use <sensorScaffold.scad>

$fn = 8;

rows = [
  [1, 1, 1, 1],
  [1, 1, 1, 1],
  [1, 1, 1, 1],
  [1, 1, 1, 1],
];

// a3144
sensorDimensions = [4, 3, 2]; 
sensorWireDimensions = [8, .2];

rowDepth = 19;
baseColumnWidth = 19;
sensorOffset = [5, 5];
plateMargin = 4;
plateHeight = .6;
scaffoldWidth = 1.6;

SensorScaffold(
  baseColumnWidth,
  rowDepth,
  rows,
  sensorDimensions,
  sensorOffset,
  plateMargin,
  plateHeight,
  scaffoldWidth
);