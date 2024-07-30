import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SliderController extends GetxController {
  var data = [].obs;
  RxList<String> myList = <String>[].obs;
  RxList<String> titre_slide = <String>[].obs;

  RxList<String> myList_produit = <String>[].obs;
  RxList<String> titre_produit = <String>[].obs;

  RxList<String> myList_system = <String>[].obs;
  RxList<String> titre_system = <String>[].obs;
  @override
  void onInit() {
    fetchData();
    fetchProduit();
    fetchSystem();
    super.onInit();
  }

  Future<void> fetchSystem() async {
    try {
      print("true");
      final response = await http
          .get(Uri.parse('https://www.hgp-dz.com/admin/api/fetch_system.php'));
      print("false");
      if (response.statusCode == 200) {
        print("dd");

        var jsonData = data.value = json.decode(response.body);
        for (var i = 0; i < data.length; i++) {
          myList_system.add(data[i]['image']);
          titre_system.add(data[i]['titre']);
        }
        // print(data[0]['image']);
        //  print(myList);
        // print(titre);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchProduit() async {
    try {
      print("true");
      final response = await http
          .get(Uri.parse('https://www.hgp-dz.com/admin/api/fetch_produit.php'));
      print("false");
      if (response.statusCode == 200) {
        print("dd");

        var jsonData = data.value = json.decode(response.body);
        for (var i = 0; i < data.length; i++) {
          myList_produit.add(data[i]['image']);
          titre_produit.add(data[i]['titre']);
        }
        // print(data[0]['image']);
        //  print(myList);
        // print(titre);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      print("true");
      final response = await http
          .get(Uri.parse('https://www.hgp-dz.com/admin/api/fetch_project.php'));
      print("false");
      if (response.statusCode == 200) {
        print("dd");

        var jsonData = data.value = json.decode(response.body);
        for (var i = 0; i < data.length; i++) {
          myList.add(data[i]['image']);
          titre_slide.add(data[i]['titre']);
        }
        // print(data[0]['image']);
        //  print(myList);
        // print(titre);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
