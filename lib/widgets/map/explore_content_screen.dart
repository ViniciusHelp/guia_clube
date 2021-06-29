import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';

class ExploreContentWidget extends StatefulWidget {
  final double currentExplorePercent;
  final Function(bool) animateExplore;

  const ExploreContentWidget(
      {Key key, this.currentExplorePercent, this.animateExplore})
      : super(key: key);

  @override
  _ExploreContentWidgetState createState() => _ExploreContentWidgetState();
}

class _ExploreContentWidgetState extends State<ExploreContentWidget>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController enderecoController = TextEditingController();

  AnimationController animationControllerExplore;
  AnimationController animationControllerSearch;
  AnimationController animationControllerMenu;
  AnimationController animationControllerMessage;
  CurvedAnimation curve;
  Animation<double> animation;
  Animation<double> animationW;
  Animation<double> animationR;

  get currentExplorePercent =>
      max(0.0, min(1.0, offsetExplore / (760.0 - 122.0)));
  get currentSearchPercent => max(0.0, min(1.0, offsetSearch / (347 - 68.0)));
  get currentMenuPercent => max(0.0, min(1.0, offsetMenu / 358));
  get currentMessagePercent => max(0.0, min(1.0, offsetMessage / 358));

  var offsetExplore = 0.0;
  var offsetSearch = 0.0;
  var offsetMenu = 0.0;
  var offsetMessage = 0.0;

  bool isExploreOpen = true;
  bool isSearchOpen = false;
  bool isMenuOpen = false;
  bool isMessageOpen = false;

  void animateExplore(bool open) {
    animationControllerExplore = AnimationController(
        duration: Duration(
            milliseconds: 1 +
                (800 *
                        (isExploreOpen
                            ? currentExplorePercent
                            : (1 - currentExplorePercent)))
                    .toInt()),
        vsync: this);
    curve =
        CurvedAnimation(parent: animationControllerExplore, curve: Curves.ease);
    animation = Tween(begin: offsetExplore, end: open ? 760.0 - 122 : 0.0)
        .animate(curve)
          ..addListener(() {
            setState(() {
              offsetExplore = animation.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              isExploreOpen = open;
            }
          });
    animationControllerExplore.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentExplorePercent != 0) {
      return Positioned(
          top: 300,
          width: displayWidth(context),
          child: Container(
            height: displayWidth(context),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(
                            displayWidth(context) /
                                3 *
                                (1 - widget.currentExplorePercent),
                            displayWidth(context) /
                                3 /
                                2 *
                                (1 - widget.currentExplorePercent)),
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Image.asset(
                                    'assets/logo-insta.png',
                                    width: displayWidth(context) * 0.2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Estabelecimento xxxxxxx',
                                    ),
                                    Text(
                                      'Rua tal tal, numero tal, bairro tal',
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Descontos disponíveis',
                        ),
                        Text(
                          'Rua tal tal, numero tal, bairro tal',
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/map_screen');
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(displayHeight(context) * 0.2,
                              displayWidth(context) * 0.15),
                          primary: colorPurple),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_task_outlined,
                            size: displayWidth(context) * 0.05,
                          ),
                          Text('Check-in',
                              style: kPrimalStyle.copyWith(
                                  fontSize: displayWidth(context) * 0.04)),
                        ],
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.translate(
                      offset: Offset(
                          displayWidth(context) /
                              3 *
                              (1 - widget.currentExplorePercent),
                          displayWidth(context) /
                              3 /
                              2 *
                              (1 - widget.currentExplorePercent)),
                      child: Container(
                        padding: EdgeInsets.all(11.0),
                        width: displayWidth(context) / 2,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/map_screen');
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(displayHeight(context) * 0.4,
                                  displayWidth(context) * 0.15),
                              primary: colorPurple),
                          child: Text('Salvar e continuar',
                              style: kPrimalStyle.copyWith(
                                  fontSize: displayWidth(context) * 0.05)),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(bottom: 205),
                ),
              ],
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text('asdsa'),
            //     Text('data')
            //   ],
            // ),
          ));
    } else {
      return const Padding(
        padding: const EdgeInsets.all(0),
      );
    }
  }
}
