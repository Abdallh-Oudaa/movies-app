import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';

class PopularSection extends StatelessWidget {
  final viewModel = getIt.get<HomeTabViewModelCubit>();
  PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
      bloc: viewModel..getPopularMovies(),
      builder: (context, state) {
        if (state is PopularSuccessState) {
          return ImageSlideshow(
            autoPlayInterval: 3000,
            indicatorPadding: 2,
            isLoop: true,
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.transparent,
            indicatorBackgroundColor: Colors.transparent,
            children: state.popularMoviesEntity.results!.map(
              (url) {
                return Stack(

                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w300/${url.backdropPath}",
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: 20.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),

                          child: Image.network(
                            "https://image.tmdb.org/t/p/w300/${url.posterPath}",
                            height: 200.h,
                            width: 129.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 15.w),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Text(
                            url.title ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            url.releaseDate ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],)
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          );
        } else if (state is ErrorState) {
          return Text(state.message);
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.transparent,),
            ),
          );
        }
      },
    );
  }
}
