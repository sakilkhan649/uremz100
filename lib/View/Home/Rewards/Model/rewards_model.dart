class RewardStepModel {
  final String coins;
  final String time;

  RewardStepModel({required this.coins, required this.time});
}

class BenefitTaskModel {
  final String title;
  final String? subtitle;
  final String? coinsLabel;
  final String buttonText;
  final bool isHighlight;
  final String layoutType; // 'subtitle_coins' or 'top_coins'
  final bool isClaimed;

  BenefitTaskModel({
    required this.title,
    this.subtitle,
    this.coinsLabel,
    required this.buttonText,
    this.isHighlight = false,
    this.layoutType = 'top_coins',
    this.isClaimed = false,
  });
}
