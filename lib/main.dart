import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/widgets/cod/cod_screen.dart';
import 'package:guia_clube/widgets/login/login_screen.dart';
import 'package:guia_clube/widgets/phone/phone_screen.dart';
import 'package:guia_clube/widgets/splash/splash_screen.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/login_screen',
          page: () => LoginScreen(),
        ),
        GetPage(
            name: '/phone_screen',
            page: () => PhoneScreen(),
           ),
           GetPage(
            name: '/cod_screen',
            page: () => CodScreen(),
           )
      ],
    ));


