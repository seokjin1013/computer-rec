import 'dart:convert';

import 'package:clean_architecture_flutter/features/recommend/domain/usecases/is_exist_account.dart';
import 'package:http/http.dart' as http;
import '../models/computer_item_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class RecommendRemoteDataSource {
  Future<ComputerItemModel> getComputerItem(int id);
  Future<bool> isExistAccount(String id, String pw);
  Future<bool> createNewAccount(String id, String pw);
}

class RecommendRemoteDataSourceImpl implements RecommendRemoteDataSource {
  final http.Client client;

  RecommendRemoteDataSourceImpl({required this.client});

  @override
  Future<ComputerItemModel> getComputerItem(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ComputerItemModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }

  @override
  Future<bool> isExistAccount(String id, String pw) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/newuser/login/$id/$pw'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body == '1';
    }
    throw ServerException();
  }

  @override
  Future<bool> createNewAccount(String id, String pw) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/newuser/$id/$pw'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body == '1';
    }
    throw ServerException();
  }
}
