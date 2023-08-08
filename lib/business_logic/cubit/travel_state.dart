part of 'travel_cubit.dart';

abstract class TravelState extends Equatable {}

class TravelInitial extends TravelState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends TravelState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TravelState {
  @override
  List<Object> get props => [];
}

class LoadedState extends TravelState {

  final List<travelModel> travelList ;

  LoadedState(this.travelList);

  @override
  List<Object> get props => [travelList];
}


class DetailState extends TravelState {

  final travelModel travelPlace ;

  DetailState(this.travelPlace);

  @override
  List<Object> get props => [travelPlace];
}
