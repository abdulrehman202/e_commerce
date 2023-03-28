import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/presentation/Components/CategoryWidget.dart';
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
  List<String> imgList = [
    'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
    'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
    'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
    'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
    'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
  ];

  @override
  Widget build(BuildContext context) {
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
                  options: CarouselOptions(enableInfiniteScroll: false),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CategoryWidget(
                            imgLink: i,
                            categoryName: 'Sofa',
                            numberOfItems: 120);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
