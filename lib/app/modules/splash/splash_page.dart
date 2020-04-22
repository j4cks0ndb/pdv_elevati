import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) async {
      //Future.delayed(Duration(seconds: 2)).then((value) => Modular.to.pushReplacementNamed('/venda/'));
      var retorno = await controller.loadFromApi();
      if(retorno){
        Modular.to.pushReplacementNamed('/venda/');
      }else{
        Modular.to.pushReplacementNamed('/venda/');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
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
