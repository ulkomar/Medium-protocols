import Foundation

class LaserCoordinates {
    private var currentLaserPosition: [Int] = []
    private var segmentCoordinates: [[Int]] = []
    private var writtenSteps: [[Int]] = []
    private var displayedResult: [[Int]] = []
    
    init(sheetSegments seg: [[Int]], figureCoordinates fig: [[Int]], figurePosition figPos: [Int]) {
        segmentCoordinates = converFigureCoordinateToSheetCoordinate(with: fig, figurePosition: figPos)
        segmentCoordinates += seg
        currentLaserPosition = [0, 0]
        getCoordinates()
    }
    
    private func getCoordinates() {
        let intersections = getIntersectedSegments(array: segmentCoordinates)
        segmentCoordinates = getClearedArray(array: segmentCoordinates, intersections: intersections)
        getOptimalWay()
    }
    
    private func converFigureCoordinateToSheetCoordinate(with fig: [[Int]], figurePosition figPos: [Int]) -> [[Int]] {
        var result = [Int]()
        var convertedArray = [[Int]]()
        
        // Convert to a flat array of the coordinate segment system
        for (index, _) in fig.enumerated() {
            if index+1 == fig.count {
                result += (fig[index] + fig[0])
            } else {
                result += (fig[index] + fig[index+1])
            }
        }
        
        //Add figure position to X and Y to convert them to the coordinate segment system
        for (index, _) in result.enumerated() {
            if index % 2 == 0 {
                result[index] += figPos[0]
            } else {
                result[index] += figPos[1]
            }
        }
        
        //Split the array into 4 segment arrays, like (x1, y1, x2, y2)
        var subArray = [Int]()
        for (index, point) in result.enumerated() {
            subArray.append(point)
            if (index+1) % 4 == 0 && index != 0{
                convertedArray.append(subArray)
                subArray = []
            }
        }
        
        return convertedArray
    }
    
    // checks whether a line intersects with a different line
    private func pointIntersection(line: [Int], point: [Int]) -> Bool {
        //Point - P1
        let x1 = line[0]
        let y1 = line[1]
        //Point - P2
        let x2 = line[2]
        let y2 = line[3]
        
        //Point - P
        let Px1 = point[0]
        let Py1 = point[1]
        
        let vectorP1P = [Px1-x1, Py1-y1]
        let vectorP1P2 = [x2-x1, y2-y1]
        
        let colleniality = vectorP1P[0]*vectorP1P2[1]-vectorP1P[1]*vectorP1P2[0]
        
        if colleniality == 0 && ((Px1 >= x1 && Px1 <= x2) || (Px1 >= x2 && Px1 <= x1)) {
            return true
        } else {
            return false
        }
    }
    
    private func getIntersectedSegments(array: [[Int]]) -> [[Int]] {
        var intersectedlines = [[Int]]()
        let countOfLines = segmentCoordinates.count
        
        //Loop through all elements to find intersected lines
        for (index, _) in segmentCoordinates.enumerated() {
            for idx in index+1..<countOfLines {
                let lineSecond = segmentCoordinates[idx]
                let firstPointOfFirstLine = [segmentCoordinates[index][0],
                                              segmentCoordinates[index][1]]
                let secondPointOfFirstLine = [segmentCoordinates[index][2],
                                              segmentCoordinates[index][3]]
                
                if pointIntersection(line: lineSecond, point: firstPointOfFirstLine),
                   pointIntersection(line: lineSecond, point: secondPointOfFirstLine) {
                    intersectedlines.append(segmentCoordinates[index])
                }
            }
        }
        
        return intersectedlines
    }
    
    // removes intersections and returns a clear array
    private func getClearedArray(array: [[Int]], intersections: [[Int]]) -> [[Int]] {
        let intersections = getIntersectedSegments(array: segmentCoordinates)
        var clearedSegments = [[Int]]()
        
        clearedSegments = segmentCoordinates.filter { segment in
            if intersections.contains(segment) {
                return false
            } else {
                return true
            }
        }
        return clearedSegments
    }
    
    // finds the optimal distance to the segment and change the laser position
    // adds the displayed coordinates to the property 'displayedResult"
    private func findNearestPoint(array: [[Int]]) -> [Int] {
        var min: Double = 10000000
        var coordinatesPosition = 0 //1 - the first two ones, 2 - the second two ones
        var minSegment = [Int]()
        for segment in array {
            if writtenSteps.contains(segment) {continue}
            
            let deltaX1 = segment[0] - currentLaserPosition[0]
            let deltaY1 = segment[1] - currentLaserPosition[1]
            
            let deltaX2 = segment[2] - currentLaserPosition[0]
            let deltaY2 = segment[3] - currentLaserPosition[1]
            
            let powXY = pow(Double(deltaX1), 2) + pow(Double(deltaY1), 2)
            let powX2Y2 = pow(Double(deltaX2), 2) + pow(Double(deltaY2), 2)
            
            let d1 = sqrt(powXY)
            let d2 = sqrt(powX2Y2)
            
            
            if d1 < min {
                min = d1
                minSegment = segment
                coordinatesPosition = 1
            }
            if d2 < min {
                min = d2
                minSegment = segment
                coordinatesPosition = 2
            }
            
        }
        
        if coordinatesPosition == 1 {
            currentLaserPosition = [minSegment[2], minSegment[3]]
            displayedResult.append([minSegment[0], minSegment[1], minSegment[2], minSegment[3]])
        } else {
            currentLaserPosition = [minSegment[0], minSegment[1]]
            displayedResult.append([minSegment[2], minSegment[3], minSegment[0], minSegment[1]])
        }
         
        writtenSteps.append(minSegment)
        min = 10000000
        return minSegment
    }
    
    private func getOptimalWay() {
        for _ in 0..<segmentCoordinates.count {
            writtenSteps.append(findNearestPoint(array: segmentCoordinates))
        }
    }
    
    func displayOptimalWay() {
        for segment in displayedResult {
            print("\(segment[0]), \(segment[1]), \(segment[2]), \(segment[3])")
        }
    }
}


//Check the functionality
let sheetSegments = [[500, 0, 500, 3210],
                     [0, 15, 6000, 15],
                     [2000, 0, 2000, 3210],
                     [500, 1515, 2000, 1515]]

let figureCoordinates = [[0,0],
                         [1500, 0],
                         [1500, 1000],
                         [0, 1485]]

let figurePosition = [500, 15]

let fig = LaserCoordinates(sheetSegments: sheetSegments,
                           figureCoordinates: figureCoordinates,
                           figurePosition: [500, 15])
fig.displayOptimalWay()
