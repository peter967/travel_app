import '../entities/trip.dart';
import '../repositories/trip_repo.dart';

class AddTrips {
  final TripRepository repository;

  AddTrips(this.repository);
  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
