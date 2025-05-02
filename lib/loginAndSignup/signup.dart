import 'package:codekameleon/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  //var keyboardType = TextInputType.text;
  final _controllerUsername = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  bool _validateUsername = false;
  bool _validateEmail = false;//using these ensure that the validation is only done when the signup button is pressed
  bool _validatePassword = false;//before using them the validation was done even when user has not entered any data
  bool _validateConfirmPassword = false;//it was simply bad ui
  bool _obsecurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _emailIsCorrect = true;
  bool _passwordIsCorrect = true;
  bool _confirmPasswordIsCorrect = true;

  @override
  void dispose(){
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConfirmPassword.dispose();
    super.dispose();

  }
  String? get _errorTextEmail{
    final textEmail = _controllerEmail.value.text;
    if(textEmail == null || textEmail.isEmpty){
      _emailIsCorrect = false;
      return "Please enter email:";
    } else if ( !( textEmail.contains("@") && textEmail.contains("."))){
      _emailIsCorrect = false;
      return "Invalid email";
    } else {
      _emailIsCorrect = true;
    }
    return null;
  }
  String? get _errorTextPassword{
    final textPassword = _controllerPassword.value.text;
    if(textPassword == null || textPassword.isEmpty){
      _passwordIsCorrect = false;
      return "Please enter password:";
    } else if (textPassword.length < 8){
      _passwordIsCorrect = false;
      return "Password must be at least 8 characters.";
    } else{
      _passwordIsCorrect = true;
    }
    return null;
  }

  String? get _errorTextConfirmPassword{
    final textConfirmPassword = _controllerConfirmPassword.value.text;
    if(textConfirmPassword == null || textConfirmPassword.isEmpty){
      _confirmPasswordIsCorrect = false;
      return "Please enter password for confirmation";
    } else if (textConfirmPassword != _controllerPassword.text){
      _confirmPasswordIsCorrect = false;
      return "Password does not match";
    } else {
      _confirmPasswordIsCorrect = true;
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], //based on light theme of this app
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Text(
              "Create an account:",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800]
                //color: Colors.purple[900]
              ),
            ),
            const SizedBox(height: 40,),
            TextField(
              //autovalidateMode: AutovalidateMode.always,//converted textformfield to textfield
              //keyboardType: TextInputType.number,
              controller: _controllerUsername,
              decoration: InputDecoration(
                labelText: "Username",
                errorText: _validateUsername?"Value can't be empty": null,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Color(0xff1565c0)) // used the int value of Colors.blue[800]
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xff1565c0))
                )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              //autovalidateMode: AutovalidateMode.always,//converted textformfield to textfield
              //keyboardType: TextInputType.number,
              controller: _controllerEmail,
              decoration: InputDecoration(
                  labelText: "Email",
                  errorText: _validateEmail?_errorTextEmail: null,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0)) // used the int value of Colors.blue[800]
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0))
                  )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              //autovalidateMode: AutovalidateMode.always,//converted textformfield to textfield
              //keyboardType: TextInputType.number,
              controller: _controllerPassword,
              obscureText: _obsecurePassword,
              decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _validatePassword?_errorTextPassword: null,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.password_outlined),
                  // still have to make the text visible and obscure when the icon is clicked
                  // did it using the obscureText property
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obsecurePassword = !_obsecurePassword;
                        });
                      }, icon: _obsecurePassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0)) // used the int value of Colors.blue[800]
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0))
                  )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              //autovalidateMode: AutovalidateMode.always,//converted textformfield to textfield
              //keyboardType: TextInputType.number,
              controller: _controllerConfirmPassword,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  errorText: _validateConfirmPassword? _errorTextConfirmPassword : null,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.password_outlined),
                  // still have to make the text visible and obscure when the icon is clicked
                  // did it using the obscureText property
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      }, icon: _obscureConfirmPassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0)) // used the int value of Colors.blue[800]
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Color(0xff1565c0))
                  )
              ),
            ),
            const SizedBox(height: 60,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){
                  setState(() {
                    _validateUsername = _controllerUsername.text.isEmpty;
                    _validateEmail = !_validateEmail;
                    _validatePassword = !_validatePassword;
                    _validateConfirmPassword = !_validateConfirmPassword;
                  });
                  if(!_validateUsername && _emailIsCorrect && _passwordIsCorrect && _confirmPasswordIsCorrect){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Sign Up",
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[900]
                      ),
                    )
                )
              ],
            )
            


          ],
        ),
      )
    );
  }
}
