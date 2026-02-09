import 'package:get/get.dart';
import '../Model/rewards_model.dart';

class RewardsController extends GetxController {
  // Data using models
  final RxList<RewardStepModel> rewardsSteps = <RewardStepModel>[
    RewardStepModel(coins: "+10", time: "5mins"),
    RewardStepModel(coins: "+15", time: "10mins"),
    RewardStepModel(coins: "+20", time: "20mins"),
    RewardStepModel(coins: "+25", time: "30mins"),
    RewardStepModel(coins: "+30", time: "40mins"),
  ].obs;

  final RxList<BenefitTaskModel> todayBenefits = <BenefitTaskModel>[
    BenefitTaskModel(
      layoutType: "subtitle_coins",
      title: "Check-in",
      subtitle: "Check-in streak 7 days ",
      coinsLabel: "+540",
      buttonText: "Go",
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Turn On Notifications",
      coinsLabel: "30",
      buttonText: "Go",
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Watch Ads, Earn Bonus",
      coinsLabel: "10",
      buttonText: "Go",
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Login Rewards",
      coinsLabel: "50",
      buttonText: "Claim",
      isHighlight: true,
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Bind Email",
      coinsLabel: "30",
      buttonText: "Go",
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Follow us on Facebook",
      coinsLabel: "20",
      buttonText: "Go",
    ),
    BenefitTaskModel(
      layoutType: "top_coins",
      title: "Follow us on Instragram",
      coinsLabel: "20",
      buttonText: "Go",
    ),
  ].obs;

  final RxList<String> descriptions = <String>[
    "1. All interpretation rights of bonus belong to Shortmax.",
    "2. Bonus can only be used to watch dramas, valid for 5 days, and will be automatically expired and liquidated after expiration.",
    "3. Gold coins will be used first when watching dramas, If not enough, Bonus will be used automatically.",
  ].obs;
}
