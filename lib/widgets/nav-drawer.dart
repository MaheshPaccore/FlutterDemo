import 'package:flutter/material.dart';
import 'package:quiz/add_questions.dart';
import 'package:quiz/quiz_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'quiz app',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Admin'),
            onTap: () => {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => QuizScreen()),
  )},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Quiz'),
            onTap: () => {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CsvToList()),
  )},
          ),
        ],
      ),
    );
  }
}