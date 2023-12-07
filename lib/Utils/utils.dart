import 'package:flutter/material.dart';

class utils {
 //Size getScreenSize(){        //(mediaQuery used)
  //return(MediaQueryData.fromWindow(WidgetsBinding.instance.window).size);
 //}
  showSnackbar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(                  //shows the notification appear the bottom
      SnackBar(
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content),
          ],
        ),
      ), 
    );
  }
}
