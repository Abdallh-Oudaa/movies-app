import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/custom-colors.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:movie_app/home/home-tab/ui/widgets/dialog-utils.dart';
import 'package:movie_app/home/home-tab/ui/widgets/movie_details.dart';
import 'package:movie_app/home/watchlist_tab/ui/cubit/add_movies_cubit.dart';

class UpcomingMoviesSection extends StatelessWidget {
  UpcomingMoviesSection({super.key});
  final viewModel = getIt.get<HomeTabViewModelCubit>();
  final viewModelWatchList = getIt.get<AddMoviesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
      bloc: viewModel..getUpcomingMovies(),
      builder: (context, state) {
        if (state is UpcomingMoviesSuccessState) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            height: 200.h,
            color: CustomColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "New Releases",
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
                                state.upcomingMoviesEntity.results?[index]);
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 10.h),
                            child: Stack(children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/w300/${state.upcomingMoviesEntity.results?[index].posterPath}",
                                height: 200.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                              ),
                              InkWell(
                                onTap: () {

                                  viewModelWatchList.addMovies(state
                                      .upcomingMoviesEntity.results![index]);
                                  DialogUtils.showMessage(
                                    context: context,
                                    message: "movie added successfully",
                                    posAction: "ok",
                                    posCallBack: () => Navigator.pop(context),
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
                          ),
                        ],
                      ),
                    ),
                    itemCount: state.upcomingMoviesEntity.results?.length ?? 0,
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
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
