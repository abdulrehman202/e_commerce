import 'package:e_commerce/presentation/Components/CustomTextField.dart';
import 'package:e_commerce/presentation/Components/YellowButton.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.all(AppPadding.p12),
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                externalController: emailController,
                iconData: Icons.email_outlined,
                focusNode: _focusNode,
              ),
              CustomTextField(
                fieldName: AppStrings.password,
                externalController: passwordController,
                iconData: Icons.key_outlined,
                passwordField: true,
                focusNode: _focusNode,
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: YellowButton(
                    callback: () {},
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
                        style: TextButton.styleFrom(
                            shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: const Text(AppStrings.createAnAccount)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
