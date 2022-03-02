import 'package:zap_2/app/domain/constants/prod.dart';

String kApiUrl = prod ? kProd : kDev;

const String kProd = "https://zap2fl.herokuapp.com/";
const String kDev = 'http://10.0.2.2:3000';
