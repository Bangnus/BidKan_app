# 🚲 BidKan (บิดกัน) - Smart E-Bike Sharing Platform

BidKan is a modern E-Bike sharing platform designed to provide a seamless, eco-friendly, and gamified mobility experience for university campuses and urban areas. 

This repository contains the mobile application built with **Flutter**, following a clean, scalable "Feature-first" architecture.

---

## ✨ Key Features
- **Real-time Map & GPS Tracking:** View available E-Bikes, parking zones, and campus boundaries.
- **Smart Hardware Integration:** Unlock and control bikes via QR Code scanning (communicating with ESP32 via MQTT/WebSockets).
- **Geofencing & Safety:** Enforces parking within designated zones (P) and auto-cuts power if a bike leaves the campus.
- **Dynamic Wallet System:** Real-time balance deduction during rides with auto-cutoff if the balance reaches zero.
- **Gamified Loyalty (Rank System):** Upgrade ranks (Bronze, Silver, Gold) based on usage history to unlock discounted fare rates.

---

## 🛠️ Tech Stack
- **Frontend Framework:** Flutter (Dart)
- **Architecture:** Feature-first Architecture
- **State Management:** Provider / Riverpod (TBD)
- **Map Services:** `flutter_map` / `google_maps_flutter`
- **Design System:** Custom UI components with SVG support (`flutter_svg`), Lucide Icons, and centralized `AppColors`.

---

## 📂 Folder Structure (Feature-first)
The project is organized to scale efficiently, separating concerns into core infrastructure, data management, and UI presentation:

```text
lib/
├── main.dart             # จุดเริ่มต้นของแอป (Entry Point)
├── app.dart              # ไฟล์ตั้งค่า MaterialApp/Theme (Global Background & Layout)
├── core/                 # เก็บส่วนกลางที่ใช้ทั้งแอป (Constants, Theme, Errors)
│   ├── constants/        # ค่าคงที่ต่างๆ เช่น colors.dart, sizes.dart
│   └── theme/            # การตั้งค่า Fonts และ ThemeData หลัก
├── data/                 # จัดการข้อมูลและการเชื่อมต่อ API (Backend Integration)
│   ├── models/           # Class สำหรับแปลง JSON (Data Models)
│   ├── repositories/     # ตัวกลางจัดการข้อมูล (Logic ในการดึงข้อมูล)
│   └── datasources/      # ส่วนเชื่อมต่อ API จริงๆ (เช่นใช้ Dio หรือ Http)
├── logic/                # ส่วนจัดการ State ส่วนกลาง
├── presentation/         # ส่วนประกอบหน้าจอ (UI Layer)
│   ├── screens/          # หน้าหลักแต่ละหน้า แยกโฟลเดอร์ตามฟีเจอร์ (เช่น Home, Wallet)
│   └── widgets/          # Component ย่อยๆ ที่ใช้ซ้ำ (Reusable Widgets)
│       ├── common/       # Widget ที่ใช้ทั่วแอป เช่น CustomBottomNav, CustomButton
│       └── home/         # Widget เฉพาะหน้า Home เช่น MapOverlay
└── utils/                # ฟังก์ชันช่วยต่างๆ เช่น ตัวแปลงวันที่, Format ตัวเลข
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (`^3.11.5` or later)
- Android Studio / Xcode (for emulators)
- VS Code with Dart & Flutter extensions

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/bidkan_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd bidkan_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## 👥 Role-Based Access
- **User:** View bikes, top-up wallet, ride (QR Scan), view history, and check rank.
- **Staff:** View all bikes (including broken), unlock for service, update maintenance status.
- **Admin:** God mode. Manage users, draw geofencing zones, configure rank conditions.

---
*Designed and built for modern mobility.*
