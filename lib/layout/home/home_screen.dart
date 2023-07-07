// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:awt_task/layout/home/cubit/app_cuibt.dart';
import 'package:awt_task/layout/home/cubit/states.dart';
import 'package:awt_task/modules/show_photo/show_photo.dart';
import 'package:awt_task/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccessUserAppSates) {
          AppCubit.get(context).getUserIndex(context);
          AppCubit.get(context).getAlbums(AppCubit.get(context).users[AppCubit.get(context).idx].id);
        }
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
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: const Text("Profile"),
              centerTitle: true,
            ),
            body: ConditionalBuilder(
              condition: AppCubit.get(context).albums.isNotEmpty &&
                  AppCubit.get(context).users.isNotEmpty,
              builder: (context) {
                return ConditionalBuild(context);
              },
              fallback: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        );
      },
    );
  }

  Widget ConditionalBuild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppCubit.get(context).users[AppCubit.get(context).idx].username.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${AppCubit.get(context).users[AppCubit.get(context).idx].address!.city.toString()},${AppCubit.get(context).users[AppCubit.get(context).idx].address!.street.toString()},${AppCubit.get(context).users[AppCubit.get(context).idx].address!.zipcode.toString()}"
                "  ${AppCubit.get(context).users[AppCubit.get(context).idx].address!.geo!.lat.toString()},${AppCubit.get(context).users[AppCubit.get(context).idx].address!.geo!.lng.toString()}",
          style:const  TextStyle(color: Colors.white),),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "My Albums",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          listViewBuild(context),
        ],
      ),
    );
  }

  listViewBuild(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                int albumId=AppCubit.get(context).albums[index].id!;
                String albumTitle=AppCubit.get(context).albums[index].title.toString();
                navigateToWithReturn(
                    context, DisplayPhotosScreen(albumId,albumTitle));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppCubit.get(context)
                      .albums[index]
                      .title
                      .toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              mySeparator(context),
          itemCount: AppCubit.get(context).albums.length),
    );
  }
}
