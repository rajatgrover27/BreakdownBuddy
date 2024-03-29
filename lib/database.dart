import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMechanics() async {
    return await FirebaseFirestore.instance.collection("Mechanics").snapshots();
  }
}
