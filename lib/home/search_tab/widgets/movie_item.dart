import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String tagLine;


  const MovieItem({required this.imagePath,required this.name,required this.tagLine, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Image.network(
              "https://image.tmdb.org/t/p/w300/$imagePath",
              height: 100.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: SizedBox(
                  width: 140.w,
                  child: Text(name,style: TextStyle(color: Colors.white,fontSize: 17.sp),)),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(tagLine,style: TextStyle(color: Colors.grey,fontSize: 17.sp),),
            ),


            ],),
        ],
      ),
    );
  }
}
