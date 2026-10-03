import 'package:flutter/material.dart';
import 'purhe_dict.dart';
import 'purhe_practica.dart';
import 'purhe_historia.dart';

class PurhePage extends StatelessWidget {
  const PurhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purépecha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //Alternative: if you want equal spacing everywhere without manually adding a SizedBox after every item, you can wrap children in Column(... children: [...]) but use a helper like spaceEvenly pattern
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiccionarioPage()),
                );
              },
              child: const Text('Diccionario'),
            ),
            const SizedBox(height: 20), //Spacer within column //change number
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticaPage()),
                );
              },
              child: const Text('Práctica'),
            ),
            const SizedBox(height: 20), //Spacer within column //change number
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoriaPage()),
                );
              },
              child: const Text('Historia'),
            ),
          ],
        ),
      ),
    );
  }
}