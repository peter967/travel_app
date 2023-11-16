import 'package:dartz/dartz.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/trip_repo.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);
  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModel = localDataSource.getTrips();
      List<Trip> res = tripModel.map((model) => model.toEntity()).toList();
      return Right(res);
    } catch (err) {
      return left(SomeSpecificError(err.toString()));
    }
  }
}
