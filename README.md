# Musec 🎵

<p align="center">
  <strong>A Flutter-based music streaming application for your self-hosted music library.</strong>
</p>

<p align="center">
  Flutter • Dart • Navidrome • Subsonic API • Linux • Self-Hosted
</p>

<p align="center">
  <a href="https://flutter.dev/">Flutter</a> •
  <a href="https://dart.dev/">Dart</a> •
  <a href="https://www.navidrome.org/">Navidrome</a>
</p>

---

## 📱 Overview

**Musec** is a personal music streaming client built with **Flutter and Dart** that connects to a self-hosted **Navidrome** music server through the **Subsonic-compatible API**.

Instead of relying on a commercial music streaming platform, Musec provides a mobile interface for accessing and playing music from a personally managed music library.

The project combines:

- 📱 Mobile application development
- 🔌 API integration
- 🎧 Audio streaming
- 🖥️ Self-hosted infrastructure
- 🐧 Linux server administration
- 🌐 Client-server architecture

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
- 🖥️ Designed around self-hosted music infrastructure

---

## 🏗️ Architecture

Musec follows a simple **client-server architecture**.

```text
┌─────────────────────────┐
│                         │
│       Musec App         │
│      Flutter / Dart     │
│                         │
└────────────┬────────────┘
             │
             │ Subsonic API
             │
             ▼
┌─────────────────────────┐
│                         │
│       Navidrome         │
│      Music Server       │
│                         │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│                         │
│      Music Library      │
│    Self-Hosted Files    │
│                         │
└─────────────────────────┘
```

The Musec application communicates with Navidrome through its **Subsonic-compatible API** to retrieve music information and stream audio.

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| **Application** | Flutter, Dart |
| **Music Server** | Navidrome |
| **API** | Subsonic API, Navidrome API |
| **Infrastructure** | Linux, Self-hosted Server |
| **Storage** | Self-hosted Music Library |
| **Networking** | Local / Network-based Access |

---

## 📂 Project Structure

```text
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
```

> The exact internal structure may evolve as the application grows.

---

## 🚀 Getting Started

### Prerequisites

Before running Musec, make sure you have:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK
- Android Studio or Xcode
- A running Navidrome server
- A configured music library
- Network access to the Navidrome server

Check your Flutter installation:

```bash
flutter doctor
```

---

## 📥 Installation

### 1. Clone the repository

```bash
git clone https://github.com/21goldy/musec.git
```

### 2. Navigate to the project

```bash
cd musec
```

### 3. Install dependencies

```bash
flutter pub get
```

---

## ⚙️ Configuration

Musec requires access to a running Navidrome server.

Configure the application with the appropriate Navidrome connection details:

```text
Server URL
Username
Password
```

Example:

```text
Server:
http://your-server:4533

Username:
your-username

Password:
your-password
```

> [!IMPORTANT]
> Never commit passwords, private credentials, API keys, or sensitive server configuration to GitHub.

For production deployments, use an appropriate configuration or secrets-management approach.

---

## ▶️ Running the Application

Connect an Android/iOS device or start an emulator/simulator.

Run the application:

```bash
flutter run
```

### Android

```bash
flutter run -d android
```

### iOS

```bash
flutter run -d ios
```

---

## 🎧 How Musec Works

The application communicates with Navidrome through the **Subsonic-compatible API**.

The general flow is:

```text
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
```

This architecture allows the mobile application to use a personal music collection without requiring a third-party commercial streaming platform.

---

## 🖥️ Self-Hosted Infrastructure

Musec was developed alongside a **Linux-based self-hosted environment**.

A simplified setup looks like:

```text
                    Linux Server
                         │
                         ▼
                    Navidrome
                         │
                  ┌──────┴──────┐
                  │             │
                  ▼             ▼
            Music Library   Subsonic API
                                │
                                │
                                ▼
                         ┌─────────────┐
                         │    Musec    │
                         │ Flutter App │
                         └─────────────┘
```

Working on this project provided practical experience with:

- 🐧 Linux
- 🖥️ Server administration
- 🏠 Self-hosted applications
- 🌐 Networking
- 🔌 API integration
- 🏗️ Client-server architecture
- 🎵 Music streaming
- ⚙️ Infrastructure management

---

## 🔐 Security Considerations

When running Musec with a remotely accessible Navidrome server:

- 🔒 Never commit credentials to the repository
- 🔐 Use HTTPS for publicly accessible servers
- 🔑 Use strong Navidrome credentials
- 🌐 Avoid exposing unnecessary server ports
- 🔄 Keep Navidrome updated
- 🐧 Keep the underlying Linux system updated
- 🛡️ Restrict server access where possible

For local or private networks, the server can be kept behind the appropriate network controls.

---

## 🧪 Development

### Static Analysis

```bash
flutter analyze
```

### Run Tests

```bash
flutter test
```

### Format Code

```bash
dart format .
```

---

## 📸 Screenshots

### Sign Up

<img src="https://github.com/user-attachments/assets/e839c6dc-1448-403d-aaea-4367a6f8abbb" alt="Musec Sign Up Page" width="280">

### Dashboard

<img src="https://github.com/user-attachments/assets/6bef45a6-508a-418b-95a5-113b361bee2f" alt="Musec Dashboard" width="280">

### Music Player

<img src="https://github.com/user-attachments/assets/21258538-0a9e-4b71-9c10-1f0307ae94d2" alt="Musec Music Player" width="280">

---

## 🗺️ Future Improvements

- [ ] Playlist management
- [ ] Queue management
- [ ] Favorites
- [ ] Recently played tracks
- [ ] Offline music playback
- [ ] Download songs for offline listening
- [ ] Album artwork caching
- [ ] Background playback improvements
- [ ] Lock-screen media controls
- [ ] Improved audio player controls
- [ ] Multiple Navidrome server profiles
- [ ] Better caching and network handling
- [ ] Android Auto support
- [ ] CarPlay support

---

## 🎯 Project Goals

The main goals of Musec are:

1. Build a modern mobile music client using Flutter.
2. Connect a mobile application to a self-hosted music server.
3. Integrate with the Navidrome/Subsonic API.
4. Implement music browsing and streaming.
5. Gain practical experience with self-hosted infrastructure.
6. Work with Linux-based servers and networking.
7. Build a personal music streaming experience around an owned music library.

---

## 📚 What I Learned

Developing Musec provided hands-on experience with:

- Flutter application development
- Dart
- API integration
- Subsonic-compatible APIs
- Navidrome
- Audio streaming
- Linux server administration
- Self-hosted infrastructure
- Networking
- Client-server architecture
- Debugging
- Mobile application development

---

## 🔭 Project Architecture

At a high level:

```text
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
```

---

## 👨‍💻 Author

### Goldy Gour

**Software Developer** focused on:

- Flutter
- Dart
- Go
- Backend Engineering
- Full-Stack Development
- Real-Time Systems
- Cloud Deployment
- Linux
- Self-Hosted Infrastructure

### Connect

- **GitHub:** [21goldy](https://github.com/21goldy)
- **LinkedIn:** [Goldy Gour](https://linkedin.com/in/goldy-gour-949251208)

---

## 📄 License

This project is currently intended primarily as a personal and learning project.

If this repository is later released as an open-source project, an appropriate open-source license can be added here.

---

## ⭐ Acknowledgements

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Navidrome](https://www.navidrome.org/)
- [Subsonic API](http://www.subsonic.org/pages/api.jsp)

---

<p align="center">
  <strong>🎵 Musec — Your music. Your server. Your app.</strong>
</p>
