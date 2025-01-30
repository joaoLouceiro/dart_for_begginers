import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print("Usage dart totals.dart <inputFile.csv>");
    exit(1);
  }
  final inputFile = args.first;
  final lines = File(inputFile).readAsLinesSync();
  Map durationByTag = {};
  lines.removeAt(0);
  for (var line in lines) {
    final List<String> values = line.split(',');

    String strDuration = values[3].split('\"')[1];
    final double duration = double.parse(strDuration);
    final tag = values[5];
    durationByTag.putIfAbsent(tag, () => 0);
    durationByTag[tag] += duration;
  }

  for (var entry in durationByTag.entries) {
    print("${entry.key} ${entry.value}");
  }
}
