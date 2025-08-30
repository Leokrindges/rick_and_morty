class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      count: map['count'] ?? 0,
      pages: map['pages'] ?? 0,
      next: map['next'] ?? '',
      prev: map['prev'] ?? '',
    );
  }
}
