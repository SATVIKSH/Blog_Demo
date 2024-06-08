import 'package:blog/data/blog_model.dart';
import 'package:blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BlogCard extends StatelessWidget {
  BlogCard({super.key, required this.blog});
  BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: SizedBox(
            height: 300,
            width: Get.size.width * 0.8,
            child: Column(
              children: [
                // Image.asset(
                //   "assets/img1.jpg",
                //   height: 200,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  child: Text(
                    blog.summary,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.size.width * 0.3),
                  child: const Divider(
                    thickness: 1,
                    color: ktextSecondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 8),
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed('/post', arguments: blog);
                    },
                    child: Center(
                      child: Text(
                        "View Summary",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
