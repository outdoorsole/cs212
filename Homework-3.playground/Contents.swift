// Assignment 3: Classes and Structs
// Objectives:
// - create classes
// - create structs
// - create stored and computed properties
// - create observers
// - class inheritance

import Cocoa

// CIRCLE

// Write a struct named Circle
struct Circle {
    
    // Give your circle a property named radius with the type Double.
    var radius: Double {
        // Use a property observer to ensure that radius has a minimum value of 0 and a maximum value of 10. That is, if a circle's radius is set to a negative value, set it to 0. If a circle's radius is set to a value over 10, set it to 10.
        didSet {
            if radius < 0 {
                radius = 0
            } else if radius > 10 {
                radius = 10
            }
        }
    }
    
    // Give your circle a property named name with the type String optional.
    var name: String?
    
    // Create a computed property named area. The formula for area is 3.14159*radius*radius
    var area: Double {
        get {
            return 3.14159*radius*radius
        }
    }
    // Create an init method with no parameters that sets the radius to 0 and leaves the name to be nil
    init() {
        radius = 0
    }
    // Create another initializer that accepts two parameters named radius and name to parameter name.
    init(radius: Double, name: String) {
        self.radius = radius
        self.name = name
    }
}

print("------------------")
print("1 - CIRCLE STRUCTS:")

// Output: using first init method
var circle1 = Circle(radius: 12, name: "circle1")
circle1.radius = 5
print("circle1 radius: \(circle1.radius)")
print("circle1 name: \(circle1.name!)")

// Output: using second init method
var circle2 = Circle()
print("circle2 radius: \(circle2.radius)")
print("------------------")

// CIRCLECOLLECTION

// Write a class named CircleCollection
class CircleCollection {
   // It should have a private property of type [Circle] (an array of circles). Initially, this should be an empty array.
    private var circleArray: [Circle] = []
    
    // It should have a computed property named count that returns the number of elements in the circle array.
    var count: Int = 0
    
    // It should have a method named add(circle: Circle), that add parameter circle to the array.
    func add(circle: Circle) {
        circleArray.append(circle)
        // Increase the count by 1 for the number of circles in the circleArray
        count += 1
    }
    
    // It should have a method named displayCircleWithRadiusBetween(min: Double, max: Double) which will display information to the debug area about all the circles in the collection which have a radius between parameters min and max, inclusive.
    func displayCircleWithRadiusBetween(min: Double, max: Double) {
        print("2 - CIRCLE ARRAY INFORMATION:")
        for circle in circleArray {
            // 1) Check if the circle is within the given min and max values. If so, continue.
            if circle.radius >= min && circle.radius <= max {
                // 2) If a circle doesn't have a value for name (i.e. it is nil), display a string saying "no-name circle has area: x" where x is the area of the circle.
                if circle.name != nil {
                    print("\(circle.name!) and has area: \(circle.area).")
                } else {
                    print("no-name circle has area: \(circle.area).")
                }
            }
        }
    }
}

var circleCollection = CircleCollection()
circleCollection.add(circle: circle1)
circleCollection.add(circle: circle2)
circleCollection.count
circleCollection.displayCircleWithRadiusBetween(min: 0, max: 5)
print("------------------")

// TODOITEM

// Write a class named ToDoItem, that could be used in an app that keeps a list tasks that the user wants to do.
class ToDoItem {
    // Give the class a String property named task.
    var task: String = ""
    
    // Give the class Int property named priority.
    var priority: Int = 0 {
        // Use an observer to ensure that the value is in the range 0 to 10.
        didSet {
            if priority < 0 {
                priority = 0
            } else if priority > 10 {
                priority = 10
            }
        }
    }
    
    // Give the class an optional property named dueDate. Its data type should be a Date optional.
    var dueDate: Date?
    
    // Give the class a method named fullDescription() that returns a string with the task, priority, and the due date if there is one. The format of this string is up to you. Anything that includes the information is fine. You should conditionally unwrap the date, to form appropriate strings for items that have dates, and for items that do not. Hint: look up the DateFormatter class to help convert a Date to a String.
    func fullDescription() -> String {
        return "Test"
    }
}

print("3 - TODOITEM")
var todo = ToDoItem()
var description = todo.fullDescription()
print(description)
