import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/widgets/map/explore_content_screen.dart';

import 'explore_screen.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
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

  bool isExploreOpen = false;
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

  void onExploreVerticalUpdate(details) {
    offsetExplore -= details.delta.dy;
    if (offsetExplore > 644) {
      offsetExplore = 644;
    } else if (offsetExplore < 0) {
      offsetExplore = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorPurple,
          title: TextField(
            decoration: InputDecoration(
                hintText: 'Pesquisar',
                hintStyle: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(
                alignment: AlignmentDirectional.centerStart,
                iconSize: 30,
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {});
                }),
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Center(
                  child: Text(
                'filtrar',
                style: TextStyle(color: colorYellow),
              )),
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: displayWidth(context),
            height: displayHeight(context),
                      child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/map.png',
                  width: displayWidth(context),
                  height: displayHeight(context),
                  fit: BoxFit.cover,
                ),
                 ExploreWidget(
                  currentExplorePercent: currentExplorePercent,
                  currentSearchPercent: currentSearchPercent,
                  animateExplore: animateExplore,
                  isExploreOpen: isExploreOpen,
                  onVerticalDragUpdate: onExploreVerticalUpdate,
                  onPanDown: () => animationControllerExplore?.stop(),
                ),
                ExploreContentWidget(
                  currentExplorePercent: currentExplorePercent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
