import 'package:flutter/material.dart'; // Import ไลบรารี Material ของ Flutter

void main() {
  // จุดเริ่มต้นของแอป Flutter
  runApp(const MyApp()); // บอก Flutter ว่าวิดเจ็ตใดคือรากฐานของแอป
}

// MyApp โดยทั่วไปคือวิดเจ็ตรากฐานของแอปพลิเคชันของคุณ
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // เมธอด build() ส่งคืนโครงสร้างต้นไม้วิดเจ็ตสำหรับวิดเจ็ตนี้
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // ใช้ Material Design เวอร์ชันล่าสุด
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

// ตัวอย่างวิดเจ็ตที่ส่งคืนโดย property 'home' ของ MaterialApp
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter 4'),
        backgroundColor: Colors.blue, // ปรับแต่งสี AppBar
      ),
      body: Padding(
        // เพิ่ม Padding รอบ Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ใช้ Column สำหรับเลย์เอาต์แนวตั้ง
          //crossAxisAlignment:
          // CrossAxisAlignment.center, // จัดกึ่งกลางไอเท็มแนวนอน
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://picsum.photos/seed/flutter/400/200',
              height: 100.0,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              'asstes/images/cat.jpg', // ใช้พาธ asset จริงของคุณ
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                // แนวปฏิบัติที่ดีแม้สำหรับ assets, เผื่อกรณีพาธผิด
                return const Text(
                  'เกิดข้อผิดพลาดในการโหลด asset',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "สวัสดี Flutter!",
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดกึ่งกลางปุ่มในแถว
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),
            const SizedBox(height: 16), // ตัวเว้นวรรค
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 50,
              tooltip: 'ข้อมูล', // ข้อความช่วยเหลือ
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
