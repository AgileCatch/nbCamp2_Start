import 'package:flutter/material.dart';
import 'package:introduce_myself/Util/colorList.dart';
import 'package:introduce_myself/Util/showToast.dart';
import 'package:introduce_myself/service/servicePage.dart';
import 'package:provider/provider.dart';

class DetailModifyPage extends StatelessWidget {
  DetailModifyPage({super.key, required this.index});

  final int index;

  // final List<String> memoList;
  // final int index;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController emailaddressController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController likeController = TextEditingController();
  final TextEditingController mbtiController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();

  // nameController.text = userList.name;
  // nicknameController.text = userList.nickname;
  // dateController.text = userList.date;
  // emailaddressController.text = userList.emailaddress;
  // addressController.text = userList.address;
  // likeController.text = userList.like;
  // mbtiController.text = userList.mbti;
  // hobbyController.text = userList.hobby;

  @override
  Widget build(BuildContext context) {
    //use Service에 있는 내용- 프로바이더 적용
    UserService userService = context.read<UserService>();
    User user = userService.cardList[index];

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
              Navigator.pop(context);
              print("object");
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
                  //       builder: (_) => DetailPage(
                  //             // index: memoList.length,
                  //             // memoList: memoList,
                  //           )),
                  // );
                  // showToast('저장되었습니다');
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
                  onTap: () {
                    showToast('message');
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.namu.wiki/i/R2EGUkNYi8b3OXJFs2GnVsZC_PZVDRr0h6ORhQEehb_wd7ekbXd0pCEnp1K6LPjpsyoEVktt8XbUVCKsNKGSr3MXOk8yfcdVsKhn8HITDW1XOEHZjmIQfcmXnD-YSDfBth2HSm3pfIruXlRvR_4tow.webp'),
                    backgroundColor: Colors.transparent,
                    radius: 100,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 60,
                    color: ColorList().gray,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "푸 바 오",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.edit,
                  size: 25,
                  color: ColorList().gray,
                )
              ],
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
