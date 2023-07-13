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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
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
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://d2v80xjmx68n4w.cloudfront.net/members/portfolios/yirR71673678500.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300,
              width: 360,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "내용을 입력하세요.",
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
