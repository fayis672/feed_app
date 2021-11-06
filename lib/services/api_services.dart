import 'package:feed_app/model/feed.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  Future<Feed?> fetchFeed() async {
    try {
      var response = await client.get(Uri.parse(
          'http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json'));
      if (response.statusCode == 200) {
        return feedFromJson(response.body);
      } else {
        print("error");
        return null;
      }
    } finally {
      client.close();
    }
  }
}
