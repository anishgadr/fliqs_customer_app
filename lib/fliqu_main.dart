import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fliqs/presentation/home/home_chips_bloc/chips_cubit.dart';
import 'package:flutter_fliqs/presentation/main_home/main_home_page.dart';
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
        BlocProvider<ChipsCubit>(
          create: (_) => di.sl<ChipsCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'heronew',
        ),
        title: 'Fliqs Online',
        home: MainRoutePage(),
      ),
    );
  }
}
