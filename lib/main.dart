// import 'dart:ffi';

import 'dart:ffi';

import 'package:auto_booking/bloc/landing_page_bloc.dart';
import 'package:auto_booking/repository/repo.dart';
import 'package:auto_booking/screens/book_ride.dart';
import 'package:auto_booking/screens/settings.dart';
import 'package:flutter/material.dart';
import "dart:convert" as convert;
import 'package:auto_booking/screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.white),
          // Commented out 'useMaterial3' because it's not recognized in ThemeData
          // useMaterial3: true,
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> place = [];
  var _controller = TextEditingController();
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    LandingPage(),
    BookRide(),
    Settings(),
  ];

  void getplaces(String input) {
    Repo repo = Repo(input: 'hetauda');
    // place = repo.getSuggestions()._placelist as List<dynamic>;
  }

  void _onItemPressed(int index) {
    setState(() {
      _selectedIndex = index;
      print("Index is {$index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 60,
          leading: IconButton(
            padding: const EdgeInsets.all(10.0),
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          title: Column(
            children: [
              Align(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(width: 1),
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Search Locations",
                    focusColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.search),
                    // suffixIcon: IconButton(
                    //     icon: Icon(Icons.cancel),
                    //     onPressed: () {
                    //       _controller.clear();
                    //     }),
                  ),
                  onTap: () async {
                    getplaces(_controller.text);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: place.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ListTile(
                          title: Text(place[index]['description']),
                        ),
                      );
                    }),
              )
            ],
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {},
              icon: const Icon(Icons.person),
            )
          ],
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(place);
          },
        ),
        bottomNavigationBar: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemPressed,
          ),
        ));
  }
}
