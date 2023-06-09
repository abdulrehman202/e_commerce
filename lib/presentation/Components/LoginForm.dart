import 'package:e_commerce/presentation/Components/CustomTextField.dart';
import 'package:e_commerce/presentation/Components/YellowButton.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/routes_manager.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginForm extends StatefulWidget {
  late TextEditingController emailController, passwordController;
  late VoidCallback loginCallback;

  LoginForm(
      {required this.emailController,
      required this.passwordController,
      required this.loginCallback,
      super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      padding: const EdgeInsets.all(AppPadding.p12),
      width: MediaQuery.of(context).size.width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.furnish,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text(
              AppStrings.furnitureShopApp,
            ),
            CustomTextField(
              fieldName: AppStrings.email,
              externalController: widget.emailController,
              iconData: Icons.email_outlined,
              focusNode: _focusNode,
            ),
            CustomTextField(
              fieldName: AppStrings.password,
              externalController: widget.passwordController,
              iconData: Icons.key_outlined,
              passwordField: true,
              focusNode: _focusNode,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: YellowButton(
                  callback: widget.loginCallback,
                  text: AppStrings.login,
                ),
              );
            }),
            Row(
              children: [
                const Expanded(
                    child: FittedBox(
                        child: Text(
                  AppStrings.dontHaveAnAccountYet,
                  overflow: TextOverflow.ellipsis,
                ))),
                Expanded(
                  child: TextButton(
                      style:
                          TextButton.styleFrom(shadowColor: Colors.transparent),
                      onPressed: () {},
                      child: const Text(AppStrings.createAnAccount)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
