
var myArray: [Int] = [2,3]
var add = true
var answer: Int = 0

if (add == true) {
    answer = myArray[0] + myArray[1]
    myArray.removeLast()
    myArray[0] = answer
    add = false
}

println("The answer is \(answer)")

myArray.append(10)
var multiply = true

if (multiply == true) {
    answer = myArray[0] * myArray[1]
    myArray.removeLast()
    myArray[0] = answer
    multiply = false
}

println("The answer is \(answer)")
