import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_DetailPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

// 이미지 수정 및 저장 페이지
class ImageModifyPage extends StatefulWidget {
  const ImageModifyPage({Key? key}) : super(key: key);

  @override
  State<ImageModifyPage> createState() => _ImageModifyPageState();
}

class _ImageModifyPageState extends State<ImageModifyPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List imageList = [
    "http://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
    "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
    "https://img.freepik.com/free-photo/cloud-and-blue-sky_1150-35749.jpg",
    "https://www.wikileaks-kr.org/news/photo/201911/71033_49573_3659.jpg",
    "https://t1.daumcdn.net/cfile/tistory/240814485574155029",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              print('사진 저장 됨');
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
                  child: Stack(
                    children: [
                      sliderWidget(),
                      sliderIndicator(),
                    ],
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

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imgLink,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
