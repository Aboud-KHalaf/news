class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromNews(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toNews() => {
        'id': id,
        'name': name,
      };
}
