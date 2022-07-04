import 'package:fady/model/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/components/componants.dart';
import '../Home/Attendance_Home_Screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AttendanceLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(
                      'assets/image/login.jpeg',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'DOCTOR LOGIN',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
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
                            const SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword: LoginCubit.get(context).isPassword,
                              suffix: LoginCubit.get(context).suffix,
                              suffixPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              label: 'Password',
                              prefix: Icons.lock_outline,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  LoginCubit.get(context).doctor_login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    isAdmin: false,
                                  );
                                  if (state is LoginSuccessState) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AttendanceHomeScreen(
                                          model: state.loginModel,
                                        ),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                        msg: 'Login Success');
                                  } else if (state is LoginErrorState) {
                                    Fluttertoast.showToast(msg: state.error);
                                  }
                                }

                                // navigateTo(context, AttendanceHomeScreen());
                              },
                              text: 'login',
                              isUpperCase: true,
                              background: Colors.blue.withOpacity(.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
