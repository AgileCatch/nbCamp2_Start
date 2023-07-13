import 'package:flutter/material.dart';

//멤버카드 데이터 형식 지정
class Member {
  Member({
    required this.photo,
    required this.name,
    required this.nickName,
    required this.birth,
    required this.live,
    required this.mbti,
    required this.like,
    required this.hobby,
  });
  String photo;
  String name;
  String nickName;
  String birth;
  String live;
  String mbti;
  String like;
  String hobby;
}

//멤버카드 데이터 관리 - 현재 더미데이터
class MemberList extends ChangeNotifier {
  List<Member> memberList = [
    Member(
        photo:
            'http://res.heraldm.com/content/image/2023/06/04/20230604000075_0.jpg',
        name: '푸바오1',
        nickName: '곰ㅁ',
        birth: '111',
        live: 'dd',
        mbti: 'dddd',
        like: 'dd',
        hobby: 'dddd'),
    Member(
        photo:
            'https://image.jtbcplus.kr/data/contents/jam_photo/202306/10/5ebc5232-e43c-4f9c-83ae-66ff5679726a.jpg',
        name: '푸바오21',
        nickName: '곰3ㅁ',
        birth: '13311',
        live: 'd3d',
        mbti: 'dddd3',
        like: '2dd',
        hobby: 'dd2dd'),
  ];

  createMemo({
    required String name,
    required String photo,
    required String nickName,
    required String birth,
    required String live,
    required String mbti,
    required String like,
    required String hobby,
  }) {
    Member member = Member(
        photo: photo,
        name: name,
        nickName: nickName,
        birth: birth,
        live: live,
        mbti: mbti,
        like: like,
        hobby: hobby);
  }

  updateMember({required int index, required String name}) {
    Member member = memberList[index];
    member.name = name;
    notifyListeners();
  }
}
