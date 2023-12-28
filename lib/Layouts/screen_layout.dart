import 'package:amazon_clone/Providers/user_detials_provider.dart';
import 'package:amazon_clone/Resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ScreenLayout extends StatefulWidget {  //layout the each screens
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
   changePage(int page){
    pageController.jumpToPage(page);
          setState(() {
            currentPage = page;
          });
   }

  @override
  void initState(){
    super.initState();
    CloudFirestoreClass().getNameAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetialsProvider>(context).getData();
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[400]!,
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
              indicator: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: activeCyanColor,
                    width: 4),
                ),
              ),
              onTap: changePage,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
              Tab(child: Icon(Icons.home_outlined,
                  color: currentPage == 0?
                  activeCyanColor : Colors.black,
              ),
               ),
              Tab(child: Icon(Icons.account_circle_outlined,
                  color: currentPage == 1?
                  activeCyanColor : Colors.black,
             ),
              ),
              Tab(child: Icon(Icons.shopping_cart_outlined,
              color: currentPage == 2?
              activeCyanColor:Colors.black,
            ),
              ),
              Tab(child: Icon(Icons.menu,
               color: currentPage == 3?
               activeCyanColor:Colors.black,
            ),
              ),
            ],
                ),
          ),
        ),
      ),
    );
  }
}