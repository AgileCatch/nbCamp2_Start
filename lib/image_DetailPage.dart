import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // 버튼 클릭시 이전 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailPage()),
            );
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 버튼 클릭시 수정 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage()),
              );
            },
            icon: Icon(CupertinoIcons.scissors, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              // 버튼 클릭시 삭제 페이지로 이동
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("정말로 삭제하시겠습니까?"),
                    actions: [
                      // 취소 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("취소"),
                      ),
                      // 확인 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "확인",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ],
                  );
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage()),
              );
            },
            icon: Icon(Icons.delete, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 300),
                  //원하는 자리로 배치시키고 싶을 땐 margin을 이용하자!
                  width: 80,
                  height: 80,
                  child: Row(
                    children: [
                      Image.network(
                        "https://t3.ftcdn.net/jpg/05/11/52/90/360_F_511529094_PISGWTmlfmBu1g4nocqdVKaHBnzMDWrN.jpg",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "이름",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0),
                Image.network(
                  "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                  width: 350,
                  height: 300,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "내용을 입력하세요",
                  ),
                  maxLines: 7,
                ),
                Container(
                  margin: EdgeInsets.only(left: 200),
                  child: Text(
                    "2023.7.11.21.00",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 이미지 수정 및 저장 페이지
class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // 버튼 클릭시 이전 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
            Navigator.pop(context); // 팝업 닫기
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 저장 버튼 클릭시
            },
            icon: Icon(Icons.save, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                Image.network(
                  "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                  width: 350,
                  height: 300,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "내용을 입력하세요",
                  ),
                  maxLines: 7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
