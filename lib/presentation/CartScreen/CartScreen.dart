import 'package:e_commerce/presentation/Components/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/YellowButton.dart';
import '../resources/values_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 239, 239),
        bottomNavigationBar: YellowButton(
          callback: () {},
          text: 'Proceed to Checkout',
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text('My Cart'),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(AppMargin.m16),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CartItem();
                  },
                ),
              ),
              const Text('Total'),
            ]),
          ),
        ));
  }
}
