import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCatalogsItem(BuildContext context, String image, String name, String id) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, "/product", arguments: {'catalogId': id});
    },
    child: Container(
      margin: EdgeInsets.only(right: 14.0.w),
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      width: 130.0,
      height: 130.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0.r),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/random.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0.r),
                  bottomRight: Radius.circular(12.0.r),
                ),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
