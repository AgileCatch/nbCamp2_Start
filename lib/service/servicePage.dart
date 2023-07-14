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
    User(
      photo:
          "https://cdn.newspenguin.com/news/photo/202306/14323_44808_3812.jpg",
      name: "김영현",
      nickname: "coffeeMaster",
      date: "2000-05-25",
      emailaddress: "agilecatch@gmail.com",
      address: "광주 광역시",
      like: "맛집탐방, 고양이",
      mbti: "ESFP",
      hobby: "사진찍기, 게임하기, 운동하기",
    ),
    User(
      photo:
          "https://cdn.newspenguin.com/news/photo/202306/14323_44795_920.jpg",
      name: "서수현",
      nickname: "joye",
      date: "1993-01-19",
      emailaddress: "missu0119@gmail.com",
      address: "서울 특별시",
      like: "팬더, 강아지, 민트초코, T1",
      mbti: "INFP",
      hobby: "온라인게임, 보드게임, 롤경기 보기",
    ),
    User(
      photo:
          "https://cdn.newspenguin.com/news/photo/202306/14323_44801_2456.jpg",
      name: "정도균",
      nickname: "Ducnan",
      date: "1997-06-02",
      emailaddress: "wjdehrbs123@gmail.com",
      address: "전북 익산시",
      like: "혼자 영화나 애니보기, 동물",
      mbti: "INFP",
      hobby: "게임, 노래방, 요리, 맛집탐방",
    ),
    User(
      photo:
          "https://cdn.newspenguin.com/news/photo/202306/14323_44809_4046.jpg",
      name: "문서연",
      nickname: "SeoYeon",
      date: "1996-12-23",
      emailaddress: "mbb1223h@gmail.com",
      address: "광주 광역시",
      like: "바다",
      mbti: "INTJ",
      hobby: "피아노",
    ),
    User(
      photo:
          "https://image.newsis.com/2021/07/20/NISI20210720_0017686240_web.jpg?rnd=20210720120731",
      name: "장재원",
      nickname: "janga0710",
      date: "1997-10-19",
      emailaddress: "janga9710@naver.com",
      address: "경북 구미시",
      like: "게임, 노래방, 영화",
      mbti: "INFP",
      hobby: "유튜브보기, 스팀게임, 산책",
    ),
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
    required String content,
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
    String? jsonString = prefs.getString('userList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List userJsonList = jsonDecode(jsonString!);
    // [{"content": "1"}, {"content": "2"}]

    userList = userJsonList.map((json) => User.fromJson(json)).toList();
  }
}
