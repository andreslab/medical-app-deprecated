import 'package:flutter/material.dart';
import 'package:heart/screens/screens.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:heart/providers/providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(
          create: (_) => RecordsProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => AlarmsProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'digital menu',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'new-record': (_) => NewRecordScreen()
        },
        theme: AppTheme.themeData,
      ),
    );
  }
}
