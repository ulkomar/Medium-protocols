var closure = {return true}
/// -----

var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func sortList(list: [Int], closure: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for element in list {
        if closure(element) {
            result.append(element)
        }
    }
    return result
}

var newList = sortList(list: numbers, closure: { (num) in
    return num < 5
})

var newList2 = sortList(list: numbers, closure: { num in
    return num < 5
})

var newList3 = sortList(list: numbers, closure: { num in num < 5 })

var newList4 = sortList(list: numbers, closure: {$0 < 5 })

var newList5 = sortList(list: numbers) {num in num < 5}


var arrayForSorting = [1, 5, 3, 8, 4, 9]
var sortedArray = arrayForSorting.sorted(by: < )

var a = 1
var b = 2

let closureSum: () -> Int = { [a, b] in
    return a + b
}

print( closureSum() )

a = 6
b = 7

print( closureSum() )


var nums: [Int] = [1, 2, 3]
func mainFunction(closure: @autoclosure () -> Int) {
    print(closure())
}

mainFunction(closure: nums.remove(at: 0) )



