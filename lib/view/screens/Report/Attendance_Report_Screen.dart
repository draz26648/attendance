import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/componants.dart';
import '../Home/Attendance_Home_Screen.dart';

class AttendanceReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 193, 79, 1),
        elevation: 0.0,
        titleSpacing: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(22, 29, 111, 1),
          onPressed: () {
            navigateTo(context, AttendanceHomeScreen());
          },
        ),
        title: Text(
          'Report',
          style: TextStyle(
            color: Color.fromRGBO(22, 29, 111, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_active_rounded,
              color: Color.fromRGBO(22, 29, 111, 1),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 193, 79, 1),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(50),
              bottomEnd: Radius.circular(50),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 193, 79, 1),
                    ),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 193, 79, 1),
                    ),
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Absent',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 193, 79, 1),
                    ),
                  ),
                  Text(
                    '50',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Present',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://www.clipartmax.com/png/middle/290-2901540_student-icon-male-student-icon-png.png',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mohamed Ibrahim',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        '4cs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '9:25',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 15,
          ),
        ),
      ]),
    );
  }
}
