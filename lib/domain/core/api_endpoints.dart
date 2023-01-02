import 'package:netflix/infrastructure/apikey.dart';

import '../../core/strings.dart';

class Apiendpoints {
  static const downloads = "$KbaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$KbaseUrl/search/movie?api_key=$apiKey";
  static const hotandnewmovie = '$KbaseUrl/discover/movie?api_key=$apiKey';
    static const hotandnewtv = '$KbaseUrl/discover/tv?api_key=$apiKey';

}
