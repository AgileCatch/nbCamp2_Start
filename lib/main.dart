import 'dart:async';
import 'package:flutter/material.dart';
import 'package:introduce_myself/Util/colorList.dart';
import 'package:introduce_myself/detail_ModifyPage.dart';
import 'package:introduce_myself/service/servicePage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() {
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
        primarySwatch: Colors.blue,
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
      List<User> cardList = userService.cardList;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorList().background, //앱바 색 지정
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                //추가버튼 클릭시 (detail_ModifyPage로 이동)
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (_) => DetailModifyPage(
                //             index: memoList.indexOf(memo),
                //             memoList: memoList,
                //           )),
                // );
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
          child: cardList.isEmpty
              ? Center(
                  child: Text("ddd"),
                )
              : ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (context, index) {
                    User card = cardList[index];
                    return ListTile(
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
                                      card.name,
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
                                color: const Color.fromARGB(255, 109, 109, 109),
                                thickness: 0.5,
                                //endIndent: 50,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                card.nickname,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //원래는 디테일페이지로 가야하는데 경로확인하려고 수정페이지로 감
                            builder: (_) => DetailModifyPage(
                              index: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      );
    });
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<CardData> cards = []; // 카드 목록

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               setState(() {
//                 // 플러스 아이콘 버튼이 눌렸을 때 카드 추가
//                 cards.add(CardData());
//               });
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: cards.length,
//         itemBuilder: (context, index) {
//           return CardWidget(cardData: cards[index]);
//         },
//       ),
//     );
//   }
// 
// class CardData {
//   String profileImage = 'assets/profile.png'; // 프로필 사진 경로
//   String name = '이름'; // 이름
//   String nickname = 'Nickname'; // 닉네임
// }
// class CardWidget extends StatelessWidget {
//   final CardData cardData;

//   const CardWidget({Key? key, required this.cardData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(cardData.hashCode.toString()), // 각 카드를 식별하기 위한 키
//       background: Container(
//         color: Colors.red,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Icon(
//                 Icons.delete,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       secondaryBackground: Container(
//         color: Colors.green,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Icon(
//                 Icons.edit,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       child: Card(
//         margin: EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CircleAvatar(
//                 radius: 32,
//                 backgroundImage: AssetImage(cardData.profileImage),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   cardData.name,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(cardData.nickname),
//               ],
//             ),
//           ],
//         ),
//       ),
//       confirmDismiss: (direction) async {
//         if (direction == DismissDirection.endToStart) {
//           // 삭제 아이콘 버튼을 스와이프하여 제거할 때
//           return true;
//         } else if (direction == DismissDirection.startToEnd) {
//           // 수정 아이콘 버튼을 스와이프하여 수정할 때
//           return false; // 수정 기능은 여기서 구현해야 함
//         }
//         return false;
//       },
//       onDismissed: (direction) {
//         if (direction == DismissDirection.endToStart) {
//           // 삭제 아이콘 버튼을 스와이프하여 제거할 때
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Card removed')),
//           );
//           // 여기에서 해당 카드를 삭제하는 로직을 구현할 수 있습니다.
//         }
//       },
//     );
//   }
// }


