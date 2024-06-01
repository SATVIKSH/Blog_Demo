import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  BlogModel(
      {required this.title,
      required this.link,
      required this.image,
      required this.summary,
      required this.id});
  String title;
  String link;
  String summary;
  String id;
  String image;
  factory BlogModel.fromDocument(DocumentSnapshot doc) {
    return BlogModel(
        id: doc.id,
        link: doc['link'],
        title: doc['title'],
        summary: doc['summary'],
        image: doc['image']);
  }
}
