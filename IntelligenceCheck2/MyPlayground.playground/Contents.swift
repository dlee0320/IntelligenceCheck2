//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 6
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let optionalInt: Int? = 9
let actualInt: Int = optionalInt!

let randomSentence = "The sum of two unrelated numbers is \(myVariable + apples)."

var ratingList = ["Poor", "Fine", "Good", "Excellent"]
ratingList[0] = "OK"
ratingList

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
print(teamScore)
