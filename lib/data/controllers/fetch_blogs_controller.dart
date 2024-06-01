import 'package:blog/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FetchBlogController extends GetxController {
  var blogs = <BlogModel>[].obs;

  final CollectionReference blogCollection =
      FirebaseFirestore.instance.collection('blogs');
  @override
  void onInit() {
    fetchBlogs();
    super.onInit();
  }

  void fetchBlogs() async {
    try {
      QuerySnapshot snapshot = await blogCollection.get();
      var fetchedBlogs = snapshot.docs.map((doc) {
        return BlogModel.fromDocument(doc);
      }).toList();
      blogs.value = fetchedBlogs;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch : $e');
    }
  }
}
