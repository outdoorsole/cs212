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

// Output: using first init method
var circle1 = Circle(radius: 12, name: "circle1")
circle1.radius = -4
print("circle1 radius: \(circle1.radius)")
print("circle1 name: \(circle1.name!)")

// Output: using second init method
var circle2 = Circle()
print("circle2 radius: \(circle2.radius)")
