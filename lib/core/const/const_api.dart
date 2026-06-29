class ConstApi {

  static const String BaseUrl = "https://vcare.integration25.com/api" ;

  // end point
static const String login = "$BaseUrl/auth/login";
  static const String signup = "$BaseUrl/auth/register";
  static const String GetDOC = "$BaseUrl/doctor/index";
  static const String appointment = "$BaseUrl/appointment/index";
  static const String store = "$BaseUrl/appointment/store";
  static String SearchDoc(String name) => "$BaseUrl/doctor/doctor-search?name=$name";


}