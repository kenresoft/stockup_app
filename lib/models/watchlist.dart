class Watchlist {
  Watchlist(
    this.firstRowItems,
    this.secondRowItems,
    this.thirdRowItems,
  );

  final (int, double, double) firstRowItems;
  final (String, double) secondRowItems;
  final (double, double, double) thirdRowItems;
}
