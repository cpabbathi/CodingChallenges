import Foundation

func countWays(steps: Int) -> Int {
    print(steps)
    if steps < 0 {
        return 0
    } else if steps <= 1 {
        return 1
    } else {
        return countWays(steps: steps - 1) + countWays(steps: steps - 2) + countWays(steps: steps - 3)
    }
}

countWays(steps: 1)
countWays(steps: 2)
countWays(steps: 3)
countWays(steps: 4)
