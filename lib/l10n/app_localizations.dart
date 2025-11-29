import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_zu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('hi', 'KH'),
    Locale('kn'),
    Locale('zu'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'FarmAura'**
  String get appTitle;

  /// No description provided for @dashboardGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get dashboardGreetingMorning;

  /// No description provided for @dashboardGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get dashboardGreetingAfternoon;

  /// No description provided for @dashboardGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get dashboardGreetingEvening;

  /// No description provided for @cropAdvisor.
  ///
  /// In en, this message translates to:
  /// **'Crop advisor'**
  String get cropAdvisor;

  /// No description provided for @pestScanner.
  ///
  /// In en, this message translates to:
  /// **'Pest scanner'**
  String get pestScanner;

  /// No description provided for @soilTest.
  ///
  /// In en, this message translates to:
  /// **'Soil test'**
  String get soilTest;

  /// No description provided for @marketPrices.
  ///
  /// In en, this message translates to:
  /// **'Market prices'**
  String get marketPrices;

  /// No description provided for @profitAndLoss.
  ///
  /// In en, this message translates to:
  /// **'Profit & loss'**
  String get profitAndLoss;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Ask KrishiMitra anything…'**
  String get searchHint;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @importantUpdates.
  ///
  /// In en, this message translates to:
  /// **'Important updates'**
  String get importantUpdates;

  /// No description provided for @farmPerformance.
  ///
  /// In en, this message translates to:
  /// **'Farm performance'**
  String get farmPerformance;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @personalFinance.
  ///
  /// In en, this message translates to:
  /// **'Personal finance'**
  String get personalFinance;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @soilHealthCardUpload.
  ///
  /// In en, this message translates to:
  /// **'Soil health card upload'**
  String get soilHealthCardUpload;

  /// No description provided for @governmentSchemes.
  ///
  /// In en, this message translates to:
  /// **'Government schemes'**
  String get governmentSchemes;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @myFarmSummary.
  ///
  /// In en, this message translates to:
  /// **'My farm summary'**
  String get myFarmSummary;

  /// No description provided for @cropHistory.
  ///
  /// In en, this message translates to:
  /// **'Crop history'**
  String get cropHistory;

  /// No description provided for @savedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Saved recommendations'**
  String get savedRecommendations;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @cropsGrown.
  ///
  /// In en, this message translates to:
  /// **'Crops grown'**
  String get cropsGrown;

  /// No description provided for @activeFields.
  ///
  /// In en, this message translates to:
  /// **'Active fields'**
  String get activeFields;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @landSize.
  ///
  /// In en, this message translates to:
  /// **'Land size'**
  String get landSize;

  /// No description provided for @irrigation.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigation;

  /// No description provided for @soilType.
  ///
  /// In en, this message translates to:
  /// **'Soil type'**
  String get soilType;

  /// No description provided for @mainCrops.
  ///
  /// In en, this message translates to:
  /// **'Main crops'**
  String get mainCrops;

  /// No description provided for @noCropHistory.
  ///
  /// In en, this message translates to:
  /// **'No crop history yet'**
  String get noCropHistory;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @manageFarms.
  ///
  /// In en, this message translates to:
  /// **'Manage farms'**
  String get manageFarms;

  /// No description provided for @govJharkhand.
  ///
  /// In en, this message translates to:
  /// **'Government of Jharkhand'**
  String get govJharkhand;

  /// No description provided for @govSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Smart farming pilot partner'**
  String get govSubtitle;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @financialOverview.
  ///
  /// In en, this message translates to:
  /// **'Financial overview'**
  String get financialOverview;

  /// No description provided for @totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total revenue'**
  String get totalRevenue;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net profit'**
  String get netProfit;

  /// No description provided for @profitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit margin'**
  String get profitMargin;

  /// No description provided for @addIncome.
  ///
  /// In en, this message translates to:
  /// **'Add income'**
  String get addIncome;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get addExpense;

  /// No description provided for @savingsGoals.
  ///
  /// In en, this message translates to:
  /// **'Savings goals'**
  String get savingsGoals;

  /// No description provided for @activeLoans.
  ///
  /// In en, this message translates to:
  /// **'Active loans'**
  String get activeLoans;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recentTransactions;

  /// No description provided for @monthlyProfitTrend.
  ///
  /// In en, this message translates to:
  /// **'Monthly profit trend'**
  String get monthlyProfitTrend;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @quarter.
  ///
  /// In en, this message translates to:
  /// **'Quarter'**
  String get quarter;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @cropWiseAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Crop-wise analysis'**
  String get cropWiseAnalysis;

  /// No description provided for @investment.
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get investment;

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @expenseBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Expense breakdown'**
  String get expenseBreakdown;

  /// No description provided for @upcomingPayments.
  ///
  /// In en, this message translates to:
  /// **'Upcoming payments'**
  String get upcomingPayments;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updated;

  /// No description provided for @bestMandi.
  ///
  /// In en, this message translates to:
  /// **'Best Mandi for {crop}'**
  String bestMandi(String crop);

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @alsoGoodOption.
  ///
  /// In en, this message translates to:
  /// **'Also good option'**
  String get alsoGoodOption;

  /// No description provided for @alternativeMandi.
  ///
  /// In en, this message translates to:
  /// **'Alternative Mandi'**
  String get alternativeMandi;

  /// No description provided for @sellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get sellingPrice;

  /// No description provided for @transportCost.
  ///
  /// In en, this message translates to:
  /// **'Transport Cost'**
  String get transportCost;

  /// No description provided for @estimatedNetProfit.
  ///
  /// In en, this message translates to:
  /// **'Est. Net Profit'**
  String get estimatedNetProfit;

  /// No description provided for @allMarketPrices.
  ///
  /// In en, this message translates to:
  /// **'All Market Prices'**
  String get allMarketPrices;

  /// No description provided for @fetchingPrices.
  ///
  /// In en, this message translates to:
  /// **'Fetching prices...'**
  String get fetchingPrices;

  /// No description provided for @couldNotLoadPrices.
  ///
  /// In en, this message translates to:
  /// **'Could not load prices'**
  String get couldNotLoadPrices;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noPricesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No prices available'**
  String get noPricesAvailable;

  /// No description provided for @livePrices.
  ///
  /// In en, this message translates to:
  /// **'Live prices from nearby mandis'**
  String get livePrices;

  /// No description provided for @yield.
  ///
  /// In en, this message translates to:
  /// **'Yield'**
  String get yield;

  /// No description provided for @profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @pestDetection.
  ///
  /// In en, this message translates to:
  /// **'Pest detection'**
  String get pestDetection;

  /// No description provided for @pestDetectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Upload a photo of the affected crop leaf to detect pests.'**
  String get pestDetectionSubtitle;

  /// No description provided for @pestDetectionInfo.
  ///
  /// In en, this message translates to:
  /// **'Use a clear, close-up photo in good lighting.'**
  String get pestDetectionInfo;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera'**
  String get openCamera;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get uploadImage;

  /// No description provided for @leafBlightDetected.
  ///
  /// In en, this message translates to:
  /// **'Leaf blight detected'**
  String get leafBlightDetected;

  /// No description provided for @severityHigh.
  ///
  /// In en, this message translates to:
  /// **'Severity: High'**
  String get severityHigh;

  /// No description provided for @recommendedActions.
  ///
  /// In en, this message translates to:
  /// **'Recommended actions'**
  String get recommendedActions;

  /// No description provided for @chemicalControl.
  ///
  /// In en, this message translates to:
  /// **'Chemical control'**
  String get chemicalControl;

  /// No description provided for @biologicalControl.
  ///
  /// In en, this message translates to:
  /// **'Biological control'**
  String get biologicalControl;

  /// No description provided for @organicAlternativeTitle.
  ///
  /// In en, this message translates to:
  /// **'Organic alternative'**
  String get organicAlternativeTitle;

  /// No description provided for @organicAlternativeDesc.
  ///
  /// In en, this message translates to:
  /// **'Use approved organic formulations and follow dosage instructions.'**
  String get organicAlternativeDesc;

  /// No description provided for @scanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan again'**
  String get scanAgain;

  /// No description provided for @saveReport.
  ///
  /// In en, this message translates to:
  /// **'Save report'**
  String get saveReport;

  /// No description provided for @farmer.
  ///
  /// In en, this message translates to:
  /// **'Farmer'**
  String get farmer;

  /// No description provided for @jharkhand.
  ///
  /// In en, this message translates to:
  /// **'Jharkhand'**
  String get jharkhand;

  /// No description provided for @noSavedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'No saved recommendations yet.'**
  String get noSavedRecommendations;

  /// No description provided for @suitability.
  ///
  /// In en, this message translates to:
  /// **'Suitability'**
  String get suitability;

  /// No description provided for @logoutClicked.
  ///
  /// In en, this message translates to:
  /// **'Logout clicked'**
  String get logoutClicked;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @privacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & security'**
  String get privacySecurity;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'View how your data is used.'**
  String get privacyPolicySubtitle;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfService;

  /// No description provided for @termsOfServiceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Read the terms of using this app.'**
  String get termsOfServiceSubtitle;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @helpSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help from the FarmAura team.'**
  String get helpSupportSubtitle;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn more about FarmAura.'**
  String get aboutSubtitle;

  /// No description provided for @whyCropTitle.
  ///
  /// In en, this message translates to:
  /// **'Why was {crop} recommended?'**
  String whyCropTitle(String crop);

  /// No description provided for @whyCropSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Detailed reasoning for {crop} based on soil, weather, and market conditions.'**
  String whyCropSubtitle(String crop);

  /// No description provided for @suitabilityScore.
  ///
  /// In en, this message translates to:
  /// **'Suitability score'**
  String get suitabilityScore;

  /// No description provided for @highlyRecommended.
  ///
  /// In en, this message translates to:
  /// **'Highly recommended'**
  String get highlyRecommended;

  /// No description provided for @keyFactors.
  ///
  /// In en, this message translates to:
  /// **'Key factors'**
  String get keyFactors;

  /// No description provided for @excellentSoilMatch.
  ///
  /// In en, this message translates to:
  /// **'Excellent soil match'**
  String get excellentSoilMatch;

  /// No description provided for @weatherSuitability.
  ///
  /// In en, this message translates to:
  /// **'Weather suitability'**
  String get weatherSuitability;

  /// No description provided for @rotationBenefit.
  ///
  /// In en, this message translates to:
  /// **'Rotation benefit'**
  String get rotationBenefit;

  /// No description provided for @marketAdvantage.
  ///
  /// In en, this message translates to:
  /// **'Market advantage'**
  String get marketAdvantage;

  /// No description provided for @growthTimeline.
  ///
  /// In en, this message translates to:
  /// **'Growth timeline'**
  String get growthTimeline;

  /// No description provided for @sowing.
  ///
  /// In en, this message translates to:
  /// **'Sowing'**
  String get sowing;

  /// No description provided for @germination.
  ///
  /// In en, this message translates to:
  /// **'Germination'**
  String get germination;

  /// No description provided for @vegetative.
  ///
  /// In en, this message translates to:
  /// **'Vegetative'**
  String get vegetative;

  /// No description provided for @flowering.
  ///
  /// In en, this message translates to:
  /// **'Flowering'**
  String get flowering;

  /// No description provided for @bollFormation.
  ///
  /// In en, this message translates to:
  /// **'Boll formation'**
  String get bollFormation;

  /// No description provided for @harvest.
  ///
  /// In en, this message translates to:
  /// **'Harvest'**
  String get harvest;

  /// No description provided for @proTip.
  ///
  /// In en, this message translates to:
  /// **'Pro tip'**
  String get proTip;

  /// No description provided for @backToResults.
  ///
  /// In en, this message translates to:
  /// **'Back to results'**
  String get backToResults;

  /// No description provided for @savePlan.
  ///
  /// In en, this message translates to:
  /// **'Save plan'**
  String get savePlan;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @weatherForecast.
  ///
  /// In en, this message translates to:
  /// **'Weather forecast'**
  String get weatherForecast;

  /// No description provided for @feelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels like'**
  String get feelsLike;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get wind;

  /// No description provided for @visibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get visibility;

  /// No description provided for @pressure.
  ///
  /// In en, this message translates to:
  /// **'Pressure'**
  String get pressure;

  /// No description provided for @sevenDayForecast.
  ///
  /// In en, this message translates to:
  /// **'7-day forecast'**
  String get sevenDayForecast;

  /// No description provided for @heavyRainWarning.
  ///
  /// In en, this message translates to:
  /// **'Heavy rain warning'**
  String get heavyRainWarning;

  /// No description provided for @nitrogen.
  ///
  /// In en, this message translates to:
  /// **'Nitrogen'**
  String get nitrogen;

  /// No description provided for @phosphorus.
  ///
  /// In en, this message translates to:
  /// **'Phosphorus'**
  String get phosphorus;

  /// No description provided for @potassium.
  ///
  /// In en, this message translates to:
  /// **'Potassium'**
  String get potassium;

  /// No description provided for @soilDetails.
  ///
  /// In en, this message translates to:
  /// **'Soil details'**
  String get soilDetails;

  /// No description provided for @soilStatusGood.
  ///
  /// In en, this message translates to:
  /// **'Soil status: Good'**
  String get soilStatusGood;

  /// No description provided for @maize.
  ///
  /// In en, this message translates to:
  /// **'Maize'**
  String get maize;

  /// No description provided for @wheat.
  ///
  /// In en, this message translates to:
  /// **'Wheat'**
  String get wheat;

  /// No description provided for @locationRequired.
  ///
  /// In en, this message translates to:
  /// **'Location required'**
  String get locationRequired;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @npkGood.
  ///
  /// In en, this message translates to:
  /// **'NPK levels good'**
  String get npkGood;

  /// No description provided for @pestAlertNearby.
  ///
  /// In en, this message translates to:
  /// **'Pest alert nearby'**
  String get pestAlertNearby;

  /// No description provided for @heavyRainTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Heavy rain tomorrow'**
  String get heavyRainTomorrow;

  /// No description provided for @wheatPrice.
  ///
  /// In en, this message translates to:
  /// **'Wheat price'**
  String get wheatPrice;

  /// No description provided for @cropHealth.
  ///
  /// In en, this message translates to:
  /// **'Crop health'**
  String get cropHealth;

  /// No description provided for @soilQuality.
  ///
  /// In en, this message translates to:
  /// **'Soil quality'**
  String get soilQuality;

  /// No description provided for @aiPowered.
  ///
  /// In en, this message translates to:
  /// **'AI powered'**
  String get aiPowered;

  /// No description provided for @cropAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Crop advisory'**
  String get cropAdvisory;

  /// No description provided for @getPersonalizedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Get personalized recommendations'**
  String get getPersonalizedRecommendations;

  /// No description provided for @startCropAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Start crop advisory'**
  String get startCropAdvisory;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @farmers.
  ///
  /// In en, this message translates to:
  /// **'Farmers'**
  String get farmers;

  /// No description provided for @crops.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get crops;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get howItWorks;

  /// No description provided for @enterFarmDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter farm details'**
  String get enterFarmDetails;

  /// No description provided for @provideInfo.
  ///
  /// In en, this message translates to:
  /// **'Provide info'**
  String get provideInfo;

  /// No description provided for @shareSoilData.
  ///
  /// In en, this message translates to:
  /// **'Share soil data'**
  String get shareSoilData;

  /// No description provided for @enterSoilInfo.
  ///
  /// In en, this message translates to:
  /// **'Enter soil info'**
  String get enterSoilInfo;

  /// No description provided for @getAiRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Get AI recommendations'**
  String get getAiRecommendations;

  /// No description provided for @receiveSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Receive suggestions'**
  String get receiveSuggestions;

  /// No description provided for @whyUseAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Why use advisory?'**
  String get whyUseAdvisory;

  /// No description provided for @maximizeProfits.
  ///
  /// In en, this message translates to:
  /// **'Maximize profits'**
  String get maximizeProfits;

  /// No description provided for @reduceRisk.
  ///
  /// In en, this message translates to:
  /// **'Reduce risk'**
  String get reduceRisk;

  /// No description provided for @marketDemandSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Market demand suggestions'**
  String get marketDemandSuggestions;

  /// No description provided for @growingGuides.
  ///
  /// In en, this message translates to:
  /// **'Growing guides'**
  String get growingGuides;

  /// No description provided for @cropDetails.
  ///
  /// In en, this message translates to:
  /// **'Crop details'**
  String get cropDetails;

  /// No description provided for @cotton.
  ///
  /// In en, this message translates to:
  /// **'Cotton'**
  String get cotton;

  /// No description provided for @expectedProfit.
  ///
  /// In en, this message translates to:
  /// **'Expected profit'**
  String get expectedProfit;

  /// No description provided for @perAcre.
  ///
  /// In en, this message translates to:
  /// **'Per acre'**
  String get perAcre;

  /// No description provided for @yieldEstimate.
  ///
  /// In en, this message translates to:
  /// **'Yield estimate'**
  String get yieldEstimate;

  /// No description provided for @growingRequirements.
  ///
  /// In en, this message translates to:
  /// **'Growing requirements'**
  String get growingRequirements;

  /// No description provided for @growingPeriod.
  ///
  /// In en, this message translates to:
  /// **'Growing period'**
  String get growingPeriod;

  /// No description provided for @growingPeriodValue.
  ///
  /// In en, this message translates to:
  /// **'150-180 days'**
  String get growingPeriodValue;

  /// No description provided for @waterRequirement.
  ///
  /// In en, this message translates to:
  /// **'Water requirement'**
  String get waterRequirement;

  /// No description provided for @waterRequirementValue.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get waterRequirementValue;

  /// No description provided for @temperatureRange.
  ///
  /// In en, this message translates to:
  /// **'Temperature range'**
  String get temperatureRange;

  /// No description provided for @temperatureRangeValue.
  ///
  /// In en, this message translates to:
  /// **'21°C - 30°C'**
  String get temperatureRangeValue;

  /// No description provided for @blackCottonSoilRedSoil.
  ///
  /// In en, this message translates to:
  /// **'Black cotton soil, Red soil'**
  String get blackCottonSoilRedSoil;

  /// No description provided for @phRange.
  ///
  /// In en, this message translates to:
  /// **'pH range'**
  String get phRange;

  /// No description provided for @phRangeValue.
  ///
  /// In en, this message translates to:
  /// **'5.5 - 8.5'**
  String get phRangeValue;

  /// No description provided for @rainfall.
  ///
  /// In en, this message translates to:
  /// **'Rainfall'**
  String get rainfall;

  /// No description provided for @rainfallValue.
  ///
  /// In en, this message translates to:
  /// **'500-1000mm'**
  String get rainfallValue;

  /// No description provided for @growingStages.
  ///
  /// In en, this message translates to:
  /// **'Growing stages'**
  String get growingStages;

  /// No description provided for @sowingDesc.
  ///
  /// In en, this message translates to:
  /// **'Seed sowing and germination phase'**
  String get sowingDesc;

  /// No description provided for @vegetativeDesc.
  ///
  /// In en, this message translates to:
  /// **'Leaf and stem development'**
  String get vegetativeDesc;

  /// No description provided for @floweringDesc.
  ///
  /// In en, this message translates to:
  /// **'Flower bud initiation and blooming'**
  String get floweringDesc;

  /// No description provided for @bollFormationDesc.
  ///
  /// In en, this message translates to:
  /// **'Boll development and maturation'**
  String get bollFormationDesc;

  /// No description provided for @harvesting.
  ///
  /// In en, this message translates to:
  /// **'Harvesting'**
  String get harvesting;

  /// No description provided for @harvestingDesc.
  ///
  /// In en, this message translates to:
  /// **'Picking of mature bolls'**
  String get harvestingDesc;

  /// No description provided for @fertilizerPlan.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer plan'**
  String get fertilizerPlan;

  /// No description provided for @basal.
  ///
  /// In en, this message translates to:
  /// **'Basal'**
  String get basal;

  /// No description provided for @dap.
  ///
  /// In en, this message translates to:
  /// **'DAP'**
  String get dap;

  /// No description provided for @firstDose.
  ///
  /// In en, this message translates to:
  /// **'1st Dose'**
  String get firstDose;

  /// No description provided for @urea.
  ///
  /// In en, this message translates to:
  /// **'Urea'**
  String get urea;

  /// No description provided for @secondDose.
  ///
  /// In en, this message translates to:
  /// **'2nd Dose'**
  String get secondDose;

  /// No description provided for @npk191919.
  ///
  /// In en, this message translates to:
  /// **'NPK 19:19:19'**
  String get npk191919;

  /// No description provided for @thirdDose.
  ///
  /// In en, this message translates to:
  /// **'3rd Dose'**
  String get thirdDose;

  /// No description provided for @potash.
  ///
  /// In en, this message translates to:
  /// **'Potash'**
  String get potash;

  /// No description provided for @irrigationSchedule.
  ///
  /// In en, this message translates to:
  /// **'Irrigation schedule'**
  String get irrigationSchedule;

  /// No description provided for @sowingToGermination.
  ///
  /// In en, this message translates to:
  /// **'Sowing to germination'**
  String get sowingToGermination;

  /// No description provided for @lightIrrigation.
  ///
  /// In en, this message translates to:
  /// **'Light irrigation'**
  String get lightIrrigation;

  /// No description provided for @vegetativeGrowth.
  ///
  /// In en, this message translates to:
  /// **'Vegetative growth'**
  String get vegetativeGrowth;

  /// No description provided for @every7to10Days.
  ///
  /// In en, this message translates to:
  /// **'Every 7-10 days'**
  String get every7to10Days;

  /// No description provided for @every5to7Days.
  ///
  /// In en, this message translates to:
  /// **'Every 5-7 days'**
  String get every5to7Days;

  /// No description provided for @bollDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Boll development'**
  String get bollDevelopment;

  /// No description provided for @marketInformation.
  ///
  /// In en, this message translates to:
  /// **'Market information'**
  String get marketInformation;

  /// No description provided for @currentPrice.
  ///
  /// In en, this message translates to:
  /// **'Current price'**
  String get currentPrice;

  /// No description provided for @marketTrend.
  ///
  /// In en, this message translates to:
  /// **'Market trend'**
  String get marketTrend;

  /// No description provided for @stable.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get stable;

  /// No description provided for @demand.
  ///
  /// In en, this message translates to:
  /// **'Demand'**
  String get demand;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @majorBuyers.
  ///
  /// In en, this message translates to:
  /// **'Major buyers'**
  String get majorBuyers;

  /// No description provided for @textileMillsExportMarket.
  ///
  /// In en, this message translates to:
  /// **'Textile mills, Export market'**
  String get textileMillsExportMarket;

  /// No description provided for @tryDifferentInputs.
  ///
  /// In en, this message translates to:
  /// **'Try different inputs'**
  String get tryDifferentInputs;

  /// No description provided for @viewMarketPrices.
  ///
  /// In en, this message translates to:
  /// **'View market prices'**
  String get viewMarketPrices;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @enterPhoneToContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to continue'**
  String get enterPhoneToContinue;

  /// No description provided for @enterShcNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Soil Health Card (SHC) number'**
  String get enterShcNumber;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @shcId.
  ///
  /// In en, this message translates to:
  /// **'SHC ID'**
  String get shcId;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @enterTenDigit.
  ///
  /// In en, this message translates to:
  /// **'Enter 10-digit number'**
  String get enterTenDigit;

  /// No description provided for @shcRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'SHC Registration Number'**
  String get shcRegistrationNumber;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInformation;

  /// No description provided for @helpUsKnowYou.
  ///
  /// In en, this message translates to:
  /// **'Help us know you better'**
  String get helpUsKnowYou;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @villageName.
  ///
  /// In en, this message translates to:
  /// **'Village name'**
  String get villageName;

  /// No description provided for @emailOptional.
  ///
  /// In en, this message translates to:
  /// **'Email (Optional)'**
  String get emailOptional;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @occupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupation;

  /// No description provided for @basedOnRegion.
  ///
  /// In en, this message translates to:
  /// **'Based on soil data for {region}'**
  String basedOnRegion(String region);

  /// No description provided for @soilProperties.
  ///
  /// In en, this message translates to:
  /// **'Soil properties'**
  String get soilProperties;

  /// No description provided for @phLevel.
  ///
  /// In en, this message translates to:
  /// **'pH Level'**
  String get phLevel;

  /// No description provided for @moisture.
  ///
  /// In en, this message translates to:
  /// **'Moisture'**
  String get moisture;

  /// No description provided for @organicMatter.
  ///
  /// In en, this message translates to:
  /// **'Organic matter'**
  String get organicMatter;

  /// No description provided for @ecSalinity.
  ///
  /// In en, this message translates to:
  /// **'EC (Salinity)'**
  String get ecSalinity;

  /// No description provided for @soilInsights.
  ///
  /// In en, this message translates to:
  /// **'Soil insights'**
  String get soilInsights;

  /// No description provided for @requestSoilTest.
  ///
  /// In en, this message translates to:
  /// **'Request Soil Test'**
  String get requestSoilTest;

  /// No description provided for @lessThanOneAcre.
  ///
  /// In en, this message translates to:
  /// **'Less than 1 acre'**
  String get lessThanOneAcre;

  /// No description provided for @oneToTwoAcres.
  ///
  /// In en, this message translates to:
  /// **'1-2 acres'**
  String get oneToTwoAcres;

  /// No description provided for @twoToFiveAcres.
  ///
  /// In en, this message translates to:
  /// **'2-5 acres'**
  String get twoToFiveAcres;

  /// No description provided for @fiveToTenAcres.
  ///
  /// In en, this message translates to:
  /// **'5-10 acres'**
  String get fiveToTenAcres;

  /// No description provided for @moreThanTenAcres.
  ///
  /// In en, this message translates to:
  /// **'More than 10 acres'**
  String get moreThanTenAcres;

  /// No description provided for @rainfed.
  ///
  /// In en, this message translates to:
  /// **'Rainfed'**
  String get rainfed;

  /// No description provided for @canal.
  ///
  /// In en, this message translates to:
  /// **'Canal'**
  String get canal;

  /// No description provided for @borewell.
  ///
  /// In en, this message translates to:
  /// **'Borewell'**
  String get borewell;

  /// No description provided for @drip.
  ///
  /// In en, this message translates to:
  /// **'Drip'**
  String get drip;

  /// No description provided for @sandy.
  ///
  /// In en, this message translates to:
  /// **'Sandy'**
  String get sandy;

  /// No description provided for @loamy.
  ///
  /// In en, this message translates to:
  /// **'Loamy'**
  String get loamy;

  /// No description provided for @clay.
  ///
  /// In en, this message translates to:
  /// **'Clay'**
  String get clay;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// No description provided for @black.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get black;

  /// No description provided for @fine.
  ///
  /// In en, this message translates to:
  /// **'Fine'**
  String get fine;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @coarse.
  ///
  /// In en, this message translates to:
  /// **'Coarse'**
  String get coarse;

  /// No description provided for @organicManure.
  ///
  /// In en, this message translates to:
  /// **'Organic manure'**
  String get organicManure;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @bags.
  ///
  /// In en, this message translates to:
  /// **'Bags'**
  String get bags;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @perStage.
  ///
  /// In en, this message translates to:
  /// **'Per stage'**
  String get perStage;

  /// No description provided for @otherManual.
  ///
  /// In en, this message translates to:
  /// **'Other (Manual)'**
  String get otherManual;

  /// No description provided for @otherSpecify.
  ///
  /// In en, this message translates to:
  /// **'Other (Specify)'**
  String get otherSpecify;

  /// No description provided for @rice.
  ///
  /// In en, this message translates to:
  /// **'Rice'**
  String get rice;

  /// No description provided for @sugarcane.
  ///
  /// In en, this message translates to:
  /// **'Sugarcane'**
  String get sugarcane;

  /// No description provided for @soybean.
  ///
  /// In en, this message translates to:
  /// **'Soybean'**
  String get soybean;

  /// No description provided for @tomato.
  ///
  /// In en, this message translates to:
  /// **'Tomato'**
  String get tomato;

  /// No description provided for @potato.
  ///
  /// In en, this message translates to:
  /// **'Potato'**
  String get potato;

  /// No description provided for @cropInput.
  ///
  /// In en, this message translates to:
  /// **'Crop input'**
  String get cropInput;

  /// No description provided for @cropAdvisoryForm.
  ///
  /// In en, this message translates to:
  /// **'Crop advisory form'**
  String get cropAdvisoryForm;

  /// No description provided for @fillDetails.
  ///
  /// In en, this message translates to:
  /// **'Fill details'**
  String get fillDetails;

  /// No description provided for @sectionFarmDetails.
  ///
  /// In en, this message translates to:
  /// **'Farm details'**
  String get sectionFarmDetails;

  /// No description provided for @enterLandSize.
  ///
  /// In en, this message translates to:
  /// **'Enter land size'**
  String get enterLandSize;

  /// No description provided for @irrigationType.
  ///
  /// In en, this message translates to:
  /// **'Irrigation type'**
  String get irrigationType;

  /// No description provided for @enterIrrigationType.
  ///
  /// In en, this message translates to:
  /// **'Enter irrigation type'**
  String get enterIrrigationType;

  /// No description provided for @sectionSoilInfo.
  ///
  /// In en, this message translates to:
  /// **'Soil info'**
  String get sectionSoilInfo;

  /// No description provided for @chooseInputMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose input method'**
  String get chooseInputMethod;

  /// No description provided for @autoDetect.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect'**
  String get autoDetect;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @shc.
  ///
  /// In en, this message translates to:
  /// **'SHC'**
  String get shc;

  /// No description provided for @enterSoilType.
  ///
  /// In en, this message translates to:
  /// **'Enter soil type'**
  String get enterSoilType;

  /// No description provided for @soilTexture.
  ///
  /// In en, this message translates to:
  /// **'Soil texture'**
  String get soilTexture;

  /// No description provided for @enterSoilTexture.
  ///
  /// In en, this message translates to:
  /// **'Enter soil texture'**
  String get enterSoilTexture;

  /// No description provided for @acidic.
  ///
  /// In en, this message translates to:
  /// **'Acidic'**
  String get acidic;

  /// No description provided for @neutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get neutral;

  /// No description provided for @alkaline.
  ///
  /// In en, this message translates to:
  /// **'Alkaline'**
  String get alkaline;

  /// No description provided for @soilMoisture.
  ///
  /// In en, this message translates to:
  /// **'Soil moisture'**
  String get soilMoisture;

  /// No description provided for @enterMoisture.
  ///
  /// In en, this message translates to:
  /// **'Enter moisture'**
  String get enterMoisture;

  /// No description provided for @uploadShc.
  ///
  /// In en, this message translates to:
  /// **'Upload SHC'**
  String get uploadShc;

  /// No description provided for @recommendedForAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Recommended for accuracy'**
  String get recommendedForAccuracy;

  /// No description provided for @shcNumber.
  ///
  /// In en, this message translates to:
  /// **'SHC Number'**
  String get shcNumber;

  /// No description provided for @enterShcNumberInput.
  ///
  /// In en, this message translates to:
  /// **'Enter SHC number'**
  String get enterShcNumberInput;

  /// No description provided for @testDate.
  ///
  /// In en, this message translates to:
  /// **'Test date'**
  String get testDate;

  /// No description provided for @sectionCropRotation.
  ///
  /// In en, this message translates to:
  /// **'Crop rotation'**
  String get sectionCropRotation;

  /// No description provided for @lastCropGrown.
  ///
  /// In en, this message translates to:
  /// **'Last crop grown'**
  String get lastCropGrown;

  /// No description provided for @enterLastCrop.
  ///
  /// In en, this message translates to:
  /// **'Enter last crop'**
  String get enterLastCrop;

  /// No description provided for @frequentCrop.
  ///
  /// In en, this message translates to:
  /// **'Frequent crop'**
  String get frequentCrop;

  /// No description provided for @enterFrequentCrop.
  ///
  /// In en, this message translates to:
  /// **'Enter frequent crop'**
  String get enterFrequentCrop;

  /// No description provided for @addFertilizer.
  ///
  /// In en, this message translates to:
  /// **'Add fertilizer'**
  String get addFertilizer;

  /// No description provided for @getRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Get recommendation'**
  String get getRecommendation;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Fill all fields'**
  String get fillAllFields;

  /// No description provided for @fertilizerDetails.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer details'**
  String get fertilizerDetails;

  /// No description provided for @selectFertilizer.
  ///
  /// In en, this message translates to:
  /// **'Select fertilizer'**
  String get selectFertilizer;

  /// No description provided for @enterFertilizerName.
  ///
  /// In en, this message translates to:
  /// **'Enter fertilizer name'**
  String get enterFertilizerName;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @enterCustomUnit.
  ///
  /// In en, this message translates to:
  /// **'Enter custom unit'**
  String get enterCustomUnit;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// No description provided for @specifyFrequency.
  ///
  /// In en, this message translates to:
  /// **'Specify frequency'**
  String get specifyFrequency;

  /// No description provided for @recommendedCrops.
  ///
  /// In en, this message translates to:
  /// **'Recommended crops'**
  String get recommendedCrops;

  /// No description provided for @basedOnFarmConditions.
  ///
  /// In en, this message translates to:
  /// **'Based on farm conditions'**
  String get basedOnFarmConditions;

  /// No description provided for @whyThisCrop.
  ///
  /// In en, this message translates to:
  /// **'Why this crop?'**
  String get whyThisCrop;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @kmAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String kmAway(String distance);

  /// No description provided for @mspPrev.
  ///
  /// In en, this message translates to:
  /// **'MSP/Prev {price}'**
  String mspPrev(String price);

  /// No description provided for @onion.
  ///
  /// In en, this message translates to:
  /// **'Onion'**
  String get onion;

  /// No description provided for @mustard.
  ///
  /// In en, this message translates to:
  /// **'Mustard'**
  String get mustard;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @pestLabel.
  ///
  /// In en, this message translates to:
  /// **'Pest'**
  String get pestLabel;

  /// No description provided for @cropLabel.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get cropLabel;

  /// No description provided for @paddy.
  ///
  /// In en, this message translates to:
  /// **'Paddy'**
  String get paddy;

  /// No description provided for @soilRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Soil recommendations'**
  String get soilRecommendations;

  /// No description provided for @tonnesPerAcre.
  ///
  /// In en, this message translates to:
  /// **'tonnes/acre'**
  String get tonnesPerAcre;

  /// No description provided for @excellentSoilMatchDesc.
  ///
  /// In en, this message translates to:
  /// **'Soil properties match perfectly with crop requirements.'**
  String get excellentSoilMatchDesc;

  /// No description provided for @weatherSuitabilityDesc.
  ///
  /// In en, this message translates to:
  /// **'Current weather conditions are optimal for sowing.'**
  String get weatherSuitabilityDesc;

  /// No description provided for @rotationBenefitDesc.
  ///
  /// In en, this message translates to:
  /// **'Helps in restoring soil nitrogen levels.'**
  String get rotationBenefitDesc;

  /// No description provided for @marketAdvantageDesc.
  ///
  /// In en, this message translates to:
  /// **'High demand expected in upcoming season.'**
  String get marketAdvantageDesc;

  /// No description provided for @proTipContent.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper drainage to prevent waterlogging.'**
  String get proTipContent;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms & Privacy Policy'**
  String get termsAndConditions;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'zu', 'kn'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'hi':
      {
        switch (locale.countryCode) {
          case 'KH':
            return AppLocalizationsHiKh();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'zu':
      return AppLocalizationsZu();
    case 'kn':
      return AppLocalizationsKn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
