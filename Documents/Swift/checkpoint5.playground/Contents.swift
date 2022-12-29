//Checkpoint 5 - Closures
//From an array of lucky numbers do the following -
//Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//filtering out any even numbers
let oddLuckyNumbers = luckyNumbers.filter{
    if $0.isMultiple(of: 2) {return false}
    return true
}
print(oddLuckyNumbers)

//sorting the odd lucky numbers array
let sortedLuckyNumbers = oddLuckyNumbers.sorted()
print(sortedLuckyNumbers)

//printing lucky numbers in the given format
let luckyNumbersString = sortedLuckyNumbers.map{
    "\($0) is a lucky number"
}
for luckyNumber in luckyNumbersString {
    print(luckyNumber)
}

