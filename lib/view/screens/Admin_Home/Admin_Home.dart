import 'package:fady/view/screens/Admin_Home/Doctor.dart';
import 'package:fady/view/screens/Admin_Home/Student.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screen = [
    StudentScreen(),
    DoctorScreen(),
  ];
  List<String> title = [
    'Add Students',
    'Add Doctors',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 193, 79, 1),
        elevation: 0.0,
        titleSpacing: 10,
        title: Text(
          title[_selectedIndex],
        ),
      ),
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'STUDENT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'DOCTOR',
          ),
        ],
      ),
    );
  }
}
