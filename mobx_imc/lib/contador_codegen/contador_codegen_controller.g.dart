// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contador_codegen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContadorCodeGenController on _ContadorCodeGenControolerBase, Store {
  Computed<String>? _$saudacaoComputed;

  @override
  String get saudacao =>
      (_$saudacaoComputed ??= Computed<String>(() => super.saudacao,
              name: '_ContadorCodeGenControolerBase.saudacao'))
          .value;

  final _$counterAtom = Atom(name: '_ContadorCodeGenControolerBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$fullNameAtom = Atom(name: '_ContadorCodeGenControolerBase.fullName');

  @override
  FullName get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(FullName value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$_ContadorCodeGenControolerBaseActionController =
      ActionController(name: '_ContadorCodeGenControolerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ContadorCodeGenControolerBaseActionController
        .startAction(name: '_ContadorCodeGenControolerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ContadorCodeGenControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName() {
    final _$actionInfo = _$_ContadorCodeGenControolerBaseActionController
        .startAction(name: '_ContadorCodeGenControolerBase.changeName');
    try {
      return super.changeName();
    } finally {
      _$_ContadorCodeGenControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rollbackName() {
    final _$actionInfo = _$_ContadorCodeGenControolerBaseActionController
        .startAction(name: '_ContadorCodeGenControolerBase.rollbackName');
    try {
      return super.rollbackName();
    } finally {
      _$_ContadorCodeGenControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
fullName: ${fullName},
saudacao: ${saudacao}
    ''';
  }
}
