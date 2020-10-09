import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/screen/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _socialMeidaButton(
      {@required String images,
      @required String title,
      @required Color color}) {
    return Container(
      width: 190,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        onPressed: () {},
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 20,
              image: AssetImage(images),
            ),
          ),
        ),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  final RegExp regex = RegExp(Login.pattern);

  final TextEditingController emailId = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  UserCredential authResult;
  bool isLoading = false;

  void submation() async {
    try {
      setState(() {
        isLoading = true;
      });
      authResult = await auth.signInWithEmailAndPassword(
        email: emailId.text,
        password: password.text,
      );
      FirebaseFirestore.instance
          .collection('UserData')
          .doc(authResult.user.uid)
          .set({
        'emailId': emailId.text,
        'password': password.text,
      });
    } on PlatformException catch (error) {
      var message = 'please check Internet';
      if (error.message != null) {
        message = error.message;
      }
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(
            milliseconds: 300,
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(error),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      print(error);
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  Widget _textFormField({
    @required String hintText,
    @required IconData iconData,
    @required bool obscureText,
    @required controller,
    @required TextInputType keyboardType,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  vaildationText() {
    if (emailId.text.isEmpty && password.text.isEmpty)
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('All field are empty'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    else if (emailId.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('EmailID is empty'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (!regex.hasMatch(emailId.text)) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please enter vaild email"),
        duration: Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).errorColor,
      ));
    } else if (password.text.isEmpty || password.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Passowrd is empty'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (password.text.length < 10) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('passowrd to short '),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else {
      submation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Color(0xff0082c5),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Color(0xffededed),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _textFormField(
                        hintText: 'Email id',
                        iconData: Icons.mail,
                        obscureText: false,
                        controller: emailId,
                        keyboardType: TextInputType.emailAddress),
                    _textFormField(
                      hintText: 'Password',
                      iconData: Icons.lock,
                      obscureText: true,
                      controller: password,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          'forget Password?',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                    ),
                    isLoading == false
                        ? Container(
                            height: 60,
                            margin: EdgeInsets.all(15),
                            width: double.infinity,
                            child: RaisedButton(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  letterSpacing: 3,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              color: Color(0xff0082c5),
                              onPressed: () {
                                vaildationText();
                              },
                            ),
                          )
                        : CircularProgressIndicator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialMeidaButton(
                            color: Color(0xffda4e38),
                            images: 'images/google.png',
                            title: 'Google'),
                        _socialMeidaButton(
                            color: Color(0xff4067b4),
                            images: 'images/facebook.png',
                            title: 'facebook'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an Account?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).errorColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
