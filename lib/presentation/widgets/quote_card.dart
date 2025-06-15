import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String translatedQuote;
  const QuoteCard({super.key, required this.quote, this.translatedQuote = ''});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: Column(
            children: [
              if (translatedQuote.isNotEmpty)
                Text(
                  'Перевод',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              Text(
                translatedQuote.isNotEmpty ? translatedQuote : quote,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
