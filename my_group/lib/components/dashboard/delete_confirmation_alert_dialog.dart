import 'package:flutter/material.dart';
import 'package:my_group/database/group_chat_list.dart';
import 'package:my_group/utils/constants.dart';

class DeleteConfirmationAlertDialog extends StatelessWidget {
  final int index;
  final GroupChatList groupChatList;
  DeleteConfirmationAlertDialog(
      {required this.index, required this.groupChatList});
  @override
  Widget build(BuildContext context) {
    return groupChatList.checkIfOwner(index)
        ? AlertDialog(
            backgroundColor: kCardBackgroundColor,
            title: Text('Are you sure you want to delete the chat?'),
            actions: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextButton(
                  onPressed: () {
                    groupChatList.deleteGroupChat(index);
                    Navigator.pop(context);
                  },
                  child: Text('Yes', style: TextStyle(color: Colors.black54)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('No', style: TextStyle(color: Colors.black54)),
                ),
              ),
            ],
          )
        : AlertDialog(
            backgroundColor: kCardBackgroundColor,
            title: Text('Only admin can delete'),
            actions: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok', style: TextStyle(color: Colors.black54)),
                ),
              ),
            ],
          );
  }
}
