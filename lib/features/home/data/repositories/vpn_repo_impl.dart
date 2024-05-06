import 'package:dartz/dartz.dart';
import 'package:vpn_demo/core/constants/error/exceptions.dart';
import 'package:vpn_demo/core/constants/error/failures.dart';
import 'package:vpn_demo/features/home/data/datasources/vpn_datasource.dart';
import 'package:vpn_demo/features/home/domain/entities/vpn_info.dart';
import 'package:vpn_demo/features/home/domain/repositories/vpn_repo.dart';

class VpnRepoImpl extends VpnRepo {
  final VpnDatasource vpnDatasource;

  VpnRepoImpl({required this.vpnDatasource});

  @override
  Future<Either<Failure, List<VpnInfo>>> getVpnServers() async {
    try {
      return Right(await vpnDatasource.getVpnServers());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
