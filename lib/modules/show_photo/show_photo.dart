// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:awt_task/layout/home/cubit/app_cuibt.dart';
import 'package:awt_task/layout/home/cubit/states.dart';
import 'package:awt_task/modules/show_photo/albums_after.dart';
import 'package:awt_task/modules/show_photo/albums_before.dart';
import 'package:awt_task/modules/show_photo/show_photo.dart';
import 'package:awt_task/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayPhotosScreen extends StatefulWidget {
  int albumId;
  String albumTitle;

  DisplayPhotosScreen(this.albumId, this.albumTitle);

  @override
  State<DisplayPhotosScreen> createState() => _DisplayPhotosScreenState();
}

class _DisplayPhotosScreenState extends State<DisplayPhotosScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.albumId != null) {
      AppCubit.get(context).getPhotos(widget.albumId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF696099),
                Color(0xFF292C36),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.albumTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ConditionalBuilder(
                        condition: AppCubit.get(context).photos.isNotEmpty,
                        builder: (context) {
                          return const AlbumsAfter();
                        },
                        fallback: (context) {
                          return const AlbumsBefore();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
