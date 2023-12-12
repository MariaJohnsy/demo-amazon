import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Utils/utils.dart';
import 'package:amazon_clone/Widgets/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

   Future<String> uploadProductToDatabase({
    required Uint8List image,
    required String productName,
    required String rawCost,
    required int discount,
    required String sellerName,
    required String sellerUid,
     })async{
    productName.trim();
    rawCost.trim();
    String output = "Something went wrong";
    if(image != null && productName != "" && rawCost != ""){
      try{
        String uid = utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid:uid);
        double cost = double.parse(rawCost);
        cost = cost - (cost * (discount/100));
        ProductModel product = ProductModel(
        url: url,
       productName: productName,
        cost: cost,
       discount: discount,
        uid: uid,
      sellerName: sellerName, 
      sellerUid: sellerUid, 
      rating: 5,
       noOfRating: 0);
       await firebaseFirestore.collection("products").doc(uid).set(product.getJson());
        output = "success";
      }catch(e){
        output = e.toString();
      }
    }else{
      output = "plesse make sure all the fields are not empty";
    }
    return output;
   }
   Future<String>uploadImageToDatabase(
    {required Uint8List image, required String uid}) async {
    Reference storageRef =
     FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
    }
    Future<List<Widget>>getProductsFromDiscount(int discount)async{
      List <Widget> children = [];
      QuerySnapshot<Map<String,dynamic>> snap = await firebaseFirestore
      .collection("products")
      .where("discount", isEqualTo: discount)
      .get();

      for (int i = 0; i < snap.docs.length; i++){
      DocumentSnapshot docSnap = snap.docs[i];
      ProductModel model = ProductModel.getModeFromJson(json: (docSnap.data()as dynamic));
      children.add(SimpleProductWidget(productModel: model));
      }
      return children;
    }
}
