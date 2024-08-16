class LedModel {
  String c;
  String col;
  String g;
  String status;
  String v;

  LedModel({
    required this.c,
    required this.col,
    required this.g,
    required this.status,
    required this.v,
  });

  Map<String, dynamic> toJson() {
    return {
      'c': c,
      'col': col,
      'g': g,
      'status': status,
      'v': v,
    };
  }

  factory LedModel.fromJson(Map<String, dynamic> json) {
    return LedModel(
      c: json['c'] as String? ?? '',
      col: json['col'] as String? ?? '',
      g: json['g'] as String? ?? '',
      status: json['status'] as String? ?? '',
      v: json['v'] as String? ?? '',
    );
  }
}
