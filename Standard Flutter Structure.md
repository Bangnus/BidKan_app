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


