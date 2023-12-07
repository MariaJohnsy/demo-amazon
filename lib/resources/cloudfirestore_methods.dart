import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/user_detials_model.dart';

class CloudFirestoreClass{
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   Future uploadNameAndAddressToDatabase(
   {required UserDetialsModel user}) async {
    await firebaseFirestore
    .collection("users")
    .doc(firebaseAuth.currentUser!.uid)
    .set(user.getJson());
 }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
       .doc(firebaseAuth.currentUser!.uid)
        .get();
       print(snap.data());

    UserDetialsModel userModels = UserDetialsModel.getModelFromJson(
    (snap.data()as dynamic),
    );
    return userModels;
   }
}   