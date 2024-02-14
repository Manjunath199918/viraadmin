import 'dart:io';

import 'package:viraadmin/modules/data/repository/users/users_repository.dart';
import 'package:viraadmin/modules/domain/core/device_info/device_info.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';

import 'package:viraadmin/modules/domain/repository/profile/my_profile_repository.dart';

part 'models/profile_details.dart';
part 'requests.dart';
part 'responses.dart';

abstract class UsersRepository extends Repository {
  factory UsersRepository() => UsersRepositoryImpl();

  Future<Result<RegisterTokenSuccess, RegisterTokenFailure>> registerToken({
    required RegisterTokenRequest request,
  });

  Future<Result<AddNewAddressSuccess, AddNewAddressFailure>> addNewAddress({
    required AddNewAddressRequest request,
  });
}
