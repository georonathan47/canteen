
import 'package:flutter/material.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/core/services/firestore.dart';

class searchLanding extends StatefulWidget {
  const searchLanding({Key key}) : super(key: key);

  @override
  _searchLandingState createState() => _searchLandingState();
}

class _searchLandingState extends State<searchLanding> {
  // final FirestoreDB _firestoreDB = FirestoreDB();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // QuerySnapshot searchSnapshot;

  // initiateSearch() {
  //   _firestoreDB.getFoodsByName(searchController.text).then((val) => {
  //         setState(() {
  //           // searchSnapshot = val;
  //         }),
  //       });
  // }

  Widget searchTile(String foodName, bool available) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foodName),
                addVertical(5),
                Text(available.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search..."),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   child: Column(
          //     children: [
          //       TextField(
          //         controller: searchController,
          //         onChanged: (val) {
          //           searchController.text = val;
          //         },
          //         decoration: InputDecoration(
          //           enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10),
          //             borderSide:
          //                 const BorderSide(color: Colors.black87, width: 0.0),
          //           ),
          //           focusedBorder: const OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(10)),
          //             borderSide:
          //                 BorderSide(color: Colors.blueAccent, width: 0.7),
          //           ),
          //           hintText: 'Search Food...',
          //           hintStyle:
          //               const TextStyle(fontSize: 17, color: Colors.black54),
          //           suffixIcon: IconButton(
          //             onPressed: () => initiateSearch(),
          //             icon: const Icon(Icons.search),
          //           ),
          //         ),
          //       ),
          //     ],
          // ),
        ),
      ),
    );
  }
}
