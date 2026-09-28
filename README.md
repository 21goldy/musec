# Musec 🎵

A Flutter-based music streaming application that connects to a self-hosted [Navidrome](https://www.navidrome.org/) music server using the Subsonic-compatible API.

Musec was built to explore mobile music streaming, API integration, audio playback, and self-hosted infrastructure while keeping the music library under the user's own control.

---

## 📱 Overview

Musec is a personal music streaming client built with Flutter and Dart.

Instead of relying on a commercial music streaming service, Musec connects to a self-hosted Navidrome server and provides a mobile interface for browsing and playing a personal music collection.

The project combines:

- Mobile application development
- REST API integration
- Audio streaming
- Self-hosted infrastructure
- Linux server administration
- Client-server architecture

---

## ✨ Features

- 🎵 Browse music from a self-hosted Navidrome server
- 🔎 Search the music library
- ▶️ Stream music directly from the server
- ⏯️ Play and pause tracks
- ⏭️ Skip between tracks
- 📚 Browse music from the connected server
- 🎧 Audio playback through the mobile application
- 🌐 Connect to a remote or local Navidrome instance
- 📱 Cross-platform Flutter application
- 🖥️ Designed to work with self-hosted music infrastructure

---

## 🏗️ Architecture

Musec follows a client-server architecture:

The Musec application communicates with Navidrome through its Subsonic-compatible API to retrieve music information and stream audio.

## 🛠️ Tech Stack

Application
Flutter
Dart
Music Server
Navidrome
API
Subsonic API
Navidrome API
Infrastructure
Linux
Self-hosted server
Self-hosted music storage
Network-based access

##📂 Project Structure

musec/
│
├── android/
├── ios/
├── lib/
│   ├── app/
│   ├── features/
│   ├── models/
│   ├── providers/
│   ├── services/
│   └── main.dart
│
├── test/
├── screenshots/
│
├── pubspec.yaml
├── README.md
└── LICENSE

The exact internal structure may evolve as the application grows.

## 🚀 Getting Started

Prerequisites

# Before running Musec, make sure you have:

Flutter SDK installed
Dart SDK
Android Studio or Xcode
A running Navidrome server
A configured music library
Network access to the Navidrome server

# Check your Flutter installation:

flutter doctor
📥 Installation

Clone the repository:

git clone https://github.com/21goldy/musec.git

Navigate to the project:

cd musec

# Install Flutter dependencies:

flutter pub get
⚙️ Configuration

Musec requires access to a running Navidrome server.

Configure the application with the appropriate Navidrome connection details:

Server URL
Username
Password

Example:

Server:
http://your-server:4533

Username:
your-username

Password:
your-password

Important: Never commit passwords, private credentials, API keys, or sensitive server configuration to GitHub.

For production deployments, use an appropriate configuration or secrets-management approach.

## ▶️ Running the Application

Connect an Android/iOS device or start an emulator/simulator.

Run the application:

flutter run

For Android:

flutter run -d android

For iOS:

flutter run -d ios
🎧 How Musec Works

The application communicates with Navidrome through the Subsonic-compatible API.

The general flow is:

User
 │
 ▼
Musec Flutter Application
 │
 ▼
Authenticate with Navidrome
 │
 ▼
Fetch Music Library
 │
 ├── Artists
 ├── Albums
 └── Songs
 │
 ▼
User Selects Track
 │
 ▼
Request Audio Stream
 │
 ▼
Audio Playback

This architecture allows the mobile application to use a personal music collection without requiring a third-party commercial streaming platform.

## 🖥️ Self-Hosted Infrastructure

Musec was developed alongside a Linux-based self-hosted environment.

A simplified setup looks like:

                Linux Server
                     │
                     ▼
                Navidrome
                     │
              ┌──────┴──────┐
              │             │
              ▼             ▼
        Music Library    Subsonic API
                            │
                            │
                            ▼
                     ┌─────────────┐
                     │    Musec    │
                     │ Flutter App │
                     └─────────────┘

Working on this project provided practical experience with:

Linux
Server administration
Self-hosted applications
Networking
API integration
Client-server architecture
Music streaming
Infrastructure management

## 🔐 Security Considerations

When running Musec with a remotely accessible Navidrome server:

Never commit credentials to the repository
Use HTTPS for publicly accessible servers
Use strong Navidrome credentials
Avoid exposing unnecessary server ports
Keep Navidrome updated
Keep the underlying Linux system updated
Restrict server access where possible

For local or private networks, the server can be kept behind the appropriate network controls.

## 🧪 Development

Run Flutter static analysis:

flutter analyze

Run tests:

flutter test

Format the project:

dart format .

## 📸 Screenshots

Add screenshots of the application to the screenshots/ directory.

Example:

## Screenshots

### Home

![Musec Home](screenshots/home.png)

### Search

![Musec Search](screenshots/search.png)

### Music Player

![Musec Player](screenshots/player.png)
🗺️ Future Improvements

Possible improvements for future versions include:

 Playlist management
 Queue management
 Favorites
 Recently played tracks
 Offline music playback
 Download songs for offline listening
 Album artwork caching
 Background playback improvements
 Lock-screen media controls
 Improved audio player controls
 Multiple Navidrome server profiles
 Better caching and network handling
 Android Auto support
 CarPlay support
 
## 🎯 Project Goals

The main goals of Musec are:

Build a modern mobile music client using Flutter.
Connect a mobile application to a self-hosted music server.
Integrate with the Navidrome/Subsonic API.
Implement music browsing and streaming.
Gain practical experience with self-hosted infrastructure.
Work with Linux-based servers and networking.
Build a personal music streaming experience around an owned music library.

## 📚 What I Learned

Developing Musec provided hands-on experience with:

Flutter application development
Dart
API integration
Subsonic-compatible APIs
Navidrome
Audio streaming
Linux server administration
Self-hosted infrastructure
Networking
Client-server architecture
Debugging
Mobile application development
🔭 Project Architecture

At a high level:

┌──────────────────────────────────────────┐
│              Mobile Client               │
│                                          │
│                Musec                     │
│           Flutter + Dart                 │
└────────────────────┬─────────────────────┘
                     │
                     │ HTTP / API
                     ▼
┌──────────────────────────────────────────┐
│              Navidrome                   │
│                                          │
│        Subsonic-Compatible API           │
└────────────────────┬─────────────────────┘
                     │
                     ▼
┌──────────────────────────────────────────┐
│            Self-Hosted Storage           │
│                                          │
│              Music Library               │
└──────────────────────────────────────────┘

## 👨‍💻 Author

Goldy Gour

Software Developer focused on:

Flutter
Dart
Go
Backend Engineering
Full-Stack Development
Real-Time Systems
Cloud Deployment
Linux
Self-Hosted Infrastructure

GitHub:

https://github.com/21goldy

LinkedIn:

https://linkedin.com/in/goldy-gour

📄 License

This project is currently intended primarily as a personal and learning project.

If this repository is later released as an open-source project, an appropriate open-source license can be added here.

⭐ Acknowledgements

Flutter
Dart
Navidrome
Subsonic API
🎵 Musec

Your music. Your server. Your app.
