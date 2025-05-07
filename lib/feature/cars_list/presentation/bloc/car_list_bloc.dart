import 'package:bloc/bloc.dart';
import 'package:car_rental/feature/cars_list/domain/usecase/get_cars_usecase.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_event.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_state.dart';

class CarListBloc extends Bloc<CarListEvent, CarListState> {
  final GetCarsUsecase usecase;
  CarListBloc({required this.usecase}) : super(EmptyCarList()) {
    on<LoadCars>((event, emit) async {
      emit(CarListLoading());
      final cars = await usecase.getCars();
      cars.fold(
        (error) {
          emit(CarListError(error));
        },
        (cars) {
          emit(CarListLoaded(cars));
        },
      );
    });
  }
}
