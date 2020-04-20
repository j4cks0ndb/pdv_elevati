import 'package:mobx/mobx.dart';

part 'lista_venda_controller.g.dart';

class ListaVendaController = _ListaVendaControllerBase
    with _$ListaVendaController;

abstract class _ListaVendaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
