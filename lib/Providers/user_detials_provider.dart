import 'package:amazon_clone/Model/user_detials_model.dart';
import 'package:amazon_clone/Resources/cloudfirestore_methods.dart';
import 'package:flutter/material.dart';

class userDetiallsProvider with ChangeNotifier {
  UserDetialsModel userDetials;

  userDetiallsProvider()
      : userDetials = UserDetialsModel(name: "Loading", address: "Loading");

  Future getData() async {
    userDetials = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
