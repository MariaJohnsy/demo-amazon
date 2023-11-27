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
                height: screenSize.height,
                width: screenSize.width,
                child: Column(children: [
                  Container(
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
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  )
                ]))));
  }
}
