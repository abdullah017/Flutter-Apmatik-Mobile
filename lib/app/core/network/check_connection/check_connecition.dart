import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get/get.dart';

class CheckNetworkConnection {
  CheckNetworkConnection._();
  static final _instance = CheckNetworkConnection._();
  StreamSubscription<ConnectivityResult>? checkStatusSubscription;
  static CheckNetworkConnection get instance => _instance;
  final Connectivity _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  StreamSubscription<ConnectivityResult>? subscription;
  Stream get myStream => _controller.stream;

  Future<bool?> checkConnectionStatus() async {
    var connectionResult = await _connectivity.checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile) {
      return Future<bool>.value(true);
    }
    if (connectionResult == ConnectivityResult.wifi) {
      return Future<bool>.value(true);
    }
    if (connectionResult == ConnectivityResult.none) {
      return Future<bool>.value(false);
    }
    return null;
  }

  void subConnectionStatus() async {
    checkStatusSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Get.toNamed('common', arguments: 'noConnection');
      }
      if (result == ConnectivityResult.mobile) {
        Get.back();
      }
      if (result == ConnectivityResult.wifi) {
        Get.back();
      }
    });
  }
}



///[In this example class, we can make a request to our own api address and check the internet.]
///MORE DETAIL VISIT [EXAMPLE] REPO
///[LINK] => https://github.com/dennmat/flutter-connectiontest-example
///
///[EXAMPLE]
///
///class ConnectionStatusSingleton {
    ///This creates the single instance by calling the `_internal` constructor specified below

///    static final ConnectionStatusSingleton _singleton = new ConnectionStatusSingleton._internal();
///    ConnectionStatusSingleton._internal();

///    //This is what's used to retrieve the instance through the app
///    static ConnectionStatusSingleton getInstance() => _singleton;

///    //This tracks the current connection status
///    bool hasConnection = false;

///    //This is how we'll allow subscribing to connection changes
///    StreamController connectionChangeController = new StreamController.broadcast();

///    //flutter_connectivity
///    final Connectivity _connectivity = Connectivity();

///    //Hook into flutter_connectivity's Stream to listen for changes
///    //And check the connection status out of the gate
///    void initialize() {
///        _connectivity.onConnectivityChanged.listen(_connectionChange);
///        checkConnection();
///    }

///    Stream get connectionChange => connectionChangeController.stream;

///    //A clean up method to close our StreamController
///    ///  Because this is meant to exist through the entire application life cycle this isn't
///    ///  really an issue
///    void dispose() {
///        connectionChangeController.close();
///    }

///    //flutter_connectivity's listener
///    void _connectionChange(ConnectivityResult result) {
///        checkConnection();
///    }

///    //The test to actually see if there is a connection
///    Future<bool> checkConnection() async {
///        bool previousConnection = hasConnection;

///        try {
///            final result = await InternetAddress.lookup('google.com');
///            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
///                hasConnection = true;
///            } else {
///                hasConnection = false;
///            }
///        } on SocketException catch(_) {
///            hasConnection = false;
///        }

///        //The connection status changed send out an update to all listeners
///        if (previousConnection != hasConnection) {
///            connectionChangeController.add(hasConnection);
///        }

///        return hasConnection;
///    }
///}
///               In Widget or elsewhere
//import 'dart:async'; //For StreamSubscription

///...

///class MyWidgetState extends State<MyWidget> {
///    StreamSubscription _connectionChangeStream;

///    bool isOffline = false;

///    @override
///    initState() {
///        super.initState();

///        ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
///        _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
///    }

///    void connectionChanged(dynamic hasConnection) {
///        setState(() {
///            isOffline = !hasConnection;
///        });
///    }

///    @override
///    Widget build(BuildContext ctxt) {
///        ...
///    }
///}



