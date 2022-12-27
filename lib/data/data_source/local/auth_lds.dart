import 'package:hive/hive.dart';

import '../../../shared/global/hive_boxes.dart';
import '../../../shared/global/hive_keys.dart';

class AuthLocalDataSource {
  final box = Hive.box<dynamic>(HiveBoxes.auth.name);

  bool get isLogedIn => box.get(HiveKeys.isLogedIn, defaultValue: false);

  Future<void> saveAuthRes(
      {required String email, required String password}) async {
    await Future.wait([
      box.put(HiveKeys.email, email),
      box.put(HiveKeys.password, password),
      box.put(HiveKeys.isLogedIn, true),
    ]);
  }

  Future<void> clear() async {
    await box.clear();
  }
}
