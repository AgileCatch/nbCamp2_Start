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
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                width: 100,
                color: Colors.black12,
                child: Image.asset(
                    'https://drive.google.com/drive/folders/1e1zhEJ_IUs-CSEg_8GIcmZAXxVsSFaf2?usp=sharing'),
              ),
              Container(
                  height: 60,
                  width: 200,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "글자를 입력해 주세요.",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
