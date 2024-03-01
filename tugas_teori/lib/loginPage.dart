import 'package:flutter/material.dart';
import 'halamanUtama.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white,
            child: SizedBox(
              width: 550,
              height: 400,
              child: Column(children: [
                usernameField(),
                passwordField(),
                loginButton(context),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      child: TextField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.tealAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
      child: TextField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.tealAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 40),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (password == "admin" && username == "admin") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HalamanUtama();
            }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(content: Text(text));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
        // style: ElevatedButton.styleFrom(

        //     primary: isLoginSuccess ? Colors.blue : Colors.red,
        //     onPrimary: Colors.white,
        //     shape: StadiumBorder()
        // ),
      ),
    );
  }

}

