// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vender_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VenderController on _VenderControllerBase, Store {
  final _$indiceAtom = Atom(name: '_VenderControllerBase.indice');

  @override
  List<dynamic> get indice {
    _$indiceAtom.context.enforceReadPolicy(_$indiceAtom);
    _$indiceAtom.reportObserved();
    return super.indice;
  }

  @override
  set indice(List<dynamic> value) {
    _$indiceAtom.context.conditionallyRunInAction(() {
      super.indice = value;
      _$indiceAtom.reportChanged();
    }, _$indiceAtom, name: '${_$indiceAtom.name}_set');
  }

  final _$botoesAtom = Atom(name: '_VenderControllerBase.botoes');

  @override
  List<Widget> get botoes {
    _$botoesAtom.context.enforceReadPolicy(_$botoesAtom);
    _$botoesAtom.reportObserved();
    return super.botoes;
  }

  @override
  set botoes(List<Widget> value) {
    _$botoesAtom.context.conditionallyRunInAction(() {
      super.botoes = value;
      _$botoesAtom.reportChanged();
    }, _$botoesAtom, name: '${_$botoesAtom.name}_set');
  }

  final _$_VenderControllerBaseActionController =
      ActionController(name: '_VenderControllerBase');

  @override
  void listarProdutos({List<dynamic> produtos, bool voltar = false}) {
    final _$actionInfo = _$_VenderControllerBaseActionController.startAction();
    try {
      return super.listarProdutos(produtos: produtos, voltar: voltar);
    } finally {
      _$_VenderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'indice: ${indice.toString()},botoes: ${botoes.toString()}';
    return '{$string}';
  }
}
