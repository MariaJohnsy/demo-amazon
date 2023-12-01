import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;
  const RatingStar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget>children = [];

      for(int i = 0; i<5;i++){
      children.add(i<rating?
       Icon(Icons.star,color: Colors.orange ) : Icon(Icons.star_outlined, color: Colors.orange),
      );
      }
    return Row(
     children: children);
  }
}