import 'package:get/get.dart';

class RewardsController extends GetxController {
  // Mock data for the progressive rewards
  final RxList<Map<String, dynamic>> rewardsSteps = <Map<String, dynamic>>[
    {"coins": "+10", "time": "5mins"},
    {"coins": "+15", "time": "10mins"},
    {"coins": "+20", "time": "20mins"},
    {"coins": "+25", "time": "30mins"},
    {"coins": "+30", "time": "40mins"},
  ].obs;

  // Mock data for Today's Benefits
  final RxList<Map<String, dynamic>> todayBenefits = <Map<String, dynamic>>[
    {
      "layoutType": "subtitle_coins",
      "title": "Check-in",
      "subtitle": "Check-in streak 7 days ",
      "coins": "+540",
      "buttonText": "Go",
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Turn On Notifications",
      "coins": "30",
      "buttonText": "Go",
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Watch Ads, Earn Bonus",
      "coins": "10",
      "buttonText": "Go",
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Login Rewards",
      "coins": "50",
      "buttonText": "Claim",
      "isHighlight": true,
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Bind Email",
      "coins": "30",
      "buttonText": "Go",
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Follow us on Facebook",
      "coins": "20",
      "buttonText": "Go",
      "isClaimed": false,
    },
    {
      "layoutType": "top_coins",
      "title": "Follow us on Instragram",
      "coins": "20",
      "buttonText": "Go",
      "isClaimed": false,
    },
  ].obs;

  final RxList<String> descriptions = <String>[
    "1. All interpretation rights of bonus belong to Shortmax.",
    "2. Bonus can only be used to watch dramas, valid for 5 days, and will be automatically expired and liquidated after expiration.",
    "3. Gold coins will be used first when watching dramas, If not enough, Bonus will be used automatically.",
  ].obs;
}
