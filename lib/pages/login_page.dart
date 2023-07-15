import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_textfield.dart';
import 'package:loginpage/components/square_tile.dart';
import 'package:loginpage/services/auth_service.dart';


class LoginPage extends StatefulWidget {

  final Function()? onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
class _LoginPageState extends State<LoginPage> {

  void signUserIn() async {
  // Show progress indicator
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Clear progress indicator
    Navigator.pop(context);

  } catch (error) {
    // Handle error here
    print('Error logging in: $error');
    // Clear progress indicator
    Navigator.pop(context);

     // Display error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Incorrect Email Or Password'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: 
      SafeArea(
        child: 
        SingleChildScrollView(
          child: Center(
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
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
        
              const SizedBox(height: 10),
        
              MyTextfield(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
        
              const SizedBox(height: 10),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Forgot password?', 
                      style: TextStyle(
                        color: Color.fromRGBO(56, 55, 55, 1)
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 20),
        
              SignIn(
                text: 'Sign In',
                onTap: signUserIn,
              ),
        
              const SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 59, 58, 58),
                      )
                      ),
        
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                  SquareTile(imagePath: 'lib/images/gglelogo.png',
                  onTap: () => AuthService().signInWithGoogle(),
                  ),
        
                  SizedBox(width: 10),
        
                  SquareTile(imagePath: 'lib/images/applelogo.png',
                  onTap: () {

                  }
                  ),
                ],
              ),
        
              const SizedBox(height: 20),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('not a member? ', 
                  style: TextStyle(
                    color: Color.fromARGB(255, 113, 112, 112),
                  ),
                  ),
        
                  const SizedBox(height: 20),
        
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )
            ],),
          ),
        ),
      ),
    );
  }
}