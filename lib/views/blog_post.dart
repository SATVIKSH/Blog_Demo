import 'package:blog/blog_model.dart';
import 'package:blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPost extends StatelessWidget {
  const BlogPost({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogModel blog = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: blog.id,
                child: FadeInImage(
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage("assets/img1.jpg"),
                    image: NetworkImage(blog.image)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Center(
                    child: Text(
                  blog.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.3),
                child: const Divider(
                  thickness: 2,
                  color: ktextPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: SingleChildScrollView(
                    child: Text(
                  blog.summary,
                  textAlign: TextAlign.justify,
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .titleLarge!
                  //     .copyWith(fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Read More:",
                    ),
                    TextButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(blog.link);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch blog !!');
                          }
                        },
                        child: Text(
                          blog.link,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.blue,
                                  ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
