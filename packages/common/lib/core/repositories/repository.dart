import 'dart:convert';
import 'dart:io';

import 'package:common/core/exceptions/app_exception.dart';
import 'package:common/core/exceptions/server_exception.dart';
import 'package:common/core/exceptions/server_payload_exception.dart';
import 'package:dio/dio.dart';
import 'package:problem_details/problem_details.dart';

/// Базовый класс репозитория
abstract class IRepository {
  Future<T> call<T>(
    Future<Response> future, {
    T Function(Map<String, dynamic> json)? jsonMapper,
    T Function(List<dynamic> json)? jsonListMapper,
    Exception? Function(DioException error, StackTrace? stackTrace)? catchError,
  }) async {
    try {
      // Выполнить запрос на сервер
      final Response response = await future;
      // Обработать ответ
      return processResponse<T>(
        response,
        jsonMapper: jsonMapper,
        jsonListMapper: jsonListMapper,
      );
    } catch (e, s) {
      // Обработать ошибку
      throw processError(e, s: s, catchError: catchError);
    }
  }

  T processResponse<T>(
    Response res, {
    T Function(Map<String, dynamic> json)? jsonMapper,
    T Function(List<dynamic> json)? jsonListMapper,
  }) {
    if (res.data == null || res.data == '') {
      return null as T;
    }

    if (T == Response) {
      return res as T;
    }

    if (jsonMapper != null) {
      return jsonMapper(res.data);
    } else if (jsonListMapper != null) {
      return jsonListMapper(res.data);
    } else {
      return res.data as T;
    }
  }

  Exception processError<T>(
    Object e, {
    StackTrace? s,
    Exception? Function(DioException error, StackTrace? stackTrace)? catchError,
  }) {
    if (e is DioException) {
      if (catchError == null) {
        if (e.response?.statusCode == HttpStatus.unprocessableEntity) {
          if (e.response?.data != null) {
            ProblemDetails? error;
            if (e.response!.data is String) {
              error = ProblemDetails.fromJson(json.decode(e.response!.data));
            } else {
              error = ProblemDetails.fromJson(e.response!.data);
            }
            return ServerPayloadException(error.detail);
          }
        } else {
          return ServerException(e, s);
        }
      } else {
        return catchError(e, s) ?? ServerException(e, s);
      }
    }
    return AppException(e.toString(), s);
  }

  Map<T, List<R>> parseMapList<T, R>(
    dynamic json,
    R Function(Map<String, dynamic> json) fromJson,
  ) {
    Map<T, List<R>> res = {};

    (json as Map<T, dynamic>).forEach((key, value) {
      res.putIfAbsent(key, () => parseList(value, fromJson));
    });

    return res;
  }

  List<T> parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return (json as List<dynamic>).map((e) => fromJson(e)).toList();
  }

  List<T> parseItems<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final items = json['items'] as List<dynamic>;
    return items.map((e) => fromJson(e)).toList();
  }
}
