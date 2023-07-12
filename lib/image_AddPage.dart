import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServicePage(),
    );
  }
}

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                // 뒤로가기 버튼
                Icons.backspace,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        leadingWidth: 100,
        actions: [
          // 저장 버튼
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  // 이미지 추가부분 어떻게?
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://d2v80xjmx68n4w.cloudfront.net/members/portfolios/yirR71673678500.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 300, // 이미지 추가칸 설정
                width: 100,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 60),
              ),
              Container(
                //텍스트 공간
                height: null,
                width: 10,
                color: Colors.white,
                child: TextField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    border: InputBorder.none,
                    hintText: "내용을 입력하세요.",
                  ),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
