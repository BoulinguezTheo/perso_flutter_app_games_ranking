class Player {
  final String name;
  int victories;
  int defeats;

  Player(this.name, this.victories, this.defeats);

  double getScore() {
    double score = victories / (victories + defeats);
    String inString = score.toStringAsFixed(3);
    double inDouble = double.parse(inString);
    return inDouble;
  }
}