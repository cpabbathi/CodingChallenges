import Foundation

// Recursion
func fibonacciRecursive(_ n: Int) -> Int {
    if n == 0 || n == 1 { return n }
    
    return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2)
}

//print("0: ", fibonacciRecursive(0))
//print("1: ", fibonacciRecursive(1))
//print("2: ", fibonacciRecursive(2))
//print("3: ", fibonacciRecursive(3))
//print("4: ", fibonacciRecursive(4))
//print("12: ", fibonacciRecursive(12))
//print("22: ", fibonacciRecursive(22))

//Had to terminate as it took more than 145k calls and the function didn't return a value
//print("32: ", fibonacciRecursive(32))
//print("50: ", fibonacciRecursive(50))

var fibonacciArray = [0, 1]
func fibonacciDynamicRecursive(_ n: Int) -> Int {
    print(n)
    guard fibonacciArray.count <= n else {
        return fibonacciArray[n]
    }
    
    let fibonacci = fibonacciDynamicRecursive(n - 2) + fibonacciDynamicRecursive(n - 1)
    if fibonacciArray.count == n {
        fibonacciArray.append(fibonacci)
    } else {
        fatalError("n: \(n) array count: \(fibonacciArray.count)")
    }
    return fibonacciArray[n]
}

//print("0: ", fibonacciDynamicRecursive(0))
//print("1: ", fibonacciDynamicRecursive(1))
//print("2: ", fibonacciDynamicRecursive(2))
//print("3: ", fibonacciDynamicRecursive(3))
//print("4: ", fibonacciDynamicRecursive(4))
//print("12: ", fibonacciDynamicRecursive(12))
//print("22: ", fibonacciDynamicRecursive(22))
//print("32: ", fibonacciDynamicRecursive(32))
//print("50: ", fibonacciDynamicRecursive(50))
//print("60: ", fibonacciDynamicRecursive(60))
//print("92: ", fibonacciDynamicRecursive(92))
//print("     \(Int.max)")
//
//print("Number of computed fibonacci values: \(fibonacciArray.count)")

func fibonacciIteratively(_ n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    
    var a = 0
    var b = 1
    var c: Int = 1
    
    for _ in 2 ... n {
        c = a + b
        a = b
        b = c
    }
    
    return c
}

print("0: ", fibonacciIteratively(0))
print("1: ", fibonacciIteratively(1))
print("2: ", fibonacciIteratively(2))
print("3: ", fibonacciIteratively(3))
print("4: ", fibonacciIteratively(4))
print("12: ", fibonacciIteratively(12))
print("22: ", fibonacciIteratively(22))
print("32: ", fibonacciIteratively(32))
print("50: ", fibonacciIteratively(50))
print("60: ", fibonacciIteratively(60))
print("92: ", fibonacciIteratively(92))
