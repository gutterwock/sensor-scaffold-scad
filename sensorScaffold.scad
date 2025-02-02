include <util.scad>

module SensorScaffold(
  baseColumnWidth,
  rowDepth,
  rows,
  sensorDimensions,
  sensorOffset,
  plateMargin,
  plateHeight,
  scaffoldWidth,
  section,
  split
) {
  for(rowIndex = [0 : len(rows) - 1])
    let(rowOffset = (rowIndex + 1) * rowDepth) {
      for(colIndex = [0 : len(rows[rowIndex]) - 1])
        let(
          colOffset = baseColumnWidth * sumTo(rows[rowIndex], colIndex),
          width = baseColumnWidth * rows[rowIndex][colIndex]
        ) {
          if (section == "undefined" || (split && split[rowIndex] && colIndex <= split[rowIndex][section] && (section == 0 ? true : colIndex > split[rowIndex][section - 1])))
            translate([colOffset - width / 2, rowOffset - rowDepth / 2, 0])  
              union() {
                cube([width, rowDepth, plateHeight], true); // for debug
                translate([sensorOffset[0], sensorOffset[1], -(plateHeight + sensorDimensions[2]) / 2])
                  difference() {
                    cube([sensorDimensions[0] + 2 * scaffoldWidth, sensorDimensions[1] + scaffoldWidth, sensorDimensions[2]], true);
                    translate([0, -scaffoldWidth, 0])
                      cube([sensorDimensions[0], sensorDimensions[1] + scaffoldWidth, sensorDimensions[2] + 1], true);
                  }
              }
        }    
    }
};
