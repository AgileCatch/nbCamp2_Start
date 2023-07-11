import 'package:flutter/material.dart';
import 'package:introduce_myself/detail_ModifyPage.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), //스플래시 화면을 앱의첫화면으로 띄우기
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 3초 후에 홈 화면으로 이동
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/lottie/card.json"),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              //추가버튼 클릭시 (detail_ModifyPage로 이동)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailModifyPage()),
              );
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "이(E)와 아이(I)들",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            //카드위젯 만드는부분
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 238, 186),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 170,
                  vertical: 60,
                ),
              ),
            ),
            Center(
              child: Text('Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
// SizedBox(
              //   height: 130,
              //   width: 360,
              //   child: Card(
              //     shape: ContinuousRectangleBorder(
              //       borderRadius: BorderRadius.circular(60), //카드둥글기정도
              //     ),
              //   ),
              // ),
