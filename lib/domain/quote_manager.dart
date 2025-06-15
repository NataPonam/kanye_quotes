import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kanye_quotes/domain/model/quote_model.dart';
import 'package:translator/translator.dart';

class QuoteManager {
  final _dio = Dio();
  CancelToken? _cancelToken;
  final translater = GoogleTranslator();
  final ValueNotifier<QuoteModel> state = ValueNotifier<QuoteModel>(
    QuoteModel(),
  );

  Future<void> getQuote() async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    try {
      final result = await _dio.get(
        'https://api.kanye.rest',
        cancelToken: _cancelToken,
      );
      state.value = state.value.copyWith(
        quote: result.data['quote'] ?? 'Цитата не найдена',
        translatedQuote: '',
      );
    } on DioException catch (e) {
      state.value = state.value.copyWith(quote: _handleDioError(e));
    }
  }

  Future<void> translateToRussian() async {
    try {
      final result = await translater.translate(state.value.quote, to: 'ru');
      state.value = state.value.copyWith(translatedQuote: result.text);
    } on SocketException {
      state.value = state.value.copyWith(
        translatedQuote: 'Нет интернет-соединения',
      );
    } catch (e) {
      state.value = state.value.copyWith(
        translatedQuote: 'Ошибка перевода: $e',
      );
    }
  }

  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      return 'Нет соединения';
    } else if (e.response?.statusCode == null) {
      return 'Ошибка API: ${e.response?.statusCode}';
    }
    return 'Ошибка: ${e.message}';
  }

  void dispose() {
    _cancelToken?.cancel();
    state.dispose();
  }
}
