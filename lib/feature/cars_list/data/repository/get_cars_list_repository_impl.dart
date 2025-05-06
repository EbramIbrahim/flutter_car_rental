import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/feature/cars_list/data/data_source/cars_remote_data_source.dart';
import 'package:car_rental/feature/cars_list/domain/repository/get_cars_list_repository.dart';

class GetCarsListRepositoryImpl extends GetCarsListRepository {
  CarsRemoteDataSource carsRemoteDataSource;
  GetCarsListRepositoryImpl({required this.carsRemoteDataSource});

  @override
  Future<List<Car>> getCarsList() {
    return carsRemoteDataSource.getCarsFromRemote();
  }
}
