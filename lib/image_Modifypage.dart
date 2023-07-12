import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_myself/image_Modifypage.dart';

import 'detailPage.dart';
import 'image_DetailPage.dart';

// 이미지 수정 및 저장 페이지
class ImageModifyPage extends StatelessWidget {
  ImageModifyPage({
    super.key,
  });

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
              MaterialPageRoute(builder: (_) => ImageDetailPage()),
            );
            Navigator.pop(context); // 팝업 닫기
            Navigator.pop(context); //ImageDetailPage로 이동
          },
          icon:
              Icon(Icons.backspace, color: Color.fromARGB(255, 136, 136, 136)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 저장 버튼 클릭시
            },
            icon: Icon(Icons.check, color: Color.fromARGB(255, 136, 136, 136)),
          )
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
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
