// ENV
import 'package:flutter/foundation.dart';

const String ENV = ENV_DEV;
const String ENV_DEV = 'dev';
const String ENV_PROD = 'prod';

// API
const String API = ENV == ENV_DEV ? API_DEV : API_PROD;
const String API_DEV =
    kIsWeb ? 'http://localhost:8000/api' : 'http://10.0.2.2/api';
const String API_PROD = 'https://kspedu.com/api';

const String LOGO_PATH = 'assets/images/logo.svg';
const String LOGO_TYPE = 'svg';
