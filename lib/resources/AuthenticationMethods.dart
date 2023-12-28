import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amazon_clone/Resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/user_detials_model.dart';

class AuthenticationMethods{        //future function of sign up and sign in
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future <String> SignUp ({
  required String name, 
  required String address,
  required String email,
  required String password}) async{
  name.trim();
  address.trim();
  email.trim();
  password.trim();
  String output = "Something went wrong";
  if (name!= "" && address!="" && email!= "" && password!= ""){   //!= not equal
   try{
   await firebaseAuth.createUserWithEmailAndPassword(
    email: email, password: password);
    UserDetialsModel user = UserDetialsModel(name: name, address: address);
  await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
   output = "success";
   }on FirebaseAuthException catch(e){
    output = e.message.toString();   
   }
  } else {
    output = "please fill up all the fields";
  }
  return output;
}

Future <String> Sign_in ({
  required String email,
  required String password}) async{
  email.trim();
  password.trim();
  String output = "Something went wrong";
  if (email!= "" && password!= ""){ 
   try{
   await firebaseAuth.createUserWithEmailAndPassword(
    email: email, password: password);
   output = "success";
   } on FirebaseException catch (e){
    output = e.message.toString();
   }
  } else {
    output = "Please fill up the fields.";
  }
  return output;
  }
} 