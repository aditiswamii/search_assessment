import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_assessment/core/core.dart';
import 'package:search_assessment/ui/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CoreRepository>(
          create: (context) => CoreRepository(),
          lazy: true,
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayOpacity: 0.5,
        overlayColor: Colors.brown.withOpacity(0.5),
        useDefaultLoading: false,
        overlayWidget: Center(
          child: CircularProgressIndicator(
            color: AppTheme.appGrey,
          ),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getThemeData(context),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
