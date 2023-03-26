import 'dart:convert';

import 'package:fliqs_app/data/models/home_tabs.dart';
import 'package:fliqs_app/domain/repository/home_repository.dart';
import 'package:http/http.dart' as http;
import '../network/network_interface.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeTab> getHomeTabChips() async {
    var endpoint = "$baseUrl${getHomeTabs()}";
    var hometabs;
    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        hometabs = HomeTab.fromJson(data);
        print(data);
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
    return hometabs;
  }
}
