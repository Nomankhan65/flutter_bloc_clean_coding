import 'package:flutter_bloc_clean_coding/config/app_url.dart';
import 'package:flutter_bloc_clean_coding/data/network/network_api_services.dart';
import 'package:flutter_bloc_clean_coding/models/user/user_model.dart';

class LoginRepo{

  final _api =NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async{

    final response=await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }

}