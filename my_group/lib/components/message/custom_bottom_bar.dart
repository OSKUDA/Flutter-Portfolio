import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(String) onChangedCallback;
  final Function() onSendCallback;
  final TextEditingController _textEditingController = TextEditingController();
  CustomBottomBar(
      {required this.onChangedCallback, required this.onSendCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8.0,
        right: 15.0,
        left: 15.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF241947),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _textEditingController,
                cursorColor: Color(0xFF747492),
                decoration: InputDecoration(
                  hintText: 'Write your message...',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Color(0xFF747492),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Color(0xFF747492),
                      width: 1.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.white70,
                ),
                onChanged: onChangedCallback,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 5.0,
              ),
              onPressed: () {
                _textEditingController.clear();
                onSendCallback();
              },
              child: Text(
                'SEND',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
