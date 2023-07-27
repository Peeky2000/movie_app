import 'package:flutter/material.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {

    // ScreenUtil is a plugin that
    // allows integration and customization of screen sizes and fonts.
    // Help the user interface display a reasonable layout on
    // screens of different sizes.
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        //điều chỉnh mật độ hiển thị của giao diện người dùng
          // tự động điều chỉnh mật độ trên mọi nền tảng
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme : ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation : 0),
      ),
      home: const HomeScreen(),
    );
  }
}

