class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(name: map['name'] ?? '', url: map['url'] ?? '');
  }
}
