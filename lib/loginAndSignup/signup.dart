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
  //bool _validateEmail = false;//was not used
  //bool _validatePassword = false;//was not used
 // bool _validateConfirmPassword = false;//was not used
  bool _obsecurePassword = true;
  bool _obscureConfirmPassword = true;

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
      return "Please enter email:";
    } else if ( !( textEmail.contains("@") && textEmail.contains("."))){
      return "Invalid email";
    }
    return null;
  }
  String? get _errorTextPassword{
    final textPassword = _controllerPassword.value.text;
    if(textPassword == null || textPassword.isEmpty){
      return "Please enter password:";
    } else if (textPassword.length < 8){
      return "Password must be at least 8 characters.";
    }
    return null;
  }

  String? get _errorTextConfirmPassword{
    final textConfirmPassword = _controllerConfirmPassword.value.text;
    if(textConfirmPassword == null || textConfirmPassword.isEmpty){
      return "Please enter password for confirmation";
    } else if (textConfirmPassword != _controllerPassword.text){
      return "Password does not match";
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
            const Text(
              "Create an account:",
              style: TextStyle(
                fontSize: 30,
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
                  errorText: _errorTextEmail,
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
                  errorText: _errorTextPassword,
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
                  errorText: _errorTextConfirmPassword,
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
                  });
                },
                child: const Text(
                    "Sign Up",
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]
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
