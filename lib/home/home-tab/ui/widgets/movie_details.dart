import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';
import 'package:movie_app/home/home-tab/ui/widgets/more_like_this_section.dart';


import '../../../../core/di.dart';

class MovieDetails extends StatelessWidget {
  static const String routName = "movies";
 

   MovieDetails({super.key});

  final HomeTabViewModelCubit viewModel = getIt.get<HomeTabViewModelCubit>();




  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as ListMoviesEntity;
    return  Scaffold(
            backgroundColor: const Color(0xff121312),
            appBar: AppBar(
              backgroundColor: const Color(0xff121312),
              iconTheme: const IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text(
                args.title??"",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children:[
                            Image.network(
                              "https://image.tmdb.org/t/p/w300/${args.backdropPath}" ,
                              width: double.infinity,
                              height: 200.h,
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                              onTap: (){
                                viewModel.launchWebSite();
                              },
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:  EdgeInsets.only(top: 60.h),
                                    child: Image.asset("Assets/images/play-button-2.png"),
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.w),
                          child: Text(
                            args.title??'',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.w),
                          child: Text(
                            args.releaseDate ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.w,top: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Image.network(
                            "https://image.tmdb.org/t/p/w300/${args.posterPath}",
                            height: 150.h,
                            width: 129.w,
                            fit: BoxFit.cover,
                          ),
                            SizedBox(width: 10.w,),
                            SizedBox(
                              width: 250.w,
                              child: Column(
                                children: [
                                  Text(
                                    args.overview ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: const Color(0xffCBCBCB)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Row(
                                      children: [
                                        Image.asset("Assets/images/star.png",width: 20.w,height: 20.h,fit: BoxFit.fill,),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          args.voteAverage.toString()??"",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        InkWell(
                                          onTap: (){
                                           viewModel.launchWebSite();
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 15.w),
                                            child: Text(
                                              "go to watch",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],),
                        ),
                        MoreLikeThisSection(id: args.id??0),
                  
                      ],
                    ),
                )

          );
        }
  }
 


