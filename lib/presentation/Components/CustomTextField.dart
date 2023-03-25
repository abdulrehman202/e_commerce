import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  final String fieldName;
  final TextEditingController externalController;
  final IconData iconData;
  final FocusNode focusNode;
  final bool passwordField;

  CustomTextField(
      {required this.fieldName,
      required this.externalController,
      required this.iconData,
      this.passwordField = false,
      required this.focusNode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color.fromARGB(255, 214, 214, 214),
      ),
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: EditableText(
              controller: externalController,
              focusNode: focusNode,
              style: const TextStyle(
                color: Colors.black,
              ),
              cursorColor: ColorManager.darkGrey,
              backgroundCursorColor: ColorManager.darkGrey,
              onChanged: (dtring) {
                focusNode.requestFocus();
              },
              onSubmitted: (s) {
                FocusScope.of(context).nextFocus();
              },
              obscureText: passwordField,
            ),
          ),
          FittedBox(
              child: Icon(
            iconData,
            size: AppSize.s20,
          )),
        ],
      ),
    );
  }
}
