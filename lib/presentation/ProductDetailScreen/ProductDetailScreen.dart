import 'package:counter/counter.dart';
import 'package:e_commerce/presentation/Components/YellowButton.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/routes_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];

  int selectedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: YellowButton(
          text: 'Add to Cart',
          callback: () {
            Navigator.pushNamed(context, Routes.CartScreenRoute);
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: ColorManager.purple,
        ),
        Container(
          margin: const EdgeInsets.all(AppMargin.m20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: AppSize.s65,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    arguments['imgLink'],
                    fit: BoxFit.fill,
                    height: 350.0,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text(
                arguments['productName'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PKR ${arguments['price']}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Counter(
                    min: 0,
                    max: 10,
                    step: 1,
                    onValueChanged: print,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'nsjdfnjksdfbshfbwiufbwiufwuifgygbdhvbdyuvbgfuaywfysgfsdyhvsduyfetsyfdsudgsygfiygfuysgefyuwegfuyewgfug',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                'Colors',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                child: Row(
                  children: [
                    for (int i = 0; i < colors.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = i;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.symmetric(
                              horizontal: AppMargin.m8),
                          decoration: BoxDecoration(
                              color: colors.elementAt(i),
                              borderRadius: BorderRadius.circular(50.0)),
                          child: i == selectedColorIndex
                              ? const Icon(Icons.check)
                              : Container(),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
