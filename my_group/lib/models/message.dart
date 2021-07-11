import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String _sender = '';
  String _text = '';
  Timestamp? _sentTime;
  Message({required sender, required text, required sentTime}) {
    _sender = sender;
    _text = text;
    _sentTime = sentTime;
  }

  //getters
  String get getSender => _sender;
  String get getText => _text;
  Timestamp? get getSentTime => _sentTime;
}
