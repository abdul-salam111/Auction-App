class AppUrls {
  static const String baseApiKey = "https://api.bigstaruae.com/v1/";

  static const String loginByUid = "${baseApiKey}user/signinUid";

  static const String logoutUser = "${baseApiKey}user/signout";

  static const String getAllContainers = "${baseApiKey}get_all_containers";

  static const String getContainersCount = "${baseApiKey}containers_count";

  static const String getuserProfile = "${baseApiKey}user/signup";

  static const String getallsignupcustomers =
      "${baseApiKey}all_signups_customer";

  static const String deleteSingleCustomer = "${baseApiKey}delete_user/";

  static const String getIndividualCustomerWonbids = "${baseApiKey}bid_won/";

  static const String addCustomerByAdmin =
      "${baseApiKey}user/admin_signupuid_customer";

  static const String deleteWonBidsOfCustomerByAdmin =
      "${baseApiKey}delete_bid_won/";

  static const String updateCustomerByAdmin = "${baseApiKey}user/signup/";

  static const String getAllNotifications =
      "${baseApiKey}read_all_notifications";
}
