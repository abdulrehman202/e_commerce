import 'package:e_commerce/presentation/CartScreen/CartScreen_ViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/values_manager.dart';

class CartItemWidget extends StatelessWidget {
  CartItem cartItem;
  CartItemWidget({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      margin: const EdgeInsets.only(bottom: AppMargin.m8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
      height: 130,
      child: Row(children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              cartItem.img,
              height: AppSize.s100,
              width: AppSize.s100,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: AppSize.s12,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    cartItem.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' Color: ${cartItem.color}',
                      style: const TextStyle(
                        backgroundColor: Color.fromARGB(255, 221, 221, 221),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('x${cartItem.quantity}'),
                  Text('PKR ${cartItem.price}'),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
