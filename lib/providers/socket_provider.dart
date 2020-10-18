import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStautus { Online, Offline, Connecting }

class Socketprovider with ChangeNotifier {
  ServerStautus _serverStautus = ServerStautus.Connecting;
  IO.Socket _socket;

  ServerStautus get serverStautus => this._serverStautus;
  IO.Socket get socket => this._socket;

  Socketprovider() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    this._socket = IO.io('http://192.168.1.69:3000/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    this._socket.on('connect', (_) {
      print('connect');
      this._serverStautus = ServerStautus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      this._serverStautus = ServerStautus.Offline;
      notifyListeners();
    });

    /*
    socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje: $payload');
      print('Nombre: ' + payload['nombre'].toString());
      print('Mensaje: ' + payload['mensaje'].toString());
      print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no exite');
    });*/
  }
}
