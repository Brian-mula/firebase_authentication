import 'package:fire/widgets/textWidget.dart';
import 'package:fire/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // !input validations

  @override
  Widget build(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    validateSignUp() {
      if (email.isEmpty && password.isEmpty) {
        print("Please fill out the spaces");
      } else {
        if (password.length < 6) {
          print("Password should be 6 characters long");
        } else {
          print('$email and $password');
        }
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/03/24/21/26/user-3257935__340.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInput(
                        controller: _emailController,
                        icon: Icons.mail,
                        text: "Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                        controller: _passwordController,
                        icon: Icons.lock,
                        text: "Password"),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: validateSignUp,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue.shade800),
                        child: TextWidget(text: "Sign Up"),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
