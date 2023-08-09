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
const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImJlMjk0MDRmLTZlZTctNDczMS05YzZiLTBkNDMwZjgxMmM0OSIsImlhdCI6MTY5MDE0NTk3Mywic3ViIjoiZGV2ZWxvcGVyLzFmMzQ0YWQ2LTE4OWUtZjRhMC00ZGU1LTk4NDliNzdhMTA0YSIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjEwNC4yLjE0Mi4yMDAiXSwidHlwZSI6ImNsaWVudCJ9XX0.eL1nLd-z_PPQKECy5PniVD5RwYr1hzJ7rGjBPWpTV7HDbaGeOJ_ttgWDlCtQVRcsdXG2dQIJ4AE6Ph3egP96WQ';
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
