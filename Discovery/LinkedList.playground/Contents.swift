import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T>: CustomStringConvertible {
    var head: Node<T>?
    
    var description: String {
        var string = ""
        var node = head
        while node != nil {
            string += "\(node!.data) "
            
            node = node!.next
        }
        return string.trimmingCharacters(in: .whitespaces)
    }
    
    func append(element: T) {
        let node = Node(data: element)
        guard head != nil else {
            head = node
            return
        }
        
        var currentNode: Node? = head
        while currentNode!.next != nil {
            currentNode = currentNode!.next
        }
        
        currentNode?.next = node
    }
    
    func insert(element: T, at position: Int) {
        let node = Node(data: element)
        if position == 0 {
            if head == nil {
                head = node
            } else {
                node.next = head
                head = node
            }
            return
        }
        
        var currentNode = head
        var currentPosition = 0
        while currentPosition < position - 1 {
            currentNode = currentNode?.next
            currentPosition += 1
            
            if currentNode == nil {
                return
            }
        }
        node.next = currentNode?.next
        currentNode?.next = node
    }
    
    func remove(at position: Int) {
        guard head != nil else { return }
        
        if position == 0 {
            head = head?.next
            return
        }
        
        var prevNode = head
        var currentPosition = 0
        while currentPosition < position - 1 {
            prevNode = prevNode?.next
            currentPosition += 1
            
            if prevNode == nil {
                return
            }
        }
        
        let nextNode = prevNode?.next?.next
        prevNode?.next = nextNode
    }
    
    func element(at position: Int) -> T? {
        guard head != nil else { return nil }
        
        var currentNode = head
        var currentPosition = 0
        
        while currentPosition < position {
            currentPosition += 1
            currentNode = currentNode?.next
            
            if currentNode == nil {
                return nil
            }
        }
        
        return currentNode?.data
    }
}

let linkedList = LinkedList<Int>()
linkedList.append(element: 0)
linkedList.remove(at: 0)

linkedList.append(element: 0)
linkedList.append(element: 1)
linkedList.remove(at: 0)
linkedList.remove(at: 0)

linkedList.insert(element: 1, at: 0)

linkedList.append(element: 0)
linkedList.append(element: 1)
linkedList.append(element: 2)
linkedList.append(element: 3)
linkedList.append(element: 4)
linkedList.insert(element: -1, at: 0)
linkedList.insert(element: 3, at: 2)
linkedList.insert(element: 30, at: 30)
linkedList.remove(at: 0)
linkedList.remove(at: 3)
linkedList.remove(at: 4)
linkedList.remove(at: 40)

linkedList.element(at: 0)
linkedList.element(at: 2)
linkedList.element(at: 20)
