import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/feature/cars_list/domain/data_source/car_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarsRemoteDataSourceImpl extends CarsRemoteDataSource {
  final FirebaseFirestore firestore;
  CarsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<Car>> getCarsFromRemote() async {
    var cars = await firestore.collection('cars').get();
    return cars.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
