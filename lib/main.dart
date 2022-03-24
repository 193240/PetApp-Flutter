import 'package:flutter/material.dart';
import 'package:mvp/src/pages/inicio_page.dart';
import 'package:mvp/src/pages/home_headers.dart';
import 'package:mvp/src/splash/splash_view.dart';
import 'package:mvp/src/Painters/progressView.dart';
import 'package:mvp/src/pages/login_page.dart';
import 'package:mvp/src/pages/registro.dart';
import 'package:mvp/src/pages/recuperarPass.dart';
import 'package:mvp/src/pages/mascotas.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio',
      initialRoute: 'initialHeader',
      
      routes: {
        //'initialHeader': (BuildContext context)=> SplashView(),
        'inicioHome': (BuildContext context)=> inicio_page(),
        'practica': (BuildContext context)=>const homeHeader(),
        'progressPainter': (BuildContext context)=> progressView(),
        'login': (BuildContext context)=> login(),
        'registro': (BuildContext context)=> Registro(),     
        'recuperarPass': (BuildContext context)=> recuperarPass(),

        'initialHeader': (BuildContext context)=> mascotasC(),
      },
      //home: inicio_page()
    );
  }
}



