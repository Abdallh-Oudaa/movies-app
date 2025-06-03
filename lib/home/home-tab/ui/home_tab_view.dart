import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/home/home-tab/ui/widgets/popular_section.dart';
import 'package:movie_app/home/home-tab/ui/widgets/recommend_section.dart';
import 'package:movie_app/home/home-tab/ui/widgets/upcoming_movies_section.dart';

class HomeTabView extends StatelessWidget {

  const HomeTabView({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PopularSection(),
        SizedBox(height: 10.h,),
        UpcomingMoviesSection(),
        SizedBox(height: 10.h,),
      
        RecommendMoviesSection(),
      ],),
    );
  }
}
