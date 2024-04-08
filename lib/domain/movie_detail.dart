class MovieDetail {
  final String imdbID;
  final String title;
  final String year;
  final String type;
  final String imageURL;
  final String duration;
  final String genre;
  final String plot;
  final String country;
  final String actors;
  final String director;
  MovieDetail({
    required this.imdbID,
    required this.title,
    required this.year,
    required this.type,
    required this.imageURL,
    required this.duration,
    required this.genre,
    required this.plot,
    required this.country,
    required this.actors,
    required this.director,
  });

  MovieDetail copyWith({
    String? imdbID,
    String? title,
    String? year,
    String? type,
    String? imageURL,
    String? duration,
    String? genre,
    String? plot,
    String? country,
    String? actors,
    String? director,
  }) {
    return MovieDetail(
      imdbID: imdbID ?? this.imdbID,
      title: title ?? this.title,
      year: year ?? this.year,
      type: type ?? this.type,
      imageURL: imageURL ?? this.imageURL,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      plot: plot ?? this.plot,
      country: country ?? this.country,
      actors: actors ?? this.actors,
      director: director ?? this.director,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imdbID': imdbID,
      'Title': title,
      'Tear': year,
      'Type': type,
      'Poster': imageURL,
      'Runtime': duration,
      'Genre': genre,
      'Plot': plot,
      'Country': country,
      'Actors': actors,
      'Director': director,
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      imdbID: map['imdbID'] ?? '',
      title: map['Title'] ?? '',
      year: map['Year'] ?? '',
      type: map['Type'] ?? '',
      imageURL: map['Poster'] ?? '',
      duration: map['Runtime'] ?? '',
      genre: map['Genre'] ?? '',
      plot: map['Plot'] ?? '',
      country: map['Country'] ?? '',
      actors: map['Actors'] ?? '',
      director: map['Director'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MovieDetail(imdbID: $imdbID, title: $title, year: $year, type: $type, imageURL: $imageURL, duration: $duration, genre: $genre, plot: $plot, country: $country, actors: $actors, director: $director)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetail &&
        other.imdbID == imdbID &&
        other.title == title &&
        other.year == year &&
        other.type == type &&
        other.imageURL == imageURL &&
        other.duration == duration &&
        other.genre == genre &&
        other.plot == plot &&
        other.country == country &&
        other.actors == actors &&
        other.director == director;
  }

  @override
  int get hashCode {
    return imdbID.hashCode ^
        title.hashCode ^
        year.hashCode ^
        type.hashCode ^
        imageURL.hashCode ^
        duration.hashCode ^
        genre.hashCode ^
        plot.hashCode ^
        country.hashCode ^
        actors.hashCode ^
        director.hashCode;
  }
}
