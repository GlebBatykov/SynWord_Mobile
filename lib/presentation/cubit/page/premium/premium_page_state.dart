part of 'premium_page_cubit.dart';

@immutable
abstract class PremiumPageState {}

class PremiumPageInitial extends PremiumPageState {}

class PremiumPageShow extends PremiumPageState {}

class PremiumPageLoad extends PremiumPageState {}

class PremiumPageActive extends PremiumPageState {}

class PremiumPageSilverActive extends PremiumPageActive {}

class PremiumPageGoldActive extends PremiumPageActive {}
