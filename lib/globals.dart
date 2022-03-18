// ignore_for_file: constant_identifier_names

const String base_url = 'https://mashtoz.org';
const api_url = base_url + '/api/v1';

class Api {
  //login
  static String get loginUrl => api_url + '/login';
  //register
  static String get resgisterUrl => api_url + '/register';

  //category list
  static String get categoryListUrl => api_url + '/libraries/categoryList';

  //library_categroy by id
  static libraryCategoryId(id) => api_url + '/libraries/$id';
}
