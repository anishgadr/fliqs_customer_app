import 'package:fliqs_app/presentation/home/home_tab_bloc/hometab_cubit.dart';
import 'package:fliqs_app/presentation/main_home/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

class FliqsApp extends StatefulWidget {
  @override
  _FliqsAppState createState() => _FliqsAppState();
}

class _FliqsAppState extends State<FliqsApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HometabCubit>(
          create: (_) => di.sl<HometabCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'heronew',
        ),
        title: 'Fliqs App',
        home: MainRoutePage(),
      ),
    );
  }
}
