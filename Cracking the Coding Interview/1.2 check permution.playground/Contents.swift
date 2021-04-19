import Foundation

func isPermutationBySorting(str1: String, str2: String) -> Bool {
    guard str1.count == str2.count else { return false }
    
    return str1.sorted() == str2.sorted()
}

func isPermutationByDictionary(str1: String, str2: String) -> Bool {
    guard str1.count == str2.count else { return false }
    
    var index1 = str1.startIndex
    var index2 = str2.startIndex
    var alphaDictionary:[String.Element: Int] = [:]
    
    while index1 < str1.endIndex && index2 < str2.endIndex {
        alphaDictionary[str1[index1]] = (alphaDictionary[str1[index1]] ?? 0) + 1
        alphaDictionary[str2[index2]] = (alphaDictionary[str2[index2]] ?? 0) - 1
        
        index1 = str1.index(after: index1)
        index2 = str2.index(after: index2)
    }
    
    return !alphaDictionary.contains { pair -> Bool in
        pair.value != 0
    }
}

let function = isPermutationByDictionary
function("god", "dog") == true
function("god", " ") == false
function("god", "") == false
function("god", "d og") == false
function("d", "d") == true
function("","") == true
