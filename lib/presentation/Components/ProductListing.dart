import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                  'https://img.freepik.com/free-vector/wicker-hanging-chairs-swing-hanging-chain-with-cushions_1284-45541.jpg?w=740&t=st=1679999867~exp=1680000467~hmac=6557a8f47a3f807c66a91af54eaaa537d7615b3896effad347ed09f82844b811'),
            ),
            Text('Hanging Chair'),
            Text('PKR 200'),
          ],
        ),
      ),
    );
  }
}
