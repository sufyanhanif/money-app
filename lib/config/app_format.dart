import 'package:intl/intl.dart';

class AppFormat{
  static String date(String stringDate){
     DateTime dataTime = DateTime.parse(stringDate);
     return DateFormat('dd MMM yyyy','id_ID').format(dataTime);
  }
}