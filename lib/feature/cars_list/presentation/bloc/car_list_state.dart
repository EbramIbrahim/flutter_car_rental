import 'package:car_rental/core/data/car.dart';

abstract class CarListState {}

class EmptyCarList extends CarListState {}

class CarListLoading extends CarListState {}

class CarListLoaded extends CarListState {
  List<Car> cars;
  CarListLoaded(this.cars);
}

class CarListError extends CarListState {
  String message;
  CarListError(this.message);
}
