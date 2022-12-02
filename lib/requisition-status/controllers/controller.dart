import 'dart:async';

import 'package:flutter/foundation.dart';

import '../repositories/repository.dart';

class ControllerStatusCode {
  RepositoryStatusCode repository;
  var result = ValueNotifier('');
  var numberRequisition = ValueNotifier(0);
  ControllerStatusCode(this.repository);
  late Timer timer;

  showStatus<String>() async {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      ((timer) async => await getStatus()),
    );
    return result;
  }

  stopStatus<String>() async {
    timer.cancel();
    Future.delayed(const Duration(milliseconds: 900));
    numberRequisition.value = 0;
    result.value = '?';
  }

  Future getStatus() async {
    result.value = await repository.getdata();
    numberRequisition.value += 1;
  }
}
