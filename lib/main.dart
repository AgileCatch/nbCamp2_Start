import 'dart:async';
import 'package:flutter/material.dart';
import 'package:introduce_myself/Util/colorList.dart';
import 'package:introduce_myself/detailPage.dart';
import 'package:introduce_myself/detail_ModifyPage.dart';
import 'package:introduce_myself/service/servicePage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserService()),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), //스플래시 화면을 앱의첫화면으로 띄우기
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 3초 후에 홈 화면으로 이동
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/lottie/card.json"),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(builder: (context, userService, child) {
      //userService로부터 userList가져오기
      List<User> userList = userService.userList;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "이(E)와 아이(I)들",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          backgroundColor: ColorList().background, //앱바 색 지정
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                //+ 버튼 클릭시 (detail_ModifyPage로 이동)
                userService.createItem(
                    content: '',
                    address: '',
                    date: '',
                    emailaddress: '',
                    hobby: '',
                    like: '',
                    mbti: '',
                    name: '',
                    nickname: '',
                    photo: '');
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailModifyPage(
                            isCreat: true,
                            index: userService.userList.length - 1,
                          )),
                );
              },
              icon: Icon(
                Icons.add,
                color: ColorList().gray,
              ),
            ),
          ],
        ),
        backgroundColor: ColorList().background, // 배경화면 색 지정
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: userList.isEmpty
              ? Center(
                  child: Text("카드를 추가해주세요."),
                )
              : ListView.builder(
                  itemCount: userList.length, //user리스트 개수만큼 보여주기
                  itemBuilder: (context, index) {
                    User user = userList[index];
                    return Dismissible(
                      // 슬라이드 삭제
                      key: Key(index.toString()),
                      background: Container(
                        color: ColorList().orange,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 13),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      direction: DismissDirection.startToEnd,
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          // Show confirmation dialog here if needed
                          return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('자기소개'),
                                content: Text('자기소개 카드를 수정/삭제 하시겠습니까?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      userService.removeItem(index: index);
                                      Navigator.pop(context); // 팝업 닫기
                                    },
                                    child: Text(
                                      '삭제',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  TextButton(
                                    onPressed: () {
                                      ////
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => DetailModifyPage(
                                            isCreat: false,
                                            index: index,
                                          ),
                                        ),
                                      ).then(
                                        (value) {
                                          Navigator.pop(
                                              context); // Close the dialog popup
                                        },
                                      );
                                    },
                                    child: Text('수정'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text('취소'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return false;
                      },
                      child: ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            color: ColorList().yellow,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10, //카드 가로여백
                              vertical: 10, //카드 세로여백
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      //현재 사진파일은 안옮김 -> 조금 더 찾아봐야 할듯
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://i.namu.wiki/i/R2EGUkNYi8b3OXJFs2GnVsZC_PZVDRr0h6ORhQEehb_wd7ekbXd0pCEnp1K6LPjpsyoEVktt8XbUVCKsNKGSr3MXOk8yfcdVsKhn8HITDW1XOEHZjmIQfcmXnD-YSDfBth2HSm3pfIruXlRvR_4tow.webp'),
                                        radius: 45,
                                        backgroundColor: ColorList().gray,
                                      ), //프로필 이미지크기
                                      SizedBox(
                                        width: 37,
                                      ),
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                  color:
                                      const Color.fromARGB(255, 109, 109, 109),
                                  thickness: 0.5,
                                  //endIndent: 50,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  user.nickname,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              //원래는 디테일페이지로 가야하는데 경로확인하려고 수정페이지로 감
                              builder: (_) => MyPage(),
                            ),
                          );
                          if (user.name.isEmpty) {
                            userService.removeItem(index: index);
                          }
                        },
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}
