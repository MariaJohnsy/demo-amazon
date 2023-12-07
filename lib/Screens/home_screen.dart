import 'package:amazon_clone/Model/user_detials_model.dart';
import 'package:amazon_clone/Widgets/Ad_banner_widget.dart';
import 'package:amazon_clone/Widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/Widgets/product_showcase_list_view.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/simple_product_widget.dart';
import 'package:amazon_clone/Widgets/User_detials_bar.dart';
import 'package:amazon_clone/Widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() { 
     setState(() {
     offset = controller.position.pixels;
     });
    });
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true, hasBackButton: false),
        body:Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  const SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  CategoriesHorizontalListView(),AdBannerWidget(),
                  ProductShowCaseListView(
                    title: "Upto 60% Off",
                   children:testChildren ),
                  ProductShowCaseListView(
                    title: "Upto 70% Off", 
                    children: testChildren),
                  ProductShowCaseListView(
                    title: "Upto 50% Off", 
                    children: testChildren),
                  ProductShowCaseListView(
                    title: "Explore", 
                    children: testChildren),
                ],
              ),
            ),
            UserDetialBar(offset: offset),
          ],
        ),
    );
  }
}