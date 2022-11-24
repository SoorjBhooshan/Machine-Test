import 'package:dio/dio.dart';
import 'package:machine_test_app/model/food_model.dart';

class RemoteService {
  Future<List<FoodModel>?> getCategoryDish() async {
    List<FoodModel> foodModel = [];

    Response response;

    response =
        await Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
    var jsonResponse = await response.data;

    jsonResponse.forEach((productJson) {
      foodModel.add(FoodModel.fromJson(productJson));
    });

    return foodModel;
  }
}
