import '../main.dart';

class PrefManager {
  /// Method to save user data
  Future<void> saveUserData(
      String name,
      String email,
      List<String> sportsPlayed,
      String uid,
      bool isComplex,
      String city,
      String country,
      double latitude,
      double longitude,
      int matchesPlayed,
      int manOfTheMatch,
      String dateOfBirth,
      String profileImageUrl,
      List<String> favoriteTeams,
      String token,
      bool notifications,
      String address,
      int gender,
      bool isVerified,
      List<String> favClubs,
      String phoneNumber,
      ) async {
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setStringList('sportsPlayed', sportsPlayed);
    await prefs.setString('uid', uid);
    await prefs.setBool("isComplex", isComplex);
    await prefs.setString("city", city);
    await prefs.setString("country", country);
    await prefs.setDouble("latitude", latitude);
    await prefs.setDouble("longitude", longitude);
    await prefs.setInt("matchesPlayed", matchesPlayed);
    await prefs.setInt("manOfTheMatch", manOfTheMatch);
    await prefs.setString("dateOfBirth", dateOfBirth);
    await prefs.setString("profileImageUrl", profileImageUrl);
    await prefs.setStringList("favoriteTeams", favoriteTeams);
    await prefs.setString("token", token);
    await prefs.setBool("notifications", notifications);
    await prefs.setString("address", address);
    await prefs.setInt("gender", gender);
    await prefs.setBool("isVerified", isVerified);
    await prefs.setStringList("favClubs", favClubs);
    await prefs.setString("phoneNumber", phoneNumber);
  }

  /// Method to save complex data to shared preferences
  Future<void> saveComplexData(
      String complexName,
      String email,
      String city,
      String country,
      String bio,
      String uid,
      bool isComplex,
      List<String> sportsOffered,
      double latitude,
      double longitude,
      int matchesCreated,
      int onGoingMatches,
      String profileImageUrl,
      String token,
      bool notifications,
      String address,
      bool isVerified,
      String vatNumber,
      String phoneNumber,
      ) async {
    await prefs.setString('name', complexName);
    await prefs.setString('email', email);
    await prefs.setString('city', city);
    await prefs.setString('country', country);
    await prefs.setString('bio', bio);
    await prefs.setString('uid', uid);
    await prefs.setBool('isComplex', isComplex);
    await prefs.setStringList('sportsOffered', sportsOffered);
    await prefs.setDouble("latitude", latitude);
    await prefs.setDouble("longitude", longitude);
    await prefs.setInt("matchesCreated", matchesCreated);
    await prefs.setInt("onGoingMatches", onGoingMatches);
    await prefs.setString("profileImageUrl", profileImageUrl);
    await prefs.setString("token", token);
    await prefs.setBool("notifications", notifications);
    await prefs.setString("address", address);
    await prefs.setBool("isVerified", isVerified);
    await prefs.setString("vatNumber", vatNumber);
    await prefs.setString("phoneNumber", phoneNumber);
  }

  Future<void> saveBoolValue(
      {required bool value, required String name}) async {
    await prefs.setBool(name, value);
  }

  Future<void> saveLocaleValue(
      {required String value,}) async {
    await prefs.setString('currentLocale', value);
  }

  Future<void> saveLatLng({
    required double latitude,
    required double longitude,
  }) async {
    await prefs.setDouble("latitude", latitude);
    await prefs.setDouble("longitude", longitude);
  }

  Future<void> saveCityAndCountry({
    required String city,
    required String country,
  }) async {
    await prefs.setString("city", city);
    await prefs.setString("country", country);
  }

  /// Getters for all the user data
  String get token => prefs.getString('token') ?? '';
  String get email => prefs.getString('email') ?? '';
  String get name => prefs.getString('name') ?? '';
  String get skillLevel => prefs.getString('skillLevel') ?? '';
  String get userUid => prefs.getString("uid") ?? "";
  double get latitude => prefs.getDouble("latitude") ?? 0.0;
  double get longitude => prefs.getDouble("longitude") ?? 0.0;
  String get city => prefs.getString("city") ?? '';
  String get country => prefs.getString("country") ?? '';
  bool get isComplex => prefs.getBool("isComplex") ?? false;
  String get bio => prefs.getString("bio") ?? '';
  List<String> get sportsOffered => prefs.getStringList("sportsOffered") ?? [];
  List<String> get sportsPlayed => prefs.getStringList("sportsPlayed") ?? [];
  List<String> get favoriteTeams => prefs.getStringList("favoriteTeams") ?? [];
  List<String> get favClubs => prefs.getStringList("favClubs") ?? [];
  int get matchesCreated => prefs.getInt("matchesCreated") ?? 0;
  int get onGoingMatches => prefs.getInt("onGoingMatches") ?? 0;
  int get matchesPlayed => prefs.getInt("matchesPlayed") ?? 0;
  int get manOfTheMatch => prefs.getInt("manOfTheMatch") ?? 0;
  String get profileImageUrl => prefs.getString("profileImageUrl") ?? "";
  String get dateOfBirth => prefs.getString("dateOfBirth") ?? "";
  bool get notificationEnabled => prefs.getBool("notifications") ?? true;
  String get address => prefs.getString("address") ?? "";
  int get gender => prefs.getInt('gender') ?? 3;
  bool get isVerified => prefs.getBool('isVerified') ?? false;
  String get vatNumber => prefs.getString('vatNumber') ?? '';
  String get phoneNumber => prefs.getString('phoneNumber') ?? '';
  String get currentLocale => prefs.getString('currentLocale') ?? 'fr';

  /// Method to clear cached data
  Future<void> clearAllData() async {
    await prefs.clear();
  }
}
