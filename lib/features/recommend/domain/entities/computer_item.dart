class ComputerItem {
  final int id;
  final int price;
  final int happyId;
  final int happyPrice;
  final int compuzoneId;
  final int compuzonePrice;
  final String image;
  final String name;
  final String details;
  final int rank;
  final int score;
  final int totalScore;
  final String shopLink;
  final String shopLogo;
  final String shopName;

  const ComputerItem(
      {required this.id,
      required this.price,
      required this.happyId,
      required this.happyPrice,
      required this.compuzoneId,
      required this.compuzonePrice,
      required this.image,
      required this.name,
      required this.details,
      required this.rank,
      required this.score,
      required this.totalScore,
      required this.shopLink,
      required this.shopLogo,
      required this.shopName});
}
