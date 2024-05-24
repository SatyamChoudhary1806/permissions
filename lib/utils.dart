import 'package:permission_handler/permission_handler.dart';

Future<void> reqper({required Permission permission}) async{
  final status = await permission.status;
  if( status.isGranted){
    print("Permission already Given");
  }
  else if (status.isDenied){
    if(await permission.request().isGranted){
      print("Permission Given");
    }
    else{
      print("Permission Denied");
    }
  }
  else{
    print("Permission Denied");
  }
}
Future<void> Allpermissions()async{
  final StatusMap = await[
    Permission.camera,
    Permission.microphone,
    Permission.storage,
    Permission.locationWhenInUse,
  ].request();
  print("Permission Status Mic = ${StatusMap[Permission.microphone]}");
  print("Permission Status Camera = ${StatusMap[Permission.camera]}");
  print("Permission Status PhotoLib = ${StatusMap[Permission.storage]}");
  print("Permission Status Location = ${StatusMap[Permission.locationWhenInUse]}");
}
Future<bool> requestPermissionSetting()=> openAppSettings();