import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? chartVerticalValues(
  int? maxValue,
  String? sizeScreen,
) {
  // Check if maxValue or sizeScreen is null
  if (maxValue == null || sizeScreen == null) return [];

  List<String> values; // Declare the list of values

  // Determine the screen size and calculate the steps
  if (sizeScreen == "small") {
    double step = maxValue / 4;
    values = [
      _formatValue(maxValue.toDouble()),
      _formatValue(maxValue - step),
      _formatValue(maxValue - step * 2),
      _formatValue(maxValue - step * 3),
      "0" // Always return "0" as a string
    ];
  } else if (sizeScreen == "medium") {
    double step = maxValue / 5;
    values = [
      _formatValue(maxValue.toDouble()),
      _formatValue(maxValue - step),
      _formatValue(maxValue - step * 2),
      _formatValue(maxValue - step * 3),
      _formatValue(maxValue - step * 4),
      "0" // Always return "0" as a string
    ];
  } else if (sizeScreen == "large") {
    double step = maxValue / 6;
    values = [
      _formatValue(maxValue.toDouble()),
      _formatValue(maxValue - step),
      _formatValue(maxValue - step * 2),
      _formatValue(maxValue - step * 3),
      _formatValue(maxValue - step * 4),
      _formatValue(maxValue - step * 5),
      "0" // Always return "0" as a string
    ];
  } else {
    return []; // If the screen size is not valid, return an empty list
  }

  return values; // Return the list of formatted values
}

// Helper function to format the value
String _formatValue(double value) {
  // Return the integer format if there are no decimals
  if (value % 1 == 0) {
    return value.toInt().toString();
  } else {
    // Limit to 4 characters
    return value.toStringAsFixed(2).substring(0, 4);
  }
}

List<MonthlyDataStruct>? monthsList(
  List<DateTime>? datetimelist,
  int? maxnum,
) {
  // Check for null or empty inputs
  if (datetimelist == null ||
      datetimelist.isEmpty ||
      maxnum == null ||
      maxnum == 0) {
    return [];
  }

  // Abbreviated month names
  const monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];

  // Step 1: Sort dates from earliest to latest
  datetimelist.sort();

  // Step 2: Create a map to store counts of dates per month and year
  final Map<String, int> monthYearMap = {};

  for (var date in datetimelist) {
    // Format: MM-yyyy
    final monthKey = '${date.month.toString().padLeft(2, '0')}-${date.year}';
    monthYearMap[monthKey] = (monthYearMap[monthKey] ?? 0) + 1;
  }

  // Step 3: Prepare result list ensuring all months are represented
  final List<MonthlyDataStruct> result = [];

  // Get the earliest and latest dates in the sorted list
  final DateTime start = datetimelist.first;
  final DateTime end = datetimelist.last;

  // Loop through each month between the start and end dates
  DateTime current = DateTime(start.year, start.month);
  while (current.isBefore(DateTime(end.year, end.month + 1))) {
    // Format month and year key
    final monthKey =
        '${current.month.toString().padLeft(2, '0')}-${current.year}';
    final monthName = monthNames[current.month - 1];

    // Calculate total for this month
    final itemCount = monthYearMap[monthKey] ?? 0;
    final total = 250 / maxnum * itemCount;

    // Add the struct with the month only (without year) and calculated total
    result.add(
      MonthlyDataStruct(month: monthName, total: total),
    );

    // Move to the next month
    current = DateTime(current.year, current.month + 1);
  }

  // Reverse the result list to show the most recent month first
  return result.reversed.toList();
}

List<int> getCurrentWeekDays(
  DateTime startDate,
  String direction,
) {
// Ensure startDate is at the beginning of the week
  DateTime startOfWeek = startDate.subtract(Duration(days: startDate.weekday));

  // Determine the end of the week based on the direction
  DateTime endOfWeek;
  if (direction == "next") {
    endOfWeek = startOfWeek.add(Duration(days: 6));
  } else if (direction == "previous") {
    endOfWeek = startOfWeek.subtract(Duration(days: 6));
  } else {
    throw ArgumentError("Invalid direction. Must be 'next' or 'previous'.");
  }

  // Get the day numbers for each day in the week
  List<int> weekDays = [];
  for (int i = 0; i <= 6; i++) {
    DateTime currentDate = startOfWeek.add(Duration(days: i));
    weekDays.add(currentDate.day);
  }

  return weekDays;
}

List<DateTime>? calendarDays(DateTime? date) {
  if (date == null) return null;

  // Paso 1: Obtener el primer día del mes
  DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

  // Paso 2: Retroceder al lunes más cercano anterior
  int daysToSubtract =
      firstDayOfMonth.weekday - 1; // Lunes es 1, subtract accordingly
  DateTime startDay = firstDayOfMonth.subtract(Duration(days: daysToSubtract));

  // Paso 3: Generar la lista de 42 días
  List<DateTime> daysList = [];
  for (int i = 0; i < 42; i++) {
    daysList.add(startDay.add(Duration(days: i)));
  }

  return daysList;
}

List<int> getCurrentMonthDays(
  DateTime startDate,
  String direction,
) {
// Ensure startDate is at the beginning of the month
  DateTime startOfMonth = startDate.subtract(Duration(days: startDate.day - 1));

  // Determine the end of the month based on the direction
  DateTime endOfMonth;
  if (direction == "next") {
    endOfMonth =
        startOfMonth.add(Duration(days: 30)); // Approximate 30 days per month
  } else if (direction == "previous") {
    endOfMonth = startOfMonth
        .subtract(Duration(days: 30)); // Approximate 30 days per month
  } else {
    throw ArgumentError("Invalid direction. Must be 'next' or 'previous'.");
  }

  // Get the day numbers for each day in the month
  List<int> monthDays = [];
  for (int i = 0; i <= 30; i++) {
    // Assuming maximum 30 days per month
    DateTime currentDate = startOfMonth.add(Duration(days: i));
    if (currentDate.isAfter(endOfMonth)) break;
    monthDays.add(currentDate.day);
  }

  return monthDays;
}

DateTime? startMonth(DateTime? date) {
  // Verificar si la fecha es nula
  if (date == null) return null;

  // Crear una nueva fecha con el primer día del mes a las 00:00:00
  return DateTime(date.year, date.month, 1, 0, 0, 0);
}

int getDateNumberFromDateTime(DateTime dateTime) {
// Check if the date exists
  if (dateTime.day > 0 && dateTime.month > 0 && dateTime.year > 0) {
    return dateTime.day;
  } else {
    throw ArgumentError("Invalid date provided.");
  }
}

DateTime? beginDay(DateTime? currenttime) {
  if (currenttime == null) return null;

  // Retorna la fecha con el tiempo ajustado al inicio del día (00:00:00)
  return DateTime(
      currenttime.year, currenttime.month, currenttime.day, 0, 0, 0);
}

DateTime? addRestMonth(
  DateTime? arg1,
  String? addOrRest,
) {
  if (arg1 == null || addOrRest == null) return null;

  if (addOrRest.toLowerCase() == 'add') {
    return DateTime(arg1.year, arg1.month + 1, arg1.day);
  } else if (addOrRest.toLowerCase() == 'rest') {
    return DateTime(arg1.year, arg1.month - 1, arg1.day);
  }

  return null;
}

String? morningAfteroonEveningWishes() {
  // Greet the user Good Morning, Good Afternoon, or Good Evening depending on when they are opening the application. If they open the application between 3:00 a.m-11:59 a.m. their time, say "Good Morning!". If they open the application between 12:00 p.m.-4:59 their time, say "Good Afternoon!". If they open the application between 5:00 p.m.-2:59 a.m. their time, say "Good Evening!"
  var now = DateTime.now();
  var hour = now.hour;

  if (hour >= 3 && hour < 12) {
    return 'Good Morning!';
  } else if (hour >= 12 && hour < 17) {
    return 'Good Afternoon!';
  } else {
    return 'Good Evening!';
  }
}

List<String>? getCountryList() {
  final countries = [
    'Afghanistan',
    'Aland Islands',
    'Albania',
    'Algeria',
    'AmericanSamoa',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antarctica',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'British Indian Ocean Territory',
    'Brunei Darussalam',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Cayman Islands',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Christmas Island',
    'Cocos (Keeling) Islands',
    'Colombia',
    'Comoros',
    'Congo',
    'Congo, The Democratic Republic of the Congo',
    'Cook Islands',
    'Costa Rica',
    'Cote dIvoire',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Falkland Islands (Malvinas',
    'Faroe Islands',
    'Fiji',
    'Finland',
    'France',
    'French Guiana',
    'French Polynesia',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guam',
    'Guatemala',
    'Guernsey',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See (Vatican City State',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran, Islamic Republic of Persian Gulf',
    'Iraq',
    'Ireland',
    'Isle of Man',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jersey',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, Democratic Peoples Republic of Korea',
    'Korea, Republic of South Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libyan Arab Jamahiriya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macao',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Micronesia, Federated States of Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'Netherlands Antilles',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Niue',
    'Norfolk Island',
    'Northern Mariana Islands',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestinian Territory, Occupied',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Pitcairn',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Reunion',
    'Saint Barthelemy',
    'Saint Helena, Ascension and Tristan Da Cunha',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Martin',
    'Saint Pierre and Miquelon',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'South Georgia and the South Sandwich Islands',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Svalbard and Jan Mayen',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syrian Arab Republic',
    'Taiwan',
    'Tajikistan',
    'Tanzania, United Republic of Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tokelau',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Turks and Caicos Islands',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela, Bolivarian Republic of Venezuela',
    'Vietnam',
    'Virgin Islands, British',
    'Virgin Islands, U.S',
    'Wallis and Futuna',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  return countries;
  // <<< Up to this
}

String? getCountryFlag(String? countryName) {
  if (countryName == null) {
    return null;
  }
  final countryInfoJson = {
    "Afghanistan": {"dial_code": "+93", "code": "AF"},
    "Aland Islands": {"dial_code": "+358", "code": "AX"},
    "Albania": {"dial_code": "+355", "code": "AL"},
    "Algeria": {"dial_code": "+213", "code": "DZ"},
    "AmericanSamoa": {"dial_code": "+1684", "code": "AS"},
    "Andorra": {"dial_code": "+376", "code": "AD"},
    "Angola": {"dial_code": "+244", "code": "AO"},
    "Anguilla": {"dial_code": "+1264", "code": "AI"},
    "Antarctica": {"dial_code": "+672", "code": "AQ"},
    "Antigua and Barbuda": {"dial_code": "+1268", "code": "AG"},
    "Argentina": {"dial_code": "+54", "code": "AR"},
    "Armenia": {"dial_code": "+374", "code": "AM"},
    "Aruba": {"dial_code": "+297", "code": "AW"},
    "Australia": {"dial_code": "+61", "code": "AU"},
    "Austria": {"dial_code": "+43", "code": "AT"},
    "Azerbaijan": {"dial_code": "+994", "code": "AZ"},
    "Bahamas": {"dial_code": "+1242", "code": "BS"},
    "Bahrain": {"dial_code": "+973", "code": "BH"},
    "Bangladesh": {"dial_code": "+880", "code": "BD"},
    "Barbados": {"dial_code": "+1246", "code": "BB"},
    "Belarus": {"dial_code": "+375", "code": "BY"},
    "Belgium": {"dial_code": "+32", "code": "BE"},
    "Belize": {"dial_code": "+501", "code": "BZ"},
    "Benin": {"dial_code": "+229", "code": "BJ"},
    "Bermuda": {"dial_code": "+1441", "code": "BM"},
    "Bhutan": {"dial_code": "+975", "code": "BT"},
    "Bolivia, Plurinational State of": {"dial_code": "+591", "code": "BO"},
    "Bosnia and Herzegovina": {"dial_code": "+387", "code": "BA"},
    "Botswana": {"dial_code": "+267", "code": "BW"},
    "Brazil": {"dial_code": "+55", "code": "BR"},
    "British Indian Ocean Territory": {"dial_code": "+246", "code": "IO"},
    "Brunei Darussalam": {"dial_code": "+673", "code": "BN"},
    "Bulgaria": {"dial_code": "+359", "code": "BG"},
    "Burkina Faso": {"dial_code": "+226", "code": "BF"},
    "Burundi": {"dial_code": "+257", "code": "BI"},
    "Cambodia": {"dial_code": "+855", "code": "KH"},
    "Cameroon": {"dial_code": "+237", "code": "CM"},
    "Canada": {"dial_code": "+1", "code": "CA"},
    "Cape Verde": {"dial_code": "+238", "code": "CV"},
    "Cayman Islands": {"dial_code": "+ 345", "code": "KY"},
    "Central African Republic": {"dial_code": "+236", "code": "CF"},
    "Chad": {"dial_code": "+235", "code": "TD"},
    "Chile": {"dial_code": "+56", "code": "CL"},
    "China": {"dial_code": "+86", "code": "CN"},
    "Christmas Island": {"dial_code": "+61", "code": "CX"},
    "Cocos (Keeling) Islands": {"dial_code": "+61", "code": "CC"},
    "Colombia": {"dial_code": "+57", "code": "CO"},
    "Comoros": {"dial_code": "+269", "code": "KM"},
    "Congo": {"dial_code": "+242", "code": "CG"},
    "Congo, The Democratic Republic of the Congo": {
      "dial_code": "+243",
      "code": "CD"
    },
    "Cook Islands": {"dial_code": "+682", "code": "CK"},
    "Costa Rica": {"dial_code": "+506", "code": "CR"},
    "Cote d'Ivoire": {"dial_code": "+225", "code": "CI"},
    "Croatia": {"dial_code": "+385", "code": "HR"},
    "Cuba": {"dial_code": "+53", "code": "CU"},
    "Cyprus": {"dial_code": "+357", "code": "CY"},
    "Czech Republic": {"dial_code": "+420", "code": "CZ"},
    "Denmark": {"dial_code": "+45", "code": "DK"},
    "Djibouti": {"dial_code": "+253", "code": "DJ"},
    "Dominica": {"dial_code": "+1767", "code": "DM"},
    "Dominican Republic": {"dial_code": "+1849", "code": "DO"},
    "Ecuador": {"dial_code": "+593", "code": "EC"},
    "Egypt": {"dial_code": "+20", "code": "EG"},
    "El Salvador": {"dial_code": "+503", "code": "SV"},
    "Equatorial Guinea": {"dial_code": "+240", "code": "GQ"},
    "Eritrea": {"dial_code": "+291", "code": "ER"},
    "Estonia": {"dial_code": "+372", "code": "EE"},
    "Ethiopia": {"dial_code": "+251", "code": "ET"},
    "Falkland Islands (Malvinas)": {"dial_code": "+500", "code": "FK"},
    "Faroe Islands": {"dial_code": "+298", "code": "FO"},
    "Fiji": {"dial_code": "+679", "code": "FJ"},
    "Finland": {"dial_code": "+358", "code": "FI"},
    "France": {"dial_code": "+33", "code": "FR"},
    "French Guiana": {"dial_code": "+594", "code": "GF"},
    "French Polynesia": {"dial_code": "+689", "code": "PF"},
    "Gabon": {"dial_code": "+241", "code": "GA"},
    "Gambia": {"dial_code": "+220", "code": "GM"},
    "Georgia": {"dial_code": "+995", "code": "GE"},
    "Germany": {"dial_code": "+49", "code": "DE"},
    "Ghana": {"dial_code": "+233", "code": "GH"},
    "Gibraltar": {"dial_code": "+350", "code": "GI"},
    "Greece": {"dial_code": "+30", "code": "GR"},
    "Greenland": {"dial_code": "+299", "code": "GL"},
    "Grenada": {"dial_code": "+1473", "code": "GD"},
    "Guadeloupe": {"dial_code": "+590", "code": "GP"},
    "Guam": {"dial_code": "+1671", "code": "GU"},
    "Guatemala": {"dial_code": "+502", "code": "GT"},
    "Guernsey": {"dial_code": "+44", "code": "GG"},
    "Guinea": {"dial_code": "+224", "code": "GN"},
    "Guinea-Bissau": {"dial_code": "+245", "code": "GW"},
    "Guyana": {"dial_code": "+595", "code": "GY"},
    "Haiti": {"dial_code": "+509", "code": "HT"},
    "Holy See (Vatican City State)": {"dial_code": "+379", "code": "VA"},
    "Honduras": {"dial_code": "+504", "code": "HN"},
    "Hong Kong": {"dial_code": "+852", "code": "HK"},
    "Hungary": {"dial_code": "+36", "code": "HU"},
    "Iceland": {"dial_code": "+354", "code": "IS"},
    "India": {"dial_code": "+91", "code": "IN"},
    "Indonesia": {"dial_code": "+62", "code": "ID"},
    "Iran, Islamic Republic of Persian Gulf": {
      "dial_code": "+98",
      "code": "IR"
    },
    "Iraq": {"dial_code": "+964", "code": "IQ"},
    "Ireland": {"dial_code": "+353", "code": "IE"},
    "Isle of Man": {"dial_code": "+44", "code": "IM"},
    "Israel": {"dial_code": "+972", "code": "IL"},
    "Italy": {"dial_code": "+39", "code": "IT"},
    "Jamaica": {"dial_code": "+1876", "code": "JM"},
    "Japan": {"dial_code": "+81", "code": "JP"},
    "Jersey": {"dial_code": "+44", "code": "JE"},
    "Jordan": {"dial_code": "+962", "code": "JO"},
    "Kazakhstan": {"dial_code": "+77", "code": "KZ"},
    "Kenya": {"dial_code": "+254", "code": "KE"},
    "Kiribati": {"dial_code": "+686", "code": "KI"},
    "Korea, Democratic People's Republic of Korea": {
      "dial_code": "+850",
      "code": "KP"
    },
    "Korea, Republic of South Korea": {"dial_code": "+82", "code": "KR"},
    "Kuwait": {"dial_code": "+965", "code": "KW"},
    "Kyrgyzstan": {"dial_code": "+996", "code": "KG"},
    "Laos": {"dial_code": "+856", "code": "LA"},
    "Latvia": {"dial_code": "+371", "code": "LV"},
    "Lebanon": {"dial_code": "+961", "code": "LB"},
    "Lesotho": {"dial_code": "+266", "code": "LS"},
    "Liberia": {"dial_code": "+231", "code": "LR"},
    "Libyan Arab Jamahiriya": {"dial_code": "+218", "code": "LY"},
    "Liechtenstein": {"dial_code": "+423", "code": "LI"},
    "Lithuania": {"dial_code": "+370", "code": "LT"},
    "Luxembourg": {"dial_code": "+352", "code": "LU"},
    "Macao": {"dial_code": "+853", "code": "MO"},
    "Macedonia": {"dial_code": "+389", "code": "MK"},
    "Madagascar": {"dial_code": "+261", "code": "MG"},
    "Malawi": {"dial_code": "+265", "code": "MW"},
    "Malaysia": {"dial_code": "+60", "code": "MY"},
    "Maldives": {"dial_code": "+960", "code": "MV"},
    "Mali": {"dial_code": "+223", "code": "ML"},
    "Malta": {"dial_code": "+356", "code": "MT"},
    "Marshall Islands": {"dial_code": "+692", "code": "MH"},
    "Martinique": {"dial_code": "+596", "code": "MQ"},
    "Mauritania": {"dial_code": "+222", "code": "MR"},
    "Mauritius": {"dial_code": "+230", "code": "MU"},
    "Mayotte": {"dial_code": "+262", "code": "YT"},
    "Mexico": {"dial_code": "+52", "code": "MX"},
    "Micronesia, Federated States of Micronesia": {
      "dial_code": "+691",
      "code": "FM"
    },
    "Moldova": {"dial_code": "+373", "code": "MD"},
    "Monaco": {"dial_code": "+377", "code": "MC"},
    "Mongolia": {"dial_code": "+976", "code": "MN"},
    "Montenegro": {"dial_code": "+382", "code": "ME"},
    "Montserrat": {"dial_code": "+1664", "code": "MS"},
    "Morocco": {"dial_code": "+212", "code": "MA"},
    "Mozambique": {"dial_code": "+258", "code": "MZ"},
    "Myanmar": {"dial_code": "+95", "code": "MM"},
    "Namibia": {"dial_code": "+264", "code": "NA"},
    "Nauru": {"dial_code": "+674", "code": "NR"},
    "Nepal": {"dial_code": "+977", "code": "NP"},
    "Netherlands": {"dial_code": "+31", "code": "NL"},
    "Netherlands Antilles": {"dial_code": "+599", "code": "AN"},
    "New Caledonia": {"dial_code": "+687", "code": "NC"},
    "New Zealand": {"dial_code": "+64", "code": "NZ"},
    "Nicaragua": {"dial_code": "+505", "code": "NI"},
    "Niger": {"dial_code": "+227", "code": "NE"},
    "Nigeria": {"dial_code": "+234", "code": "NG"},
    "Niue": {"dial_code": "+683", "code": "NU"},
    "Norfolk Island": {"dial_code": "+672", "code": "NF"},
    "Northern Mariana Islands": {"dial_code": "+1670", "code": "MP"},
    "Norway": {"dial_code": "+47", "code": "NO"},
    "Oman": {"dial_code": "+968", "code": "OM"},
    "Pakistan": {"dial_code": "+92", "code": "PK"},
    "Palau": {"dial_code": "+680", "code": "PW"},
    "Palestinian Territory, Occupied": {"dial_code": "+970", "code": "PS"},
    "Panama": {"dial_code": "+507", "code": "PA"},
    "Papua New Guinea": {"dial_code": "+675", "code": "PG"},
    "Paraguay": {"dial_code": "+595", "code": "PY"},
    "Peru": {"dial_code": "+51", "code": "PE"},
    "Philippines": {"dial_code": "+63", "code": "PH"},
    "Pitcairn": {"dial_code": "+872", "code": "PN"},
    "Poland": {"dial_code": "+48", "code": "PL"},
    "Portugal": {"dial_code": "+351", "code": "PT"},
    "Puerto Rico": {"dial_code": "+1939", "code": "PR"},
    "Qatar": {"dial_code": "+974", "code": "QA"},
    "Romania": {"dial_code": "+40", "code": "RO"},
    "Russia": {"dial_code": "+7", "code": "RU"},
    "Rwanda": {"dial_code": "+250", "code": "RW"},
    "Reunion": {"dial_code": "+262", "code": "RE"},
    "Saint Barthelemy": {"dial_code": "+590", "code": "BL"},
    "Saint Helena, Ascension and Tristan Da Cunha": {
      "dial_code": "+290",
      "code": "SH"
    },
    "Saint Kitts and Nevis": {"dial_code": "+1869", "code": "KN"},
    "Saint Lucia": {"dial_code": "+1758", "code": "LC"},
    "Saint Martin": {"dial_code": "+590", "code": "MF"},
    "Saint Pierre and Miquelon": {"dial_code": "+508", "code": "PM"},
    "Saint Vincent and the Grenadines": {"dial_code": "+1784", "code": "VC"},
    "Samoa": {"dial_code": "+685", "code": "WS"},
    "San Marino": {"dial_code": "+378", "code": "SM"},
    "Sao Tome and Principe": {"dial_code": "+239", "code": "ST"},
    "Saudi Arabia": {"dial_code": "+966", "code": "SA"},
    "Senegal": {"dial_code": "+221", "code": "SN"},
    "Serbia": {"dial_code": "+381", "code": "RS"},
    "Seychelles": {"dial_code": "+248", "code": "SC"},
    "Sierra Leone": {"dial_code": "+232", "code": "SL"},
    "Singapore": {"dial_code": "+65", "code": "SG"},
    "Slovakia": {"dial_code": "+421", "code": "SK"},
    "Slovenia": {"dial_code": "+386", "code": "SI"},
    "Solomon Islands": {"dial_code": "+677", "code": "SB"},
    "Somalia": {"dial_code": "+252", "code": "SO"},
    "South Africa": {"dial_code": "+27", "code": "ZA"},
    "South Sudan": {"dial_code": "+211", "code": "SS"},
    "South Georgia and the South Sandwich Islands": {
      "dial_code": "+500",
      "code": "GS"
    },
    "Spain": {"dial_code": "+34", "code": "ES"},
    "Sri Lanka": {"dial_code": "+94", "code": "LK"},
    "Sudan": {"dial_code": "+249", "code": "SD"},
    "Suriname": {"dial_code": "+597", "code": "SR"},
    "Svalbard and Jan Mayen": {"dial_code": "+47", "code": "SJ"},
    "Swaziland": {"dial_code": "+268", "code": "SZ"},
    "Sweden": {"dial_code": "+46", "code": "SE"},
    "Switzerland": {"dial_code": "+41", "code": "CH"},
    "Syrian Arab Republic": {"dial_code": "+963", "code": "SY"},
    "Taiwan": {"dial_code": "+886", "code": "TW"},
    "Tajikistan": {"dial_code": "+992", "code": "TJ"},
    "Tanzania, United Republic of Tanzania": {
      "dial_code": "+255",
      "code": "TZ"
    },
    "Thailand": {"dial_code": "+66", "code": "TH"},
    "Timor-Leste": {"dial_code": "+670", "code": "TL"},
    "Togo": {"dial_code": "+228", "code": "TG"},
    "Tokelau": {"dial_code": "+690", "code": "TK"},
    "Tonga": {"dial_code": "+676", "code": "TO"},
    "Trinidad and Tobago": {"dial_code": "+1868", "code": "TT"},
    "Tunisia": {"dial_code": "+216", "code": "TN"},
    "Turkey": {"dial_code": "+90", "code": "TR"},
    "Turkmenistan": {"dial_code": "+993", "code": "TM"},
    "Turks and Caicos Islands": {"dial_code": "+1649", "code": "TC"},
    "Tuvalu": {"dial_code": "+688", "code": "TV"},
    "Uganda": {"dial_code": "+256", "code": "UG"},
    "Ukraine": {"dial_code": "+380", "code": "UA"},
    "United Arab Emirates": {"dial_code": "+971", "code": "AE"},
    "United Kingdom": {"dial_code": "+44", "code": "GB"},
    "United States": {"dial_code": "+1", "code": "US"},
    "Uruguay": {"dial_code": "+598", "code": "UY"},
    "Uzbekistan": {"dial_code": "+998", "code": "UZ"},
    "Vanuatu": {"dial_code": "+678", "code": "VU"},
    "Venezuela, Bolivarian Republic of Venezuela": {
      "dial_code": "+58",
      "code": "VE"
    },
    "Vietnam": {"dial_code": "+84", "code": "VN"},
    "Virgin Islands, British": {"dial_code": "+1284", "code": "VG"},
    "Virgin Islands, U.S.": {"dial_code": "+1340", "code": "VI"},
    "Wallis and Futuna": {"dial_code": "+681", "code": "WF"},
    "Yemen": {"dial_code": "+967", "code": "YE"},
    "Zambia": {"dial_code": "+260", "code": "ZM"},
    "Zimbabwe": {"dial_code": "+263", "code": "ZW"}
  };

  final countryCode = countryInfoJson[countryName]?["code"];

  if (countryCode != null) {
    final countryCodeInLowerCase = countryCode.toLowerCase();
    return 'https://flagcdn.com/h80/$countryCodeInLowerCase.png';
  }

  return null;
  //
}

String? parseGoogleCode(String? url) {
  if (url != null && url.contains('code=')) {
    // Split the string by "&"
    List<String> parameters = url.split('&');
    // Traverse through the parameters
    for (String param in parameters) {
      // Check if the parameter contains "code="
      if (param.contains('code=')) {
        // Split the parameter by "="
        List<String> codeParam = param.split('=');
        // Return the second element which is the code
        return codeParam[1];
      }
    }
  }

  return null;
}

String? jsonTostring(dynamic arg1) {
  return jsonEncode(arg1); // Convierte el objeto a un string JSON
}

List<CourseWorkStruct>? joinAssigments(
  List<CourseWorkStruct>? arg1,
  List<CourseWorkStruct>? arg2,
) {
  // Si arg1 o arg2 son null, los tratamos como listas vacías
  arg1 ??= [];
  arg2 ??= [];

  // Añadimos los elementos de arg2 a arg1
  arg1.addAll(arg2);

  return arg1;
}

List<CourseWorkStruct>? setCourseName(
  List<CourseWorkStruct>? list,
  String? courseName,
  DateTime? time,
  int? weeks,
) {
  if (list == null) return [];

  final referenceTime = time ?? DateTime.now();

  // si weeks es null usar 12 por defecto
  final int weeksToUse = weeks ?? 12;

  // calcular fecha hacia atrás según weeks
  final DateTime limitDate =
      referenceTime.subtract(Duration(days: 7 * weeksToUse));

  // filtrar y asignar courseName
  return list.where((element) {
    final DateTime elementTime = DateTime.parse(element.updateTime);

    if (elementTime.isAfter(limitDate)) {
      element.coursename = courseName;
      return true;
    }

    return false;
  }).toList();
}

DateTime? combinetoDateTime(
  String? year,
  String? month,
  String? day,
) {
  // Verificar si alguno de los valores es null
  if (year == null || month == null || day == null) return null;

  // Intentar convertir los valores de String a int
  int? yearInt = int.tryParse(year);
  int? monthInt = int.tryParse(month);
  int? dayInt = int.tryParse(day);

  // Verificar si la conversión fue exitosa
  if (yearInt == null || monthInt == null || dayInt == null) {
    return null;
  }

  // Crear la fecha en el inicio del día (00:00:00)
  return DateTime(yearInt, monthInt, dayInt);
}

DateTime? convertCurrentTimeintoStartDate(DateTime? date) {
  // Si la fecha es nula, retorna nulo
  if (date == null) return null;

  // Establece la hora, minutos, segundos y milisegundos a 0 para obtener el inicio del día
  return DateTime(date.year, date.month, date.day);
}

List<CourseWorkStruct> sortMyData(
  List<CourseWorkStruct> courseWork,
  int index,
  bool ascending,
) {
// Sort by 'id' for 0, 'firstName' for 1, 'number' for 2, 'email' for 3 in code.
  switch (index) {
    case 0:
      courseWork.sort((a, b) => ascending
          // if ascending is true, sort by ascending order
          ? a.coursename.compareTo(b.coursename)
          // else, sort by descending order
          : b.coursename.compareTo(a.coursename));
      break;
    default:
      break;
  }
  return courseWork;
}

DateTime? creatDateTime(
  int? year,
  int? month,
  int? day,
) {
  if (year == 0 || month == 0 || day == 0) {
    return DateTime(1950, 1, 1, 0, 0); // Fecha de 1950-01-01 00:00
  }

  // Si los valores no son 0, creamos la fecha con los valores dados
  return DateTime(year ?? 0, month ?? 1, day ?? 1, 0,
      0); // Asignamos la hora y minutos a 00:00 si son válidos
}

String? quitSpaceUrl(String? arg1) {
  if (arg1 == null) return "";
  return arg1.trim().replaceAll(RegExp(r'\s+'), '%20');
}

bool? nonePar(int? index) {
  if (index == null) return false;
  return index % 2 == 0;
}

String? dueDateTransform(
  String? year,
  String? month,
  String? day,
  String? hours,
  String? minutes,
) {
  if (year == null || month == null || day == null) return "- - / - - / - -";

  final int y = int.parse(year);
  final int m = int.parse(month);
  final int d = int.parse(day);
  final int h = hours != null ? int.parse(hours) : 0;
  final int min = minutes != null ? int.parse(minutes) : 0;

  // Construir en UTC
  final utcDate = DateTime.utc(y, m, d, h, min);

  // Convertir a local (usuario)
  final localDate = utcDate.toLocal();

  // Formato MM/DD/YYYY
  final mm = localDate.month.toString().padLeft(2, '0');
  final dd = localDate.day.toString().padLeft(2, '0');
  final yyyy = localDate.year.toString();

  return "$mm/$dd/$yyyy";
}
