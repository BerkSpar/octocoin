import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:octocoin/features/search/data/datasources/search_datasource.dart';
import 'package:octocoin/features/search/data/repositories/search_repository.dart';

@GenerateMocks([SearchDatasource])
import 'search_repository_test.mocks.dart';

void main() {
  final datasource = MockSearchDatasource();
  final repository = SearchRepositoryImpl(datasource);

  test('Need to return a exception when error', () async {
    when(datasource.search(vsCurrency: 'usd')).thenThrow(Exception());

    final result = await repository.getMarkets(
      vsCurrency: 'usd',
    );

    expect(result.isLeft(), true);
  });
}
