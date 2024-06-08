import 'package:blog/data/blog_model.dart';
import 'package:blog/databases/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FetchBlogController extends GetxController {
  var blogs = <BlogModel>[].obs;
  var dbBlogs = <BlogModel>[].obs;
  late final dbHelper;
  final CollectionReference blogCollection =
      FirebaseFirestore.instance.collection('blogs');
  @override
  void onInit() async {
    fetchBlogs();
    dbHelper = DatabaseHelper.instance;
    dbBlogs.value = await dbHelper.fetchBlogs();
    super.onInit();
  }

  void fetchBlogs() async {
    try {
      QuerySnapshot snapshot = await blogCollection.get();
      int k = 0;
      final fetchedBlogs = snapshot.docs.map((doc) {
        final blog = BlogModel.fromDocument(doc);

        return blog;
      }).toList();
      dbHelper.replaceBlogs(fetchedBlogs);
      blogs.value = fetchedBlogs;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch : $e');
    }
  }
}
