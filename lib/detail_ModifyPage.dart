import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:introduce_myself/Util/colorList.dart';
import 'package:introduce_myself/Util/showToast.dart';
import 'package:introduce_myself/service/servicePage.dart';
import 'package:provider/provider.dart';

class DetailModifyPage extends StatefulWidget {
  DetailModifyPage({super.key, required this.index, required this.isCreat});

  final int index;
  final bool isCreat;

  @override
  State<DetailModifyPage> createState() => _DetailModifyPageState();
}

class _DetailModifyPageState extends State<DetailModifyPage> {
  // final List<String> memoList;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController nicknameController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  final TextEditingController emailaddressController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController likeController = TextEditingController();

  final TextEditingController mbtiController = TextEditingController();

  final TextEditingController hobbyController = TextEditingController();

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //use Service에 있는 내용- 프로바이더 적용
    UserService userService = context.read<UserService>();
    User user = userService.userList[widget.index];

    nameController.text = user.name;
    nicknameController.text = user.nickname;
    dateController.text = user.date;
    emailaddressController.text = user.emailaddress;
    addressController.text = user.address;
    likeController.text = user.like;
    mbtiController.text = user.mbti;
    hobbyController.text = user.hobby;

    return Scaffold(
      backgroundColor: ColorList().background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //뒤로가기 버튼
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              if (widget.isCreat == true) {
                userService.removeItem(index: widget.index);
                Navigator.pop(context); // Close the dialog
              } else {
                Navigator.pop(context); // Close the dialog
              }
            },
            icon: Icon(
              Icons.backspace,
              size: 30,
              color: ColorList().gray,
            ),
          ),
        ),
        //저장하기 버튼
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     //원래는 디테일페이지로 가야하는데 경로확인하려고 수정페이지로 감
                  //     builder: (_) => MyPage(),
                  //   ),
                  // );
                  Navigator.pop(context);
                  userService.updateItem(
                      index: widget.index,
                      address: addressController.text,
                      date: dateController.text,
                      emailaddress: emailaddressController.text,
                      hobby: hobbyController.text,
                      like: likeController.text,
                      mbti: mbtiController.text,
                      name: nameController.text,
                      nickname: nicknameController.text);
                  showToast('저장되었습니다');
                },
                icon: Icon(
                  Icons.check,
                  color: ColorList().gray,
                  size: 30,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            // Image.file(File()),
            //원형 사진 넣는 곳
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.photo),
                    backgroundColor: ColorList().gray,
                    radius: 100,
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: 70,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 60,
                    color: ColorList().background,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 25,
            ),

            SizedBox(
              height: 20,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이름",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "이름을 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "닉네임",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      onChanged: (value) {
                        user.nickname;
                      },
                      controller: nicknameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "닉네임을 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "생년월일",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "생년월일을 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "이메일 주소",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: emailaddressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "이메일 주소를 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "사는 곳",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "닉네임을 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "MBTI",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: mbtiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "MBTI를 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "좋아하는 것",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: likeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "좋아하는 것을 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "취미",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: hobbyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "취미를 입력하세요",
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
