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

isAnagram(first: "mothers", second: "thermos")
isAnagram(first: "mothers", second: "thermo")
isAnagram(first: "mother", second: "thermos")
isAnagram(first: "a", second: "")
isAnagram(first: "Dat", second: "tad")
isAnagram(first: "A", second: "AA")
