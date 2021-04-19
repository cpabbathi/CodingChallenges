import Foundation

class Solution {
    
    var matrix: [[Int]]!
    
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        
        self.matrix = matrix

        // So the range here is is the VALUE of the first (top-left) and last (btm-right) elements of matrix.
        var left = matrix[0][0]
        var right = matrix[matrix.count - 1][matrix[0].count - 1]
        
        while left < right {
            let mid = left + (right - left) / 2
            let lessOrEqual = countLessOrEqual(mid)
            print(left, right, mid, lessOrEqual)
            if lessOrEqual >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
        
    }
    
    func countLessOrEqual(_ num: Int) -> Int {
        var i = 0
        var j = matrix[0].count - 1
        var count = 0
        while i < matrix.count && j >= 0 {
            let current = matrix[i][j]
            if current <= num {
                count += j + 1
                i += 1
            } else {
                j += -1
            }
        }
        return count
    }
}


Solution().kthSmallest([[1,5,9,30],[10,11,13,31],[12,13,15,32],[14,15,16,3400]], 16)
