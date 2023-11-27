import 'package:amazon_clone/Layouts/screen_layout.dart';
import 'package:amazon_clone/Layouts/Screens/Sign_in.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Firebase_Options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const Amazonapp());
}
class Amazonapp extends StatelessWidget {
  const Amazonapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amazon Clone",
     theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: backgroundColor),
 home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, AsyncSnapshot<User?> User){
    if(User.connectionState == ConnectionState.waiting){
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      );
    } else if (User.hasData){
    return const ScreenLayout();
      } else {
    return const SignIn();
    }
     }),
    );
  }
}