import 'package:flutter/material.dart';

class ImageAddPage extends StatelessWidget {
  const ImageAddPage({super.key});

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
              color: const Color.fromARGB(255, 136, 136, 136),
              size: 30,
            ),
            onPressed: () {
              print('back button is clicked');
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "http://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
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
