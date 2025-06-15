import 'package:flutter/material.dart';
import 'package:kanye_quotes/domain/quote_manager.dart';
import 'package:kanye_quotes/presentation/widgets/button_next_quote.dart';
import 'package:kanye_quotes/presentation/widgets/button_translate.dart';
import 'package:kanye_quotes/presentation/widgets/quote_card.dart';

class QuotePage extends StatelessWidget {
  final QuoteManager manager = QuoteManager();
  QuotePage({super.key}) {
    manager.getQuote();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("Kanye West Quotes", style: theme.textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ValueListenableBuilder(
          valueListenable: manager.state,
          builder: (context, state, _) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  QuoteCard(quote: state.quote),
                  ButtonTranslate(getTranslate: manager.translateToRussian),
                  if (state.translatedQuote.isNotEmpty)
                    QuoteCard(
                      quote: state.quote,
                      translatedQuote: state.translatedQuote,
                    ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: ButtonNextQuote(getApi: manager.getQuote),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
