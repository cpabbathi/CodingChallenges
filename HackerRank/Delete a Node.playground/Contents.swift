import Foundation

// https://www.hackerrank.com/challenges/delete-a-node-from-a-linked-list/problem?h_r=next-challenge&h_v=legacy

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
        print(String(node!.data), terminator: "")

        node = node!.next

        if node != nil {
            print(sep, terminator: "")
        }
    }
}

// Complete the deleteNode function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func deleteNode(llist: SinglyLinkedListNode?, position: Int) -> SinglyLinkedListNode? {
    guard let head = llist else { return nil}

    if position == 0 {
        if head.next == nil {
            return nil
        } else {
            return head.next
        }
    }

    var priorNodePosition = 0
    var priorNode = head

    while priorNodePosition < position - 1 {
        priorNodePosition += 1
        priorNode = priorNode.next!
    }

    priorNode.next = priorNode.next?.next

    return head
}

guard let llistCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let llist = SinglyLinkedList()

for _ in 1...llistCount {
    guard let llistItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }
    llist.insertNode(nodeData: llistItem)
}

guard let position = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let llist1 = deleteNode(llist: llist.head!, position: position)

printSinglyLinkedList(head: llist1, sep: " ")
print()
