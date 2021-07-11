import 'package:flutter/material.dart';
import 'package:my_group/models/group_chat.dart';

class CustomCardGroupChatList extends StatelessWidget {
  final GroupChat groupChat;
  final Function(GroupChat?) groupChatIdCallback;
  final Function() groupChatDeleteDialogCallback;
  CustomCardGroupChatList(
      {required this.groupChat,
      required this.groupChatIdCallback,
      required this.groupChatDeleteDialogCallback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        groupChatIdCallback(groupChat);
      },
      onLongPress: () {
        print('long called');
        groupChatDeleteDialogCallback();
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 10.0,
        color: Color(0xFF9FA1BF),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            groupChat.getTitle,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
