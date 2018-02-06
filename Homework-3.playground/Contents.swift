// Assignment 3: Classes and Structs
// Objectives:
// - create classes
// - create structs
// - create stored and computed properties
// - create observers
// - class inheritance

import Cocoa

// ******************************************************************
// CIRCLE
// ******************************************************************

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
    
    // Create a computed property named area. The formula for area is 3.14159 * radius * radius
    var area: Double {
        get {
            return 3.14159 * radius * radius
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

// CIRCLE OUTPUT
print("------------------")
print("1 - CIRCLE STRUCTS:")

// Output: using first init method
var circle1 = Circle(radius: 5, name: "circle1")
print("circle1 radius (initially set with init method): \(circle1.radius)")
circle1.radius = 12
print("circle1 radius (after trying to set it above max): \(circle1.radius)")
circle1.radius = -4
print("circle1 radius (after trying to set it below min): \(circle1.radius)")
// Set back to initial value
circle1.radius = 5
print("circle1 radius: \(circle1.radius)")
if let circleName = circle1.name {
    print("circle1 name: \(circleName)")
}


// Output: using second init method
var circle2 = Circle()
print("circle2 radius: \(circle2.radius)")
if let circleName = circle2.name {
    print("circle1 name: \(circleName)")
}
print("------------------")

// ******************************************************************
// CIRCLECOLLECTION
// ******************************************************************

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
    func displayCirclesWithRadiusBetween(min: Double, max: Double) {
        print("The selected max radius is \(max) and the min radius is \(min). The circle(s) that fit that criteria:")
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

// CIRCLE COLLECTION OUTPUT
print("2 - CIRCLE ARRAY INFORMATION:")
var circleCollection = CircleCollection()
circleCollection.add(circle: circle1)
circleCollection.add(circle: circle2)
circleCollection.count
circleCollection.displayCirclesWithRadiusBetween(min: 0, max: 4)
print("------------------")

// ******************************************************************
// TODOITEM
// ******************************************************************

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
        if let taskDate = dueDate {
            
            // Format the date
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMddyy")
            let formattedDate = dateFormatter.string(from: taskDate)
            
            return "Priority \(priority): \(task) - due \(formattedDate)."
        } else {
            return "Priority \(priority): \(task)"
        }
    }
    
    init(task: String, priority: Int, dueDate: Date?) {
        self.task = task
        self.priority = priority
        self.dueDate = dueDate
    }
}

// TODO ITEM OUTPUT
print("3 - TODOITEM")
var todo = ToDoItem(task: "Take out trash", priority: 2, dueDate: Date())
var description = todo.fullDescription()
print(description)
print("------------------")

// ******************************************************************
// ANNOTATED TODO ITEM
// ******************************************************************

// Write a class named AnnotatedToDoItem that is a subclass of ToDoItem, but adds an additional property.
class AnnotatedToDoItem: ToDoItem {
    // The additional property should be named note, and it should be type String optional.
    var note: String?
    
    // Write an init method that accepts four arguments; the three from ToDoItem, and the additional note property, and set the properties appropriately.
    init(task: String, priority: Int, dueDate: Date?, note: String?) {
        super.init(task: task, priority: priority, dueDate: dueDate)
        self.note = note
    }
    
    // Override the fullDescription() method so that it includes the note if there is one.
    override func fullDescription() -> String {
        var outputString = super.fullDescription()
        
        if let annotatedNote = note {
            outputString += " \(annotatedNote)"
        }
        return outputString
    }
}

// TODO ITEM OUTPUT
print("4 - ANNOTATED TODO ITEM")
var annotatedTodo = AnnotatedToDoItem(task: "Read about Swift", priority: 1, dueDate: Date(), note: "Look up developer docs.")
var annotatedDescription = annotatedTodo.fullDescription()
print(annotatedDescription)
print("------------------")


// ******************************************************************
// TEST CODE
// ******************************************************************

print("TEST CODE")
// test Circle
var donutHole = Circle(radius: 2, name: "donut hole")
var pie = Circle(radius: 6, name: "pie")
var cookie = Circle()
cookie.radius = 4
pie.radius = 12
donutHole.radius = -2


// test CircleCollection
var circles = CircleCollection()
print("We have \(circles.count) circles in the collection")
circles.add(circle: donutHole)
circles.add(circle: pie)
circles.add(circle: cookie)
print("We have \(circles.count) circles in the collection")
circles.displayCirclesWithRadiusBetween(min: 0, max: 10)


// test ToDoItem and AnnotatedToDoItem
let cs212hw3 = ToDoItem(task: "CS212 HW3", priority: 2, dueDate: Date())
let reading3 = AnnotatedToDoItem(task: "reading", priority: 1, dueDate: Date(), note: "read Swift guide for properties")
let laundry = AnnotatedToDoItem(task: "do laundry", priority: 3, dueDate: nil, note: nil)
print(cs212hw3.fullDescription())
print(reading3.fullDescription())
print(laundry.fullDescription())
