import 'package:dartz/dartz.dart';
import 'package:vpn_demo/core/constants/error/failures.dart';
import 'package:vpn_demo/core/constants/usecases/usecase.dart';
import 'package:vpn_demo/features/home/domain/entities/vpn_info.dart';
import 'package:vpn_demo/features/home/domain/repositories/vpn_repo.dart';

class VpnGetServersUsercase extends UseCase<List<VpnInfo>, NoParams> {
  final VpnRepo vpnRepo;

  VpnGetServersUsercase({required this.vpnRepo});
  @override
  Future<Either<Failure, List<VpnInfo>>> call(NoParams params) async {
    return await vpnRepo.getVpnServers();
  }
}
