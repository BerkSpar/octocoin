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
        priceChangePercentages: [''],
        vsCurrency: 'usd',
      );

      var savedMarkets = await marketSearch(
        priceChangePercentages: [''],
        marketIds: ['bluebenx'],
        vsCurrency: 'usd',
      );

      if (markets.isLeft() || savedMarkets.isLeft()) {
        return emit(SearchError(Exception()));
      }

      emit(SearchSucess(
        markets: markets.getOrElse(() => []),
        savedMarkets: savedMarkets.getOrElse(() => []),
      ));
    });
  }
}
