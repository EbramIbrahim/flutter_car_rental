import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/feature/cars_list/domain/repository/get_cars_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetCarsUsecase {
  GetCarsListRepository getCarsListRepository;
  GetCarsUsecase({required this.getCarsListRepository});

  Future<Either<String, List<Car>>> getCars() async {
    try {
      final result = await getCarsListRepository.getCarsList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
