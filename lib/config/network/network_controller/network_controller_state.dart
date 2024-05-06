part of 'network_controller_cubit.dart';

enum NetworkStatus { connected, disconnected }

class InternetStatus {
  final NetworkStatus status;

  InternetStatus(this.status);
}
