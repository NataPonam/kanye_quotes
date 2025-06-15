import 'package:flutter/material.dart';
import 'package:kanye_quotes/presentation/pages/quote_page.dart';
import 'package:kanye_quotes/theme/theme.dart';

class KaneyWestQuotesApp extends StatelessWidget {
  const KaneyWestQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanye West Quotes',
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: QuotePage(),
    );
  }
}
