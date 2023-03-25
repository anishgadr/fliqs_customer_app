import 'package:fliqs_app/presentation/home/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';
import '../widgets/bottom_bar.dart';

class MainRoutePage extends StatefulWidget {
  MainRoutePage({Key? key}) : super(key: key);

  @override
  _MainRoutePageState createState() => _MainRoutePageState();
}

class _MainRoutePageState extends State<MainRoutePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.black
        : Colors.white;
    final Color unselectedColorReverse =
        colors[currentPage].computeLuminance() < 0.5
            ? Colors.white
            : Colors.black;

    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          clip: Clip.none,
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: unselectedColor,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(18.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.9,
          barColor: AppColors.textNavyBlue,
          start: 2,
          end: 0,
          bottom: 10,
          alignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: const [HomePage(), HomePage(), HomePage(), HomePage()],
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              _tabbarwidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabbarwidget() {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
      tabs: [
        SizedBox(
          height: 60,
          width: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 0
                  ? Image.asset(
                      'assets/images/home_select.png',
                      scale: 2.5,
                    )
                  : Image.asset(
                      'assets/images/home_unselect.png',
                      scale: 2.5,
                    ),
              const Text("Home",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "HeroNew",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0),
                  textAlign: TextAlign.left)
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 1
                  ? Image.asset(
                      'assets/images/msg_select.png',
                      scale: 2.5,
                    )
                  : Image.asset(
                      'assets/images/msg_unselect.png',
                      scale: 2.5,
                    ),
              const Text("Chats",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "HeroNew",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0),
                  textAlign: TextAlign.left)
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 2
                  ? Image.asset(
                      'assets/images/msg_select.png',
                      scale: 2.5,
                    )
                  : Image.asset(
                      'assets/images/msg_unselect.png',
                      scale: 2.5,
                    ),
              const Text("Communities",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "HeroNew",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0),
                  textAlign: TextAlign.left)
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 3
                  ? Image.asset(
                      'assets/images/doc_select.png',
                      scale: 2.5,
                    )
                  : Image.asset(
                      'assets/images/doc_unselect.png',
                      scale: 2.5,
                    ),
              const Text("Account",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "HeroNew",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0),
                  textAlign: TextAlign.left)
            ],
          ),
        ),
      ],
    );
  }
}
