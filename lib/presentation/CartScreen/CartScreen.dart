import 'package:e_commerce/presentation/CartScreen/CartScreen_ViewModel.dart';
import 'package:e_commerce/presentation/Components/CartItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/AmountsWidget.dart';
import '../Components/YellowButton.dart';
import '../resources/values_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartScreenViewModel _cartScreenViewModel = CartScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartScreenViewModel.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cartScreenViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewObject>(
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
      stream: _cartScreenViewModel.outputViewObject,
    );
  }

  _getContentWidget(ViewObject? viewObject) {
    if (viewObject == null) {
      return Container();
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 239, 239),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(AppMargin.m14),
            child: YellowButton(
              callback: () {},
              text: 'Proceed to Checkout',
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            title: const Text('My Cart'),
          ),
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(AppMargin.m16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: viewObject.invoice.cartItems.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                              cartItem: viewObject.invoice.cartItems
                                  .elementAt(index));
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(AppPadding.p14),
                      child: Text('Total'),
                    ),
                    Expanded(
                        child: AmountsWidget(
                      subTotal: viewObject.invoice.subTotal,
                      discount: viewObject.invoice.discount,
                    )),
                  ]),
            ),
          ));
    }
  }
}
