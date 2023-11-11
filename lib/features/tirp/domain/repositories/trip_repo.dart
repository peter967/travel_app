import 'package:travel_app/features/tirp/domain/entitltes/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrips();
  Future<void> addTrip();
  Future<void> deleteTrip();
}
