import 'package:fast_food/screen/search.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar({context}) {
  //  var moreCategory = Provider.of<MoreCategory>(context);
  //   moreCategory.fetchUserData();
  //   UserModel currentUser = moreCategory.currentUsers;
  return AppBar(
    elevation: 0.0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(Icons.sort, color: Theme.of(context).iconTheme.color),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Theme.of(context).iconTheme.color,
          size: 30,
        ),
        onPressed: () {
          showSearch(
            context: context,
            delegate: Search(),
          );
        },
      ),

      // Padding(
      //   padding: const EdgeInsets.all(9.0),
      //   child: Center(
      //     child: Container(
      //       child: CircleAvatar(
      //         maxRadius: 20,
      //         backgroundImage: NetworkImage(
      //           currentUser.image??'https://i.pinimg.com/originals/76/85/87/7685879d6861fcca7803d7d5a51faf7b.jpg'
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    ],
  );
}
