import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';
import 'package:flutter_chat_ui/screens/chat_screen.dart';
class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    'Favorite Contacts',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: Colors.blueGrey,
                  onPressed: (){},
                )
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              itemCount: favorites.length,
              itemBuilder: (BuildContext builContext, int index){
                User user = favorites[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return ChatScreen(user);
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(user.imageUrl),
                        ),
                        SizedBox(height: 6.0,),
                        Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
