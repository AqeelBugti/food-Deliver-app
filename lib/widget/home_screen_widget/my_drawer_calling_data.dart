import 'package:fast_food/model/user_model.dart';
import 'package:fast_food/provider/app_state.dart';
import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/about_screen.dart';
import 'package:fast_food/screen/cart_screen.dart';
import 'package:fast_food/screen/order_screen.dart';
import 'package:fast_food/screen/profile_screen.dart';
import 'package:fast_food/widget/home_screen_widget/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawerCallingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState swich = Provider.of<AppState>(context);
    MoreCategory moreCategory = Provider.of<MoreCategory>(context);
    moreCategory.fetchUserData();
    UserModel currentUser = moreCategory.currentUsers;
    Future<void> _logout() async {
      try {
        await FirebaseAuth.instance.signOut();
      } catch (e) {
        print(e.toString());
      }
    }

    return Drawer(
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.image ??
                        'https://i.pinimg.com/originals/76/85/87/7685879d6861fcca7803d7d5a51faf7b.jpg'),
                  ),
                  decoration: BoxDecoration(),
                  accountName: Text(
                    currentUser.userName,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyText2.color)
                  ),
                  accountEmail: Text(
                    currentUser.emailId,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyText2.color),
                  ),
                ),
              ),
              MyDrawer(
                whenPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        currentUser: currentUser,
                      ),
                    ),
                  );
                },
                iconData: Icons.person,
                title: 'Profile',
              ),
              MyDrawer(
                whenPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                iconData: Icons.add_shopping_cart,
                title: 'Cart',
              ),
              MyDrawer(
                whenPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ),
                  );
                },
                iconData: Icons.business_center,
                title: 'Order',
              ),
              MyDrawer(
                whenPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                },
                iconData: Icons.info,
                title: 'About',
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Communicate',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.bodyText2.color),
                ),
              ),
              MyDrawer(
                whenPress: () {},
                iconData: Icons.lock,
                title: 'Change',
              ),
              MyDrawer(
                whenPress: () {
                  _logout();
                },
                iconData: Icons.exit_to_app,
                title: 'Log out',
              ),
              Switch(
                  value: swich.isDarkModeOn,
                  onChanged: (booleanValue) {
                    swich.updateTheme(booleanValue);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
