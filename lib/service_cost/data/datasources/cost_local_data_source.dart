// import 'dart:convert';
//
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/calculate_result_model.dart';
//
//
// abstract class NumberTriviaLocalDataSource {
//   Future<CostModel> getLastNumberTrivia();
//
//   Future<void> cacheNumberTrivia(CostModel costToCache);
// }
//
// const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';
//
// class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
//   final SharedPreferences sharedPreferences;
//
//   NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});
//
//   @override
//   Future<NumberTriviaModel> getLastNumberTrivia() {
//     final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
//     if (jsonString != null) {
//       return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
//     } else {
//       throw CacheException();
//     }
//   }
//
//   @override
//   Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
//     return sharedPreferences.setString(
//       CACHED_NUMBER_TRIVIA,
//       json.encode(triviaToCache.toJson()),
//     );
//   }
// }
