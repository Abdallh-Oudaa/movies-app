import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/brows_tab/domin/gategoriesMoviesEntity.dart';
import 'package:movie_app/home/brows_tab/ui/category_movie_item.dart';

import 'cubit/categories_cubit.dart';

class CategoryDetails extends StatelessWidget {
  static const String routName = "category details";
  final CategoriesCubit viewModel = getIt.get<CategoriesCubit>();
  CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GenresEntity;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: viewModel..getCategoryDetails(args.id ?? 0),
      builder: (context, state) {
        if (state is CategoryDetailsSuccessState) {
          return Scaffold(
            backgroundColor: const Color(0xff121312),
            appBar: AppBar(
              backgroundColor: const Color(0xff121312),

              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(args.name??"",style: const TextStyle(color: Colors.white),),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
                  child: ListView.builder(
                      itemCount: state.categoryDetailsEntity.results?.length,
                      itemBuilder: (context, index) => CategoryMovieItem(
                            imagePath: state.categoryDetailsEntity.results?[index]
                                    .posterPath ??
                                "",
                            name: state.categoryDetailsEntity.results?[index]
                                    .title ??
                                "",
                            tagLine: state.categoryDetailsEntity.results?[index]
                                    .releaseDate ??
                                "",
                          )),
                ))
              ],
            ),
          );
        } else if (state is CategoriesErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
