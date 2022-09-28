import 'package:shopping/models/home_model.dart';

abstract class HomeAppstates {}


class HomeAppInitState  extends HomeAppstates {}
class HomeAppLoadingState  extends HomeAppstates {}
class HomeAppSuccesState  extends HomeAppstates {
  HomeModel homemodel;
  HomeAppSuccesState(this.homemodel);

}

class HomeAppErorrState  extends HomeAppstates {
  dynamic erorr;
HomeAppErorrState (this.erorr);
void printerror (erorr){
  print(erorr);
}


}
class HomeAPPCurrentState  extends HomeAppstates {}