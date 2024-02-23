import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viraadmin/modules/data/repository/profile/my_profile_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';

part 'models/QnA.dart';
part 'models/edit_profile.dart';
part 'requests.dart';
part 'responses.dart';
part 'models/address.dart';
part 'models/user_address.dart';
part 'models/user_details.dart';

abstract class ProfileRepository extends Repository {
  factory ProfileRepository() => ProfileRepositoryImpl();

  Future<Result<PrivacyPolicySuccess, PrivacyPolicyFailure>> getPrivacyPolicyList();

  Future<Result<FaqSuccess, FaqFailure>> getFaqList();

  Future<Result<SavedAddressSuccess, SavedAddressFailure>> getUserAddressList(String uuid);

  Future<Result<CreateAddressSuccess, CreateAddressFailure>> createAddress(Address address,String uuid);

  Future<Result<UpdateAddressSuccess, UpdateAddressFailure>> updateAddress(Address address,String uuid);

  Future<Result<GetAddressSuccess, GetAddressFailure>> getAddress(String UUID,String addressUuid);

  Future<Result<GetAddressSuccess, GetAddressFailure>> getCityAndStateFromPinCode(String pinCode);
}
