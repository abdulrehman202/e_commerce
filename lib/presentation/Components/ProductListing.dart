import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductListing extends StatelessWidget {
  String imgPath;
  ProductListing({required this.imgPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(imgPath),
              ),
            ),
            Text(
              'Hanging Chair',
              style: TextStyle(fontSize: AppSize.s16),
            ),
            Text(
              'PKR 200',
              style:
                  TextStyle(fontWeight: FontWeight.w800, fontSize: AppSize.s20),
            ),
          ],
        ),
      ),
    );
  }
}
