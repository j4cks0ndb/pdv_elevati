// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VendaController on _VendaControllerBase, Store {
  final _$quantidadeProdutosAtom =
      Atom(name: '_VendaControllerBase.quantidadeProdutos');

  @override
  int get quantidadeProdutos {
    _$quantidadeProdutosAtom.context
        .enforceReadPolicy(_$quantidadeProdutosAtom);
    _$quantidadeProdutosAtom.reportObserved();
    return super.quantidadeProdutos;
  }

  @override
  set quantidadeProdutos(int value) {
    _$quantidadeProdutosAtom.context.conditionallyRunInAction(() {
      super.quantidadeProdutos = value;
      _$quantidadeProdutosAtom.reportChanged();
    }, _$quantidadeProdutosAtom, name: '${_$quantidadeProdutosAtom.name}_set');
  }

  final _$totalCompraAtom = Atom(name: '_VendaControllerBase.totalCompra');

  @override
  double get totalCompra {
    _$totalCompraAtom.context.enforceReadPolicy(_$totalCompraAtom);
    _$totalCompraAtom.reportObserved();
    return super.totalCompra;
  }

  @override
  set totalCompra(double value) {
    _$totalCompraAtom.context.conditionallyRunInAction(() {
      super.totalCompra = value;
      _$totalCompraAtom.reportChanged();
    }, _$totalCompraAtom, name: '${_$totalCompraAtom.name}_set');
  }

  final _$_VendaControllerBaseActionController =
      ActionController(name: '_VendaControllerBase');

  @override
  void setQuantidadeProdutos(int valor) {
    final _$actionInfo = _$_VendaControllerBaseActionController.startAction();
    try {
      return super.setQuantidadeProdutos(valor);
    } finally {
      _$_VendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalCompra(double valor) {
    final _$actionInfo = _$_VendaControllerBaseActionController.startAction();
    try {
      return super.setTotalCompra(valor);
    } finally {
      _$_VendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quantidadeProdutos: ${quantidadeProdutos.toString()},totalCompra: ${totalCompra.toString()}';
    return '{$string}';
  }
}
