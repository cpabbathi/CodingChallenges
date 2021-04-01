import Foundation

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String) {
    var node = head

    while node != nil {
        print(node!.data, terminator: "")

        node = node!.next

        if node != nil {
            print(sep, terminator: "")
        }
    }
}

// Complete the reversePrint function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func reversePrint(llist: SinglyLinkedListNode?) -> Void {
    guard let head = llist else { return }
    
    var tempHead = head
    var first = tempHead.next
    var second = first?.next
    tempHead.next = nil
    
    while first != nil {
        first!.next = tempHead
        tempHead = first!
        
        first = second
        second = first?.next
    }

    printSinglyLinkedList(head: tempHead, sep: "\n")
    print()
}

guard let tests = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...tests {
    guard let llistCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let llist = SinglyLinkedList()

    for _ in 1...llistCount {
        guard let llistItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
        llist.insertNode(nodeData: llistItem)
    }

    reversePrint(llist: llist.head!)
    print()
}

