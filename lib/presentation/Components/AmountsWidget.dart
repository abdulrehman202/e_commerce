import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/values_manager.dart';

class AmountsWidget extends StatelessWidget {
  const AmountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppPadding.p18),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getRow('Sub Total', '10999'),
            getRow('Discount', '5999'),
            getRow('Total', '5000'),
          ],
        ));
  }
}

getRow(String label, String amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label),
      Text('PKR $amount'),
    ],
  );
}
