import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/search/data/repositories/search_repository.dart';
import 'package:octocoin/features/search/domain/usecases/market_search.dart';
import 'package:octocoin/features/search/external/coingecko/coingecko_datasource.dart';
import 'package:octocoin/features/search/presentation/bloc/search_bloc.dart';
import 'package:octocoin/features/search/presentation/widgets/market_listtile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = SearchBloc(
      MarketSearchImpl(SearchRepositoryImpl(CoingeckoDatasource(Dio()))));

  @override
  void initState() {
    super.initState();
    bloc.add(const LoadSearch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 32),
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
          StreamBuilder<SearchState>(
            stream: bloc.stream,
            builder: ((context, snapshot) {
              final state = bloc.state;

              if (state is SearchError) {
                return const Icon(
                  Icons.traffic_sharp,
                  color: Colors.red,
                );
              }

              if (state is SearchLoading) {
                return const CircularProgressIndicator();
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: (state as SearchSucess).list.length,
                itemBuilder: (_, index) {
                  final item = state.list[index];

                  return MarketListTile(
                    market: item,
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 16);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
