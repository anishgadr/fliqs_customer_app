import 'package:fliqs_app/data/models/home_tabs.dart';

abstract class HomeRepository {
  Future<HomeTab> getHomeTabChips();
}
