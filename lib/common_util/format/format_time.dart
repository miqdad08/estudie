import 'package:intl/intl.dart';

String formatTimeAgo(int timeMilliseconds) {
  DateTime currentTime = DateTime.now();
  DateTime reviewTime = DateTime.fromMillisecondsSinceEpoch(timeMilliseconds);

  // Calculate the difference in days
  int differenceInDays = currentTime.difference(reviewTime).inDays;

  if (differenceInDays == 0) {
    // Today: Format time only
    return DateFormat('H:mm').format(reviewTime);
  } else if (differenceInDays == 1) {
    // Yesterday
    return 'Yesterday';
  } else {
    // 2 days ago or more: Format as "2 days ago" or "N days ago"
    return '$differenceInDays days ago';
  }
}