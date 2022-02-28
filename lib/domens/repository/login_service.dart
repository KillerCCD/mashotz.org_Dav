import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mashtoz_flutter/domens/entity/user.dart';

class LoginService {
  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzBjYzMxNzNhZjI0MTY4NmNiODhiMTg0NDZjNTUxMjE0YWUyOGMwODc3ZmEzMTRkZmJiYjdiMTgxOWE3Mjc2N2EzZjU4NWZjNWVkZmMzOWYiLCJpYXQiOjE2NDI3ODAyNTMsIm5iZiI6MTY0Mjc4MDI1MywiZXhwIjoxNjc0MzE2MjUzLCJzdWIiOiIxNiIsInNjb3BlcyI6W119.VRkfqtqW9Fc41LBb81LYovzVyCe2qktuy1LqanRQffUcyfIil_EUYzJu1Ij63FQ4gjRo1PIN9uHfQHrK8gtX0a4zCGuAYPXWAOY7hyZDwnUtTLvYJXVDPL2bdsef48T9lQF7XTyZSk20_m0JhdC_C8zYwn5w2EIqjnt6f-9qvrkbpAuHbUkNpwUVWoIxAhoDT5QnN1cD_30tpEgnTTS36_k_uTrHrm0QjgTBFe4wjlv4gEacDrtmA4qnVb3dB-VppAuowhldurlYKCTCVmCWOpcrQ-Ufl2pTpFZE4Z6bcP8uda9b5CTvsfrzhy5u9YhZGoNMbSh18aNSg1gUlsjWjTMVTsquVGKCWUvHCya4Rcz__TgaTCnZ8GLtUtv0TV4KqVl-PI-L7jZmTYc40Ut7Z2JoPNQ1XmM62XzDgo2pmjgo6Cie2E24MckqY';
  var url = Uri.parse(
      'https://phpstack-351614-1150808.cloudwaysapps.com/api/customer');
  Future<List<User>?> login(Map user) async {
    try {
      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (request.statusCode == 200) {
        List jsonResponse = json.decode(request.body);
        return jsonResponse.map((data) => User.fromJson(data)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
