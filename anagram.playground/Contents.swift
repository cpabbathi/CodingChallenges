import Foundation

extension String {
    func makeDictionary() -> [String.Element: Int] {
        var dictionary = [String.Element: Int]()

        for char in self.lowercased() {
            dictionary[char] = dictionary[char] == nil ? 1 : (dictionary[char]! + 1)
        }
        
        return dictionary
    }
}

func isAnagram(first: String, second: String) -> Bool {
    first.makeDictionary() == second.makeDictionary()
}

func isAnagramWithSort(first: String, second: String) -> Bool {
    first.sorted() == second.sorted()
}
    
func isAnagramWithScanAndIncrementOrDecrement(first: String, second: String) -> Bool {
    guard first.count == second.count else {
        return false
    }
    
    let first = first.lowercased()
    let second = second.lowercased()
    
    var dictionary:[String.Element: Int] = [:]
    
    for i in 0 ..< first.count {
        dictionary[first[first.index(first.startIndex, offsetBy: i)]] = (dictionary[first[first.index(first.startIndex, offsetBy: i)]] ?? 0) + 1
        dictionary[second[second.index(second.startIndex, offsetBy: i)]] = (dictionary[second[second.index(second.startIndex, offsetBy: i)]] ?? 0) - 1
    }
    
    return dictionary.allSatisfy { (dictionaryElement) -> Bool in
        dictionaryElement.value == 0
    }
}
 
var startTime = Date()
isAnagramWithSort(first: "mothers", second: "thermos") == true
var endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "mothers", second: "thermo") == false
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "mother", second: "thermos") == false
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "a", second: "") == false
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "Dat", second: "tad") == true
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "A", second: "AA") == false
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

startTime = Date()
isAnagram(first: "adkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfad", second: "adfasdgaaagasdasdfasioadadfadfasdfanjfadfadkfjaadfasdgaaagasdasdfasioadadfadfasdfanjfadfadkfjaeagasdeagasdadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfad") == true
endTime = Date()
print(String(format: "%.6f", endTime.timeIntervalSince(startTime)))

print("adfasdgaaagasdasdfasioadadfadfasdfanjfadfadkfjaadfasdgaaagasdasdfasioadadfadfasdfanjfadfadkfjaeagasdeagasdadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfadadkfjaeioadfaagasdfasdgaaagasdasdfaadkfjaeioadfaagasdfasdgaaagasdasdfasdfasdfanjadfadfadsdfasdfanjadfadfad".count)
