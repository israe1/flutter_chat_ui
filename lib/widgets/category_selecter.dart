import 'package:flutter/material.dart';
class CategorySelecter extends StatefulWidget {
  @override
  _CategorySelecterState createState() => _CategorySelecterState();
}

class _CategorySelecterState extends State<CategorySelecter> {
  int selectedIndex = 0;
  final List<String> categories = [
    "Messages",
    "Online",
    "Groups",
    "Requests"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext buildContext, int index){
            String category = categories[index];
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.white60,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
