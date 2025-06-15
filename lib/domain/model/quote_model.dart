import 'dart:core';

class QuoteModel {
  final String quote;
  final String translatedQuote;
  QuoteModel({this.quote = 'Loading...', this.translatedQuote = ''});
  QuoteModel copyWith({String? quote, String? translatedQuote}) {
    return QuoteModel(
      quote: quote ?? this.quote,
      translatedQuote: translatedQuote ?? this.translatedQuote,
    );
  }
}
