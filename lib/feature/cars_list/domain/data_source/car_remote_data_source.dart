import 'package:car_rental/core/data/car.dart';

abstract class CarsRemoteDataSource {
  Future<List<Car>> getCarsFromRemote();
}
