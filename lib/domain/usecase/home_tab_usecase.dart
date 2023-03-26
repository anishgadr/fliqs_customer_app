import 'package:fliqs_app/data/models/home_tabs.dart';

import '../repository/home_repository.dart';

class HomeTopUseCase {
  final HomeRepository repository;
  HomeTopUseCase({required this.repository});
  Future<HomeTab> call() {
    return repository.getHomeTabChips();
  }
}
