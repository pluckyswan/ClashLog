/// Parses and stores war related information.
class WarLog {
  final String? result;
  final String endTime;
  final int teamSize;
  final int attacksPerMember;
  final String clanTag;
  final String clanName;
  final String clanBadgeUrl;
  final int clanLevel;
  final int clanAttack;
  final int clanStar;
  final double clanDestructionPercentage;
  final int clanExpEarned;
  final String? oppTag;
  final String? oppName;
  final String oppBadgeUrl;
  final int oppLevel;
  final int oppStar;
  final double oppDestructionPercentage;
  /// Constructor.
  WarLog(this.result, this.endTime, this.teamSize, this.attacksPerMember, this.clanTag, this.clanName, this.clanBadgeUrl, this.clanLevel, this.clanAttack, this.clanStar, this.clanDestructionPercentage, this.clanExpEarned, this.oppTag, this.oppName, this.oppBadgeUrl, this.oppLevel, this.oppStar, this.oppDestructionPercentage);
  /// Factory constructor to parse json.
  factory WarLog.fromJson(dynamic json, int index) {
    return WarLog(json['items'][index]['result'] as String?, json['items'][index]['endTime'] as String, json['items'][index]['teamSize'] as int, json['items'][index]['attacksPerMember'] as int,
      json['items'][index]['clan']['tag'] as String, json['items'][index]['clan']['name'] as String, json['items'][index]['clan']['badgeUrls']['medium'] as String, json['items'][index]['clan']['clanLevel'] as int,
      json['items'][index]['clan']['attacks'] as int, json['items'][index]['clan']['stars'] as int, json['items'][index]['clan']['destructionPercentage'] as double, json['items'][index]['clan']['expEarned'] as int,
      json['items'][index]['opponent']['tag'] as String?, json['items'][index]['opponent']['name'] as String?, json['items'][index]['opponent']['badgeUrls']['medium'] as String, json['items'][index]['opponent']['clanLevel'] as int,
     json['items'][index]['opponent']['stars'] as int, json['items'][index]['opponent']['destructionPercentage'] as double,
    );
  }
}