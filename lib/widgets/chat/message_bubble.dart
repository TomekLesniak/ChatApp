import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final String username;
  final String imageUrl;
  final bool isMe;

  MessageBubble(this.message, this.isMe, this.username, this.imageUrl,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 140),
                decoration: BoxDecoration(
                  color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                child: Column(
                    crossAxisAlignment:
                        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isMe
                              ? Colors.black
                              : Theme.of(context).accentTextTheme.headline1.color,
                        ),
                      ),
                      Text(
                        message,
                        style: TextStyle(
                          color: isMe
                              ? Colors.black
                              : Theme.of(context).accentTextTheme.headline1.color,
                        ),
                        textAlign: isMe ? TextAlign.right : TextAlign.start,
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Positioned(
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          top: -10,
          left: isMe ? null : 125,
          right: isMe ? 125 : null,
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
