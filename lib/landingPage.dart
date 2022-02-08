// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test/core/services/firestore.dart';
import 'package:test/features/Food/presentation/pages/searches_Landing.dart';
// import 'package:test/core/constants/colors.dart';

import 'features/Food/presentation/pages/home_Landing.dart';
import 'features/sidebar.dart';

class Landing extends StatefulWidget {
  const Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // var _currentIndex = 0;
  // final FirestoreDB _firestoreDB = FirestoreDB();
  final foodNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foodNameController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    // int activePage = 0;
    // PageController _pageController = PageController();

    // @override
    // void initState() {
    //   super.initState();
    //   _pageController = PageController();
    // }

    // @override
    // void dispose() {
    //   _pageController.dispose();
    //   super.dispose();
    // }

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Makata",
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 1.25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const searchLanding(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const sidebar(),
      body: const homeLanding(),
      // PageView(
      //   controller: _pageController,
      //   children: const [
      //     homeLanding(),
      //     favLanding(),
      //     searchLanding(),
      //     profileLanding(),
      //   ],
      //   onPageChanged: (index) {
      //     setState(
      //       () {
      //         _pageController.jumpToPage(index);
      //       },
      //     );
      //   },
      // ),
      // bottomNavigationBar: SalomonBottomBar(
      //   duration: const Duration(milliseconds: 1500),
      //   currentIndex: _currentIndex,
      //   onTap: (pages) => setState(
      //     () {
      //       _currentIndex = pages;
      //       _pageController.jumpToPage(pages);
      //       activePage = pages;
      //     },
      //   ),
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.home),
      //       title: const Text("Available Foods"),
      //       selectedColor: Colors.purple,
      //     ),

      //     /// Likes
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.favorite_border),
      //       title: const Text("Favorites"),
      //       selectedColor: Colors.pink,
      //     ),

      //     /// Search
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.search),
      //       title: const Text("Search"),
      //       selectedColor: Colors.white,
      //     ),

      //     /// Profile
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.person),
      //       title: const Text("Profile"),
      //       selectedColor: Colors.teal,
      //     ),
      //   ],
      // ),
    );
  }
}
