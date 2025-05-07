import 'package:car_rental/feature/cars_list/data/data_source/cars_remote_data_source_impl.dart';
import 'package:car_rental/feature/cars_list/data/repository/get_cars_list_repository_impl.dart';
import 'package:car_rental/feature/cars_list/domain/data_source/car_remote_data_source.dart';
import 'package:car_rental/feature/cars_list/domain/repository/get_cars_list_repository.dart';
import 'package:car_rental/feature/cars_list/domain/usecase/get_cars_usecase.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<CarsRemoteDataSource>(
    () => CarsRemoteDataSourceImpl(firestore: sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<GetCarsListRepository>(
    () => GetCarsListRepositoryImpl(
      carsRemoteDataSource: sl<CarsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton(
    () => GetCarsUsecase(getCarsListRepository: sl<GetCarsListRepository>()),
  );

  sl.registerFactory(() => CarListBloc(usecase: sl<GetCarsUsecase>()));
}
