import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'package:guia_clube/widgets/cod/cod_screen.dart';
import 'package:guia_clube/widgets/data/data_screen.dart';
import 'package:guia_clube/widgets/login/loginFG_screen.dart';
import 'package:guia_clube/widgets/login/login_screen.dart';
import 'package:guia_clube/widgets/map/map_screen.dart';
import 'package:guia_clube/widgets/phone/phone_screen.dart';
import 'package:guia_clube/widgets/selfie/selfie_screen.dart';
import 'package:guia_clube/widgets/splash/splash_screen.dart';


void main() => runApp(
   GetMaterialApp(
       debugShowCheckedModeBanner: false,
        initialRoute: '/map_screen',
        defaultTransition: Transition.native,
        locale: Locale('pt', 'BR'),
        getPages: [
           GetPage(
            name: '/',
            page: () => LandLogin(),
          ),
          GetPage(
            name: "/splash_screen",
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
          ),
          GetPage(
            name: '/selfie_screen',
            page: () => SelfieScreen(),
          ),
          GetPage(
            name: '/data_screen',
            page: () => DataScreen(),
          ),
          GetPage(
            name: '/map_screen',
            page: () => MapScreen(),
          ),
          GetPage(
            name: '/loginFC_screen',
            page: () => LoginFCScreen(),
            
          ),
        ],
      ),
    );

    class LandLogin extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return LoginFCScreen();
                  } else {
                    return SplashScreen();
                  }
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              });
        }
        return Scaffold(
          body: Center(
            child: Text('Connected'),
          ),
        );
      },
    );
  }
}
