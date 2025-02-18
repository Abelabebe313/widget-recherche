import 'package:example/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search/search.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(title: 'Search Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 810));
    return TargetPage(
      target: Target.searchbar,
      avatarImage: 'https://via.placeholder.com/150/',
      title: 'Title',
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 700,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: 700,
            color: Colors.green,
          )
        ],
      ),
      onPressed: () => Navigator.push(
        context,
        PageTransition(
          child: const Test1(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
