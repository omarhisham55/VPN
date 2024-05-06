import 'package:dartz/dartz.dart';
import 'package:vpn_demo/core/constants/error/failures.dart';
import 'package:vpn_demo/features/home/domain/entities/vpn_info.dart';

abstract class VpnRepo {
  Future<Either<Failure, List<VpnInfo>>> getVpnServers();
}
