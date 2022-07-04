import 'package:bloc/bloc.dart';
import 'package:fady/shared/bloc_observer.dart';
import 'package:fady/shared/components/constants.dart';

import 'package:fady/shared/styles/themes.dart';
import 'package:fady/view/screens/Admin_Home/cubit/add_users_cubit.dart';
import 'package:fady/view/screens/Home/subject_cubit/subject_cubit.dart';
import 'package:fady/view/screens/Modify/cubit/attend_cubit.dart';
import 'package:fady/view/screens/UserProfile/cubit/profile_cubit.dart';
import 'package:fady/view/screens/login/Admin/cubit/login_cubit.dart';
import 'package:fady/view/screens/on_hash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // بيتاكد ان كل حاجه في الميثود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  Widget widget;

  // token = CacheHelper.getData(key: 'token');
  // print(token);

  runApp(MyApp(
    startWidget: widget,
  ));
}

// Stateless
// Stateful
// class MyApp
class MyApp extends StatelessWidget {
  // constructor
  // build
  final bool isDark;
  final Widget startWidget;

  MyApp({this.isDark, this.startWidget});
  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<AddUsersCubit>(
          create: (context) => AddUsersCubit(),
        ),
        BlocProvider<AttendCubit>(
          create: (context) => AttendCubit(),
        ),
        BlocProvider<SubjectCubit>(
          create: (context) => SubjectCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnHashScreen(),
      ),
    );
  }
}
