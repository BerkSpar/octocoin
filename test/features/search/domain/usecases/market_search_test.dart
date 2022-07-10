import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';
import 'package:octocoin/features/search/domain/repositories/search_repository.dart';
import 'package:octocoin/features/search/domain/usecases/market_search.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SearchRepository])
import 'market_search_test.mocks.dart';

void main() {
  final repository = MockSearchRepository();
  final usecase = MarketSearchImpl(repository);

  test('Should return a market list', () async {
    when(repository.getMarkets(
      vsCurrency: anyNamed('vsCurrency'),
    )).thenAnswer((_) async => right(<Market>[]));

    final result = await usecase(
      vsCurrency: 'usd',
    );

    expect(result.isRight(), true);
  });

  test('Return error when search with a negative page ', () async {
    when(repository.getMarkets(
      vsCurrency: anyNamed('vsCurrency'),
      page: anyNamed('page'),
    )).thenAnswer((_) async => right(<Market>[]));

    final result = await usecase(
      vsCurrency: 'usd',
      page: -1,
    );

    expect(result.isLeft(), true);
  });

  test('Return error when search with itens per page less than 0', () async {
    when(repository.getMarkets(
      vsCurrency: anyNamed('vsCurrency'),
      itensPerPage: anyNamed('itensPerPage'),
    )).thenAnswer((_) async => right(<Market>[]));

    final result = await usecase(
      vsCurrency: 'usd',
      itensPerPage: -1,
    );

    expect(result.isLeft(), true);
  });

  test('Return error when search with itens per page more than 250', () async {
    when(repository.getMarkets(
      vsCurrency: anyNamed('vsCurrency'),
      itensPerPage: anyNamed('itensPerPage'),
    )).thenAnswer((_) async => right(<Market>[]));

    final result = await usecase(
      vsCurrency: 'usd',
      itensPerPage: 251,
    );

    expect(result.isLeft(), true);
  });
}
