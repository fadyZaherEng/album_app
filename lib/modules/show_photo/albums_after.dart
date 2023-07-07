// ignore_for_file: non_constant_identifier_names

import 'package:awt_task/layout/home/cubit/app_cuibt.dart';
import 'package:awt_task/models/photo/PhotoModel.dart';
import 'package:flutter/material.dart';

class AlbumsAfter extends StatelessWidget {
  const AlbumsAfter({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuild(context);
  }

  Widget ConditionalBuild(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      // crossAxisSpacing: 10.0,
      // mainAxisSpacing: 10.0,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: AppCubit.get(context).photos.map(
        (PhotoModel photoModel) {
          return Image(
            image: NetworkImage(photoModel.url.toString()),
          );
        },
      ).toList(),
    );
  }
}
