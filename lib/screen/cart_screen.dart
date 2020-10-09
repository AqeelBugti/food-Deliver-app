import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/widget/badge/badge.dart';
import 'package:fast_food/widget/cart_screen_widget/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const kcolor = Color(0xff282828);

class CartScreen extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  int quantity;
  CartScreen({
    this.quantity,
    this.title,
    this.price,
    this.image,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    MoreCategory myProvider = Provider.of<MoreCategory>(context);
    double totalPrice = myProvider.totalPrice;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:Theme.of(context).textTheme.bodyText2.color,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        actions: [
          Consumer<MoreCategory>(
            builder: (_, detail, ch) => Badge(
              child: ch,
              value: myProvider.cartListlength.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: myProvider.cartListlength,
                itemBuilder: (context, index) => SingleCartItem(
                  image: myProvider.getCartList[index].image,
                  price: myProvider.getCartList[index].price,
                  title: myProvider.getCartList[index].title,
                  quantity: myProvider.getCartList[index].quantity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 65,
                width: double.infinity,
                child: RaisedButton(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 27,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 23,
                          letterSpacing: 2,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                    ],
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  onPressed: myProvider.totalPrice <= 0
                      ? null
                      : () async {
                          await Provider.of<MoreCategory>(context,
                                  listen: false)
                              .addOrder(
                            myProvider.getCartList.toList(),
                            myProvider.totalPrice,
                          );
                          myProvider.clean();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('succssful your oder '),
                              duration: Duration(milliseconds: 300),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
