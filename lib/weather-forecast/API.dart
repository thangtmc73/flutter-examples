import 'package:http/http.dart' as http;

const authority = "api.openweathermap.org";
const unencodedPath = "data/2.5/weather";
const appID = "YOUR_APP_ID_HERE";

Future requestCurrentData(String q) async {
  final queryParameters = {
    "q": q,
    "appid": appID,
  };
  final response =
      await http.get(Uri.https(authority, unencodedPath, queryParameters));

  if (response.statusCode != 200) {
    throw Exception("request current weather data failed");
  }
  return null;
}
