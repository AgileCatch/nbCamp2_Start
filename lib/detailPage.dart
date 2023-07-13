import 'package:flutter/material.dart';
import 'package:introduce_myself/detail_ModifyPage.dart';
import 'package:introduce_myself/image_AddPage.dart';
import 'package:introduce_myself/main.dart';

import 'image_DetailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'detailPage',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final nicknameTextSpan = TextSpan(
      text: ("닉네임"),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final birthdayTextSpan = TextSpan(
      text: ('생년월일'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final emailTextSpan = TextSpan(
      text: ('이메일 주소'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final locationTextSpan = TextSpan(
      text: ('사는 곳'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final mbtiTextSpan = TextSpan(
      text: ('MBTI'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final favoriteTextSpan = TextSpan(
      text: ('좋아하는 것'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final hobbyTextSpan = TextSpan(
      text: ('취미'),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ImageAddPage()),
          );
        },
      ),
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.backspace,
              color: const Color.fromARGB(255, 136, 136, 136),
              size: 30,
            ),
            onPressed: () {
              print('back button is clicked');
              Navigator.pop(context // 메인화면으로 이동
                  );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.edit,
                color: const Color.fromARGB(255, 136, 136, 136),
                size: 30,
              ),
              onPressed: () {
                print('back button is clicked');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailModifyPage()), //수정페이지로 이동
                );
                print('modify button is clicked');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.dmitory.com/img/201911/2wX/oNk/2wXoNkdn88oWmguAk6yWwW.jpg"),
                      backgroundColor: Colors.transparent,
                      radius: 100,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '이   름',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: const Color.fromARGB(255, 209, 208, 208),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: SizedBox(
                              width: 50,
                            ),
                          ),
                          nicknameTextSpan,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  color: const Color.fromARGB(255, 209, 208, 208),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.celebration),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        birthdayTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 115,
                          ),
                        ),
                        TextSpan(
                          text: '1234.56.78',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  color: const Color.fromARGB(255, 209, 208, 208),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.alternate_email),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        emailTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 100,
                          ),
                        ),
                        TextSpan(
                          text: 'abcd@gamil.com',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  color: const Color.fromARGB(255, 209, 208, 208),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.public),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        locationTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 250,
                          ),
                        ),
                        TextSpan(
                          text: '대한민국',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  color: const Color.fromARGB(255, 209, 208, 208),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.info_outline),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        mbtiTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 250,
                          ),
                        ),
                        TextSpan(
                          text: 'ABCD',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  color: const Color.fromARGB(255, 209, 208, 208),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.favorite),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        favoriteTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                        TextSpan(
                          text: 'ㄱㄴㄷㄹ',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 208, 208),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.star),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        hobbyTextSpan,
                        WidgetSpan(
                          child: SizedBox(
                            width: 300,
                          ),
                        ),
                        TextSpan(
                          text: 'ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎㅏㅑㅓㅕㅜㅠㅗㅠ',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //사진 누르면 ImageDetailPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ImageDetailPage()),
                    );
                  },
                  child: Row(
                    children: [
                      Image.network(
                          'https://image.dongascience.com/Photo/2018/01/15156572291854.jpg',
                          width: 180,
                          height: 200),
                      Spacer(flex: 2),
                      Image.network(
                          'http://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg',
                          width: 180,
                          height: 200),
                    ],
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
