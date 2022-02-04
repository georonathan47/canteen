import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  getFoodsByName(String foodName) async {
    return await FirebaseFirestore.instance
        .collection("Foods")
        .where("name", isEqualTo: foodName)
        .get();
  }

  orderFoodUsingName(String foodName, ordersMap) {
    FirebaseFirestore.instance
        .collection("Orders")
        .doc(DateTime.now().toString())
        .set(ordersMap);
  }
}
