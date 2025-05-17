import 'package:bw1_flutter_assignment/widgets/location_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = FutureProvider<String>((ref) async {
  return await LocationService().getPlaceName();
});
