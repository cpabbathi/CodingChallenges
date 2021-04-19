import Foundation

func printNext(i: Int) {
    print("printNext(\(i): Int)")
    if i <= 0 {
        return
    }
    
    printNext(i: i - 1)
    print(i)
}

printNext(i: 10)
