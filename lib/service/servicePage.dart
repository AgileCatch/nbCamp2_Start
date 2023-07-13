import 'package:flutter/material.dart';

class User {
  User({
    required this.photo,
    required this.name,
    required this.nickname,
    required this.date,
    required this.emailaddress,
    required this.address,
    required this.like,
    required this.mbti,
    required this.hobby,
  });
  String photo;
  String name;
  String nickname;
  String date;
  String emailaddress;
  String address;
  String like;
  String mbti;
  String hobby;
}

class UserService extends ChangeNotifier {
  List<User> cardList = [
    User(
        photo:
            'http://res.heraldm.com/content/image/2023/06/04/20230604000075_0.jpg',
        name: '푸바오1',
        nickname: '곰ㅁ',
        date: '111',
        emailaddress: 'dd',
        address: 'ddddsds',
        like: 'dddd',
        mbti: 'dd',
        hobby: 'dddd'),
    User(
        photo:
            'https://image.jtbcplus.kr/data/contents/jam_photo/202306/10/5ebc5232-e43c-4f9c-83ae-66ff5679726a.jpg',
        name: '푸바오21',
        nickname: '곰3ㅁ',
        date: '13311',
        emailaddress: 'd3d',
        address: 'd3d',
        like: 'dddd3',
        mbti: '2dd',
        hobby: 'dd2dd'),
  ];

  createItem({
    required String photo,
    required String name,
    required String nickname,
    required String date,
    required String emailaddress,
    required String address,
    required String like,
    required String mbti,
    required String hobby,
  }) {
    cardList.add(
      User(
        photo: photo,
        name: name,
        nickname: nickname,
        date: date,
        emailaddress: emailaddress,
        address: address,
        like: like,
        hobby: hobby,
        mbti: mbti,
      ),
    );
    notifyListeners(); //Consumer<BartenderService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateItem({
    required int index,
    required String name,
    required String nickname,
    required String date,
    required String emailaddress,
    required String address,
    required String like,
    required String mbti,
    required String hobby,
  }) {
    cardList[index].name = name;
    cardList[index].nickname = nickname;
    cardList[index].date = date;
    cardList[index].address = address;
    cardList[index].like = like;
    cardList[index].emailaddress = emailaddress;
    cardList[index].hobby = hobby;
    cardList[index].mbti = mbti;

    notifyListeners();
  }

  removeItem({required int index}) {
    cardList.removeAt(index);
    notifyListeners();
  }
}
