import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/search/presentation/bloc/search_bloc.dart';
import 'package:octocoin/features/search/presentation/widgets/market_listtile.dart';
import '../widgets/market_card.dart';

class SearchPage extends StatefulWidget {
  final SearchBloc bloc;

  const SearchPage({
    super.key,
    required this.bloc,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<SearchState>(
          stream: widget.bloc.stream,
          builder: (context, snapshot) {
            final state = widget.bloc.state;

            if (state is SearchError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.error.toString()),
                    TextButton(
                      onPressed: () => widget.bloc.add(const RetrySearch()),
                      child: const Text("retry"),
                    )
                  ],
                ),
              );
            }

            if (state is SearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchSucess) {
              return ListView(
                children: [
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 240,
                    child: PageView.builder(
                      itemCount: state.savedMarkets.length,
                      itemBuilder: (_, index) {
                        final item = state.savedMarkets[index];

                        return MarketCard(
                          market: item,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          'Markets',
                          style: GoogleFonts.notoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: state.markets.length,
                    itemBuilder: (_, index) {
                      final item = state.markets[index];

                      return MarketListTile(
                        market: item,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: 16);
                    },
                  ),
                ],
              );
            }

            return Container();
          }),
    );
  }
}
