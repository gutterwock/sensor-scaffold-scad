use <sensorScaffold.scad>

$fn = 8;

rows = [
  [1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1],
  [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1.75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.25],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
];

split = [
  [4, 5, 10],
  [3, 8, 13],
  [3, 8, 12],
  [4, 9, 13],
  [4, 9, 13]
];

// a3144
sensorDimensions = [4, 3, 2]; 
sensorWireDimensions = [8, .2];

rowDepth = 19;
baseColumnWidth = 19;
sensorOffset = [3.25, 3.25];
plateMargin = 4;
plateHeight = .6;
scaffoldWidth = 1.6;


color([1, 0, 0]) SensorScaffold(
  baseColumnWidth,
  rowDepth,
  rows,
  sensorDimensions,
  sensorOffset,
  plateMargin,
  plateHeight,
  scaffoldWidth,
  0,
  split
);

color([0, 1, 0]) SensorScaffold(
  baseColumnWidth,
  rowDepth,
  rows,
  sensorDimensions,
  sensorOffset,
  plateMargin,
  plateHeight,
  scaffoldWidth,
  1,
  split
);

color([0, 0, 1]) SensorScaffold(
  baseColumnWidth,
  rowDepth,
  rows,
  sensorDimensions,
  sensorOffset,
  plateMargin,
  plateHeight,
  scaffoldWidth,
  2,
  split
);