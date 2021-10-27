// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab2/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      darkTheme: ThemeData(
        accentColor: Colors.grey,
        brightness: Brightness.dark,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(width: 0.5, color: Colors.white)),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'lab2 Home Page'),
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
  int index = 4;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 4);
  }

  void onTap(int i) {
    setState(() {
      index = i;

      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    });
  }

  final List<Widget> widgets = [
    Center(child: Text('Home page')),
    Center(child: Text('Search')),
    Center(child: Text('Add new post')),
    Center(child: Text('Liked posts')),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: pageController,
          onPageChanged: (i) {
            setState(() => index = i);
          },
          children: widgets,
        ),
      ),
      floatingActionButton: index == 3
          ? FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFFFFFF),
        currentIndex: index,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'home_filled', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'search', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'add', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'like', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'account', tooltip: ''),
        ],
      ),
    );
  }
}
