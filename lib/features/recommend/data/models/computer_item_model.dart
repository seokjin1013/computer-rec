import '../../domain/entities/computer_item.dart';

class ComputerItemModel extends ComputerItem {
  ComputerItemModel(
      {required super.id,
      required super.price,
      required super.happyId,
      required super.happyPrice,
      required super.compuzoneId,
      required super.compuzonePrice,
      required super.image,
      required super.name,
      required super.details,
      required super.rank,
      required super.score,
      required super.totalScore,
      required super.shopLink,
      required super.shopLogo,
      required super.shopName});

  factory ComputerItemModel.fromJson(Map<String, dynamic> json) =>
      ComputerItemModel(
          id: json['id'],
          price: json['price'],
          happyId: json['happyId'],
          happyPrice: json['happyPrice'],
          compuzoneId: json['compuzoneId'],
          compuzonePrice: json['compuzonePrice'],
          image: json['image'],
          name: json['name'],
          details: json['details'],
          rank: json['rank'],
          score: json['score'],
          totalScore: json['totalScore'],
          shopLink: json['shopLink'],
          shopLogo: json['shopLogo'],
          shopName: json['shopName']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'happyId': happyId,
        'happyPrice': happyPrice,
        'compuzoneId': compuzoneId,
        'compuzonePrice': compuzonePrice,
        'image': image,
        'name': name,
        'details': details,
        'rank': rank,
        'score': score,
        'totalScore': totalScore,
        'shopLink': shopLink,
        'shopLogo': shopLogo,
        'shopName': shopName,
      };
}
