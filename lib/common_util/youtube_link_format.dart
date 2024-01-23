String formattedLink(String url) {
  int startIndex = url.indexOf('v=');
  if (startIndex != -1) {
    startIndex += 2;
    int endIndex = url.indexOf('&', startIndex);
    if (endIndex != -1) {
      return url.substring(startIndex, endIndex);
    } else {
      return url.substring(startIndex);
    }
  }
  return '';
}
