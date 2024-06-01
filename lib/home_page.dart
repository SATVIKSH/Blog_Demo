import 'package:blog/blog_card.dart';
import 'package:blog/fetch_blogs_controller.dart';
import 'package:blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final FetchBlogController blogController = Get.put(FetchBlogController());
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: ktextPrimary,
        backgroundColor: Color.fromARGB(255, 192, 184, 193),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Today's Blogs",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "Tribune"),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (blogController.blogs.isEmpty) {
          return const Center(
              child: Center(child: CircularProgressIndicator()));
        }
        return ListView.builder(
            itemCount: blogController.blogs.length,
            itemBuilder: (context, index) {
              final blog = blogController.blogs[index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(top: 8)
                    : EdgeInsets.only(top: 0),
                child: BlogCard(
                  blog: blog,
                ),
              );
            });
      }),
    );
  }
}
