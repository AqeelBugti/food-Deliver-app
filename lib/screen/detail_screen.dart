import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/cart_screen.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;

  DetailScreen({
    this.image,
    this.price,
    this.title,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.price * count;
    MoreCategory moreCategory = Provider.of<MoreCategory>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(widget.image)),
                  ),
                ),
              ),
              // Color(0xff3c3f40),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    ///////////////////checking colors..
                    color: Theme.of(context).textTheme.button.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        height: 430,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Theme.of(context).textTheme.bodyText2.color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Any Text.....',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).textTheme.bodyText2.color,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                              color: Colors.blueGrey[100],
                                              image: DecorationImage(
                                                scale: 23,
                                                image: AssetImage(
                                                    'images/minus.png'),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (count > 1) {
                                              setState(() {
                                                count--;
                                              });
                                            }
                                          },
                                        ),
                                        Container(
                                          height: 36,
                                          width: 36,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$count',
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Theme.of(context).textTheme.bodyText2.color,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                              color: Colors.blueGrey[100],
                                              image: DecorationImage(
                                                scale: 30,
                                                image: AssetImage(
                                                    'images/plus.png'),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (count < 15) {
                                              setState(() {
                                                count++;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${totalPrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Theme.of(context).textTheme.bodyText2.color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 140,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Descripation',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).textTheme.bodyText2.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).textTheme.bodyText2.color,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 55,
                                width: double.infinity,
                                child: RaisedButton.icon(
                                  color:Theme.of(context).colorScheme.primary,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    moreCategory.addCartModel(
                                      image: widget.image,
                                      price: widget.price,
                                      quantity: count,
                                      title: widget.title,
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => CartScreen(
                                          image: widget.image,
                                          price: widget.price,
                                          title: widget.title,
                                          quantity: count,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Theme.of(context).textTheme.bodyText2.color,
                                  ),
                                  label: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Theme.of(context).textTheme.bodyText2.color,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
