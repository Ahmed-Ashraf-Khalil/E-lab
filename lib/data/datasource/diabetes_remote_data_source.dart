import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/app_constance.dart';
import '../models/diabetes_post_model.dart';

abstract class BaseRemoteDataSource {
  Future<String> diabetesPostData(int? gender, int? age, int? weight, int? polyuria, int? alopecia,
      int? polydipsia);

  Future<String> diabetesGetResult();

  Future<String> uploadSkinCancer(File? img);

  Future<String> uploadBrainTumor(File? img);

  Future<String> uploadChest(File? img);
}

class ElabRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<String> diabetesGetResult() async {
    final response = await Dio().get(
      AppConstance.getDiabetesResult,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );

    if (response.statusCode == 200) {
      return response.data['result'];
    } else {
      return 'Error Occurred';
      //throw UnimplementedError();
    }
  }

  @override
  Future<String> diabetesPostData(int? gender, int? age, int? weight, int? polyuria, int? alopecia,
      int? polydipsia) async {
    final response = await Dio().post(AppConstance.postDiabetesData,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: DiabetesPostModel(
        gender: gender!,
        age: age!,
        weight: weight!,
        polydipsia: polydipsia!,
        polyuria: polyuria!,
        alopecia: alopecia!,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return diabetesGetResult();
    } else {
      return 'Error Occurred';
      //throw UnimplementedError();
    }
  }

  @override
  Future<String> uploadSkinCancer(File? img)async {
    final request = http.MultipartRequest("POST", Uri.parse(AppConstance.postSkinCancer));
    final header = {"Content_type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', img!.readAsBytes().asStream(), img.lengthSync(),
        filename: img.path.split('/').last));
    request.headers.addAll(header);
    final myRequest = await request.send();
    http.Response res = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      final  resJson = jsonDecode(res.body);
      //print("response here: $resJson");
      return resJson['result'];
    } else {
      return 'Error Occurred';
      //throw UnimplementedError();
    }
  }

  @override
  Future<String> uploadBrainTumor(File? img) async {
    final request = http.MultipartRequest(
        "POST", Uri.parse(AppConstance.postBrainTumor));
    final header = {"Content_type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', img!.readAsBytes().asStream(), img.lengthSync(),
        filename: img.path
            .split('/')
            .last));
    request.headers.addAll(header);
    final myRequest = await request.send();
    http.Response res = await http.Response.fromStream(myRequest);
    //print(img.path);
    if (myRequest.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      //print("response here: $resJson");
      return resJson['result'];
    } else {
      return 'Error Occurred';
      //throw UnimplementedError();
    }
  }

  @override
  Future<String> uploadChest(File? img)async {
    final request = http.MultipartRequest(
        "POST", Uri.parse(AppConstance.postChest));
    final header = {"Content_type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', img!.readAsBytes().asStream(), img.lengthSync(),
        filename: img.path
            .split('/')
            .last));
    request.headers.addAll(header);
    final myRequest = await request.send();
    http.Response res = await http.Response.fromStream(myRequest);
    //print(img.path);
    if (myRequest.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      //print("response here: $resJson");
      return resJson['result'];
    } else {
      return 'Error Occurred';
      //throw UnimplementedError();
    }
  }

}
