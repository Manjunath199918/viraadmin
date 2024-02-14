part of '../../utils/booters/app_booter.dart';

abstract class Booter<T> {
  Future<T> bootUp();

  void onBootUp();

  void bootDown();
}
