const express = require('express');
const mysql = require('mysql2');
const session = require('express-session');

const app = express();
app.use(express.json());

// ── Session middleware ───────────────────────────────────────────────────────
app.use(session({
    secret: 'musicdb-secret-key-2026',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 24 * 60 * 60 * 1000 } // 24 hours
}));

// ── Connect to MySQL ─────────────────────────────────────────────────────────
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'musicplayerdb'
});

db.connect(err => {
    if (err) {
        console.error('MySQL connection failed:', err.message);
        process.exit(1);
    }
    console.log('MySQL Connected...');
});

// ── Helper — promisified query ───────────────────────────────────────────────
function dbQuery(sql, params = []) {
    return new Promise((resolve, reject) => {
        db.query(sql, params, (err, result) => {
            if (err) reject(err);
            else resolve(result);
        });
    });
}

// Legacy helper for simple GET endpoints
function query(res, sql, params = []) {
    db.query(sql, params, (err, result) => {
        if (err) {
            console.error('Query error:', err.message);
            return res.status(500).json({ error: err.message });
        }
        res.json(result);
    });
}

// ── Serve static frontend ────────────────────────────────────────────────────
app.use(express.static('public'));

// ══════════════════════════════════════════════════════════════════════════════
// AUTH ENDPOINTS
// ══════════════════════════════════════════════════════════════════════════════

// Check current session
app.get('/me', (req, res) => {
    if (req.session && req.session.user) {
        return res.json({ loggedIn: true, ...req.session.user });
    }
    res.json({ loggedIn: false });
});

// Login
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({ error: 'Email and password are required' });
    }
    try {
        const rows = await dbQuery(
            'SELECT user_id, username, email, password_hash FROM user WHERE email = ?',
            [email]
        );
        if (rows.length === 0) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }
        const user = rows[0];
        // Simple plaintext comparison (matches the seed data format)
        if (user.password_hash !== password) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }
        const sessionUser = { user_id: user.user_id, username: user.username, email: user.email };
        req.session.user = sessionUser;
        res.json(sessionUser);
    } catch (err) {
        console.error('Login error:', err.message);
        res.status(500).json({ error: 'Server error' });
    }
});

// Register
app.post('/register', async (req, res) => {
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
        return res.status(400).json({ error: 'All fields are required' });
    }
    try {
        // Check if email already exists
        const existing = await dbQuery('SELECT user_id FROM user WHERE email = ?', [email]);
        if (existing.length > 0) {
            return res.status(409).json({ error: 'Email already registered' });
        }
        const result = await dbQuery(
            'INSERT INTO user (username, email, password_hash) VALUES (?, ?, ?)',
            [username, email, password]
        );
        const sessionUser = { user_id: result.insertId, username, email };
        req.session.user = sessionUser;
        res.json(sessionUser);
    } catch (err) {
        console.error('Register error:', err.message);
        res.status(500).json({ error: 'Server error' });
    }
});

// Logout
app.post('/logout', (req, res) => {
    req.session.destroy(() => {
        res.json({ success: true });
    });
});

// ══════════════════════════════════════════════════════════════════════════════
// TABLE ENDPOINTS (existing + unchanged)
// ══════════════════════════════════════════════════════════════════════════════

// ── Tracks ───────────────────────────────────────────────────────────────────
app.get('/tracks', (req, res) => {
    query(res, 'SELECT * FROM track');
});

// ── Users ────────────────────────────────────────────────────────────────────
app.get('/users', (req, res) => {
    query(res, 'SELECT user_id, username, email, created_at FROM user');
});

// ── Artists ──────────────────────────────────────────────────────────────────
app.get('/artists', (req, res) => {
    query(res, 'SELECT * FROM artist');
});

// ── Albums ───────────────────────────────────────────────────────────────────
app.get('/albums', (req, res) => {
    query(res, 'SELECT * FROM album');
});

// ── Genres ───────────────────────────────────────────────────────────────────
app.get('/genres', (req, res) => {
    query(res, 'SELECT * FROM genre');
});

// ── Playlists ────────────────────────────────────────────────────────────────
app.get('/playlists', (req, res) => {
    query(res, 'SELECT * FROM playlist');
});

// ── Play History ─────────────────────────────────────────────────────────────
app.get('/history', (req, res) => {
    query(res, 'SELECT * FROM play_history ORDER BY played_at DESC');
});

// ══════════════════════════════════════════════════════════════════════════════
// TRACK CRUD
// ══════════════════════════════════════════════════════════════════════════════

// Create track
app.post('/tracks', async (req, res) => {
    const { title, duration, album_id } = req.body;
    if (!title || !duration) {
        return res.status(400).json({ error: 'Title and duration are required' });
    }
    try {
        const result = await dbQuery(
            'INSERT INTO track (title, duration, album_id) VALUES (?, ?, ?)',
            [title, duration, album_id || null]
        );
        res.json({ track_id: result.insertId, title, duration, album_id: album_id || null });
    } catch (err) {
        console.error('Create track error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Update track
app.put('/tracks/:id', async (req, res) => {
    const { title, duration, album_id } = req.body;
    const id = req.params.id;
    if (!title || !duration) {
        return res.status(400).json({ error: 'Title and duration are required' });
    }
    try {
        await dbQuery(
            'UPDATE track SET title = ?, duration = ?, album_id = ? WHERE track_id = ?',
            [title, duration, album_id || null, id]
        );
        res.json({ track_id: Number(id), title, duration, album_id: album_id || null });
    } catch (err) {
        console.error('Update track error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Delete track
app.delete('/tracks/:id', async (req, res) => {
    const id = req.params.id;
    try {
        // Remove related records first to avoid FK constraint errors
        await dbQuery('DELETE FROM play_history WHERE track_id = ?', [id]);
        await dbQuery('DELETE FROM playlist_track WHERE track_id = ?', [id]);
        await dbQuery('DELETE FROM track_genre WHERE track_id = ?', [id]);
        await dbQuery('DELETE FROM track WHERE track_id = ?', [id]);
        res.json({ success: true });
    } catch (err) {
        console.error('Delete track error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// ══════════════════════════════════════════════════════════════════════════════
// SEARCH
// ══════════════════════════════════════════════════════════════════════════════
app.get('/search', async (req, res) => {
    const q = req.query.q;
    if (!q) return res.json([]);
    try {
        const rows = await dbQuery(`
            SELECT t.track_id, t.title, t.duration, t.album_id,
                   a.title AS album_name,
                   ar.artist_name
            FROM track t
            LEFT JOIN album a ON t.album_id = a.album_id
            LEFT JOIN artist ar ON a.artist_id = ar.artist_id
            WHERE t.title LIKE ?
            ORDER BY t.title
            LIMIT 50
        `, [`%${q}%`]);
        res.json(rows);
    } catch (err) {
        console.error('Search error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// ══════════════════════════════════════════════════════════════════════════════
// ANALYTICS ENDPOINTS
// ══════════════════════════════════════════════════════════════════════════════

// Summary counts
app.get('/analytics/summary', async (req, res) => {
    try {
        const [tracks] = await dbQuery('SELECT COUNT(*) AS count FROM track');
        const [users] = await dbQuery('SELECT COUNT(*) AS count FROM user');
        const [plays] = await dbQuery('SELECT COUNT(*) AS count FROM play_history');
        const [artists] = await dbQuery('SELECT COUNT(*) AS count FROM artist');
        res.json({ tracks, users, plays, artists });
    } catch (err) {
        console.error('Summary error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Top 10 most played tracks
app.get('/analytics/top-tracks', async (req, res) => {
    try {
        const rows = await dbQuery(`
            SELECT t.title, COUNT(ph.play_id) AS play_count
            FROM play_history ph
            JOIN track t ON ph.track_id = t.track_id
            GROUP BY ph.track_id, t.title
            ORDER BY play_count DESC
            LIMIT 10
        `);
        res.json(rows);
    } catch (err) {
        console.error('Top tracks error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Genre stats — plays per genre
app.get('/analytics/genre-stats', async (req, res) => {
    try {
        const rows = await dbQuery(`
            SELECT g.genre_name, COUNT(ph.play_id) AS play_count
            FROM play_history ph
            JOIN track_genre tg ON ph.track_id = tg.track_id
            JOIN genre g ON tg.genre_id = g.genre_id
            GROUP BY g.genre_id, g.genre_name
            ORDER BY play_count DESC
        `);
        res.json(rows);
    } catch (err) {
        console.error('Genre stats error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// User activity — plays per user
app.get('/analytics/user-activity', async (req, res) => {
    try {
        const rows = await dbQuery(`
            SELECT u.username, COUNT(ph.play_id) AS play_count
            FROM play_history ph
            JOIN user u ON ph.user_id = u.user_id
            GROUP BY ph.user_id, u.username
            ORDER BY play_count DESC
        `);
        res.json(rows);
    } catch (err) {
        console.error('User activity error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Album stats — plays per album
app.get('/analytics/album-stats', async (req, res) => {
    try {
        const rows = await dbQuery(`
            SELECT a.title AS album_name, COUNT(ph.play_id) AS play_count
            FROM play_history ph
            JOIN track t ON ph.track_id = t.track_id
            JOIN album a ON t.album_id = a.album_id
            GROUP BY a.album_id, a.title
            ORDER BY play_count DESC
            LIMIT 10
        `);
        res.json(rows);
    } catch (err) {
        console.error('Album stats error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// Device stats — plays per device type
app.get('/analytics/device-stats', async (req, res) => {
    try {
        const rows = await dbQuery(`
            SELECT device_type, COUNT(*) AS count
            FROM play_history
            GROUP BY device_type
            ORDER BY count DESC
        `);
        res.json(rows);
    } catch (err) {
        console.error('Device stats error:', err.message);
        res.status(500).json({ error: err.message });
    }
});

// ── Start server ─────────────────────────────────────────────────────────────
app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});