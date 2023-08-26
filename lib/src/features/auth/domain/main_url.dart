class MainUrl {
  String mainUrl = 'http://sipunggur.iotsiskom.com/';
  static String _token = '';

  void setToken(String? data) {
    if (data != null) {
      _token = data;
    }
  }

  String getToken() {
    return _token;
  }
}
