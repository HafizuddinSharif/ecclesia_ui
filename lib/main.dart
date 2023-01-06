import 'package:ecclesia_ui/client/config/app_router.dart';
import 'package:ecclesia_ui/server/bloc/election_overview_bloc.dart';
import 'package:ecclesia_ui/server/bloc/joined_elections_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<JoinedElectionsBloc>(
      create: (context) => JoinedElectionsBloc(),
    ),
    BlocProvider<ElectionOverviewBloc>(
      create: (context) => ElectionOverviewBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-cclesia UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      routerConfig: appRouter,
      // home: const Home()
    );
  }
}
