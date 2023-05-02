import 'package:e_commerce/presentation/resources/routes_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductListing extends StatelessWidget {
  String imgPath, name;
  ProductListing({required this.name, required this.imgPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.productDetailScreenRoute,
              arguments: {
                'imgLink': imgPath,
                'productName': 'Hanging Chair',
                'price': '200'
              });
        },
        child: Container(
          margin: const EdgeInsets.all(AppMargin.m14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(imgPath),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: AppSize.s16),
              ),
              Text(
                'PKR 200',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: AppSize.s20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
