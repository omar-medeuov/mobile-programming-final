import 'package:flutter/material.dart';
import 'package:https_project/home/ui/home_page.dart';
import 'package:https_project/profile/ui/pages/third_page.dart';
import 'package:https_project/second/ui/second_page.dart';
import 'package:https_project/user/ui/user_info_page.dart';



class BottomBarPage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  BottomBarPage({required this.name, required this.email, required this.phoneNumber});

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar Page'),
        backgroundColor: Colors.grey,
      ),
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home Page', backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.orange),
            label: 'Second Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Colors.orange),
            label: 'Third Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.orange),
            label: 'User Info Page',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SecondPage();
      case 2:
        return ThirdPage();
      case 3:
        return UserInfoPage(name: widget.name, email: widget.email, phoneNumber: widget.phoneNumber);
      default:
        return Container();
    }
  }
}
