import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shared/cubit/states.dart';
import '../../modules/homeScreen/catog_app.dart';
import '../../modules/homeScreen/favo_app.dart';
import '../../modules/homeScreen/homeApp/home_app.dart';
import '../../modules/homeScreen/profile_app.dart';
class HomeCubit extends Cubit<Homestates>{
  HomeCubit():super(HomeInitState());


 static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);

  
    List<Widget> screens=[
const HommApp(),
const Catog(),
const Favo(),

const Profile()

  ];

  var index=0;

  void changeindex(int i){
    index=i;
    emit(HomeCurrentState());

  }

}