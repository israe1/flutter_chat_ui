import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/widgets/category_selecter.dart';
import 'package:flutter_chat_ui/widgets/favorite_contacts.dart';
import 'package:flutter_chat_ui/widgets/recent_chat.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {}),
        title: Text('Chats'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelecter(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
