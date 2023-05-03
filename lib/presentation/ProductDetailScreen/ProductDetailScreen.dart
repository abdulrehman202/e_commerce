import 'package:counter/counter.dart';
import 'package:e_commerce/presentation/Components/YellowButton.dart';
import 'package:e_commerce/presentation/ProductDetailScreen/ProductDetailScreen_ViewModel.dart';
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
  final ProductDetailScreenViewModel _detailScreenViewModel =
      ProductDetailScreenViewModel();
  _bind() {
    _detailScreenViewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _detailScreenViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewObject>(
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
      stream: _detailScreenViewModel.outputViewObject,
    );
  }

  _getContentWidget(ViewObject? viewObject) {
    if (viewObject == null) {
      return Container();
    } else {
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
                      viewObject.item.img,
                      fit: BoxFit.fill,
                      height: 350.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  viewObject.item.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PKR ${viewObject.item.price}',
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
                  viewObject.item.description,
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
                      for (int i = 0; i < viewObject.item.colors.length; i++)
                        GestureDetector(
                          onTap: () {
                            _detailScreenViewModel.onColorChange(i);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppMargin.m8),
                            decoration: BoxDecoration(
                                color: viewObject.item.colors.elementAt(i),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: i == viewObject.selectedColorIndex
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
}
