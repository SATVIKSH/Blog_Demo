import 'package:blog/views/blog_post.dart';
import 'package:blog/views/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final get_routes = [
  GetPage(name: '/', page: () => const Home()),
  GetPage(name: '/post', page: () => const BlogPost()),
];
