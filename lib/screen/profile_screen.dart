import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/model/user_model.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/widget/profile_widget/profile.dart';
import 'package:fast_food/widget/profile_widget/profile_edit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel currentUser;
  ProfileScreen({this.currentUser});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit = false;
  File cameraImage;
  var uid;
  Future<String> _uploadFile(File _image) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'images/$uid',
        );
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final String _imagesUrl = (await taskSnapshot.ref.getDownloadURL());
    return _imagesUrl;
  }

  final picker = ImagePicker();
  Future getImage({ImageSource source}) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      cameraImage = File(pickedFile.path);
    });
  }

  var imagesUrl;

  Future<void> update(
    String emailId,
    String mobileNumber,
    String userName,
    String password,
  ) async {
    setState(() {
      isEdit = false;
    });
    cameraImage != null
        ? imagesUrl = await _uploadFile(cameraImage)
        : Container();
    FirebaseFirestore.instance.collection('UserData').doc(uid).update({
      'ImageUrl': cameraImage == null ? widget.currentUser.image : imagesUrl,
      'emailId': emailId,
      'mobileNumber': mobileNumber,
      'userName': userName,
      'password': password,
    });
  }

  void currentUser() async {
    User user = FirebaseAuth.instance.currentUser;
    uid = user.uid;
  }

  Future<void> showDialogBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 150,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: RaisedButton.icon(
                  onPressed: () {
                    getImage(source: ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  label: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: RaisedButton.icon(
                  onPressed: () {
                    getImage(source: ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.photo,
                  ),
                  label: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    currentUser();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2.color),
        ),
        centerTitle: true,
        leading: isEdit == false
            ? IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).textTheme.bodyText2.color),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )
            : IconButton(
                icon: Icon(Icons.close,
                    color: Theme.of(context).textTheme.bodyText2.color),
                onPressed: () {
                  setState(() {
                    isEdit = false;
                  });
                },
              ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isEdit = true;
              });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).textTheme.bodyText2.color),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 290,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Theme.of(context).textTheme.button.color,
                  ),
                ),
              ),
              isEdit == false
                  ? Profile(
                      currentUser: widget.currentUser,
                    )
                  : ProfileEdit(
                      currentUser: widget.currentUser,
                      update: update,
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CircleAvatar(
              radius: 100,
              child: CircleAvatar(
                  radius: 97,
                  backgroundImage: cameraImage == null
                      ? NetworkImage(
                          widget.currentUser.image ??
                              'https://i.pinimg.com/originals/89/3a/f0/893af03a6fe4fe5c7e45a45f21cf1bff.jpg',
                        )
                      : FileImage(
                          cameraImage,
                        )),
            ),
          ),
          isEdit == false
              ? Container()
              : Positioned(
                  right: 110,
                  top: 190,
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {
                        showDialogBox();
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
