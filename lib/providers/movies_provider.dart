import 'package:flutter/material.dart';
import 'package:latihan_pratek_m10/models/movie_model.dart';

class MoviesProvider with ChangeNotifier {
  List<MovieModel> movies = [
    MovieModel(
        id: 1,
        title: "Agak Laen Kau",
        cover:
            "https://upload.wikimedia.org/wikipedia/id/0/01/Poster_Agak_Laen_%282024%29.jpg",
        desc:
            "Empat petugas rumah hantu bernama Boris, Jegel, Bene, dan Oki. Dikisahkan bahwa keempatnya bertugas sebagai hantu yang menakut-nakuti pengunjung rumah hantu yang ada di sebuah pasar malam. Namun, alih-alih menyeramkan dan membuat para pengunjung terkesan, rumah hantu tersebut justru sama sekali tidak menunjukkan kesan yang seram. Bahkan hantu-hantu di dalamnya pun tidak berhasil membuat pengunjung terkejut maupun ketakutan. Situasi tersebut membuat pihak pengelola wahana mencoba sebisa mungkin untuk menghadirkan wahana rumah hantu yang menyeramkan."),
    MovieModel(
        id: 2,
        title: "Guru-Guru Gokil",
        cover:
            "https://upload.wikimedia.org/wikipedia/id/f/ff/Poster_Film_Crazy_Awesome_Teachers.jpg",
        desc:
            "Guru-Guru Gokil bercerita tentang Taat (Gading Marten) yang berambisi untuk sukses, tapi lebih sering menemui kegagalan dalam karier. Baginya, kesuksesan berarti memiliki uang banyak."),
    MovieModel(
        id: 3,
        title: "Jakarta vs Everybody",
        cover:
            "https://upload.wikimedia.org/wikipedia/id/3/34/Jakarta_vs_Everybody_poster_Bioskop_online.jpeg",
        desc:
            "Jakarta vs Everybody mengisahkan sosok Dom yang berusia 23 tahun memutuskan untuk pergi merantau ke Jakarta. Tujuan Dom pergi ke Jakarta adalah untuk mengejar mimpinya sebagai aktor ternama di Ibukota. Namun perjalanan untuk menjadi aktor tidaklah mudah. Dom harus menghadapi kesulitan hidup di kota metropolitan. Hingga pada suatu hari Dom bertemu dengan Pinkan dan Radit."),
  ];

  List<MovieModel> temp = [];

  int getId() {
    return movies.length;
  }

  void addMovie(MovieModel movie) {
    movies.add(movie);
    notifyListeners();
  }

  void deletemovie(MovieModel movie) {
    temp = [...movies];

    movies.remove(movie);
    notifyListeners();
  }

  void undoDeleteMovie() {
    movies = [...temp];
    notifyListeners();
  }

  void updateMovie(MovieModel movie) {
    temp = [...movies];
    movies = [
      ...movies.map(
        (e) {
          if (movie.id == e.id) {
            print(movie.title);
            return movie;
          } else {
            return e;
          }
        },
      )
    ];

    notifyListeners();
  }
}
