class Utils {
  static String capitalize(String input) {
    return input
        .split(" ")
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(" ");
  }
}
