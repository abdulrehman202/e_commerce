import 'package:e_commerce/presentation/Components/LoginForm.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/routes_manager.dart';
import 'package:e_commerce/presentation/splash/splash_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel _splashViewModel = SplashViewModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _bind() {
    _splashViewModel.start();
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
    _splashViewModel.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewObject>(
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
      stream: _splashViewModel.outputViewObject,
    );
  }

  Widget _getContentWidget(ViewObject? viewObject) {
    if (viewObject != null) {
      return Scaffold(
          body: Stack(alignment: Alignment.center, children: [
        Column(children: [
          Expanded(
              child: Image.network(
            viewObject.imgUrl,
            fit: BoxFit.fill,
          )),
          Expanded(
              child: Row(children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.2,
                color: ColorManager.purple),
          ])),
        ]),
        LoginForm(
          emailController: emailController,
          passwordController: passwordController,
          loginCallback: () {
            if (_splashViewModel.validateCredentials(
                emailController.text, passwordController.text)) {
              Navigator.pushReplacementNamed(
                  context, Routes.productsScreenRoute);
            }
          },
        ),
      ]));
    } else {
      return Container();
    }
  }
}
