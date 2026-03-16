import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class TaskProvider extends ChangeNotifier {

  final SupabaseService _service = SupabaseService();

  List<Map<String, dynamic>> tasks = [];
  List<Map<String, dynamic>> filtered = [];

  bool loading = false;

  Future<void> fetchTasks() async {

    loading = true;
    notifyListeners();

    tasks = await _service.fetchTasks();
    filtered = tasks;

    loading = false;
    notifyListeners();
  }
  Future<void> deleteTask(String id) async {

  await _service.deleteTask(id);

  await fetchTasks();
}

  void search(String query) {

    if (query.isEmpty) {
      filtered = tasks;
    } else {

      filtered = tasks
          .where((task) => task['title']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

 Future<void> addTask(String title, DateTime dueDate) async {

  await _service.addTask(title, dueDate);

  await fetchTasks();
}

  Future<void> completeTask(String id) async {

    await _service.toggleTask(id, true);
    await fetchTasks();
  }

}