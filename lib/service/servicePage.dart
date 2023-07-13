import 'package:flutter/material.dart';
import 'package:introduce_myself/main.dart';
import 'dart:convert';

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

  Map toJson() {
    return {
      'photo': photo,
      'name': name,
      'nickname': nickname,
      'date': date,
      'emailaddress': emailaddress,
      'address': address,
      'like': like,
      'mbti': mbti,
      'hobby': hobby,
    };
  }

  factory User.fromJson(json) {
    return User(
      photo: json['photo'],
      name: json['name'],
      nickname: json['nickname'],
      date: json['date'],
      emailaddress: json['emailaddress'],
      address: json['address'],
      like: json['like'],
      mbti: json['mbti'],
      hobby: json['hobby'],
    );
  }
}

class UserService extends ChangeNotifier {
  UserService() {
    loadUserList();
  }

  List<User> userList = [
    //2개의 카드 초기화해줬음
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
    User user = User(
        photo: photo,
        name: name,
        nickname: nickname,
        date: date,
        emailaddress: emailaddress,
        address: address,
        like: like,
        mbti: mbti,
        hobby: hobby);
    userList.add(user);
    notifyListeners(); //Consumer<BartenderService>의 builder 부분을 호출해서 화면 새로고침
    saveUserList();
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
    User user = userList[index];
    user.name = name;
    user.nickname = nickname;
    user.date = date;
    user.address = address;
    user.like = like;
    user.emailaddress = emailaddress;
    user.hobby = hobby;
    user.mbti = mbti;
    // userList[index].name = name;
    // userList[index].nickname = nickname;
    // userList[index].date = date;
    // userList[index].address = address;
    // userList[index].like = like;
    // userList[index].emailaddress = emailaddress;
    // userList[index].hobby = hobby;
    // userList[index].mbti = mbti;

    notifyListeners();
    saveUserList();
  }

  removeItem({required int index}) {
    userList.removeAt(index);
    notifyListeners();
    saveUserList();
  }

  saveUserList() {
    List userJsonList = userList.map((user) => user.toJson()).toList();

    String jsonString = jsonEncode(userJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('userList', jsonString);
  }

  loadUserList() {
    String? jsonString = prefs.getString('userJsonList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List userJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    userList = userJsonList.map((json) => User.fromJson(json)).toList();
  }
}
