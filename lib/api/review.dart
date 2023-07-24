import 'package:dio/dio.dart';
import 'api.dart';

mixin ReviewApi on BaseApi {
  Future<bool> createReview(id, data) async {
    var url = '/api/Review/${id}/createReview';
    try {
      Response response = await dio.post(url,
          options: Options(
            headers: {
              'accept': '*/*',
              'Content-Type': 'application/json',
            },
          ),
          data: data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> editReview(id, data) async {
    var url = '/api/Review/${id}/editReview';
    try {
      Response response = await dio.put(url,
          options: Options(
            headers: {
              'accept': '*/*',
              'Content-Type': 'application/json',
            },
          ),
          data: data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> deleteReview(id, data) async {
    var url = '/api/Review/${id}/editReview';
    try {
      Response response = await dio.put(url,
          options: Options(
            headers: {
              'accept': '*/*',
              'Content-Type': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}
