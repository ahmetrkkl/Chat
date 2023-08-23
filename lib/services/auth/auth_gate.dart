import 'package:flutter/material.dart';
import '../../pages/home_page.dart';
import '../login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (context, snaphshot){
          if (snaphshot.hasData){
            return HomePage();
          }
          else{
            return const LoginOrRegister();
          }
        },
      ),

    );
  }
}
