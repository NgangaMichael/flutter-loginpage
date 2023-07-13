import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_textfield.dart';
import 'package:loginpage/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: 
      SafeArea(
        child: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 50,),
            // logo 
            const Icon(
              Icons.lock,
              size: 100,  
            ),
      
            const SizedBox(height: 20,),

            const Text('Welcome back you have been missed', 
            style: TextStyle(
              color: Color.fromRGBO(97, 97, 97, 1),
              fontSize:16
              )
            ),

            const SizedBox(height: 20),
            
            MyTextfield(
              controller: widget.usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            MyTextfield(
              controller: widget.passwordController,
              hintText: 'password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Forgot password?', 
                    style: TextStyle(
                      color: Color.fromRGBO(56, 55, 55, 1)
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SignIn(
              onTap: signUserIn,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 59, 58, 58),
                    )
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Or continue with'),
                  ),

                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 59, 58, 58),
                      
                    )
                    )
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'lib/images/gglelogo.png'),

                const SizedBox(width: 10),

                SquareTile(imagePath: 'lib/images/applelogo.png'),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('not a member? ', 
                style: TextStyle(
                  color: Color.fromARGB(255, 113, 112, 112),
                ),
                ),

                const SizedBox(height: 20),

                Text('Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )


          ],),
        ),
      ),
    );
  }
}