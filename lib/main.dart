import 'package:flutter/material.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/provider/video_provider.dart';
import 'package:movieapp/routes/routes.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => NavBarProvider()),
          ChangeNotifierProvider(create: (_) => VideoProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.lightGreyBg,
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              listTileTheme: const ListTileThemeData(horizontalTitleGap: 4),
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.btn),
              useMaterial3: true,
              fontFamily: "Poppins"),
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
