include <util.scad>

$fn = 8;

// 4x4
//rows = [
//  [1, 1, 1, 1],
//  [1, 1, 1, 1],
//  [1, 1, 1, 1],
//  [1, 1, 1, 1],
//];

//
// 65%
rows = [
  [1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1],
  [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1.75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.25],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
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

module SensorWire() {
  rotate([90, 0 ,0])
    cylinder(sensorWireDimensions[0], sensorWireDimensions[1], sensorWireDimensions[1], true);
};

module Sensor() {
  union() {
    cube(sensorDimensions, true);
    translate([0, -(sensorDimensions[1] + sensorWireDimensions[0]) / 2, 0]) {
      translate([-sensorWireDimensions[1] * 4, 0, 0])
        SensorWire();
      SensorWire();
      translate([sensorWireDimensions[1] * 4, 0, 0])
        SensorWire();
    }
  }
};

module Cell(width) {
  union() {
//    cube([width, rowDepth, plateHeight], true); // for debug
    translate([sensorOffset[0], sensorOffset[1], -(plateHeight + sensorDimensions[2]) / 2])
    difference() {
      cube([sensorDimensions[0] + 2 * scaffoldWidth, sensorDimensions[1] + scaffoldWidth, sensorDimensions[2]], true);
      translate([0, -scaffoldWidth, 0])
        cube([sensorDimensions[0], sensorDimensions[1] + scaffoldWidth, sensorDimensions[2] + 1], true);
    }
    // for debug
//    translate([sensorOffset[0], sensorOffset[1] - scaffoldWidth / 2, -(plateHeight + sensorDimensions[2]) / 2])
//    color([1,0,0])
//      Sensor();
  }
};

for(rowIndex = [0 : len(rows) - 1])
  let(rowOffset = (rowIndex + 1) * rowDepth) {
    for(colIndex = [0 : len(rows[rowIndex]) - 1])
      let(colOffset = baseColumnWidth * sumTo(rows[rowIndex], colIndex)) {
        translate([colOffset - baseColumnWidth * rows[rowIndex][colIndex] / 2, rowOffset - rowDepth / 2, 0])
          Cell(baseColumnWidth * rows[rowIndex][colIndex]);
      }    
  }
