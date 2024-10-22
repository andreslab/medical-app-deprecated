import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  late final SupabaseClient supabase = Supabase.instance.client;

  Session? get session => supabase.auth.currentSession;

  User? get user => supabase.auth.currentUser;

  AuthApi();

  Future<void> signIn(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<void> singUp(String email, String password) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );
    await supabase.from('test').select('*');
  }
}
