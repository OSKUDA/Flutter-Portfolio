import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_group/database/group_chat_message.dart';
import 'package:my_group/components/message/custom_bottom_bar.dart';
import 'package:my_group/components/message/custom_message_container.dart';
import 'package:my_group/utils/constants.dart';

class MessageScreen extends StatefulWidget {
  static const id = 'message_screen';

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return Consumer<GroupChatMessage>(
      builder: (context, groupChatMessage, _) => Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(groupChatMessage.getParentGroupChatTitle),
              Text(
                'number: ${groupChatMessage.getParentGroupChatNumber.toString()}',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                    reverse: true,
                    itemCount: groupChatMessage.getMessageCount,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomMessageContainer(
                        sender: groupChatMessage.getMessages[index].getSender,
                        isMe: groupChatMessage.getIsMe(index),
                        text: groupChatMessage.getMessages[index].getText,
                      );
                    }),
              ),
              CustomBottomBar(
                onChangedCallback: (newValue) {
                  text = newValue;
                },
                onSendCallback: () => groupChatMessage.addNewMessage(text!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
