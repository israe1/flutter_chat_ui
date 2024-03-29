import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';
class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen(this.user);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String newMessage;
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {}
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int i){
                      Message message = messages[i];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                )
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    return Row(
      children: <Widget>[
        Visibility(
          visible: isMe,
          child: Spacer(),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          margin: isMe ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0
          ) :
          EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
          ),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor :Color(0xFFFFEFEE),
            borderRadius: isMe ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0)
            ) : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)
            )
          ),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 5.0,),
              Text(
                message.text,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700
                ),
              ),
            ],
          )
        ),
        Visibility(
          visible: !isMe,
          child: IconButton(
              icon: Icon(message.isLiked ? Icons.favorite : Icons.favorite_border),
              iconSize: 30.0,
              color: message.isLiked ? Colors.red : Colors.blueGrey,
              onPressed: () {
                setState(() {
                  message.isLiked = !message.isLiked;
                });
              }
          ),
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {}
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter your message'
              ),
              onChanged: (String s){
                setState(() {
                  newMessage = s;
                });
              },
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if(newMessage != null && newMessage.isNotEmpty){
                  setState(() {
                    Message myMessage = Message(
                      sender: currentUser,
                      text: newMessage,
                      time: "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                      isLiked: false,
                      unread: true
                    );
                    messages.insert(0, myMessage);
                    _controller.clear();
                  });
                }
              }
          ),
        ],
      ),
    );
  }
}
