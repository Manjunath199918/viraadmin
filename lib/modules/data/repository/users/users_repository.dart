import 'package:viraadmin/modules/domain/core/network/network.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';
import 'package:viraadmin/modules/domain/repository/users/users_repository.dart';

part 'end_points.dart';
part 'payloads.dart';

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<Result<RegisterTokenSuccess, RegisterTokenFailure>> registerToken({
    required RegisterTokenRequest request,
  }) async {
    final client = await KNetworkingBox.instance.secureClient();

    if (client != null) {
      final response = await client.post(
        _EndPoint.registerToken,
        data: request.toJson(),
      );

      if (response.statusCode.isSuccess) {
        final data = response.data;

        return Success(RegisterTokenSuccess());
      } else {
        return Failure(RegisterTokenFailure());
      }
    } else {
      return Failure(RegisterTokenFailure());
    }
  }

  @override
  Future<Result<AddNewAddressSuccess, AddNewAddressFailure>> addNewAddress({
    required AddNewAddressRequest request,
  }) async {
    final client = await KNetworkingBox.instance.secureClient();

    if (client != null) {
      final response = await client.post(
        _EndPoint.addNewAddress,
        data: request.toJson(),
      );

      if (response.statusCode.isSuccess) {
        final data = response.data;

        return Success(
          AddNewAddressSuccess.fromJson(data),
        );
      } else {
        return Failure(AddNewAddressFailure());
      }
    } else {
      return Failure(AddNewAddressFailure());
    }
  }
}
