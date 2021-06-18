
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: displayHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: displayWidth(context) * 1,
                  height: displayHeight(context) * 0.15,
                  decoration: BoxDecoration(
                      color: colorPurple,
                      borderRadius: BorderRadius.only(
                          bottomRight:
                              Radius.elliptical(max(900, 0), max(300, 0)),
                          bottomLeft:
                              Radius.elliptical(max(0, 550), max(350, 0)))),
                ),
                Image.asset(
              'assets/guia-clube-nome-roxo.png',
              width: displayWidth(context)* 0.8,
              fit: BoxFit.scaleDown,
            ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(displayHeight(context) * 0.4,
                              displayWidth(context) * 0.15),
                          primary: colorPurple),
                      child: Text('Já tenho cadastro',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.05)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('----------------- ou -----------------'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/phone_screen');
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(displayHeight(context) * 0.4,
                                displayWidth(context) * 0.15),
                            primary: colorPurple,
                            side: BorderSide(color: colorPurple)),
                        child: Text('Não tenho cadastro', style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.05, color: colorPurple))),
                  ],
                ),
                Container(
                  width: displayWidth(context) * 1,
                  height: displayHeight(context) * 0.2,
                  decoration: BoxDecoration(
                      color: colorPurple,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(max(780, 0), max(340, 0)),
                          topRight:
                              Radius.elliptical(max(0, 390), max(370, 0)))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
