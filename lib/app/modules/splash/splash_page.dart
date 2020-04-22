import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pdv_elevati/app/shared/db_helper.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    Future futureA = Future.delayed(Duration(seconds: 3));
    Future futureB = DbHelper.getInstance().db;   
    Future futureC = controller.loadProdutoFromApi();
    Future futureD = controller.loadProdutoGrupoFromApi();
    // Usuario
    //Future<Usuario> futureC = Usuario.get();

    Future.wait([futureA,futureB,futureC,futureD]).then((List values) {
      //Usuario user = values[2];
      //print(user);

      Modular.to.pushReplacementNamed('/venda/');
      
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
