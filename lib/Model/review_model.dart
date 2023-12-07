import 'package:flutter/material.dart';

class reviewModel{
  final String senderName;
  final String description;
  final int rating;

  const reviewModel ({
  required this.senderName,
  required this.description,
  required this.rating,
  });
}