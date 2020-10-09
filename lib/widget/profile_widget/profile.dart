import 'package:fast_food/model/user_model.dart';
import 'package:fast_food/widget/false_text_field/false_text_field.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
 final UserModel currentUser;
   Profile({this.currentUser});

  Widget _falseTextFormFieldCallingData() {
    return Column(
      children: [
        FalseTextFeild(
          icon: Icons.person,
          title: currentUser.userName,
        ),
        FalseTextFeild(
          icon: Icons.email,
          title: currentUser.emailId,
        ),
        FalseTextFeild(
          icon: Icons.phone,
          title: currentUser.mobileNumber,
        ),
        FalseTextFeild(
          icon: Icons.lock,
          title: currentUser.password,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _falseTextFormFieldCallingData();
  }
}
