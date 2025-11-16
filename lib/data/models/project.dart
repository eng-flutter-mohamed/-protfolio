enum ProjectLinkType { googlePlay, appStore, web }

class ProjectLink {
  final ProjectLinkType type;
  final String url;

  const ProjectLink({required this.type, required this.url});
}

class Project {
  final String titleKey;
  final String descriptionKey;
  final List<String> gallery;
  final List<ProjectLink> storeLinks;
  final List<String> highlightKeys;
  final String? githubRepoLink;
  final String? previewLink;

  const Project({
    required this.titleKey,
    required this.descriptionKey,
    required this.gallery,
    this.storeLinks = const [],
    this.highlightKeys = const [],
    this.githubRepoLink,
    this.previewLink,
  });
}
