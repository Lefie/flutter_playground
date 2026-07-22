import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../dataModel/user_profile.dart';

class FirestoreService {

  final db = FirebaseFirestore.instance;

  Future<void> addOneUserProfile(UserProfile user) async{
    DocumentReference<Map<String, dynamic>>  data = await db.collection("user_profiles").add(user.toJson());
    print(data.id);
  }

}