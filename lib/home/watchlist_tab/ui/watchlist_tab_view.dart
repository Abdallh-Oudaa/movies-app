import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/search_tab/widgets/movie_item.dart';
import 'package:movie_app/home/watchlist_tab/ui/cubit/add_movies_cubit.dart';

import '../../../core/custom-colors.dart';
import '../../../core/di.dart';
import '../../home-tab/ui/widgets/movie_details.dart';

class WatchlistTabView extends StatelessWidget {
  final viewModel=getIt.get<AddMoviesCubit>();
   WatchlistTabView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AddMoviesCubit,AddMoviesState>(
      bloc: viewModel..getMoviesList(),
      builder: (context, state) {
        if (state is AddMoviesSuccess) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            height: double.infinity,
            color: CustomColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "Watch List Movies",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                itemCount:state.listMoviesEntity.length ?? 0,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetails.routName,
                            arguments:
                            state.listMoviesEntity[index]);
                      },
                      child: MovieItem(imagePath: state.listMoviesEntity[index].backdropPath??"",
                          name:  state.listMoviesEntity[index].title??"", tagLine:  state.listMoviesEntity[index].releaseDate??""
                    ),

                  ),
                )
                ) ],
            ),
          );
        } else if (state is AddMoviesError) {
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
      },);
  }
}
