import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_group/models/message.dart';
import 'package:firebase_core/firebase_core.dart';

class GroupChatMessage extends ChangeNotifier {
  List<Message> _groupChatMessage = [];
  String? _parentGroupChatId;
  String? _parentGroupChatTitle;
  int? _parentGroupChatNumber;
  //constructor
  GroupChatMessage() {
    init();
  }

  Future<void> init() async {
    // simple  async call to initialize firebase
    await Firebase.initializeApp();
  }

  Future<DocumentReference> addNewMessage(String text) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('User must be logged in');
    }
    return FirebaseFirestore.instance
        .collection('groups')
        .doc(_parentGroupChatId)
        .collection('messages')
        .add(<String, dynamic>{
      'sender': FirebaseAuth.instance.currentUser!.displayName,
      'text': text,
      'timestamp': Timestamp.now(),
    });
  }

  void setParentGroupChatId(String parentGroupChatId,
      String parentGroupChatTitle, int parentGroupChatNumber) {
    _parentGroupChatId = parentGroupChatId;
    _parentGroupChatTitle = parentGroupChatTitle;
    _parentGroupChatNumber = parentGroupChatNumber;
    updateListener();
  }

  void updateListener() {
    // setup listener for FirebaseStore collection
    // this method will be called when there is any changes
    // on our collection
    FirebaseFirestore.instance
        .collection('groups')
        .doc(_parentGroupChatId)
        .collection('messages')
        .orderBy(
          'timestamp',
          descending: true,
        )
        .snapshots()
        .listen((snapshot) {
      _groupChatMessage = [];
      for (var document in snapshot.docs) {
        _groupChatMessage.add(Message(
          sender: document.data()['sender'],
          text: document.data()['text'],
          sentTime: document.data()['sentTime'],
        ));
      }
      notifyListeners();
    });
  }

  bool getIsMe(int index) {
    return _groupChatMessage[index].getSender ==
            FirebaseAuth.instance.currentUser!.displayName
        ? true
        : false;
  }

  //getter methods
  String get getParentGroupChatTitle => _parentGroupChatTitle!;
  int get getMessageCount => _groupChatMessage.length;
  int get getParentGroupChatNumber => _parentGroupChatNumber!;
  List<Message> get getMessages => _groupChatMessage;
}
