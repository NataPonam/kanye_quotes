import 'package:flutter/material.dart';

class ButtonTranslate extends StatelessWidget {
  final VoidCallback getTranslate;
  const ButtonTranslate({
    super.key,
    required this.getTranslate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlinedButton(
        onPressed: getTranslate,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          side: BorderSide(
            color: const Color.fromARGB(255, 182, 222, 234),
            width: 2.0,
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        child: Text(
          'Перевести на русский',
          style: TextStyle(color: Colors.brown[600], fontSize: 18),
        ),
      ),
    );
  }
}
