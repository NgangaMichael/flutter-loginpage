import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_textfield.dart';
import 'package:loginpage/components/square_tile.dart';
import 'package:loginpage/services/auth_service.dart';


class RegisterPage extends StatefulWidget {

  final Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();


class _RegisterPageState extends State<RegisterPage> {

  void signUserUp() async {
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
    if(passwordController.text == confirmPasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password does not match'),
        ),
      );
    }
    

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
        
              const Text('Lets create an account for you', 
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

              MyTextfield(
                controller: confirmPasswordController,
                hintText: 'confirm password',
                obscureText: true,
              ),

              const SizedBox(height: 20),
        
              SignIn(
                text: 'Sign Up',
                onTap: signUserUp,
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
                    onTap: () {},
                  ),
                ],
              ),
        
              const SizedBox(height: 20),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', 
                  style: TextStyle(
                    color: Color.fromARGB(255, 113, 112, 112),
                  ),
                  ),
        
                  const SizedBox(height: 20),
        
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Login now',
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