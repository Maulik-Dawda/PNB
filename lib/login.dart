import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_lec_6/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShow = true;

  void toggle() {
    if (isShow) {
      isShow = false;
    } else {
      isShow = true;
    }

    setState(() {});
  }

  void writeData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("username", username.text);
    pref.setString("password", password.text);
    if(username.text.isNotEmpty && password.text.isNotEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }

    setState(() {

    });
  }
  void getData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    username.text = pref.getString("username") ?? "";
    password.text = pref.getString("password") ?? "";

    if(username.text.isNotEmpty && password.text.isNotEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }

    setState(() {

    });
  }

  @override
  void initState(){
    getData();

    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/pnb.png'),
                      width: 300,
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome Back !",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(16, 53, 127, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter your credential to login",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                        hintText: "Enter Username",
                        hintStyle: TextStyle(fontSize: 14),
                        fillColor: Color.fromRGBO(244, 244, 244, 1),  
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: password,
                    obscureText: isShow,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextStyle(fontSize: 14),
                        fillColor: Color.fromRGBO(244, 244, 244, 1),
                        filled: true,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              toggle();
                            },
                            child: Icon(Icons.visibility_off)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Signup()));
                        },
                        child: Text(
                          "Create User ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (username.text != "" && password.text != "") {
                          writeData();
                          EasyLoading.showSuccess("Login Successful");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dashboard()));
                        } else {
                          EasyLoading.showError("Please Enter Correct");
                        }
                      },
                      child: Text("LOGIN"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(16, 53, 127, 1),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      ),

    );
  }
}
