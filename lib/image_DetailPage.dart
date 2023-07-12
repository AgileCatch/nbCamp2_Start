import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_myself/image_Modifypage.dart';

import 'detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageDetailPage(),
    );
  }
}

// 홈 페이지
class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({Key? key}) : super(key: key);

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
              MaterialPageRoute(builder: (_) => MyPage()),
            );
          },
          icon:
              Icon(Icons.backspace, color: Color.fromARGB(255, 136, 136, 136)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 버튼 클릭시 수정 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ImageModifyPage()),
              );
            },
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 136, 136, 136)),
          ),
          IconButton(
            onPressed: () {
              // 버튼 클릭시 삭제 버튼 나옴
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
                MaterialPageRoute(builder: (_) => ImageDetailPage()),
              );
            },
            icon: Icon(Icons.delete, color: Color.fromARGB(255, 136, 136, 136)),
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
                  width: 200,
                  height: 60,
                  margin: EdgeInsets.only(
                    right: 250,
                  ),
                  //원하는 자리로 배치시키고 싶을 땐 margin을 이용하자!
                  child: Row(
                    children: [
                      CircleAvatar(
                        //원형 이미지 구현
                        backgroundImage: NetworkImage(
                            'https://i.namu.wiki/i/R2EGUkNYi8b3OXJFs2GnVsZC_PZVDRr0h6ORhQEehb_wd7ekbXd0pCEnp1K6LPjpsyoEVktt8XbUVCKsNKGSr3MXOk8yfcdVsKhn8HITDW1XOEHZjmIQfcmXnD-YSDfBth2HSm3pfIruXlRvR_4tow.webp'),
                        backgroundColor: Colors.transparent,
                        radius: 30,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "이름",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5, //글자 간 간격
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    "http://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  height: 160,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "내용을 입력하세요",
                    ),
                    maxLines: 7,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 250),
                  child: Text(
                    "2023.7.11.21.00",
                    style: TextStyle(
                      fontSize: 16,
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
