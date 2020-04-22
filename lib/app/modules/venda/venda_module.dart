import 'package:pdv_elevati/app/modules/venda/pages/pagamento/pagamento_page.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';
import 'package:pdv_elevati/app/modules/venda/pages/pagamento/pagamento_controller.dart';
import 'package:pdv_elevati/app/modules/venda/pages/lista_venda/lista_venda_controller.dart';
import 'package:pdv_elevati/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pdv_elevati/app/modules/venda/venda_page.dart';

class VendaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutoRepository()),
        Bind((i) => PagamentoController()),
        Bind((i) => ListaVendaController()),
        Bind((i) => VendaController(i.get<ProdutoRepository>())),
        Bind((i) => ProdutoRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => VendaPage()),
        Router('/pagamentopage',child: (_, args) =>  PagamentoPage()),
      ];

  static Inject get to => Inject<VendaModule>.of();
}
