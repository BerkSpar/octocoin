part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchError extends SearchState {
  final Exception error;
  const SearchError(this.error);
}

class SearchSucess extends SearchState {
  final List<Market> list;
  const SearchSucess(this.list);

  @override
  List<Object> get props => [list];
}
