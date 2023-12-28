
import 'package:amazon_clone/Utils/data.dart';
import 'package:flutter/material.dart';

class AccountScreenAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  //Account screent - appbar widget
   @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
    const AccountScreenAppBarWidget({
   super.key,
  PreferredSize,
  }); 
   @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Container(
    height: kAppBarHeight,
    width: screenSize.width,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
      colors: backgroundGradient,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15),
          child: Image.network(
            amazonLogoUrl,
             height: kAppBarHeight *0.7,
          ),
        ),
        Row(
          children:[
            IconButton(onPressed: (){},
            icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            ),
            ),
            IconButton(onPressed: (){},
            icon: const Icon(
            Icons.search_outlined, 
            color: Colors.black,
            ),
            ),
          ],
        ),
      ],
    ),
    );
  }
}