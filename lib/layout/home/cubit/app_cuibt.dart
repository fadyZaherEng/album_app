import 'dart:math';

import 'package:awt_task/layout/home/cubit/states.dart';
import 'package:awt_task/models/alboums/AlboumModel.dart';
import 'package:awt_task/models/photo/PhotoModel.dart';
import 'package:awt_task/models/user_model/UserModel.dart';
import 'package:awt_task/shared/components/constants.dart';
import 'package:awt_task/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialAppSates());

  static AppCubit get(context)=>BlocProvider.of(context);
  List<UserModel>users=[];
  void getUsers(){
    emit(InitialUserAppSates());
    DioHelper.getData(
      url:users_url,
      lang: 'en',
    ).then((value) {
      users=[];
      for(var user in value.data){
        print(user);
        users.add(UserModel.fromJson(user));
      }
      emit(SuccessUserAppSates());
    }).catchError((onError){
      print('Errrrrrrrrr ${onError.toString()}');
      emit(ErrorUserAppSates());
    });
  }
  List<AlboumModel>albums=[];
  void getAlbums(int? userId){
    albums=[];
    emit(InitialAlbumsAppSates());
    DioHelper.getData(
      query: {
        "userId":userId,
      },
      url:albums_url,
      lang: 'en',
    ).then((value) {
      for(var album in value.data){
        print(album);
        albums.add(AlboumModel.fromJson(album));
      }
      emit(SuccessAlbumsAppSates());
    }).catchError((onError){
      print('Errrrrrrrrr ${onError.toString()}');
      emit(ErrorAlbumsAppSates());
    });
  }
  List<PhotoModel>photos=[];
  void getPhotos(int? albumId){
    photos=[];
    emit(InitialPhotosAppSates());
    DioHelper.getData(
      query: {
        "albumId":albumId
      },
      url:photos_url,
      lang: 'en',
    ).then((value) {
      for(var photo in value.data){
        print(photo);
        photos.add(PhotoModel.fromJson(photo));
      }
      emit(SuccessPhotosAppSates());
    }).catchError((onError){
      print('Errrrrrrrrr ${onError.toString()}');
      emit(ErrorPhotosAppSates());
    });
  }
  int idx=0;
  void getUserIndex(context){
    idx=(Random().nextInt(AppCubit.get(context).users.length));
    emit(SuccessAlbumsAppSates());
  }
}