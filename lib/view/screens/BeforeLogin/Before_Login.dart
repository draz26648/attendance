import 'package:flutter/material.dart';

import '../../../shared/components/componants.dart';
import '../login/Admin/Login_Admin.dart';
import '../login/Attendance_Login_Screen.dart';

class BeforeLoginScreen extends StatefulWidget {
  @override
  _BeforeLoginScreenState createState() => _BeforeLoginScreenState();
}

class _BeforeLoginScreenState extends State<BeforeLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 29, 111, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGIN AS?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please choose your specialty',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            defaultButton(
              function: () {
                navigateTo(context, AttendanceLoginScreen());
              },
              radius: 20,
              width: 300,
              text: 'DOCTOR',
              isUpperCase: true,
              background: Color.fromRGBO(255, 193, 79, 1),
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(
              function: () {
                navigateTo(context, LoginAdminScreen());
              },
              radius: 20,
              width: 300,
              text: 'ADMIN',
              isUpperCase: true,
              background: Colors.blue.withOpacity(.2),
            ),
          ],
        ),
      ),
    );
  }
}
