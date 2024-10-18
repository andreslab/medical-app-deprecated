import 'package:flutter/material.dart';
import 'package:heart/screens/screens.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:heart/providers/providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage/storage.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  Storage.db = await Storage.initDatabase();

  runApp(const MultiProviders());
}

class MultiProviders extends StatelessWidget {
  const MultiProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProxyProvider<AuthProvider, RecordsProvider>(
          create: (ctx) =>
              RecordsProvider(Provider.of<AuthProvider>(ctx, listen: false)),
          update: (_, authProvider, previous) => RecordsProvider(authProvider),
        ),
        ChangeNotifierProxyProvider<AuthProvider, AlarmsProvider>(
            create: (ctx) =>
                AlarmsProvider(Provider.of<AuthProvider>(ctx, listen: false)),
            update: (_, authProvider, previous) =>
                AlarmsProvider(authProvider)),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'digital menu',
      initialRoute: 'home', //home
      routes: {
        'home': (_) => HomeScreen(),
        'new-record': (_) => NewRecordScreen(),
        'new-alarm': (_) => NewAlarmScreen(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen()
      },
      theme: AppTheme.themeData,
    );
  }
}
