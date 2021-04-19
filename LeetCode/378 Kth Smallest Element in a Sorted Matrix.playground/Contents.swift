import Foundation

class Solution {
    var array: [Int] = []
    
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        array.append(contentsOf: matrix[0])
        
        for row in 1 ..< matrix.count {
            var prevIndex = 0
            for column in 0 ..< matrix[row].count {
                let index = insert(element: matrix[row][column], from: prevIndex)
                if column == 0 && index >= k {
                    return array[k-1]
                } else {
                    prevIndex = index
                }
            }
        }
        
        return array[k-1]
    }
    
    private func insert(element: Int, from: Int) -> Int {
        if array.count == 0 || element < array[0] {
            array.insert(element, at: 0)
            return 0
        } else if element >= array.last! {
            array.append(element)
            return array.count - 1
        } else {
            var from = from
            var to = array.count - 1
            
            while from <= to {
                let middle = from + (to - from) / 2
                 
                if element >= array[middle] && element < array[middle + 1] {
                    array.insert(element, at: middle + 1)
                    return middle + 1
                } else if element < array[middle] {
                    to = middle
                } else {
                    from = middle
                }
            }
        }
        
        return 0
    }
}

Solution().kthSmallest([[1,5,9,30],[10,11,13,31],[12,13,15,32],[14,15,16,34]], 8)
