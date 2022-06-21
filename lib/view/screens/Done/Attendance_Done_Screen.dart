import 'package:flutter/material.dart';

import '../../../shared/components/componants.dart';
import '../Auto/Attendance_Auto_Screen.dart';
import '../Thank_you/Thank_You_Screen.dart';

class AutoAttendanceDoneScreen extends StatefulWidget {
  @override
  _AutoAttendanceDoneScreenState createState() =>
      _AutoAttendanceDoneScreenState();
}

class _AutoAttendanceDoneScreenState extends State<AutoAttendanceDoneScreen> {
  // bool isChecked = false;
  static int _len = 15;

  List<bool> isChecked = List.generate(_len, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 193, 79, 1),
        elevation: 0.0,
        titleSpacing: 20,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(22, 29, 111, 1),
          onPressed: () {
            navigateTo(context, AttendanceAutoScreen());
          },
        ),
        title: Text(
          'Auto Attendance',
          style: TextStyle(
            color: Color.fromRGBO(22, 29, 111, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 193, 79, 1),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 30,
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
                    Checkbox(
                      activeColor: Color.fromRGBO(255, 193, 79, 1),
                      value: isChecked[index],
                      onChanged: (checked) {
                        setState(
                          () {
                            isChecked[index] = checked;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: _len,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                navigateTo(context, AttendanceThankYouScreen());
              },
              radius: 20,
              width: 200,
              text: 'done',
              isUpperCase: true,
              background: Color.fromRGBO(22, 29, 111, 1),
            ),
          ),
        ],
      ),
    );
  }
}
