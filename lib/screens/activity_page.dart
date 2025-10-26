import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/activity_model.dart';
import 'detail_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> _activities = [];
  bool _loading = true;

  Future<void> _load() async {
    final s = await rootBundle.loadString('assets/data/activity_data.json');
    final List<dynamic> data = json.decode(s);
    _activities = data.map((e) => Activity.fromJson(e)).toList();
    setState(() => _loading = false);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas Harian')),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: Colors.teal.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(children: [const Icon(Icons.info_outline), const SizedBox(width: 8), Expanded(child: Text('Berikut beberapa aktivitas sehat yang direkomendasikan beserta kutipan Islami.'))]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _activities.length,
                        itemBuilder: (ctx, i) {
                          final a = _activities[i];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: Text(a.icon, style: const TextStyle(fontSize: 26)),
                              title: Text(a.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(a.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(activity: a))),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
