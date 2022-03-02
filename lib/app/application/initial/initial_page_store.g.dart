// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialPageStore on _InitialPageStoreBase, Store {
  final _$errorNameAtom = Atom(name: '_InitialPageStoreBase.errorName');

  @override
  String? get errorName {
    _$errorNameAtom.reportRead();
    return super.errorName;
  }

  @override
  set errorName(String? value) {
    _$errorNameAtom.reportWrite(value, super.errorName, () {
      super.errorName = value;
    });
  }

  final _$_InitialPageStoreBaseActionController =
      ActionController(name: '_InitialPageStoreBase');

  @override
  void changeErrorName(String? value) {
    final _$actionInfo = _$_InitialPageStoreBaseActionController.startAction(
        name: '_InitialPageStoreBase.changeErrorName');
    try {
      return super.changeErrorName(value);
    } finally {
      _$_InitialPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorName: ${errorName}
    ''';
  }
}
