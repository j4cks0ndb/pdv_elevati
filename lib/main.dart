import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pdv_elevati/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  runApp(OKToast(child: ModularApp(module: AppModule()),));
} 
