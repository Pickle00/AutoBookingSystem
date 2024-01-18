// import 'dart:ffi';

import 'dart:ffi';

import 'package:auto_booking/bloc/landing_page_bloc.dart';
import 'package:auto_booking/repository/repo.dart';
import 'package:auto_booking/screens/book_ride.dart';
import 'package:auto_booking/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import "dart:convert" as convert;

// import 'package:search_map_location/search_map_location.dart';
import 'package:auto_booking/screens/landing_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  late GoogleMapController mapController;

  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<dynamic> placelist = [];

  var _controller = TextEditingController();
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    LandingPage(),
    BookRide(),
    Settings(),
  ];

  List placenames = ["Hetauda", "Pokhara", "Dharan"];

  getplaces(String input) {
    Repo repo = Repo(input: input);
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
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   toolbarHeight: 60,
        //   leading: IconButton(
        //     padding: const EdgeInsets.all(10.0),
        //     onPressed: () {},
        //     icon: Icon(Icons.menu),
        //   ),
        //   actions: [
        //     IconButton(
        //       padding: const EdgeInsets.all(10.0),
        //       onPressed: () {},
        //       icon: const Icon(Icons.person),
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 18.0,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId("source"),
                  position: _center,
                )
              },
            ),
            Positioned(
              top: 30,
              left: 55,
              right: 55, // Adjust right padding as needed
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Search Locations",
                      focusColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onTap: () async {
                      Repo repo = Repo(input: _controller.text);
                      placelist = await repo.getSuggestions();
                      // print(place);
                      // // List<dynamic>  = await place;
                      // placelist.add(place);
                      // print("This is placelist");
                      print(placelist);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50, // Adjust top padding as needed
              left: 55,
              right: 55, // Adjust right padding as needed
              bottom: 0, // Adjust bottom padding as needed
              child: Expanded(
                child: ListView.builder(
                  itemCount: placelist.length,
                  itemBuilder: (context, index) {
                    // return Text("ok" + index.toString());
                    return GestureDetector(
                      child: ListTile(
                        title: Text(placelist[index]['description']),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Repo repo = Repo(input: 'Hetauda children park');
            Future<List<dynamic>> place = repo.getSuggestions();
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
