import 'package:viraadmin/environment/environment.dart';
import 'package:viraadmin/modules/domain/repository/profile/my_profile_repository.dart';
import 'package:viraadmin/modules/domain/core/network/network.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';

part 'end_points.dart';
part 'payloads.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Result<PrivacyPolicySuccess, PrivacyPolicyFailure>>
      getPrivacyPolicyList() async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.getPrivacyPolicy;

    if (client != null) {
      final response = await client.get(url);

      if (response.statusCode.isSuccess) {
        final data = response.data;
        List<QnA> value = [];
        for (final qa in data) {
          value.add(QnA.fromJson(qa));
        }

        return Success(PrivacyPolicySuccess(privacy_policy_list: value));
      } else {
        return Failure(PrivacyPolicyFailure());
      }
    } else {
      return Failure(PrivacyPolicyFailure());
    }
  }

  @override
  Future<Result<FaqSuccess, FaqFailure>> getFaqList() async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.getFaq;

    if (client != null) {
      final response = await client.get(url);

      if (response.statusCode.isSuccess) {
        final data = response.data;
        List<QnA> value = [];
        for (final qa in data) {
          value.add(QnA.fromJson(qa));
        }

        return Success(FaqSuccess(faq_list: value));
      } else {
        return Failure(FaqFailure());
      }
    } else {
      return Failure(FaqFailure());
    }
  }

  @override
  Future<Result<SavedAddressSuccess, SavedAddressFailure>> getUserAddressList(
      String uuid) async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.getUserSavedAddresses;
    if (client != null) {
      final response = await client.get('$url?userUuid=$uuid');

      if (response.statusCode.isSuccess) {
        final data = response.data;
        List<Address> value = [];
        if (data.toString() == '') {
          return Success(SavedAddressSuccess(address_list: value));
        }
        var userAddressData = UserAddress.fromJson(data);
        value = userAddressData.addressList!.cast<Address>();

        return Success(SavedAddressSuccess(address_list: value));
      } else {
        return Failure(SavedAddressFailure());
      }
    } else {
      return Failure(SavedAddressFailure());
    }
  }

  @override
  Future<Result<GetAddressSuccess, GetAddressFailure>> getAddress(
      String UUID, String addressUuid) async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.getAddress;

    if (client != null) {
      final response = await client.get(url,
          queryParameters: {'addressUuid': addressUuid, 'userUuid': UUID});

      if (response.statusCode.isSuccess) {
        final data = response.data;

        return Success(GetAddressSuccess(address: Address.fromJson(data)));
      } else {
        return Failure(GetAddressFailure());
      }
    } else {
      return Failure(GetAddressFailure());
    }
  }

  @override
  Future<Result<CreateAddressSuccess, CreateAddressFailure>> createAddress(
      Address address, String uuid) async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.addAddress;
    if (client != null) {
      final response = await client.post('$url?userUuid=$uuid', data: address);

      if (response.statusCode.isSuccess) {
        return Success(CreateAddressSuccess());
      } else {
        return Failure(CreateAddressFailure());
      }
    } else {
      return Failure(CreateAddressFailure());
    }
  }

  @override
  Future<Result<UpdateAddressSuccess, UpdateAddressFailure>> updateAddress(
      Address address, String uuid) async {
    final client = await KNetworkingBox.instance.secureClient();

    final url = KEnvironment.config.apiUrl + _EndPoint.updateAddress;
    if (client != null) {
      final response = await client.put('$url?userUuid=$uuid', data: address);

      if (response.statusCode.isSuccess) {
        return Success(UpdateAddressSuccess());
      } else {
        return Failure(UpdateAddressFailure());
      }
    } else {
      return Failure(UpdateAddressFailure());
    }
  }

  @override
  Future<Result<GetAddressSuccess, GetAddressFailure>>
      getCityAndStateFromPinCode(String pinCode) async {
    final client = await KNetworkingBox.instance.secureClient();

    if (client != null) {
      final response =
          await client.get(_EndPoint.locationFromPinCode + pinCode);
      var res = response.data;
      var status = 'Failure';
      if (res != null) {
        status = res[0]['Status'];
      }

      if (status == 'Success') {
        var city = res[0]['PostOffice'][0]['District'];
        var state = res[0]['PostOffice'][0]['State'];
        var address = Address();
        address.state = state;
        address.city = city;

        return Success(GetAddressSuccess(address: address));
      } else {
        return Failure(GetAddressFailure());
      }
    } else {
      return Failure(GetAddressFailure());
    }
  }
}
