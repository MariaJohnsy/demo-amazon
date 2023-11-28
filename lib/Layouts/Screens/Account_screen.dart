import 'package:amazon_clone/Custom_Main_Button.dart';
import 'package:amazon_clone/Layouts/Product_showcase_list_view.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/Account_screen_bar_widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccounntSearchBarWidget(),
        body: SingleChildScrollView(
            child: SizedBox(
                height: screenSize.height - (kAppBarHeight / 2),
                width: screenSize.width,
                child: Column(children: [
                  IntroductionAccountWidgetScreen(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMainbutton(
                      child: Text("Sign In",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      ),
                       color: Colors.orange, 
                       isloading: false,
                        onPressed: (){}),
                  ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CustomMainbutton(
                         child: Text("Sell",
                         style: TextStyle(
                         color: Colors.black,
                        ),
                          ),
                          color: yellowColor, 
                          isloading: false,
                          onPressed: (){}),
                       ),
                       ProductShowCaseListView(
                        title: "Your Orders", 
                        children: testChildren),
                       const Padding(
                          padding:EdgeInsets.all(15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Order Requests",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder:(context,index){
                            return ListTile(
                            title:const Text("Order : Black Shoe",
                             style: TextStyle(
                            fontWeight: FontWeight.w500,
                            ),
                            ),
                            subtitle:const Text("Address : Somewhere on earth"),
                            trailing: IconButton(
                              onPressed: (){}, icon: Icon(Icons.check)),
                            );
                            }),
                          ),
                        ]),
                      ),
                   ),
                );
  }
}
class IntroductionAccountWidgetScreen extends StatelessWidget {
  const IntroductionAccountWidgetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
           Colors.white,
            Colors.white.withOpacity(0.000000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 27,
                  ),
                ),
                 TextSpan(
                  text: "Maria Johnsy",
                   style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              ),
              ),
            ),
            Padding(padding: EdgeInsets.only(
             right: 20,
            ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                 "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

