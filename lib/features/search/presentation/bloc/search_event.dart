part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearch extends SearchEvent {
  const LoadSearch();
}

class RetrySearch extends SearchEvent {
  const RetrySearch();
}
