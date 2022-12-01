import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocola_jems/page/home.dart';


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/bg/shop.jpg"
          ),
          fit: BoxFit.fill,
        ),
      ),
      child:const Scaffold(
        backgroundColor: Colors.transparent,
        body: ShopD(),
      ),
    );
  }
}

class ShopD extends StatefulWidget {
  const ShopD({Key? key}) : super(key: key);

  @override
  State<ShopD> createState() => _ShopDState();
}

class _ShopDState extends State<ShopD> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

