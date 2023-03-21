import 'package:flutter/material.dart';
import 'package:new_app/service/model.dart';
import 'package:new_app/service/services.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool sign = false;
  AuthServices authService = AuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignIn() async {
    UserModel? user = await authService.SignIn(
        _emailController.text, _passwordController.text);
    return user;
  }

  SignUp() async {
    UserModel? user = await authService.SignUp(
        _emailController.text, _passwordController.text);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "MonkeyApp ",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                    ),
                  ),
                  Image.asset("Images/monkey.png"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    label: const Text(
                      "Email",
                    ),
                    labelStyle: const TextStyle(color: Colors.amber),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.amber)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.amber)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.lime,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    label: const Text(
                      "Password",
                    ),
                    labelStyle: const TextStyle(color: Colors.amber),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.amber)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.amber)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.lime,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                  child: sign == false
                      ? const Text('SignIn')
                      : const Text('SignUp'),
                  onPressed: () => sign == false ? SignIn() : SignUp(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child:
                    sign == false ? const Text('SignUp') : const Text('SignIn'),
                onTap: () {
                  setState(() {
                    sign = !sign;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
