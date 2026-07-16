# 🚲 Project Context: "BidKan" (บิดกัน)
**Description:** A smart E-Bike sharing platform (similar to GOGO BIKE).
**Platform:** Mobile App (Flutter) and Backend API (Node.js/Express).
**Hardware Integration:** ESP32 via MQTT/WebSockets (for GPS tracking and relay control).

## 🛠️ Tech Stack (Software)
- **Frontend:** Flutter (Dart) using Feature-first architecture.
- **State Management:** Provider / Riverpod.
- **Map Services:** Mapbox / Google Maps SDK (`flutter_map` or `Maps_flutter`).
- **Backend:** Node.js (Express.js) for REST APIs.
- **Real-time:** Socket.IO / MQTT.
- **Database:** Relational DB (MySQL/PostgreSQL).

## 👤 Role-Based Access Control (RBAC)
1. **user:** Can view available bikes, top-up wallet, scan QR to ride, view history, and check current Rank.
2. **staff:** Can view ALL bikes (including broken), unlock for free to service, and update bike status.
3. **admin:** God mode. Manage users, draw geofencing zones, and set Rank conditions.

## 🧠 Core Business Logic (Updated)
- **Geofencing System:**
  - **Parking Zone (P):** Users MUST be within the polygon of a Parking Zone to "End Ride".
  - **Riding Limit Zone:** If a bike leaves the campus polygon, the app triggers a warning, and backend cuts power (Relay OFF).
- **Real-time Wallet Deduction & Auto-Cutoff:**
  - The backend runs a cron job/worker that continuously deducts the user's wallet balance during an active ride (e.g., 1 THB/minute).
  - **Auto-Cutoff:** If `wallet_balance <= 0` during the ride, the backend instantly sends a push notification/socket event to warn the user, and sends an MQTT command to the ESP32 to cut the power (Relay LOW) automatically.
- **Ranking & Loyalty System (Gamification):**
  - Users have a Rank based on their usage history over the last 3 months (e.g., Total Minutes Driven or Total Spent).
  - Reaching specific milestones upgrades the Rank and provides a discounted fare rate.
  - *Example:* Normal Rank = 1.00 THB/min, Silver Rank = 0.85 THB/min, Gold Rank = 0.75 THB/min.
- **Ride Flow:** Scan QR -> Check Balance (> Min required) -> Send MQTT Unlock -> Create Ride Record -> Deduct per minute -> (If empty: Auto Cutoff) -> Reach Point P -> End Ride -> Relay LOW.

## 📱 UI/UX Layout (Flutter Home Screen)
Uses a `Stack` widget:
1. **Base Layer:** Full-screen Map with Red polylines (Limit) and Blue polygons (Parking P).
2. **Markers:** Custom bike icons with battery % indicators.
3. **Top Floating UI:** Wallet balance pill (Top-Left) and Notification bell.
4. **Bottom-Right:** "My Location" crosshair, Support chat icon.
5. **Bottom Navigation:** Center-docked large orange "Scan QR" FAB. Tabs: Home, Wallet, History, Profile.
6. **Bottom Sheet:** Triggers on marker tap. Shows Bike ID, Range (วิ่งได้อีก X กม.), Distance, and "Ring Bell" button.

## 🗄️ Database Schema (Updated Core Tables)
1. `users`: id, phone_number, full_name, wallet_balance, role (ENUM), **rank** (e.g., 'bronze', 'silver', 'gold'), status.
2. `bikes`: id (e.g., BK-001), hardware_id, lat, lng, battery_level, status, current_ride_id.
3. `zones`: id, name, type (parking_zone/riding_limit_zone), boundary (Polygon).
4. `rides`: id, user_id, bike_id, start_time, end_time, start_location, end_location, distance_km, total_fare, status.
5. `transactions`: id, user_id, amount (+/-), type, reference_id.
6. `reports`: id, bike_id, reported_by, issue_type, status, resolved_by.
7. **`user_ranks_log` (New):** user_id, month_year, total_minutes_used, achieved_rank (Used to calculate 3-month rolling history for rank upgrades).

lib/
├── main.dart             # จุดเริ่มต้นของแอป (Entry Point)
├── app.dart              # ไฟล์ตั้งค่า MaterialApp/Theme (เหมือน _app.tsx หรือ layout.tsx)
├── core/                 # เก็บส่วนกลางที่ใช้ทั้งแอป (Constants, Theme, Errors)
│   ├── constants/        # เช่น colors.dart, sizes.dart
│   └── theme/            # การตั้งค่า Fonts และ Colors หลัก
├── data/                 # จัดการข้อมูลและการเชื่อมต่อ API (Backend Integration)
│   ├── models/           # Class สำหรับแปลง JSON (Data Models)
│   ├── repositories/     # ตัวกลางจัดการข้อมูล (Logic ในการดึงข้อมูล)
│   └── datasources/      # ส่วนเชื่อมต่อ API จริงๆ (เช่นใช้ Dio หรือ Http)
├── logic/                # ส่วนจัดการ State (ถ้าใช้ Provider, Bloc, หรือ Riverpod)
├── presentation/         # ส่วนประกอบหน้าจอ (UI Layer)
│   ├── screens/          # หน้าหลักแต่ละหน้า (เหมือนโฟลเดอร์ pages/)
│   │   ├── dashboard/    # แยกโฟลเดอร์ตามฟีเจอร์
│   │   └── payment/
│   └── widgets/          # Component ย่อยๆ ที่ใช้ซ้ำ (Reusable Widgets)
│       ├── common/       # Widget ที่ใช้ทั่วแอป เช่น CustomButton
│       └── dashboard/    # Widget เฉพาะหน้า Dashboard เช่น PaymentCard
└── utils/                # ฟังก์ชันช่วยต่างๆ เช่น ตัวแปลงวันที่, Format ตัวเลข


