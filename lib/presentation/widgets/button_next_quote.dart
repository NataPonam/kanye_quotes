import 'package:flutter/material.dart';

class ButtonNextQuote extends StatelessWidget {
  final VoidCallback getApi;
  const ButtonNextQuote({super.key, required this.getApi});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: getApi,
      foregroundColor: Colors.blue,
      backgroundColor: const Color.fromARGB(255, 182, 222, 234),
      extendedPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      shape: StadiumBorder(),
      label: Text(
        'Новая цитата',
        style: TextStyle(color: Colors.brown[600], fontSize: 20),
      ),
    );
  }
}
