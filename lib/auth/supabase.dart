import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  final SupabaseClient _supabase = Supabase.instance.client;

  /// SIGN UP
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {

    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    return response;
  }

  /// LOGIN
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {

    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response;
  }

  /// LOGOUT
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  /// CURRENT USER
  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  /// CURRENT SESSION
  Session? getSession() {
    return _supabase.auth.currentSession;
  }

}