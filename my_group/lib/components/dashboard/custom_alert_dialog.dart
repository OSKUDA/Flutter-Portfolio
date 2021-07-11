import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';

enum AlertDialogState {
  notSelected,
  newGroupSelected,
  joinGroupSelected,
}

class CustomAlertDialog extends StatefulWidget {
  final AlertDialogState alertDialogState;
  final Function(String? title) createNewGroupCallback;
  final Function(String? groupNumber) joinExistingGroupCallback;
  CustomAlertDialog(
      {required this.alertDialogState,
      required this.createNewGroupCallback,
      required this.joinExistingGroupCallback});
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  AlertDialogState? _alertDialogState;
  String? groupTitle;
  String? groupNumber;
  @override
  void initState() {
    super.initState();
    _alertDialogState = widget.alertDialogState;
  }

  @override
  Widget build(BuildContext context) {
    switch (_alertDialogState!) {
      case AlertDialogState.notSelected:
        return AlertDialog(
          backgroundColor: kCardBackgroundColor,
          title: Text('Choose an option'),
          content: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _alertDialogState = AlertDialogState.newGroupSelected;
                        });
                      },
                      child: Text(
                        'Create new group',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _alertDialogState =
                              AlertDialogState.joinGroupSelected;
                        });
                      },
                      child: Text(
                        'Join group',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case AlertDialogState.newGroupSelected:
        return AlertDialog(
          backgroundColor: kCardBackgroundColor,
          title: Text('Create your new group'),
          content: SingleChildScrollView(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter group title',
                focusedBorder: kAlertDialogTextFieldBorder,
                enabledBorder: kAlertDialogTextFieldBorder,
              ),
              cursorColor: kPrimaryColor,
              onChanged: (newValue) {
                groupTitle = newValue;
              },
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextButton(
                onPressed: () {
                  widget.createNewGroupCallback(groupTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        );
      case AlertDialogState.joinGroupSelected:
        return AlertDialog(
          backgroundColor: kCardBackgroundColor,
          title: Text('Join existing group'),
          content: SingleChildScrollView(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter group number',
                focusedBorder: kAlertDialogTextFieldBorder,
                enabledBorder: kAlertDialogTextFieldBorder,
              ),
              cursorColor: kPrimaryColor,
              keyboardType: TextInputType.number,
              onChanged: (newValue) {
                groupNumber = newValue;
              },
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextButton(
                onPressed: () {
                  widget.joinExistingGroupCallback(groupNumber);
                  Navigator.pop(context);
                },
                child: Text(
                  'Join',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        );
    }
  }
}
