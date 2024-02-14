part of '../../app_extension.dart';

class KTimeService {
  KTimeService._();

  Future<String> getLocalTimezoneRegion() async {
    var localTimezone = await FlutterTimezone.getLocalTimezone();

    //Handle Asia/Kolkata Asia/Calcutta
    if (localTimezone == 'Asia/Calcutta') {
      localTimezone = 'Asia/Kolkata';
    }

    return localTimezone;
  }
}
