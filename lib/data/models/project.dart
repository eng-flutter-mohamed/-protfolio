class Project {
  final String name;
  final String imageUrl; // الصورة الرئيسية
  final String image1;   // الصورة الإضافية 1
  final String image2;   // الصورة الإضافية 2
  final String image3;   // الصورة الإضافية 3
  final String description;
  final String? githubRepoLink;
  final String? previewLink;
  final String? googlePlay;

  const Project({
    required this.name,
    required this.imageUrl,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.description,
    this.githubRepoLink,
    this.previewLink,
    this.googlePlay,
  });
}
