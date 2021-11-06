import 'package:feed_app/model/feed.dart';
import 'package:feed_app/services/api_services.dart';
import 'package:get/get.dart';

class FeedControler extends GetxController {
  var feed = Feed().obs;
  var isloading = true.obs;

  @override
  void onInit() {
    fetchFeed();
    super.onInit();
  }

  void fetchFeed() async {
    var feedData = await ApiServices().fetchFeed();
    if (feedData != null) {
      feed.value = feedData;
    } else {
      print("nodata");
    }
    isloading.value = false;
    print(feedData?.data?.coverUrl ?? "nodata");
  }
}
