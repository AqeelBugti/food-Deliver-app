import 'package:flutter/material.dart';

class UserModel {
  String userName;
  String emailId;
  String mobileNumber;
  String password;
  String image;

  UserModel(
      {@required this.emailId,
      this.image,
      @required this.mobileNumber,
      @required this.password,
      @required this.userName});
}
