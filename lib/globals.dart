var _baseUrl = 'https://fantomtask.herokuapp.com/';

class Api {
  static String get loginUrl => _baseUrl + 'login';
  static String get fetchAllNft => _baseUrl + 'nft/all/:page';
}