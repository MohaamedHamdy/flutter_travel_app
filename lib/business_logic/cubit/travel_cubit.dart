import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:travel_app/data/models/travel_model.dart';
import 'package:travel_app/data/repository/web_services.dart';

part 'travel_state.dart';

class TravelCubit extends Cubit<TravelState> {
  TravelCubit({required this.webService}) : super(TravelInitial()) {
    emit(WelcomeState());
  }

  List<travelModel> travelList = [];
  final WebService webService;

  void getData() async {
    try {
      emit(LoadingState());
      travelList = await webService.fetchData();
      emit(LoadedState(travelList));
    } catch (error) {}
  }

  void detaiPage(travelModel TravelModel){
    emit(DetailState(TravelModel));
  }

  void goHome(){
    emit(LoadedState(travelList));
  }

}
