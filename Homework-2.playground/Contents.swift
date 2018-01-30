
/*:
 ---
## 1. Counting nils

The `generateRandomArrayOfIntsAndNils` function creates an array that is a random mix of Int values and nils. 
 
 Write code that counts the number of nil values in array1 and prints this number to the debug area
*/

let array1: [Int?]
array1 = generateRandomArrayOfIntsAndNils()

var total: Int = 0

// Your Swift code for question 1 here:

var nilValues = 0
for num in array1 {
    if num == nil {
        total += 1
    }
}
print("Total nil values: \(total)")
print("---------------")
/*:
 ---
## 2. Mean

Write code that calculates the mean (average) value of the non-nil elements in array2, and prints the mean out to the debug area.  Note that the answer might include decimal places.
*/
let array2 = generateRandomArrayOfIntsAndNils()

// Your Swift code for question 2 here:
var numCountArray2 = 0
var sumArray2 = 0
var average: Double

for value in array2 {
    if value != nil {
        // increment the count of non-nil elements
        numCountArray2 += 1
        // include value of non-nil element to sum
        sumArray2 += value!
    }
}

// calculate the average of non-nil elements in array2
average = Double(sumArray2) / Double(numCountArray2)
print("The average is: \(average)")
print("---------------")

/*:
 ---
## 3. New Array

 Write code that adds values to the array named nilFree3 so that it has the same elements
 as array3, except without the nil values. The elements in nilFree3 should be
 Ints, not Int optionals.
 
*/

let array3 = generateRandomArrayOfIntsAndNils()
var nilFree3 = [Int]()

// Your Swift code for question 3 here:
for value in array3 {
    if value != nil {
        nilFree3.append(value!)
    }
}

/*:
 ---
 ## 4. Airline
 
 There are two dictionaries defined for two different fictional airlines, NorcalAir
 and SocalAir named `norcal` and `socal`, respectively, representing the airports and
 cities that the two airlines serve.
 
 The key is a String containing the airport code, e.g. "SFO", and the value
 is a String containing the name of the city that the airport serves, e.g. "San
 Francisco".
 
 NorcalAir has decided to acquire SocalAir and make a new airline called
 CaliAir, which serves all of the cities that the existing airlines serve.
 Your job is to create a new dictionary named `cali` which contains all
 of the cities that CaliAir serves, i.e. all cities that either NorcalAir
 or SocalAir serve.  If both NorcalAir and SocalAir serve the same city,
 `cali` should contain the name of the city from `norcal`.  Like the existing
 dictionaries, its key and value should both be of type String.
 
 Once you have created `cali`, print out all entries to the debug area.  Order
 doesn't matter.
 
 Hint: you might want to print out all entries in `norcal` and `socal` first to
 see what's in the dictionaries and help verify your answer.
 
 Note: your code should work for any given `norcal` and `socal` dictionaries.
 In other words, I should be able add a city to `norcal` and your solution should
 still work.
 */

// Your Swift code for question 4 here:

// Create new dictionary
var caliair = [String: String]()

print("NorcalAir airports and cities:")
for (key, value) in norcal {
    print("Airport code: \(key), Airport name: \(value)")
    // Add NorcalAir airport codes and cities first
    caliair[key] = value
}
print("")

print("SocalAir airports and cities:")
for (key, value) in socal {
    print("Airport code: \(key), Airport name: \(value)")
}
print("")


for (socalKey, socalValue) in socal {
    // Check if CaliAir dictionary already contains airport code (already exists)
    if caliair.keys.contains(socalKey) {
        // Do nothing, default will be NorcalAir information
    } else {
        // Create new key in caliair dictionary and add value
        caliair[socalKey] = socalValue
    }
}

// Print new combined dictionary
print("CaliAir serves the following airports (with codes and cities): \(caliair)")
print("---------------")
/*:
 ---
## 5. Sort array

 Write code that will sort array4 using your own logic.  You might want to
 review the logic for Selection Sort or Bubble Sort online.  Find a sort
 algorithm that you like in a language that you are familiar with and then
 translate it to Swift.  Resist the temptation to find a sort online that
 is already written in Swift and copy and paste it.  Do not use Swift's sort
 method.

 Note that array4 is declared with var, so that it is a mutable array, i.e. it
 can be modified.
*/
 
var array4 = generateRandomArrayOfIntsAndNils()

// Your Swift code for question 5 here:
// BUBBLE SORT
// Explanation (from Wikipedia.org):
// start at the beginning of the list
// compare every adjacent pair
// swap the position of the pair if not in the right order
// after each iteration, compare one less element from the list (last item will be the largest)

// Original array:
print("Array4: \(array4)")

// Sorting
print("BUBBLE SORT")

// Create variable that will temporarily store the value to be swapped (smaller value)
var temp: Int?
// Create a variable to store the number of times to pass through the array
// Sort iterations will begin with 1 less than the total array size
var countdown = array4.count - 1
print("Countdown (iterations) starts at: \(countdown)")

// Continue to loop until all unsorted elements have been sorted
while countdown > 0 {
    for index in 0..<array4.count {
//        // Check to make sure that the last value to compare is within the array range (not out of bounds)
        if index + 1 < array4.count {
            // Check if both of the elements in the pair are nil
            if array4[index] == nil || array4[index + 1] == nil {
                if array4[index] == nil && array4[index + 1] == nil {
                    // 1) Do nothing; both elements are nil, leave them in place.
                } else if array4[index] == nil {
                    // 2) Do nothing, both elements are in the correct order
                } else {
                    // 3) Move the nil element to the left
                    temp = nil
                    array4[index + 1] = array4[index]!
                    array4[index] = temp
                }
            } else {
                // Both elements contain a value
                // Compare the two adjacent pairs; see if left value is greater than the value on the right
                if array4[index]! > array4[index + 1]! {
                    // Store the smaller value (value on the right) in the temporary variable
                    temp = array4[index + 1]
                    // Replace the value on the right with the value on the left (larger value)
                    array4[index + 1] = array4[index]
                    // Replace the value on the left with the smaller value (from the temp variable)
                    array4[index] = temp
                }
            }
        }
    }
    // Decrement the iterations after one pass of the entire array is complete
    countdown -= 1
}

print("Array after sorting: \(array4)")
