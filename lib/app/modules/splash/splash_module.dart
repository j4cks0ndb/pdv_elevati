import 'package:pdv_elevati/app/modules/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pdv_elevati/app/modules/splash/splash_page.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController(i.get<ProdutoRepository>())),
        Bind((i) => ProdutoRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}