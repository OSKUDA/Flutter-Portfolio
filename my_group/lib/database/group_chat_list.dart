import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_group/models/group_chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class GroupChatList extends ChangeNotifier {
  List<GroupChat> _groupChatList = [];
  //constructor
  GroupChatList() {
    init();
  }

  Future<void> init() async {
    // simple  async call to initialize firebase
    await Firebase.initializeApp();

    // setup listener for FirebaseStore collection
    // this method will be called when there is any changes
    // on our collection
    FirebaseFirestore.instance
        .collection('groups')
        .snapshots()
        .listen((snapshot) {
      _groupChatList = [];
      for (var document in snapshot.docs) {
        List<dynamic> members = document.data()['members'];
        for (String s in members) {
          if (s.compareTo(FirebaseAuth.instance.currentUser!.uid.toString()) ==
              0) {
            _groupChatList.add(
              GroupChat(
                  groupChatId: document.id,
                  groupChatNumber: document.data()['number'],
                  title: document.data()['title'],
                  owner: document.data()['owner'],
                  memberList: document.data()['members']),
            );
            break;
          }
        }
      }
      notifyListeners();
    });
  }

  Future<DocumentReference> addNewGroupChat(String title) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('Must be logged in');
    }
    return FirebaseFirestore.instance
        .collection('groups')
        .add(<String, dynamic>{
      'members':
          FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
      'number': Random().nextInt(8888) + 1111,
      'owner': FirebaseAuth.instance.currentUser!.uid,
      'title': title,
    });
  }

  Future<void> addNewMember(String groupNumber, Function errorCallback) async {
    DocumentReference? documentReference;
    await FirebaseFirestore.instance
        .collection('groups')
        .where('number', isEqualTo: int.parse(groupNumber))
        .get()
        .then((value) {
      try {
        documentReference = value.docs[0].reference;
      } catch (e) {
        errorCallback();
      }
    });
    if (documentReference != null) {
      documentReference!.update({
        'members':
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
    }
  }

  void deleteGroupChat(int index) {
    FirebaseFirestore.instance
        .collection('groups')
        .doc(_groupChatList[index].getGroupChatId)
        .delete();
  }

  bool checkIfOwner(int index) {
    return _groupChatList[index].getOwner ==
            FirebaseAuth.instance.currentUser!.uid
        ? true
        : false;
  }

  void flushGroupChatList() {
    _groupChatList = [];
  }

  // getter methods
  List<GroupChat> get getListOfGroupChat => _groupChatList;
  int get getLengthOfGroupChatList => _groupChatList.length;
}
