import 'package:fast_food/provider/more_category.dart';
import 'package:fast_food/screen/home_screen.dart';
import 'package:fast_food/widget/order_screen_widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    MoreCategory orderData = Provider.of<MoreCategory>(context);
    var dataOrder = orderData.order;
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'My Oder',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  orderData.cleanOrder();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Clean',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(
          dataOrder[index],
        ),
        itemCount: dataOrder.length,
      ),
    );
  }
}
