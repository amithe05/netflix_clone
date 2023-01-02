import 'package:flutter/material.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/mainpage/screen_mainpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/Home/home_bloc.dart';
import 'application/hot_and_new/hot_and_new_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureinjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getit<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getit<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getit<SearchBloc>()),
        BlocProvider(create: (ctx) => getit<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getit<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getit<HomeBloc>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: backgroundColor,
            primarySwatch: Colors.blue,
          ),
          home: ScreenMainPage()),
    );
  }
}
