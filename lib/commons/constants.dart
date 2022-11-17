import 'package:flutter/material.dart';

class AppColors {
  static Color appBarColor = Colors.blueGrey.shade300;
  static Color questionContainerColor = const Color(0xFFFFE5BE);
  static Color buttonPinkColor = const Color(0xFFFFC0CB);
  static Color textColorGrey = Colors.grey.shade600;
  static Color hintTextColor = Colors.grey.shade500;
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color labelColorBlack = Colors.black54;
  static Color titleColor = Colors.grey.shade700;
  static Color secondaryAccentColor = Colors.green;
  static Color bgGrayColor = const Color(0xffdbdbdb);
  static Color buttonOrangeColor = const Color(0xffff7b00);
  static Color buttonGreyColor = const Color(0xffabb5bd);
  static Color textBlueColor = const Color(0xff0071db);
}

class AlertMessages {
  static const String success = "SUCCESS!";
  static const String alert = "Aware Config";
  static const String noDataFound = "No data found.";
  static const String somethingWentWrong = "Something Went Wrong!";
  static const String invalidLoginDetails = "Invalid Login Details!";
  static const String okButton = "OK";
  static const String cancelButton = "CANCEL";
  static const String editButton = "EDIT";
  static const String saveButton = "SAVE";
  static const String submitButton = "SUBMIT";
  static const String retryButton = "RETRY";
  static const String enterSensorId = "Please enter sensor id.";
  static const String selectSolutionRole = "Please select solution role.";
  static const String enterTargetName = "Please enter target name.";
  static const String selectTargetType = "Please select target type.";
  static const String selectTargetGroup = "Please select target group.";
  static const String noInternetConnection = "No internet connection";
  static const String noInternetConnectionMsg = "Please check your internet connection and try again.";
  static String noSensorFound = "This sensor does not belong to your solution. Please contact awaresupport@buildinglink.com for details.";
  static const String targetUpdated = "Target Updated!";
  static const String targetAdded = "Target Added!";
  static const String sensorUpdated = "Sensor Updated!";
  static const String addTarget = "Please enter group name.";
  static const String groupCreated = "Deployment target group created.";
  static const String groupUpdated = "Deployment target group updated.";
  static const String registerRequest = "Service request submitted successfully.";
  static const String enterRequestNotes = "Please enter request description.";
  static const String selectRequestCategory = "Please select request category.";
}

class MessageConstants {
  static const String versionConstants = "Version";

  static const String enterPhoneNumber = "Enter your phone number";
  static const String phoneNumber = "Phone Number";
  static const String signIn = 'Sign In';
  static const String rememberMe = "  Remember me";
  static const String continueWith = "or continue with";
  static const String email = "Your Email";
  static const String enterEmail = "Enter your email";
  static const String emailAssociated = "Enter the email address associated with your account";
  static const String emailErrorText = 'enter a valid email address';
  static const String validData = 'Enter valid data';
  static const String validPassword = 'Please Enter valid password';
  static const String validEmail = 'Please Enter valid email address';
  static const String validContact = 'Enter valid contact Number';

  static const String socketErrorOccurred = 'Socket Error occurred';
  static const String serverTimeoutOccurred = 'Server Timeout occurred';
}

class ApiConstants {
  static const String baseUrl = 'xyz';
}
