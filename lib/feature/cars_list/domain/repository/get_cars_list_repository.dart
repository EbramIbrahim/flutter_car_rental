import 'package:car_rental/core/data/car.dart';

abstract class GetCarsListRepository {
  Future<List<Car>> getCarsList();
}
