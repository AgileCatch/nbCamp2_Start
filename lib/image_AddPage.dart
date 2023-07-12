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
            SizedBox(width: 16),
            Icon(
              // 뒤로가기
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ],
        ),
        actions: [
          IconButton(
            // 저장버튼
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // 스크롤
        padding: const EdgeInsets.all(0.0),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //이미지 추가부분
                height: 300,
                width: 100,
                color: Colors.black12,
                child: Image.network(
                    'https://d2v80xjmx68n4w.cloudfront.net/gigs/OUf1c1649499417.jpg',
                    fit: BoxFit.cover),
              ),
              Container(
                //텍스트 공간
                height: null,
                width: 600,
                color: Colors.white,
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                      hintText: "내용을 입력하세요.",
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
