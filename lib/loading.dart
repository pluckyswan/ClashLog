import 'dart:convert';
import 'package:clash_log/war_class.dart';
import 'package:http/http.dart' as http;
import 'clan_class.dart';
/// Holds clan information.
late Clan clan;
/// Holds war information.
late WarLog war;
/// Stores war information into list.
List log = [];
/// Stores custom token to access API.
const token = "API-KEY";
/// Fetches clan related information.
fetchClanClass(String tag) async {
  final response = await http.get(
    Uri.parse('https://api.clashofclans.com/v1/clans/%23$tag'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  final json = jsonDecode(response.body);
  final status = response.statusCode;
  if (status == 200) {
    clan = Clan.fromJson(json);
    for (int i = 0; i < clan.members; i++) {
      clan.memberList.add(ClanMember.fromJson(json, i));
    }
    fetchWarClass(tag);
  }
  else if (status == 404) {
    return false;
  }
  return true;
}
/// Fetches war related information.
fetchWarClass(String tag) async {
  final response = await http.get(
    Uri.parse('https://api.clashofclans.com/v1/clans/%23$tag/warlog'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  final json = jsonDecode(response.body);
  final status = response.statusCode;
  final size = json['items'].length;
  if (status == 200) {
    for (int i = 0; i < size; i++) {
      war = WarLog.fromJson(json, i);
      log.add(war);
    }
  }
  else if (status == 404) {
    print('Clan does not exist');
  }
}
/// Fetches current war information.
fetchCurrClass(String tag) async {
  final response = await http.get(
    Uri.parse('https://api.clashofclans.com/v1/clans/%23$tag/currentwar'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  final json = jsonDecode(response.body);
  print(json);
}
