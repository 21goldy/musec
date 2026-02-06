import 'package:flutter_dotenv/flutter_dotenv.dart';

final String subsonicUser =
    dotenv.env['SUBSONIC_USERNAME'] ?? '';

final String subsonicPass =
    dotenv.env['SUBSONIC_PASSWORD'] ?? '';

final String baseUrl =
    dotenv.env['SUBSONIC_BASE_URL'] ?? '';

final String client =
    dotenv.env['SUBSONIC_CLIENT'] ?? 'myapp';

class SubsonicApi {
  static Uri buildUri(
      String endpoint, {
        Map<String, String>? extra,
      }) {
    return Uri.parse(
      '$baseUrl/rest/$endpoint',
    ).replace(queryParameters: {
      'u': subsonicUser,
      'p': subsonicPass,
      'v': '1.16.1',
      'c': client,
      'f': 'json',
      ...?extra,
    });
  }
}

