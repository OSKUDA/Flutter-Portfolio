import 'package:flutter/material.dart';
import 'package:my_group/database/group_chat_list.dart';
import 'package:my_group/database/group_chat_message.dart';
import 'package:my_group/components/dashboard/custom_card_group_chat_list.dart';
import 'package:my_group/screens/message_screen.dart';
import 'package:my_group/components/dashboard/custom_no_item_card.dart';
import 'package:my_group/components/dashboard/delete_confirmation_alert_dialog.dart';

class ChatListGenerator extends StatelessWidget {
  final GroupChatList groupChatList;
  final GroupChatMessage groupChatMessage;
  ChatListGenerator(
      {required this.groupChatList, required this.groupChatMessage});
  @override
  Widget build(BuildContext context) {
    return groupChatList.getLengthOfGroupChatList == 0
        ? CustomNoItemCard()
        : Expanded(
            child: ListView.builder(
              itemCount: groupChatList.getLengthOfGroupChatList,
              itemBuilder: (BuildContext context, int index) {
                return CustomCardGroupChatList(
                  groupChat: groupChatList.getListOfGroupChat[index],
                  groupChatIdCallback: (groupChat) {
                    groupChatMessage.setParentGroupChatId(
                        groupChat!.getGroupChatId,
                        groupChat.getTitle,
                        groupChat.getGroupChatNumber);
                    Navigator.pushNamed(context, MessageScreen.id);
                  },
                  groupChatDeleteDialogCallback: () => showDialog(
                    context: context,
                    builder: (_) => DeleteConfirmationAlertDialog(
                      index: index,
                      groupChatList: groupChatList,
                    ),
                  ),
                );
              },
            ),
          );
  }
}
