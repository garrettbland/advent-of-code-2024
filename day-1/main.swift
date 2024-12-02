import Foundation

// Run with "swiftc main.swift data.swift -o app && ./app"

// Our sample data
// var sampleA = [3, 4, 2, 1, 3, 3]
// var sampleB = [4, 3, 5, 3, 9, 3]

// 1. Find smallest in sample A, save index
// 2. Find smallest in sample B, save index
// 3. Calculate distance between these two, add to new array
// 4. Remove both from sample A and sample B array (maybe?)
func findDistances(from listA: [Int], to listB: [Int]) -> Int {

  // Array to hold all distances
  var distances: [Int] = []

  // Using sorted to return a new sorted array, rather than mutating arguments
  // Also swift yells at us if we try to use ".sort()"
  let orderedArrayA = listA.sorted()
  let orderedArrayB = listB.sorted()

  for (index, item) in orderedArrayA.enumerated() {
    // Append the distance between numbers.
    // Gets the absolute value (meaning remove the negative) using "abs" function
    distances.append(abs(item - orderedArrayB[index]))
  }

  return distances.reduce(0) { acc, current in
    return current + acc
  }

}

// 1. Loop through items in listA
// 2. Find number of occurances of that item in listB
// Multiple item from listA * number of occurences
func calculateSimilarityScores(from listA: [Int], and listB: [Int]) -> Int {
  var similarityScores: [Int] = []

  for itemA in listA {
    var occurences: Int = 0

    for itemB in listB {
      if itemA == itemB {
        occurences = occurences + 1
      }
    }

    similarityScores.append(itemA * occurences)
  }

  return similarityScores.reduce(0) { $0 + $1 }
}

func main() {
  print("Starting...")

  let totalDistances = findDistances(from: PuzzleInput.listA, to: PuzzleInput.listB)

  let similarityScore = calculateSimilarityScores(from: PuzzleInput.listA, and: PuzzleInput.listB)

  print("Total Distances: \(totalDistances)")
  print("Similarity Score: \(similarityScore)")

}

main()
