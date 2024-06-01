import 'package:blog/fetch_blogs_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FetchBlogController>(() => FetchBlogController());
  }
}
