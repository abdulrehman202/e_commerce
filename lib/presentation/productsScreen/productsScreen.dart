import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/presentation/Components/CategoryWidget.dart';
import 'package:e_commerce/presentation/Components/ProductListing.dart';
import 'package:e_commerce/presentation/productsScreen/ProductsScreen_ViewModel.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/color_manager.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductsScreenViewModel _viewModel = ProductsScreenViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewObject>(
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
      stream: _viewModel.outputViewObject,
    );
  }

  Widget _getContentWidget(ViewObject? viewObject) {
    if (viewObject == null) {
      return Container();
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text(
              AppStrings.productList,
            ),
          ),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: ColorManager.purple,
            ),
            Container(
              margin: const EdgeInsets.all(AppMargin.m12),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSize.s100,
                  ),
                  //select category carousel
                  CarouselSlider(
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          _viewModel.onCategoryChange(index);
                        }),
                    items: viewObject.categoryList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CategoryWidget(
                              imgLink: i.imgUrl,
                              categoryName: i.name,
                              numberOfItems: 120);
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          viewObject.categoryList
                              .elementAt(viewObject.selectedCategoryIndex)
                              .name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.purple),
                        ),
                        Text('${viewObject.itemsList.length} Products'),
                      ],
                    ),
                  ),

                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children:
                          List.generate(viewObject.itemsList.length, (index) {
                        return ProductListing(
                            name: viewObject.itemsList.elementAt(index).name,
                            imgPath:
                                viewObject.itemsList.elementAt(index).imgUrl);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
