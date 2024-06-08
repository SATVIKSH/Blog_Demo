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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'link': link,
      'title': title,
      'summary': summary,
      'image': image,
    };
  }

  // Create a BlogModel from a Map.
  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'],
      link: map['link'],
      title: map['title'],
      summary: map['summary'],
      image: map['image'],
    );
  }
}
