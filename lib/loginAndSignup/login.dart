import 'package:codekameleon/loginAndSignup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _controllerUserNameLogin = TextEditingController();
  final _controllerPasswordLogin = TextEditingController();
  bool _validateUsernameLogin = false;
 // bool _usernameIsCorrect = false; // no need can use the _validateUsernameLogin variable
  bool _passwordIsCorrect = true;
  bool _validatePasswordLogin = false;
  bool obscurePassword = true;

  @override
  void dispose(){
    _controllerUserNameLogin.dispose();
    _controllerPasswordLogin.dispose();
    super.dispose();
  }

  String? get _errorTextPasswordLogin{
    final textPasswordLogin = _controllerPasswordLogin.value.text;
    if(textPasswordLogin == null || textPasswordLogin.isEmpty){
      _passwordIsCorrect = false;
      return "Please enter password:";
    } else if(textPasswordLogin.length < 8){
      _passwordIsCorrect = false;
      return "Incorrect password";
    } else {
      _passwordIsCorrect = true;
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],//same as the sign up screen
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),//same as the sign up screen
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200,),
            Center(// to align the text in center
              child: Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800]
                ),
              ),
            ),
            const SizedBox(height: 50,),
            TextField(
              controller: _controllerUserNameLogin,
              decoration: InputDecoration(
                labelText: "Username",
                errorText: _validateUsernameLogin?"Value can't be empty": null,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Color(0xff1565c0)) //same as in sign up screen
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Color(0xff1565c0))
                ),
              )
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: _controllerPasswordLogin,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: _validatePasswordLogin? _errorTextPasswordLogin: null,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: obscurePassword? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Color(0xff1565c0))
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Color(0xff1565c0))
                )
              )
            ),
            const SizedBox(height: 60,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){
                  setState(() {
                    _validateUsernameLogin = _controllerUserNameLogin.text.isEmpty;
                    _validatePasswordLogin = !_validatePasswordLogin;
                  });
                  // this makes sure that both the password and username are valid
                  // and directs user to the home screen
                  if (!_validateUsernameLogin && _passwordIsCorrect){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900]
                    ),
                  ),

                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
