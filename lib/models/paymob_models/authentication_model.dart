
class AuthenticationModel {
  Profile? profile;
  String? token;

  AuthenticationModel({this.profile, this.token});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    if(json["profile"] is Map) {
      profile = json["profile"] == null ? null : Profile.fromJson(json["profile"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(profile != null) {
      data["profile"] = profile?.toJson();
    }
    data["token"] = token;
    return data;
  }
}

class Profile {
  int? id;
  User? user;
  String? createdAt;
  bool? active;
  String? profileType;
  List<String>? phones;
  dynamic companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool? isMobadra;
  String? sector;
  bool? is2FaEnabled;
  String? otpSentTo;
  int? activationMethod;
  int? signedUpThrough;
  int? failedAttempts;
  List<dynamic>? customExportColumns;
  List<dynamic>? serverIp;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  dynamic otp2FaSentAt;
  dynamic otp2FaAttempt;
  String? otpSentAt;
  String? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  int? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  int? bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;
  int? suspicious;
  dynamic latitude;
  dynamic longitude;
  BankStaffs? bankStaffs;
  dynamic bankRejectionReason;
  bool? bankReceivedDocuments;
  int? bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool? filledBusinessData;
  String? dayStartTime;
  dynamic dayEndTime;
  bool? withholdTransfers;
  bool? manualSettlement;
  String? smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool? canBillDepositWithCard;
  bool? canTopupMerchants;
  dynamic topupTransferId;
  bool? referralEligible;
  bool? isEligibleToBeRanger;
  bool? isRanger;
  bool? isPoaching;
  bool? paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool? allowTransactionNotifications;
  bool? allowTransferNotifications;
  int? sallefnyAmountWhole;
  int? sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  bool? payoutEnabled;
  bool? payoutTerms;
  bool? isBillsNew;
  bool? canProcessMultipleRefunds;
  int? settlementClassification;
  bool? instantSettlementEnabled;
  bool? instantSettlementTransactionOtpVerified;
  dynamic preferredLanguage;
  bool? ignoreFlashCallbacks;
  dynamic acqPartner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Profile({this.id, this.user, this.createdAt, this.active, this.profileType, this.phones, this.companyEmails, this.companyName, this.state, this.country, this.city, this.postalCode, this.street, this.emailNotification, this.orderRetrievalEndpoint, this.deliveryUpdateEndpoint, this.logoUrl, this.isMobadra, this.sector, this.is2FaEnabled, this.otpSentTo, this.activationMethod, this.signedUpThrough, this.failedAttempts, this.customExportColumns, this.serverIp, this.username, this.primaryPhoneNumber, this.primaryPhoneVerified, this.isTempPassword, this.otp2FaSentAt, this.otp2FaAttempt, this.otpSentAt, this.otpValidatedAt, this.awbBanner, this.emailBanner, this.identificationNumber, this.deliveryStatusCallback, this.merchantExternalLink, this.merchantStatus, this.deactivatedByBank, this.bankDeactivationReason, this.bankMerchantStatus, this.nationalId, this.superAgent, this.walletLimitProfile, this.address, this.commercialRegistration, this.commercialRegistrationArea, this.distributorCode, this.distributorBranchCode, this.allowTerminalOrderId, this.allowEncryptionBypass, this.walletPhoneNumber, this.suspicious, this.latitude, this.longitude, this.bankStaffs, this.bankRejectionReason, this.bankReceivedDocuments, this.bankMerchantDigitalStatus, this.bankDigitalRejectionReason, this.filledBusinessData, this.dayStartTime, this.dayEndTime, this.withholdTransfers, this.manualSettlement, this.smsSenderName, this.withholdTransfersReason, this.withholdTransfersNotes, this.canBillDepositWithCard, this.canTopupMerchants, this.topupTransferId, this.referralEligible, this.isEligibleToBeRanger, this.isRanger, this.isPoaching, this.paymobAppMerchant, this.settlementFrequency, this.dayOfTheWeek, this.dayOfTheMonth, this.allowTransactionNotifications, this.allowTransferNotifications, this.sallefnyAmountWhole, this.sallefnyFeesWhole, this.paymobAppFirstLogin, this.paymobAppLastActivity, this.payoutEnabled, this.payoutTerms, this.isBillsNew, this.canProcessMultipleRefunds, this.settlementClassification, this.instantSettlementEnabled, this.instantSettlementTransactionOtpVerified, this.preferredLanguage, this.ignoreFlashCallbacks, this.acqPartner, this.dom, this.bankRelated, this.permissions});

  Profile.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["active"] is bool) {
      active = json["active"];
    }
    if(json["profile_type"] is String) {
      profileType = json["profile_type"];
    }
    if(json["phones"] is List) {
      phones = json["phones"] == null ? null : List<String>.from(json["phones"]);
    }
    companyEmails = json["company_emails"];
    if(json["company_name"] is String) {
      companyName = json["company_name"];
    }
    if(json["state"] is String) {
      state = json["state"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["city"] is String) {
      city = json["city"];
    }
    if(json["postal_code"] is String) {
      postalCode = json["postal_code"];
    }
    if(json["street"] is String) {
      street = json["street"];
    }
    if(json["email_notification"] is bool) {
      emailNotification = json["email_notification"];
    }
    orderRetrievalEndpoint = json["order_retrieval_endpoint"];
    deliveryUpdateEndpoint = json["delivery_update_endpoint"];
    logoUrl = json["logo_url"];
    if(json["is_mobadra"] is bool) {
      isMobadra = json["is_mobadra"];
    }
    if(json["sector"] is String) {
      sector = json["sector"];
    }
    if(json["is_2fa_enabled"] is bool) {
      is2FaEnabled = json["is_2fa_enabled"];
    }
    if(json["otp_sent_to"] is String) {
      otpSentTo = json["otp_sent_to"];
    }
    if(json["activation_method"] is int) {
      activationMethod = json["activation_method"];
    }
    if(json["signed_up_through"] is int) {
      signedUpThrough = json["signed_up_through"];
    }
    if(json["failed_attempts"] is int) {
      failedAttempts = json["failed_attempts"];
    }
    if(json["custom_export_columns"] is List) {
      customExportColumns = json["custom_export_columns"] ?? [];
    }
    if(json["server_IP"] is List) {
      serverIp = json["server_IP"] ?? [];
    }
    username = json["username"];
    if(json["primary_phone_number"] is String) {
      primaryPhoneNumber = json["primary_phone_number"];
    }
    if(json["primary_phone_verified"] is bool) {
      primaryPhoneVerified = json["primary_phone_verified"];
    }
    if(json["is_temp_password"] is bool) {
      isTempPassword = json["is_temp_password"];
    }
    otp2FaSentAt = json["otp_2fa_sent_at"];
    otp2FaAttempt = json["otp_2fa_attempt"];
    if(json["otp_sent_at"] is String) {
      otpSentAt = json["otp_sent_at"];
    }
    if(json["otp_validated_at"] is String) {
      otpValidatedAt = json["otp_validated_at"];
    }
    awbBanner = json["awb_banner"];
    emailBanner = json["email_banner"];
    identificationNumber = json["identification_number"];
    if(json["delivery_status_callback"] is String) {
      deliveryStatusCallback = json["delivery_status_callback"];
    }
    merchantExternalLink = json["merchant_external_link"];
    if(json["merchant_status"] is int) {
      merchantStatus = json["merchant_status"];
    }
    if(json["deactivated_by_bank"] is bool) {
      deactivatedByBank = json["deactivated_by_bank"];
    }
    bankDeactivationReason = json["bank_deactivation_reason"];
    if(json["bank_merchant_status"] is int) {
      bankMerchantStatus = json["bank_merchant_status"];
    }
    nationalId = json["national_id"];
    superAgent = json["super_agent"];
    walletLimitProfile = json["wallet_limit_profile"];
    address = json["address"];
    commercialRegistration = json["commercial_registration"];
    commercialRegistrationArea = json["commercial_registration_area"];
    distributorCode = json["distributor_code"];
    distributorBranchCode = json["distributor_branch_code"];
    if(json["allow_terminal_order_id"] is bool) {
      allowTerminalOrderId = json["allow_terminal_order_id"];
    }
    if(json["allow_encryption_bypass"] is bool) {
      allowEncryptionBypass = json["allow_encryption_bypass"];
    }
    walletPhoneNumber = json["wallet_phone_number"];
    if(json["suspicious"] is int) {
      suspicious = json["suspicious"];
    }
    latitude = json["latitude"];
    longitude = json["longitude"];
    if(json["bank_staffs"] is Map) {
      bankStaffs = json["bank_staffs"] == null ? null : BankStaffs.fromJson(json["bank_staffs"]);
    }
    bankRejectionReason = json["bank_rejection_reason"];
    if(json["bank_received_documents"] is bool) {
      bankReceivedDocuments = json["bank_received_documents"];
    }
    if(json["bank_merchant_digital_status"] is int) {
      bankMerchantDigitalStatus = json["bank_merchant_digital_status"];
    }
    bankDigitalRejectionReason = json["bank_digital_rejection_reason"];
    if(json["filled_business_data"] is bool) {
      filledBusinessData = json["filled_business_data"];
    }
    if(json["day_start_time"] is String) {
      dayStartTime = json["day_start_time"];
    }
    dayEndTime = json["day_end_time"];
    if(json["withhold_transfers"] is bool) {
      withholdTransfers = json["withhold_transfers"];
    }
    if(json["manual_settlement"] is bool) {
      manualSettlement = json["manual_settlement"];
    }
    if(json["sms_sender_name"] is String) {
      smsSenderName = json["sms_sender_name"];
    }
    withholdTransfersReason = json["withhold_transfers_reason"];
    withholdTransfersNotes = json["withhold_transfers_notes"];
    if(json["can_bill_deposit_with_card"] is bool) {
      canBillDepositWithCard = json["can_bill_deposit_with_card"];
    }
    if(json["can_topup_merchants"] is bool) {
      canTopupMerchants = json["can_topup_merchants"];
    }
    topupTransferId = json["topup_transfer_id"];
    if(json["referral_eligible"] is bool) {
      referralEligible = json["referral_eligible"];
    }
    if(json["is_eligible_to_be_ranger"] is bool) {
      isEligibleToBeRanger = json["is_eligible_to_be_ranger"];
    }
    if(json["is_ranger"] is bool) {
      isRanger = json["is_ranger"];
    }
    if(json["is_poaching"] is bool) {
      isPoaching = json["is_poaching"];
    }
    if(json["paymob_app_merchant"] is bool) {
      paymobAppMerchant = json["paymob_app_merchant"];
    }
    settlementFrequency = json["settlement_frequency"];
    dayOfTheWeek = json["day_of_the_week"];
    dayOfTheMonth = json["day_of_the_month"];
    if(json["allow_transaction_notifications"] is bool) {
      allowTransactionNotifications = json["allow_transaction_notifications"];
    }
    if(json["allow_transfer_notifications"] is bool) {
      allowTransferNotifications = json["allow_transfer_notifications"];
    }
    if(json["sallefny_amount_whole"] is int) {
      sallefnyAmountWhole = json["sallefny_amount_whole"];
    }
    if(json["sallefny_fees_whole"] is int) {
      sallefnyFeesWhole = json["sallefny_fees_whole"];
    }
    paymobAppFirstLogin = json["paymob_app_first_login"];
    paymobAppLastActivity = json["paymob_app_last_activity"];
    if(json["payout_enabled"] is bool) {
      payoutEnabled = json["payout_enabled"];
    }
    if(json["payout_terms"] is bool) {
      payoutTerms = json["payout_terms"];
    }
    if(json["is_bills_new"] is bool) {
      isBillsNew = json["is_bills_new"];
    }
    if(json["can_process_multiple_refunds"] is bool) {
      canProcessMultipleRefunds = json["can_process_multiple_refunds"];
    }
    if(json["settlement_classification"] is int) {
      settlementClassification = json["settlement_classification"];
    }
    if(json["instant_settlement_enabled"] is bool) {
      instantSettlementEnabled = json["instant_settlement_enabled"];
    }
    if(json["instant_settlement_transaction_otp_verified"] is bool) {
      instantSettlementTransactionOtpVerified = json["instant_settlement_transaction_otp_verified"];
    }
    preferredLanguage = json["preferred_language"];
    if(json["ignore_flash_callbacks"] is bool) {
      ignoreFlashCallbacks = json["ignore_flash_callbacks"];
    }
    acqPartner = json["acq_partner"];
    dom = json["dom"];
    bankRelated = json["bank_related"];
    if(json["permissions"] is List) {
      permissions = json["permissions"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if(user != null) {
      data["user"] = user?.toJson();
    }
    data["created_at"] = createdAt;
    data["active"] = active;
    data["profile_type"] = profileType;
    if(phones != null) {
      data["phones"] = phones;
    }
    data["company_emails"] = companyEmails;
    data["company_name"] = companyName;
    data["state"] = state;
    data["country"] = country;
    data["city"] = city;
    data["postal_code"] = postalCode;
    data["street"] = street;
    data["email_notification"] = emailNotification;
    data["order_retrieval_endpoint"] = orderRetrievalEndpoint;
    data["delivery_update_endpoint"] = deliveryUpdateEndpoint;
    data["logo_url"] = logoUrl;
    data["is_mobadra"] = isMobadra;
    data["sector"] = sector;
    data["is_2fa_enabled"] = is2FaEnabled;
    data["otp_sent_to"] = otpSentTo;
    data["activation_method"] = activationMethod;
    data["signed_up_through"] = signedUpThrough;
    data["failed_attempts"] = failedAttempts;
    if(customExportColumns != null) {
      data["custom_export_columns"] = customExportColumns;
    }
    if(serverIp != null) {
      data["server_IP"] = serverIp;
    }
    data["username"] = username;
    data["primary_phone_number"] = primaryPhoneNumber;
    data["primary_phone_verified"] = primaryPhoneVerified;
    data["is_temp_password"] = isTempPassword;
    data["otp_2fa_sent_at"] = otp2FaSentAt;
    data["otp_2fa_attempt"] = otp2FaAttempt;
    data["otp_sent_at"] = otpSentAt;
    data["otp_validated_at"] = otpValidatedAt;
    data["awb_banner"] = awbBanner;
    data["email_banner"] = emailBanner;
    data["identification_number"] = identificationNumber;
    data["delivery_status_callback"] = deliveryStatusCallback;
    data["merchant_external_link"] = merchantExternalLink;
    data["merchant_status"] = merchantStatus;
    data["deactivated_by_bank"] = deactivatedByBank;
    data["bank_deactivation_reason"] = bankDeactivationReason;
    data["bank_merchant_status"] = bankMerchantStatus;
    data["national_id"] = nationalId;
    data["super_agent"] = superAgent;
    data["wallet_limit_profile"] = walletLimitProfile;
    data["address"] = address;
    data["commercial_registration"] = commercialRegistration;
    data["commercial_registration_area"] = commercialRegistrationArea;
    data["distributor_code"] = distributorCode;
    data["distributor_branch_code"] = distributorBranchCode;
    data["allow_terminal_order_id"] = allowTerminalOrderId;
    data["allow_encryption_bypass"] = allowEncryptionBypass;
    data["wallet_phone_number"] = walletPhoneNumber;
    data["suspicious"] = suspicious;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    if(bankStaffs != null) {
      data["bank_staffs"] = bankStaffs?.toJson();
    }
    data["bank_rejection_reason"] = bankRejectionReason;
    data["bank_received_documents"] = bankReceivedDocuments;
    data["bank_merchant_digital_status"] = bankMerchantDigitalStatus;
    data["bank_digital_rejection_reason"] = bankDigitalRejectionReason;
    data["filled_business_data"] = filledBusinessData;
    data["day_start_time"] = dayStartTime;
    data["day_end_time"] = dayEndTime;
    data["withhold_transfers"] = withholdTransfers;
    data["manual_settlement"] = manualSettlement;
    data["sms_sender_name"] = smsSenderName;
    data["withhold_transfers_reason"] = withholdTransfersReason;
    data["withhold_transfers_notes"] = withholdTransfersNotes;
    data["can_bill_deposit_with_card"] = canBillDepositWithCard;
    data["can_topup_merchants"] = canTopupMerchants;
    data["topup_transfer_id"] = topupTransferId;
    data["referral_eligible"] = referralEligible;
    data["is_eligible_to_be_ranger"] = isEligibleToBeRanger;
    data["is_ranger"] = isRanger;
    data["is_poaching"] = isPoaching;
    data["paymob_app_merchant"] = paymobAppMerchant;
    data["settlement_frequency"] = settlementFrequency;
    data["day_of_the_week"] = dayOfTheWeek;
    data["day_of_the_month"] = dayOfTheMonth;
    data["allow_transaction_notifications"] = allowTransactionNotifications;
    data["allow_transfer_notifications"] = allowTransferNotifications;
    data["sallefny_amount_whole"] = sallefnyAmountWhole;
    data["sallefny_fees_whole"] = sallefnyFeesWhole;
    data["paymob_app_first_login"] = paymobAppFirstLogin;
    data["paymob_app_last_activity"] = paymobAppLastActivity;
    data["payout_enabled"] = payoutEnabled;
    data["payout_terms"] = payoutTerms;
    data["is_bills_new"] = isBillsNew;
    data["can_process_multiple_refunds"] = canProcessMultipleRefunds;
    data["settlement_classification"] = settlementClassification;
    data["instant_settlement_enabled"] = instantSettlementEnabled;
    data["instant_settlement_transaction_otp_verified"] = instantSettlementTransactionOtpVerified;
    data["preferred_language"] = preferredLanguage;
    data["ignore_flash_callbacks"] = ignoreFlashCallbacks;
    data["acq_partner"] = acqPartner;
    data["dom"] = dom;
    data["bank_related"] = bankRelated;
    if(permissions != null) {
      data["permissions"] = permissions;
    }
    return data;
  }
}

class BankStaffs {
  BankStaffs();

  BankStaffs.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? groups;
  List<int>? userPermissions;

  User({this.id, this.username, this.firstName, this.lastName, this.dateJoined, this.email, this.isActive, this.isStaff, this.isSuperuser, this.lastLogin, this.groups, this.userPermissions});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if(json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if(json["date_joined"] is String) {
      dateJoined = json["date_joined"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["is_active"] is bool) {
      isActive = json["is_active"];
    }
    if(json["is_staff"] is bool) {
      isStaff = json["is_staff"];
    }
    if(json["is_superuser"] is bool) {
      isSuperuser = json["is_superuser"];
    }
    lastLogin = json["last_login"];
    if(json["groups"] is List) {
      groups = json["groups"] ?? [];
    }
    if(json["user_permissions"] is List) {
      userPermissions = json["user_permissions"] == null ? null : List<int>.from(json["user_permissions"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["username"] = username;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["date_joined"] = dateJoined;
    data["email"] = email;
    data["is_active"] = isActive;
    data["is_staff"] = isStaff;
    data["is_superuser"] = isSuperuser;
    data["last_login"] = lastLogin;
    if(groups != null) {
      data["groups"] = groups;
    }
    if(userPermissions != null) {
      data["user_permissions"] = userPermissions;
    }
    return data;
  }
}