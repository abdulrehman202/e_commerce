import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class YellowButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  const YellowButton({required this.callback, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.yellow,
        shape: const StadiumBorder(),
      ),
      child: Text(text),
    );
  }
}
