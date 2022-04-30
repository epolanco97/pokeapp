import 'package:flutter/material.dart';

class ConnectionCheck extends ChangeNotifier {
  bool? _connectionCheck;

  bool get connectionCheck{
    return _connectionCheck ?? false;
  }

  set connectionCheck(bool connectionCheck){
    _connectionCheck = connectionCheck;
  }

}
