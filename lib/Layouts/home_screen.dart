import 'package:amazon_clone/Layouts/Ad_Banner_Widget.dart';
import 'package:amazon_clone/Layouts/Categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/Layouts/Product_showcase_list_view.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Layouts/Simple_product_Widget.dart';
import 'package:amazon_clone/Model/UserDetialModel.dart';
import 'package:amazon_clone/Widgets/User_detials_bar.dart';
import 'package:amazon_clone/resources/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget> testChildren = [
    const SimpleProductWidget(
                  url:"https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
                const SimpleProductWidget(
                  url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                    const SimpleProductWidget(
                  url:"https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
                const SimpleProductWidget(
                  url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                    const SimpleProductWidget(
                  url:"https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
                const SimpleProductWidget(
                  url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  ];

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
            UserDetialBar(offset: offset, userDetails: UserDetialModel(name: "Maria Johnsy",  address: "Somewhere on Earth",
            ),
            ),
            
          ],
        ),
    );
  }
}