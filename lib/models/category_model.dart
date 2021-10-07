import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  static List<Category> category = [
    Category(
        name: 'Clothes',
        imageUrl:
            'https://images.unsplash.com/photo-1445205170230-053b83016050?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3RoZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
    Category(
        name: 'Devices',
        imageUrl:
            'https://www.sayidaty.net/sites/default/files/styles/1375_scale/public/2019/07/24/5593851-1987591248.jpg?itok=Pj_iwtSH'),
    Category(
        name: 'Accessories',
        imageUrl: 'https://wallpaperaccess.com/full/4571410.jpg'),
  ];
}
