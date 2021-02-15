import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_skeleton/config/index.dart';

mixin MixinState<T extends StatefulWidget> on State<T> {
  bool loading;
  bool netNotAvailable = false;
  var subscription;
  BuildContext scaffoldContext;

  @override
  void initState() {
    super.initState();
    loading = false;
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      Utility.logsInDebug("ConnectivityResult $result");
      setState(() {
        netNotAvailable = result.toString() == 'ConnectivityResult.none' ? true : false;
      });
    });
  }

  void setLoader(bool showLoader) {
    setState(() {
      loading = showLoader;
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
}
