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
      var result = await marketSearch(
        priceChangePercentages: [''],
        vsCurrency: 'usd',
      );

      result.fold(
        (l) => emit(SearchError(l)),
        (r) => emit(SearchSucess(r)),
      );
    });
  }
}
