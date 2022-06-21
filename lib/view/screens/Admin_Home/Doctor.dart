import 'package:fady/view/screens/Admin_Home/cubit/add_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/components/componants.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var fname = TextEditingController();
  var lname = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  var password = TextEditingController();
  String dropdownvalues = 'Male';
  var item = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: fname,
                type: TextInputType.name,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your first name';
                  }
                },
                label: 'First Name',
                prefix: Icons.drive_file_rename_outline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: lname,
                type: TextInputType.name,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your list name';
                  }
                },
                label: 'Last Name',
                prefix: Icons.drive_file_rename_outline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your email address';
                  }
                },
                label: 'Email Address',
                prefix: Icons.email_outlined,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: password,
                type: TextInputType.visiblePassword,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your password';
                  }
                },
                label: 'Password',
                prefix: Icons.lock_outline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: address,
                type: TextInputType.visiblePassword,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your address';
                  }
                },
                label: 'address',
                prefix: Icons.home,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: defaultFormField(
                controller: phone,
                type: TextInputType.number,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter your phone';
                  }
                },
                label: 'phone',
                prefix: Icons.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    'Gender :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      DropdownButton(
                        value: dropdownvalues,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: item.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalues = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<AddUsersCubit, AddUsersState>(
              builder: (context, state) {
                return defaultButton(
                  function: () {
                    if (formKey.currentState.validate()) {
                      AddUsersCubit.get(context).addLecturer(
                          first_name: fname.text,
                          last_name: lname.text,
                          email: emailController.text,
                          password: password.text,
                          phone: int.parse(phone.text),
                          address: address.text,
                          gender: dropdownvalues);
                      if (state is AddUsersSuccess) {
                        Fluttertoast.showToast(msg: state.message);
                      } else if (state is AddUsersError) {
                        Fluttertoast.showToast(msg: state.error);
                      }
                    }
                  },
                  text: 'Done',
                  isUpperCase: true,
                  background: Color.fromRGBO(255, 193, 79, 1),
                  width: 200,
                  radius: 20,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
