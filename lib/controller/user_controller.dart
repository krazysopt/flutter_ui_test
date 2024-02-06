import 'package:get/get.dart';

import '../model/user.dart';

class UserController extends GetxController {

  /// user info
  var curUser = User().obs;

  /// init
  init() {
    curUser.value = User(
      firstName: 'Shivani',
      lastName: '',
      location: 'ABC Road, LA',
      avatar: 'assets/images/avatar.jpg',
    );
  }
}