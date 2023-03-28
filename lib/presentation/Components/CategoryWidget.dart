import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;
  int numberOfItems;
  CategoryWidget(
      {required this.categoryName, required this.numberOfItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          margin: const EdgeInsets.all(AppMargin.m8),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              'https://img.freepik.com/premium-photo/living-room-interior-wall-dark-tones-with-leather-armchair-black-wooden-wall-3d-rendering_41470-3595.jpg?w=740',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                categoryName,
                style: TextStyle(color: ColorManager.white),
              ),
              Text('$numberOfItems Items',
                  style: TextStyle(color: ColorManager.white)),
            ],
          ),
        )
      ],
    );
  }
}
