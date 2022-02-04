// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test/core/services/firestore.dart';
// import 'package:test/core/constants/colors.dart';

import 'features/Food/presentation/pages/fav_Landing.dart';
import 'features/Food/presentation/pages/home_Landing.dart';
import 'features/Food/presentation/pages/profile_Landing.dart';
import 'features/Food/presentation/pages/searches_Landing.dart';
import 'features/sidebar.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var _currentIndex = 0;
  final FirestoreDB _firestoreDB = FirestoreDB();
  final foodNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foodNameController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    int activePage = 0;
    late PageController _pageController = PageController();

    @override
    void initState() {
      super.initState();
      _pageController = PageController();
    }

    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          automaticallyImplyLeading: false,
          title: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {
                  _firestoreDB.getFoodsByName(foodNameController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        drawer: const sidebar(),
        body: PageView(
          controller: _pageController,
          children: const [
            homeLanding(),
            favLanding(),
            searchLanding(),
            profileLanding(),
          ],
          onPageChanged: (index) {
            setState(
              () {
                _pageController.jumpToPage(index);
              },
            );
          },
        ),
        bottomNavigationBar: SalomonBottomBar(
          duration: const Duration(milliseconds: 1500),
          currentIndex: _currentIndex,
          onTap: (pages) => setState(
            () {
              _currentIndex = pages;
              _pageController.jumpToPage(pages);
              activePage = pages;
            },
          ),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Available Foods"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Favorites"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.white,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
