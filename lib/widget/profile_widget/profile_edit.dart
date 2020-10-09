import 'package:fast_food/model/user_model.dart';
import 'package:fast_food/widget/my_raised_button/my_raised_button.dart';
import 'package:fast_food/widget/my_text_form_field/my_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  final UserModel currentUser;
   var update;

  ProfileEdit({this.currentUser, this.update});

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  
  final RegExp regex = RegExp(ProfileEdit.pattern);

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
      widget.update(
        emailId.text,
        mobileNumber.text,
        userName.text,
        password.text,
        
        
      );
    }
  }

  Widget _textFormField() {
    return Container(
      height: 435,
      child: ListView(
        children: [
          MyTextFormField(
            color:  Theme.of(context).textTheme.button.color,
            hintText: 'Username',
            controller: userName,
            iconData: Icons.person,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          MyTextFormField(
            color:  Theme.of(context).textTheme.button.color,
            hintText: 'Email Id',
            controller: emailId,
            iconData: Icons.email,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          MyTextFormField(
            color:  Theme.of(context).textTheme.button.color,
            hintText: 'MobileNumber',
            controller: mobileNumber,
            iconData: Icons.phone,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          MyTextFormField(
            color:  Theme.of(context).textTheme.button.color,
            hintText: 'Password',
            controller: password,
            iconData: Icons.lock,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          MyRaisedButton(
            elevation: 2,
            color:  Theme.of(context).textTheme.button.color,
            title: 'Update',
            whenPress: () {
              
              vaildationText();
              
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    userName = TextEditingController(text: widget.currentUser.userName);
    mobileNumber = TextEditingController(text: widget.currentUser.mobileNumber);
    password = TextEditingController(text: widget.currentUser.password);
    emailId = TextEditingController(text: widget.currentUser.emailId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _scaffoldKey,
      child: _textFormField(),

    );
  }
}
