import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if(passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Parola eşleşmedi"),
          ),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 30),

                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey[800],
                ),
                const SizedBox(height: 30),

                const Text(
                  "Size bir hesap oluşturalım",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 30),

                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(height: 30),

                MyTextField(
                  controller: passwordController,
                  hintText: "Şifre",
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Şifreyi Doğrula",
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                MyButton(onTap: signUp, text: "Üye Ol"),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Zaten bir üye misiniz ? "),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Giriş yap",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
