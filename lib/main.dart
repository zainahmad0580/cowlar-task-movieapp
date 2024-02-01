import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/provider/genre_provider.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/provider/video_provider.dart';
import 'package:movieapp/routes/routes.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
          ChangeNotifierProvider(create: (_) => GenreProvider()),
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
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.btn),
              useMaterial3: true,
              fontFamily: "Poppins"),
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
