import 'package:flutter/material.dart';
import 'database_helper.dart';

class DiccionarioPage extends StatefulWidget {
  const DiccionarioPage({super.key});

  @override
  State<DiccionarioPage> createState() => _DiccionarioPageState();
}

class _DiccionarioPageState extends State<DiccionarioPage> {
  List<Map<String, dynamic>> entries = [];

  @override
  void initState() {
    super.initState();
    loadEntries();
  }

Future<void> loadEntries() async {
  try {
    final data = await DatabaseHelper.instance.getAllEntries();
    print('Loaded ${data.length} entries');
    if (data.isNotEmpty) print(data.first);
    setState(() {
      entries = data;
    });
  } catch (e) {
    print('DICTIONARY ERROR: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diccionario'),
      ),
      body: entries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final entry = entries[index];
                return ListTile(
                  title: Text(
                    entry['purepecha'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(entry['spanish'] ?? ''),
                );
              },
            ),
    );
  }
}