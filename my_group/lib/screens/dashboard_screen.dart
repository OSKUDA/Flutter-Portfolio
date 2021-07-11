import 'package:flutter/material.dart';
import 'package:my_group/database/group_chat_message.dart';
import 'package:provider/provider.dart';
import 'package:my_group/database/authentication_state.dart';
import 'package:my_group/database/group_chat_list.dart';
import 'package:my_group/components/dashboard/custom_alert_dialog.dart';
import 'package:my_group/utils/constants.dart';
import 'package:my_group/components/dashboard/chat_list_generator.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _onBackPressed(BuildContext context) {
    Provider.of<AuthenticationState>(context, listen: false).signOut();
    Provider.of<GroupChatList>(context, listen: false).flushGroupChatList();
    return true;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GroupChatList>(context, listen: false).init();
  }

  void _showErrorDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kCardBackgroundColor,
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Enter Valid GroupChat Number',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed(context);
      },
      child: Consumer3<AuthenticationState, GroupChatList, GroupChatMessage>(
        builder: (context, authenticationState, groupChatList, groupChatMessage,
                _) =>
            Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  authenticationState.signOut();
                  groupChatList.flushGroupChatList();
                  Navigator.pop(context);
                },
              ),
            ],
            title: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text(kAppName),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  alertDialogState: AlertDialogState.notSelected,
                  createNewGroupCallback: (groupTitle) =>
                      Provider.of<GroupChatList>(context, listen: false)
                          .addNewGroupChat(groupTitle!),
                  joinExistingGroupCallback: (groupNumber) =>
                      Provider.of<GroupChatList>(context, listen: false)
                          .addNewMember(
                              groupNumber!,
                              () => _showErrorDialog(
                                  context, 'No such group found!')),
                ),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                ChatListGenerator(
                    groupChatList: groupChatList,
                    groupChatMessage: groupChatMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
