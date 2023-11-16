import 'package:dartz/dartz.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/trip.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);
  Future<Either<Failure, List<Trip>>> call() {
    return repository.getTrips();
  }
}
