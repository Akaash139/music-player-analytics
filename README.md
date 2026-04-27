# ◈ MusicDB Analytics Platform

A premium, modern Music Analytics Dashboard built with **Node.js**, **Express**, **MySQL**, and **Chart.js**. This platform provides deep insights into music streaming data, user activity, and track performance with a sleek, dark-themed interface.

![Version](https://img.shields.io/badge/version-1.0.0-gold)
![License](https://img.shields.io/badge/license-ISC-blue)
![Tech](https://img.shields.io/badge/stack-NEVM-green)

---

## ✨ Features

- **📊 Advanced Analytics**: Interactive charts for Top Tracks, Genre Distribution, User Activity, and Album Popularity.
- **🔐 Secure Authentication**: Integrated Login and Registration system with session management.
- **🔍 Smart Search**: Real-time search functionality across tracks, albums, and artists.
- **♪ Track Management**: Full CRUD operations for managing the music library.
- **🗂 Database Tables**: Comprehensive views for Users, Artists, Albums, Genres, and Play History.
- **📱 Responsive Design**: Fully optimized for various screen sizes with a custom premium aesthetic.

## 🛠 Tech Stack

- **Backend**: Node.js, Express.js
- **Frontend**: Vanilla JavaScript, CSS3, HTML5
- **Database**: MySQL
- **Visualization**: Chart.js
- **Sessions**: Express-session

## 🚀 Getting Started

### 1. Database Setup
1. Ensure you have **MySQL** installed and running.
2. Create a database named `musicplayerdb`.
3. Import the provided schema:
   ```bash
   mysql -u root -p musicplayerdb < backup_fixed.sql
   ```
   *(Note: The default credentials in `server.js` are `user: 'root'` and `password: '1234'`. Update these if necessary.)*

### 2. Installation
Clone the repository and install dependencies:
```bash
git clone https://github.com/[your-username]/music-player-web-fixed.git
cd music-player-web-fixed
npm install
```

### 3. Run the Application
Start the server:
```bash
node server.js
```
The application will be running at [http://localhost:3000](http://localhost:3000).

## 📁 Project Structure

```bash
├── public/              # Frontend files
│   └── index.html       # Single Page Application
├── server.js            # Express server & API endpoints
├── backup_fixed.sql     # Database dump
├── package.json         # Dependencies & Scripts
└── .gitignore           # Ignored files for Git
```

## 📝 License
This project is licensed under the ISC License.

---
*Created as part of a DBMS Course Project.*
