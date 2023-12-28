import 'package:flutter/material.dart';

class reviewModel{               //review session
  final String senderName;
  final String description;
  final int rating;

  const reviewModel ({
  required this.senderName,
  required this.description,
  required this.rating,
  });

 factory reviewModel.getModelFromJson({required Map<String, dynamic>json}){
  return reviewModel(
    senderName: json["senderName"], 
    description: json["description"],
    rating: json["rating"]);
 }

 Map<String,dynamic> getJson() => {
  'senderName' : senderName,
  'description': description,
  'rating'     : rating};
}