import 'package:flutter/material.dart';
import 'package:introduce_myself/detailPage.dart';

void main() {
  runApp(ImageAddPage());
}

class ImageAddPage extends StatelessWidget {
  const ImageAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAddPage(),
    );
  }
}

class MyAddPage extends StatelessWidget {
  const MyAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.backspace,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MyApp()),
              );
            },
          ),
        ),
        actions: [
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
