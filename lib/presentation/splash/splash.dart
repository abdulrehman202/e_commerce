import 'package:e_commerce/presentation/Components/LoginForm.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Column(children: [
        Expanded(
            child: Image.network(
          'https://img.freepik.com/free-photo/loft-home-office-interior-design_53876-143117.jpg?w=740&t=st=1679565431~exp=1679566031~hmac=c9a4494b52979e0cb71d88ac49de9c21770f6f3fec17e11a578c4d46feadb5ba',
          fit: BoxFit.fill,
        )),
        Expanded(
            child: Row(children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.2,
              color: ColorManager.purple),
        ])),
      ]),
      LoginForm(),
    ]));
  }
}
