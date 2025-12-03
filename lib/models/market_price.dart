class MarketPrice {
  MarketPrice({
    required this.state,
    required this.district,
    required this.mandiName,
    required this.cropName,
    required this.variety,
    required this.grade,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
  });

  final String state;
  final String district;
  final String mandiName;
  final String cropName;
  final String variety;
  final String grade;
  final String arrivalDate;
  final double minPrice;
  final double maxPrice;
  final double modalPrice;

  // Computed properties for UI compatibility
  String get location => '$district, $state';
  int get currentPrice => modalPrice.toInt();
  // We don't have previous price from this API, so we'll use minPrice as a proxy or 0
  int get previousPrice => minPrice.toInt(); 

  double get percentChange {
    if (previousPrice == 0) return 0;
    return ((currentPrice - previousPrice) / previousPrice) * 100;
  }

  String get cropKey => cropName.toLowerCase();

  double get estimatedProfit => (currentPrice - previousPrice).toDouble();

  factory MarketPrice.fromJson(Map<String, dynamic> json) {
    return MarketPrice(
      state: json['state'] ?? '',
      district: json['district'] ?? '',
      mandiName: json['market'] ?? '',
      cropName: json['commodity'] ?? '',
      variety: json['variety'] ?? '',
      grade: json['grade'] ?? '',
      arrivalDate: json['arrival_date'] ?? '',
      minPrice: double.tryParse(json['min_price']?.toString() ?? '0') ?? 0,
      maxPrice: double.tryParse(json['max_price']?.toString() ?? '0') ?? 0,
      modalPrice: double.tryParse(json['modal_price']?.toString() ?? '0') ?? 0,
    );
  }
}
