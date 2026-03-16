import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchTasks() async {

    final data = await supabase
        .from('tasks')
        .select()
        .order('created_at');

    return List<Map<String, dynamic>>.from(data);
  }


  Future<void> addTask(String title, DateTime dueDate) async {

  await supabase.from('tasks').insert({
    'title': title,
    'progress': 50,
    'completed': false,
    'due_date': dueDate.toIso8601String(),
  });

}
  Future<void> toggleTask(String id, bool completed) async {

    await supabase
        .from('tasks')
        .update({'completed': completed})
        .eq('id', id);

  }

  Future<void> deleteTask(String id) async {

    await supabase
        .from('tasks')
        .delete()
        .eq('id', id);

  }

}