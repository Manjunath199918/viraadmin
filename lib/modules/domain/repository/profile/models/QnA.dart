part of '../my_profile_repository.dart';

class QnA {
  String? answer;
  String? question;

  QnA({this.answer, this.question});

  QnA.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['question'] = this.question;
    return data;
  }
}