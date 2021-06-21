import 'package:flutter/material.dart';
import 'package:guia_clube/constants/size.config.dart';

class ExploreWidget extends StatelessWidget {
  final double currentSearchPercent;

  final double currentExplorePercent;

  final Function(bool) animateExplore;

  final Function(DragUpdateDetails) onVerticalDragUpdate;
  final Function() onPanDown;

  final bool isExploreOpen;

  const ExploreWidget(
      {Key key,
      this.currentSearchPercent,
      this.currentExplorePercent,
      this.animateExplore,
      this.isExploreOpen,
      this.onVerticalDragUpdate,
      this.onPanDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: displayWidth(context) * 0.24,
        child: GestureDetector(
          onVerticalDragUpdate: onVerticalDragUpdate,
          onVerticalDragEnd: (_) {
            _dispatchExploreOffset();
          },
          onPanDown: (_) => onPanDown(),
          child: Opacity(
            opacity: 1 - currentSearchPercent,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: displayWidth(context) * 0.5,
              height: displayHeight(context) * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(displayWidth(context) * 0.2),
                      topRight: Radius.circular(displayWidth(context) * 0.2))),
              child: Stack(
                children: [
                  Positioned(
                      top: displayWidth(context) * 0.15,
                      left: displayWidth(context) * 0.07,
                      child: InkWell(
                        onTap: () => animateExplore(!isExploreOpen),
                        child: Text(
                          "Escolher destino",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: displayWidth(context) * 0.05),
                        ),
                      )),
                  Positioned(
                      top: displayWidth(context) * 0.05,
                      left: displayWidth(context) * 0.20,
                      child: InkWell(
                        onTap: () => animateExplore(!isExploreOpen),
                        child:
                        Image.asset('assets/logo-insta.png',
                                width: displayWidth(context)*0.1,
                                ),
                        //  Icon(
                        //   Icons.location_on,
                        //   size: displayWidth(context) * 0.08,
                        //   color: Colors.black,
                        // ),
                      )),
                  // Positioned(
                  //     top: displayHeight(context) * currentExplorePercent < 0.9 ?
                  //     displayHeight(context) * 0.02 :
                  //      displayHeight(context) * 0.5,
                  //     left: displayWidth(context) * 0.19,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         animateExplore(false);
                  //       },
                  //       child: Image.asset(
                  //         "assets/arrow.png",
                  //         width: displayHeight(context) *0.08,
                  //         height: displayHeight(context)*0.05,
                  //         color: Colors.black,
                  //       ),
                  //     )
                  //     ),
                ],
              ),
            ),
          ),
        ));
  }

  /// dispatch Explore state
  ///
  /// handle it by [isExploreOpen] and [currentExplorePercent]
  void _dispatchExploreOffset() {
    if (!isExploreOpen) {
      if (currentExplorePercent < 0.3) {
        animateExplore(false);
      } else {
        animateExplore(true);
      }
    } else {
      if (currentExplorePercent > 0.6) {
        animateExplore(true);
      } else {
        animateExplore(false);
      }
    }
  }
}
