import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/values_manager.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
              'https://img.freepik.com/free-photo/retro-living-room-interior-design_53876-145503.jpg?w=740&t=st=1680002125~exp=1680002725~hmac=07b10546162aea17fdab7978f87e9baea50c77c4780a1c7c5ea7e747237fc224',
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
                    'Hanging Chair',
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' Color: Blue ',
                      style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 221, 221, 221),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('x1'),
                  const Text('PKR 4799'),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
