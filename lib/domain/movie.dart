class Movie {
  final String imdbID;
  final String title;
  final String year;
  final String type;
  final String imageURL;
  Movie({
    required this.imdbID,
    required this.title,
    required this.year,
    required this.type,
    required this.imageURL,
  });

  Movie copyWith({
    String? imdbID,
    String? title,
    String? year,
    String? type,
    String? imageURL,
  }) {
    return Movie(
      imdbID: imdbID ?? this.imdbID,
      title: title ?? this.title,
      year: year ?? this.year,
      type: type ?? this.type,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imdbID': imdbID,
      'Title': title,
      'Year': year,
      'Type': type,
      'Poster': imageURL,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      imdbID: map['imdbID'] ?? '',
      title: map['Title'] ?? '',
      year: map['Year'] ?? '',
      type: map['Type'] ?? '',
      imageURL: map['Poster'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Movie(imdbID: $imdbID, title: $title, year: $year, type: $type, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.imdbID == imdbID &&
        other.title == title &&
        other.year == year &&
        other.type == type &&
        other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return imdbID.hashCode ^
        title.hashCode ^
        year.hashCode ^
        type.hashCode ^
        imageURL.hashCode;
  }
}
