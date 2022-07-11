import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';
import 'package:octocoin/features/search/domain/usecases/market_search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MarketSearch marketSearch;

  SearchBloc(this.marketSearch) : super(const SearchLoading()) {
    on<LoadSearch>((event, emit) async {
      var markets = await marketSearch(
        priceChangePercentages: ['24h', '30d', '200d', '1y'],
        vsCurrency: 'usd',
      );

      var savedMarkets = await marketSearch(
        priceChangePercentages: ['24h', '30d', '200d', '1y'],
        marketIds: ['bitcoin', 'bluebenx'],
        vsCurrency: 'usd',
      );

      if (markets.isLeft() || savedMarkets.isLeft()) {
        return emit(SearchError(Exception()));
      }

      final sortedSavedMarkets = savedMarkets.getOrElse(() => []);
      sortedSavedMarkets.sort((a, b) => a.id == 'bluebenx' ? 0 : 1);

      emit(SearchSucess(
        markets: markets.getOrElse(() => []),
        savedMarkets: sortedSavedMarkets,
      ));

      Future.delayed(const Duration(seconds: 15))
          .whenComplete(() => add(const LoadSearch()));
    });
  }
}
