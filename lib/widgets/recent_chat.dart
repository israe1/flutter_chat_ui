import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/screens/chat_screen.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext buildContext, int i) {
              Message chat = chats[i];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChatScreen(chat.sender);
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              chat.sender.name,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              chat.text,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            chat.time,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                            visible: chat.unread,
                            child: Container(
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).primaryColor),
                              alignment: Alignment.center,
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
