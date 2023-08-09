/// Parses and store individual clan member information.
class ClanMember {
  final String tag;
  final String name;
  final String role;
  final int expLevel;
  final String leagueName;
  final String? leagueIcon;
  final String leagueIconSmall;
  final int trophy;
  final int bbTrophy;
  final int verTrophy;
  final int clanRank;
  final int donation;
  final int donated;
  final String bbLeagueName;
  /// Constructor.
  ClanMember(this.tag, this.name, this.role, this.expLevel, this.leagueName, this.leagueIcon, this.trophy, this.bbTrophy, this.verTrophy, this.clanRank, this.donated, this.donation, this.bbLeagueName, this.leagueIconSmall);
  /// Parses json into constructor.
  factory ClanMember.fromJson(dynamic json, int index) {
    return ClanMember(json['memberList'][index]['tag'] as String, json['memberList'][index]['name'] as String,
    json['memberList'][index]['role'] as String, json['memberList'][index]['expLevel'] as int, json['memberList'][index]['league']['name'] as String, json['memberList'][index]['league']['iconUrls']['medium'] as String?,
      json['memberList'][index]['trophies'] as int, json['memberList'][index]['builderBaseTrophies'] as int, json['memberList'][index]['versusTrophies'] as int,
      json['memberList'][index]['clanRank'] as int, json['memberList'][index]['donations'] as int, json['memberList'][index]['donationsReceived'] as int, json['memberList'][index]['builderBaseLeague']['name'] as String, json['memberList'][index]['league']['iconUrls']['small'] as String
    );
  }
}
/// Parses and store clan related information.
class Clan {
  final String tag;
  final String name;
  final String badgeUrl;
  final int level;
  final int point;
  final int bbPoint;
  final int verPoint;
  final int capitalPoint;
  final int warWins;
  final int warTies;
  final int warLosses;
  final String warLeague;
  final int members;
  final List tempMemberList;
  final List memberList = [];
  final String description;
  final String location;
  /// Constructor.
  Clan(this.tag, this.name, this.badgeUrl, this.level, this.point, this.bbPoint, this.verPoint, this.capitalPoint, this.warWins, this.warTies, this.warLosses, this.warLeague, this.members, this.tempMemberList, this.description, this.location);
  /// Parses and stores in constructor.
  factory Clan.fromJson(dynamic json) {
    return Clan(json['tag'] as String, json['name'] as String, json['badgeUrls']['medium'] as String, json['clanLevel'] as int, json['clanPoints'] as int,
        json['clanBuilderBasePoints'] as int, json['clanVersusPoints'] as int, json['clanCapitalPoints'] as int,
        json['warWins'] as int, json['warTies'] as int, json['warLosses'] as int, json['warLeague']['name'] as String, json['members'] as int, json['memberList'] as List, json['description'] as String, json['location']['name'] as String,
    );
  }
}

