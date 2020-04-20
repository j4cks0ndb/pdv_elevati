import 'package:mobx/mobx.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {
  @observable
  int quantidadeProdutos = 0;

  @observable
  double totalCompra = 0;

  @action
  void setQuantidadeProdutos(int valor) {
    quantidadeProdutos += valor ;
  }

  @action
  void setTotalCompra(double valor) {
    totalCompra += valor ;
  }
}
