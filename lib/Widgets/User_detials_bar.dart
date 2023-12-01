import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Model/UserDetialModel.dart';
import 'package:flutter/material.dart';

class UserDetialBar extends StatelessWidget {
  final double offset;
  final UserDetialModel userDetails;
   const UserDetialBar({
    super.key,
    required this.offset,
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: -offset / 3,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
        ),
        child:Padding(padding:const EdgeInsets.symmetric(
          vertical: 3, horizontal: 20,
        ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                color:Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width*0.7,
                child: Text(
                  "Deliever to ${userDetails.name}  -${userDetails.address}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                   color: Colors.grey[900],
                   ),
                   ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}