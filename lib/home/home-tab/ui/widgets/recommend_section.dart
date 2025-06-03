import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/custom-colors.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:movie_app/home/watchlist_tab/ui/cubit/add_movies_cubit.dart';

import 'dialog-utils.dart';
import 'movie_details.dart';

class RecommendMoviesSection extends StatelessWidget {
  RecommendMoviesSection({super.key});
  final viewModel = getIt.get<HomeTabViewModelCubit>();
  final viewModelWatchList = getIt.get<AddMoviesCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
      bloc: viewModel..getRecommendMovies(),
      builder: (context, state) {
        if (state is RecommendMoviesSuccessState) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            height: 300.h,
            color: CustomColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "Recommended",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetails.routName,
                            arguments:
                                state.recommendedMoviesEntity.results?[index]);
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 10.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(14.r)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Image.network(
                                      "https://image.tmdb.org/t/p/w300/${state.recommendedMoviesEntity.results?[index].posterPath}",
                                      height: 200.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        viewModelWatchList.addMovies(state
                                            .recommendedMoviesEntity
                                            .results![index]);
                                        DialogUtils.showMessage(
                                          context: context,
                                          message: "movie added successfully",
                                          posAction: "ok",
                                          posCallBack: () =>
                                              Navigator.pop(context),
                                        );
                                      },
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          "Assets/images/bookmark.png",
                                          height: 40.h,
                                          width: 25.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Row(
                                      children: [
                                        Image.asset("Assets/images/star.png"),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          state.recommendedMoviesEntity
                                                  .results?[index].voteAverage
                                                  .toString() ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    state.recommendedMoviesEntity
                                        .results![index].releaseDate
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount:
                        state.recommendedMoviesEntity.results?.length ?? 0,
                  ),
                )
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Text(state.message,
              style: const TextStyle(color: Colors.white));
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.transparent,
              ),
            ),
          );
        }
      },
    );
  }
}
