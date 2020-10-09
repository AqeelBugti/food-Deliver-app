import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/screen/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final RegExp regex = RegExp(SignUp.pattern);
  final TextEditingController userName = TextEditingController();

  final TextEditingController emailId = TextEditingController();

  final TextEditingController mobileNumber = TextEditingController();

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
      authResult = await auth.createUserWithEmailAndPassword(
        email: emailId.text,
        password: password.text,
      );
      FirebaseFirestore.instance
          .collection('UserData')
          .doc(authResult.user.uid)
          .set({
        'userName': userName.text,
        'emailId': emailId.text,
        'mobileNumber': mobileNumber.text,
        'password': password.text,
        "UserId": authResult.user.uid,
      });
    } on PlatformException catch (error) {
      var message = 'please check Internet';
      if (error.message != null) {
        message = error.message.toString();
      }
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
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
          content: Text(error.toString()),
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
      margin: EdgeInsets.all(15),
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
    if (userName.text.isEmpty &&
        emailId.text.isEmpty &&
        password.text.isEmpty &&
        mobileNumber.text.isEmpty)
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('All field are empty'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    else if (userName.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('UserName is empty'),
          duration: Duration(
            milliseconds: 300,
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (emailId.text.isEmpty) {
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
    } else if (mobileNumber.text.isEmpty || mobileNumber.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('MobileNumber is empty'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (mobileNumber.text.length < 11 || mobileNumber.text.length > 11) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('MobileNumber must be eleven'),
          duration: Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
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
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _textFormField(
                        hintText: 'User Name',
                        iconData: Icons.person,
                        obscureText: false,
                        controller: userName,
                        keyboardType: TextInputType.emailAddress),
                    _textFormField(
                        hintText: 'Email id',
                        iconData: Icons.mail,
                        obscureText: false,
                        controller: emailId,
                        keyboardType: TextInputType.emailAddress),
                    _textFormField(
                        hintText: 'Mobile Number',
                        iconData: Icons.phone,
                        obscureText: false,
                        controller: mobileNumber,
                        keyboardType: TextInputType.number),
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
                                'SIGN UP',
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
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: Text(
                            'SIGN IN',
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
