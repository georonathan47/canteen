// ignore_for_file: file_names
class Food {
  final String name, description, imageURL;
  final double lgprice, smprice, mdprice;

  const Food({
    required this.name,
    required this.smprice,
    required this.lgprice,
    required this.mdprice,
    required this.imageURL,
    required this.description,
  });
}
