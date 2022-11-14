import Foundation

func checkLotteryTicket(withNumber num: Int) -> Bool {
    let convertToString: String = String(num)
    let halfLength = convertToString.count / 2
    var firstArrayPart = [Int]()
    var secondArrayPart = [Int]()
    
    // get an array with digital numbers
    let digitalArray = convertToString.compactMap{ Int( String($0) ) }
    
    //Split the array into two arrays
    for (index, number) in digitalArray.enumerated() {
        if index < halfLength {
            firstArrayPart.append(number)
        } else {
            secondArrayPart.append(number)
        }
    }
    
    return firstArrayPart.reduce(0, +) == secondArrayPart.reduce(0, +)
}
