import Foundation

// https://www.hackerrank.com/challenges/reverse-a-doubly-linked-list/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=linked-lists

final class DoublyLinkedListNode {
    var data: Int
    var next: DoublyLinkedListNode?
    weak var prev: DoublyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class DoublyLinkedList {
    var head: DoublyLinkedListNode?
    var tail: DoublyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: DoublyLinkedListNode) {
        if let tail = tail {
            tail.next = node
            node.prev = tail
        } else {
            head = node
        }

        tail = node
    }
}

func printDoublyLinkedList(head: DoublyLinkedListNode?, sep: String) {
    var node = head

    while node != nil {
        print(String(node!.data), terminator: "")

        node = node!.next

        if node != nil {
            print(sep, terminator: "")
        }
    }
    print()
}

// Complete the reverse function below.

/*
 * For your reference:
 *
 * DoublyLinkedListNode {
 *     data: Int
 *     next: DoublyLinkedListNode?
 *     prev: DoublyLinkedListNode?
 * }
 *
 */
func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    guard let head = llist else {
        return nil
    }
    
    var tempHead: DoublyLinkedListNode? = head
    var prevTempHead: DoublyLinkedListNode? = nil
    
    while tempHead != nil {
        let temp = tempHead!.prev
        let tempn = tempHead!.next
        
        tempHead!.prev = tempn
        tempHead!.next = temp
        
        prevTempHead = tempHead
        tempHead = tempHead!.prev
    }
    
    return prevTempHead
}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let llistCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let llist = DoublyLinkedList()

    for _ in 1...llistCount {
        guard let llistItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
        llist.insertNode(nodeData: llistItem)
    }

    let llist1 = reverse(llist: llist.head!)

    printDoublyLinkedList(head: llist1, sep: " ")
    print()
}
