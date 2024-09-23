import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:octocoin/features/home/presentation/pages/home_page.dart';
import 'package:octocoin/features/search/data/repositories/search_repository.dart';
import 'package:octocoin/features/search/domain/usecases/market_search.dart';
import 'package:octocoin/features/search/external/coingecko/coingecko_datasource.dart';
import 'package:octocoin/features/search/external/coinmarketcap/coinmarketcap_datasource.dart';
import 'package:octocoin/features/search/presentation/bloc/search_bloc.dart';
import 'package:octocoin/features/search/presentation/pages/search_page.dart';
import 'package:octocoin/firebase_options.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Octocoin',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();
  int _page = 0;

  final searchBloc = SearchBloc(
    MarketSearchImpl(SearchRepositoryImpl(CoingeckoDatasource(Dio()))),
    MarketSearchImpl(SearchRepositoryImpl(CoinMarketCapDatasource(Dio()))),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _page = _controller.page?.round() ?? 0;
    });

    searchBloc.add(const LoadSearch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Octocoin",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          SearchPage(bloc: searchBloc),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _page,
        onTap: (i) => setState(() => _controller.jumpToPage(i)),
        backgroundColor: Colors.blue,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.white,
            unselectedColor: Colors.blue.shade900,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.white,
            unselectedColor: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }
}
