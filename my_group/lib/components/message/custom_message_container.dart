import 'package:flutter/material.dart';

class CustomMessageContainer extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  CustomMessageContainer(
      {required this.sender,
      required this.isMe,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 5.0,
              ),
              child: Text(
                sender,
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF9FA1BF),
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
