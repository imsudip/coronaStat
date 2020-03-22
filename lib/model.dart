class WorldStat {
  List<CountriesStat> countriesStat;
  String statisticTakenAt;

  WorldStat({this.countriesStat, this.statisticTakenAt});

  WorldStat.fromJson(Map<String, dynamic> json) {
    if (json['countries_stat'] != null) {
      countriesStat = new List<CountriesStat>();
      json['countries_stat'].forEach((v) {
        countriesStat.add(new CountriesStat.fromJson(v));
      });
    }
    statisticTakenAt = json['statistic_taken_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countriesStat != null) {
      data['countries_stat'] =
          this.countriesStat.map((v) => v.toJson()).toList();
    }
    data['statistic_taken_at'] = this.statisticTakenAt;
    return data;
  }
}

class CountriesStat {
  String countryName;
  String cases;
  String deaths;
  String region;
  String totalRecovered;
  String newDeaths;
  String newCases;
  String seriousCritical;
  String activeCases;
  String totalCasesPer1mPopulation;

  CountriesStat(
      {this.countryName,
      this.cases,
      this.deaths,
      this.region,
      this.totalRecovered,
      this.newDeaths,
      this.newCases,
      this.seriousCritical,
      this.activeCases,
      this.totalCasesPer1mPopulation});

  CountriesStat.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    cases = json['cases'];
    deaths = json['deaths'];
    region = json['region'];
    totalRecovered = json['total_recovered'];
    newDeaths = json['new_deaths'];
    newCases = json['new_cases'];
    seriousCritical = json['serious_critical'];
    activeCases = json['active_cases'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['region'] = this.region;
    data['total_recovered'] = this.totalRecovered;
    data['new_deaths'] = this.newDeaths;
    data['new_cases'] = this.newCases;
    data['serious_critical'] = this.seriousCritical;
    data['active_cases'] = this.activeCases;
    data['total_cases_per_1m_population'] = this.totalCasesPer1mPopulation;
    return data;
  }
}

class SearchCountry {
  String country;
  List<LatestStatByCountry> latestStatByCountry;

  SearchCountry({this.country, this.latestStatByCountry});

  SearchCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['latest_stat_by_country'] != null) {
      latestStatByCountry = new List<LatestStatByCountry>();
      json['latest_stat_by_country'].forEach((v) {
        latestStatByCountry.add(new LatestStatByCountry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.latestStatByCountry != null) {
      data['latest_stat_by_country'] =
          this.latestStatByCountry.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestStatByCountry {
  String id;
  String countryName;
  String totalCases;
  String newCases;
  String activeCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String seriousCritical;
  Null region;
  String totalCasesPer1m;
  String recordDate;

  LatestStatByCountry(
      {this.id,
      this.countryName,
      this.totalCases,
      this.newCases,
      this.activeCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.seriousCritical,
      this.region,
      this.totalCasesPer1m,
      this.recordDate});

  LatestStatByCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    activeCases = json['active_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    seriousCritical = json['serious_critical'];
    region = json['region'];
    totalCasesPer1m = json['total_cases_per1m'];
    recordDate = json['record_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_name'] = this.countryName;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['active_cases'] = this.activeCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['serious_critical'] = this.seriousCritical;
    data['region'] = this.region;
    data['total_cases_per1m'] = this.totalCasesPer1m;
    data['record_date'] = this.recordDate;
    return data;
  }
}
class World {
  String totalCases;
  String totalDeaths;
  String totalRecovered;
  String newCases;
  String newDeaths;
  String statisticTakenAt;

  World(
      {this.totalCases,
      this.totalDeaths,
      this.totalRecovered,
      this.newCases,
      this.newDeaths,
      this.statisticTakenAt});

  World.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    totalDeaths = json['total_deaths'];
    totalRecovered = json['total_recovered'];
    newCases = json['new_cases'];
    newDeaths = json['new_deaths'];
    statisticTakenAt = json['statistic_taken_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cases'] = this.totalCases;
    data['total_deaths'] = this.totalDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['new_cases'] = this.newCases;
    data['new_deaths'] = this.newDeaths;
    data['statistic_taken_at'] = this.statisticTakenAt;
    return data;
  }
}