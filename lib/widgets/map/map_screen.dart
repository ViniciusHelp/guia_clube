import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
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
                  _bottomSheetLocalizacao(context);
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
                //  ExploreWidget(
                //   currentExplorePercent: currentExplorePercent,
                //   currentSearchPercent: currentSearchPercent,
                //   animateExplore: animateExplore,
                //   isExploreOpen: isExploreOpen,
                //   onVerticalDragUpdate: onExploreVerticalUpdate,
                //   onPanDown: () => animationControllerExplore?.stop(),
                // ),
                // ExploreContentWidget(
                //   currentExplorePercent: currentExplorePercent,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _bottomSheetLocalizacao(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Image.asset(
                            'assets/logo-insta.png',
                            width: displayWidth(context) * 0.2,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estabelecimento xxxxxxx',
                              style: kPrimalStyle.copyWith(
                                  color: colorPurple,
                                  fontSize: displayWidth(context) * 0.05),
                            ),
                            Text(
                              'Rua tal tal, numero tal, bairro tal',
                            )
                          ],
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descontos disponíveis',
                        ),
                        Text(
                          '5% em camisetas',
                          style: kPrimalStyle.copyWith(
                              color: colorPurple,
                              fontSize: displayWidth(context) * 0.032),
                        ),
                        Text(
                          '10% em tênis',
                          style: kPrimalStyle.copyWith(
                              color: colorPurple,
                              fontSize: displayWidth(context) * 0.032),
                        )
                      ],
                    ),
                    // ElevatedButton(

                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/map_screen');
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(displayHeight(context) * 0.2,
                    //           displayWidth(context) * 0.15),
                    //       primary: colorPurple,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(20))
                    //       )
                    //       ),

                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Icon(
                    //         Icons.add_task_outlined,
                    //         size: displayWidth(context) * 0.05,
                    //       ),
                    //       Text('Check-in',
                    //           style: kPrimalStyle.copyWith(
                    //               fontSize: displayWidth(context) * 0.04)),
                    //     ],
                    //   ),
                    // ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add_task_outlined,
                          color: colorYellow,
                          size: displayWidth(context) * 0.05),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            displayWidth(context) * 0.35,
                              displayHeight(context) * 0.07,),
                          primary: colorPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      label: Text('Check-in',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.04)),
                    )
                  ],
                ),
                Divider(
                  height: displayHeight(context) * 0.1,
                  color: Colors.black,
                  endIndent: 15,
                  indent: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contatos'),
                        Text(
                          '5% em camisetas',
                          style: kPrimalStyle.copyWith(
                              color: colorPurple,
                              fontSize: displayWidth(context) * 0.032),
                        ),
                        Text(
                          '10% em tênis',
                          style: kPrimalStyle.copyWith(
                              color: colorPurple,
                              fontSize: displayWidth(context) * 0.032),
                        )
                      ],
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.directions),
                        style: TextButton.styleFrom(
                            fixedSize: Size(
                              displayWidth(context) * 0.35,
                              displayHeight(context) * 0.07,
                            ),
                            primary: colorPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            side: BorderSide(color: colorPurple)),
                        label: Text('Dirigir até', style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.04, color: colorPurple)))
                  ],
                ),
              ],
            ),
          );
        });
  }
}
