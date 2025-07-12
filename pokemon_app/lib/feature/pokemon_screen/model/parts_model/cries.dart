class Cries {
  final String latest;
  final String legacy;

  Cries({required this.latest, required this.legacy});

  factory Cries.fromJson(Map<String, dynamic> json) {
    return Cries(latest: json["latest"], legacy: json["legacy"]);
  }
}
