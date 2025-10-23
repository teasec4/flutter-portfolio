class Project {
  final String id;
  final String title;
  final String description;
  final String contribution;
  final String detailedDescription;
  final String personalNotes;
  final List<String> technologies;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String? assetPath;
  final String? gifUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.contribution,
    required this.detailedDescription,
    required this.personalNotes,
    required this.technologies,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.assetPath,
    this.gifUrl,
  });
}
