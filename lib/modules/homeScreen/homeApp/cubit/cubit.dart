import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/models/home_model.dart';
import 'package:shopping/modules/homeScreen/homeApp/cubit/states.dart';

import '../../../../shared/network/remote/cache_helper.dart';
import '../../../../shared/network/remote/diohelper.dart';

class HomeAppCubit extends Cubit<HomeAppstates>{
  HomeAppCubit():super(HomeAppInitState());


 static HomeAppCubit get(context)=>BlocProvider.of<HomeAppCubit>(context);

  
  var photos = [
"http://www.kiwithebeauty.com/wp-content/uploads/2017/11/BLACK-PANTHER-COLLAGE-KIWI-THE-BEAUTY-MOVIE-MARVEL-800x350.png",
"https://static-ssl.businessinsider.com/image/5a7085a97e7a35f10c8b479f-1000/blackpanthershuri.jpg",
"https://longreadsblog.files.wordpress.com/2018/02/black-panther.jpg?w=1680",
"https://uziiw38pmyg1ai60732c4011-wpengine.netdna-ssl.com/wp-content/dropzone/2018/02/black-panther.jpg",
"https://static2.srcdn.com/wp-content/uploads/2017/10/Black-Panther-Trailer-1.jpg?q=50&w=1000&h=500&fit=crop&dpr=1.5",
"http://www.kiwithebeauty.com/wp-content/uploads/2017/11/BLACK-PANTHER-COLLAGE-KIWI-THE-BEAUTY-MOVIE-MARVEL-800x350.png",
"https://static-ssl.businessinsider.com/image/5a7085a97e7a35f10c8b479f-1000/blackpanthershuri.jpg",
"https://longreadsblog.files.wordpress.com/2018/02/black-panther.jpg?w=1680",
"https://uziiw38pmyg1ai60732c4011-wpengine.netdna-ssl.com/wp-content/dropzone/2018/02/black-panther.jpg",
"https://static2.srcdn.com/wp-content/uploads/2017/10/Black-Panther-Trailer-1.jpg?q=50&w=1000&h=500&fit=crop&dpr=1.5",

];
bool datacome=false;
late HomeModel homeModel;
 void getHomeModel() {
    emit(HomeAppLoadingState());
    DioHelper.getData(
        url: "home",
      token: CacheHelper.getData(key: "token"),
        ).then((value) {
         if (value==null){
           print("data dont come");
         }else
             print("data come");
             print(value);
             datacome=true;
       homeModel = HomeModel.fromJson(value.data);
      emit(HomeAppSuccesState(homeModel));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeAppErorrState(error));
    });
  }

  var icon=Icons.favorite_border_outlined;
  void changefavo (){
   
                     icon=Icons.favorite;
                     emit(HomeAPPCurrentState());
                                        
  }
double? ratingvalue;

void rating (dynamic value )
{
  ratingvalue=value;
}
List <dynamic> txt=[
  "shoes",
  "hand  ",
  "shoes",
  "hand  ",
  "shoes",
  "hand  "
  
]
;
 

}
