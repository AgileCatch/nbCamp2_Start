import 'package:flutter/material.dart';
import 'package:introduce_myself/detail_ModifyPage.dart';
import 'package:provider/provider.dart';
import 'image_AddPage.dart';
import 'image_DetailPage.dart';
import 'service/servicePage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Example',
      home: MyPage(),
    );
  }
}

class _MyPageState extends State<MyPage> {
  List<String> gridItems = ['Item 1', 'Item 2', 'Item 3'];
  @override
  void addItemToGrid() {
    setState(() {
      int itemCount = gridItems.length;

      gridItems.add('Item ${itemCount + 1}'); //그리드 추가
    });
  }

  Widget build(BuildContext context) {
    return Consumer<UserService>(builder: (context, userService, child) {
      //userService로부터 userList가져오기
      List<User> userList = userService.userList;
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

      return Consumer<UserService>(builder: (context, userService, child) {
        List<User> userList = userService.userList;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ImageAddPage()), //플로팅 버튼
              );
            },
            child: Icon(Icons.add),
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
                  Navigator.pop(context);
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
                          builder: (_) => DetailModifyPage(
                                index: userList.length - 1,
                                isCreat: false,
                              )),
                    );

                    print('modify button is clicked');
                  },
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              User user = userList[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.namu.wiki/i/R2EGUkNYi8b3OXJFs2GnVsZC_PZVDRr0h6ORhQEehb_wd7ekbXd0pCEnp1K6LPjpsyoEVktt8XbUVCKsNKGSr3MXOk8yfcdVsKhn8HITDW1XOEHZjmIQfcmXnD-YSDfBth2HSm3pfIruXlRvR_4tow.webp',
                        ),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          RichText(
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
                                nicknameTextSpan,
                                WidgetSpan(
                                  child: SizedBox(
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.nickname,
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          RichText(
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
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.date,
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          RichText(
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
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.emailaddress,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          RichText(
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
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.address,
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          RichText(
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
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.mbti,
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          RichText(
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
                                    width: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: user.like,
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
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
                                      width: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: user.hobby,
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
                        ],
                      ),
                      SizedBox(height: 0),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(gridItems.length, (index) {
                          return InkWell(
                            onTap: () {
//사진 누르면 ImageDetailPage로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ImageDetailPage()),
                              );
                            },
                            child: Row(
                              children: [
                                Image.network(
                                    'https://image.dongascience.com/Photo/2018/01/15156572291854.jpg',
                                    width: 180,
                                    height: 200),
                                Spacer(flex: 1),
                                Image.network(
                                    'http://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg',
                                    width: 180,
                                    height: 200),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
    });
  }
}
