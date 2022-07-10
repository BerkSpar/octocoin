// Mocks generated by Mockito 5.2.0 from annotations
// in octocoin/test/features/search/data/repositories/search_datasource_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:octocoin/features/search/data/datasources/search_datasource.dart'
    as _i2;
import 'package:octocoin/features/search/data/models/market_model.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SearchDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchDatasource extends _i1.Mock implements _i2.SearchDatasource {
  MockSearchDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.MarketModel>> search(
          {String? vsCurrency,
          int? page,
          int? itensPerPage,
          bool? sparkline,
          List<String>? priceChangePercentages,
          String? order,
          List<String>? marketIds}) =>
      (super.noSuchMethod(
              Invocation.method(#search, [], {
                #vsCurrency: vsCurrency,
                #page: page,
                #itensPerPage: itensPerPage,
                #sparkline: sparkline,
                #priceChangePercentages: priceChangePercentages,
                #order: order,
                #marketIds: marketIds
              }),
              returnValue:
                  Future<List<_i4.MarketModel>>.value(<_i4.MarketModel>[]))
          as _i3.Future<List<_i4.MarketModel>>);
}
