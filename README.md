# Doc Doc - Doctor Appointment App 🏥

A modern, robust, and feature-rich Doctor Appointment mobile application built using Flutter. The app provides a seamless experience for patients to search for doctors, book appointments, and manage their healthcare requests with a highly responsive and beautiful UI/UX.

---

## 📱 UI Showcase & Features

*Check out the app interface and user flow:*

<p align="center">
  <img src="https://github.com/user-attachments/assets/ec2b2e78-d55a-4ca9-8b5b-4d9d033de09a" width="31%" />
  <img src="https://github.com/user-attachments/assets/953ae366-c8e1-417d-a3ff-84b21babf5ae" width="31%" />
  <img src="https://github.com/user-attachments/assets/1ccb51dd-334e-4cbc-acc3-cf399982b60c" width="31%" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/8d2d0892-0951-43ff-af77-72768f7f4024" width="31%" />
  <img src="https://github.com/user-attachments/assets/043eb5d5-00f0-4530-9cdf-df87d02680e7" width="31%" />
  <img src="https://github.com/user-attachments/assets/28fa4969-c472-4087-9cc7-e9f0d1c80ddb" width="31%" />
</p>

---

## 🎬 App Walkthrough & Animations

*Here is a full demonstration of the app flow, responsive UI, and smooth transitions:*

<p align="center">
  <video src="https://github.com/user-attachments/assets/278f1cd7-d419-4835-87db-71c1fee1eae3" width="50%" controls></video>
</p>

---

## 🛠️ Tech Stack & Architecture

This project is engineered following production-ready standards to ensure optimal performance and scalability:

| Layer | Technology |
|-------|-----------|
| Language | Dart |
| Framework | Flutter |
| State Management | BLoC / Cubit |
| Architecture | Clean Architecture (DataSource → Repository → Cubit) |
| Networking | Dio + REST API |
| Error Handling | Dartz (Either pattern) |
| Local Storage | Flutter Secure Storage |
| Authentication | Token-based Auth (Bearer Token) |

---

## 🏗️ Project Structurelib/

├── core/

│   ├── const/          → API endpoints

│   ├── error/          → Failure & ServerFailure classes

│   ├── service/        → Token storage service

│   ├── theming/        → Colors, text styles

│   └── widgets/        → Shared widgets

│

└── features/

├── auth/

│   ├── data/       → Models, DataSource, Repository

│   ├── logic/      → Cubit & States

│   └── presentation/ → Screens & Widgets

│

├── all_doctor/

│   ├── data/       → Doctor model, DataSource, Repository

│   ├── logic/      → DoctorCubit & States

│   └── presentation/ → Screens & Widgets

│

└── home/

└── presentation/ → Home screen & Widgets

---

## ✨ Features

- 🔐 **Authentication** — Login & Register with token-based auth
- 👨‍⚕️ **Browse Doctors** — View all available doctors with details
- 🔍 **Search Doctors** — Real-time search by doctor name
- 👤 **Doctor Profile** — View full doctor info, specialization & availability
- 📋 **Book Appointment** — Schedule appointments with ease
- 🌙 **Dark / Light Mode** — Full theme support
- 🌍 **Multi-language** — Arabic & English support (Easy Localization)

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0

### Installation

1. Clone the repo
```bash
git clone https://github.com/A7MEDTAREK2/docdoc.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.x      # State management
  dio: ^5.x               # HTTP client
  dartz: ^0.10.x          # Functional error handling
  flutter_secure_storage: # Secure token storage
  easy_localization:      # Multi-language support
  cached_network_image:   # Image caching
```

---

