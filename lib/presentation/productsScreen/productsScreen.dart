import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/presentation/Components/CategoryWidget.dart';
import 'package:e_commerce/presentation/Components/ProductListing.dart';
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

  String img1 =
      'https://img.freepik.com/free-photo/retro-living-room-interior-design_53876-145503.jpg?w=740&t=st=1680002125~exp=1680002725~hmac=07b10546162aea17fdab7978f87e9baea50c77c4780a1c7c5ea7e747237fc224';

  String img2 =
      'https://img.freepik.com/free-vector/wicker-hanging-chairs-swing-hanging-chain-with-cushions_1284-45541.jpg?w=740&t=st=1680002500~exp=1680003100~hmac=a33f1c9de208d82cb2ebf040be3147a15ddb79db5c4ba797f6282d2d8f0ae64a';

  List<String> itemsList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
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
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Chairs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.purple),
                      ),
                      Text('120 Products'),
                    ],
                  ),
                ),

                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: List.generate(itemsList.length, (index) {
                      return ProductListing(imgPath: img1);
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
