import 'package:fliqs_app/constants/app_colors.dart';
import 'package:fliqs_app/presentation/home/home_tab_bloc/hometab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HometabCubit>().getHomeTabs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureBlack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() {}),
            icon: Image.asset(
              'assets/images/left_menu.png',
              scale: 3,
              color: AppColors.white,
            )),
        actions: [
          IconButton(
              onPressed: null,
              icon: Image.asset(
                'assets/images/notification_bell.png',
                scale: 3,
                color: AppColors.white,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.bgBlue,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        BlocConsumer<HometabCubit, HometabState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HometabSuccess) {
              return Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.homtab.homeTab!.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        height: 30,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: AppColors.bottomNav,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            state.homtab.homeTab![index].tab.toString(),
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      );
                    }),
                  ));
            }

            if (state is HometabLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HometabFailure) {
              return Text(
                state.errMsg,
                style: const TextStyle(color: AppColors.white),
              );
            }

            return Container();
          },
        )
      ])),
    );
  }
}
