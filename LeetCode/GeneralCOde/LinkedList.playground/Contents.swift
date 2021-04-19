import Foundation

/// ListNode: This represents a single node of value in a singly linked list
public class ListNode<T> {
    public var val: T
    public var next: ListNode?
    
    public init(_ val: T) { self.val = val; self.next = nil; }
    public init(_ val: T, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val)"
    }
}

/// Singly linked list having nodes of type T
public class LinkedList<T>: CustomStringConvertible {
    var head: ListNode<T>?
    
    /// Create a singly linked list made from elements in the array of type T
    /// - parameter arr: An array of elements from which nodes are made. Node are linked together to form a linked list.
    init(arr: [T]) {
        guard arr.count > 0 else {
            head = nil
            return
        }
        
        head = ListNode(arr[0])
        var currentNode = head
        for i in 1 ..< arr.count {
            let node = ListNode(arr[i])
            currentNode!.next = node
            currentNode = node
        }
    }
    
    /// Creates a new linked list with the head node passed to the initializer
    /// - parameter head: List node for the head of the linked list. It can be a single node or a head of another linked list
    init(head: ListNode<T>?) {
        self.head = head
    }
    
    /// Provides the string representation of the linked list
    public var description: String {
        var currentNode = head
        var listString = ""
        
        while currentNode != nil {
            listString += "\(currentNode!.val) "
            currentNode = currentNode?.next
        }
        
        return listString.trimmingCharacters(in: .whitespaces)
    }
    
    /// Gives a reference to the tail of the link list.
    public var tail: ListNode<T>? {
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    /// Gives the reference to the node at the given position
    /// - parameter at: position of the requested node. 0 indexed
    public func node(at position: Int) -> ListNode<T>? {
        guard head != nil else { return nil }
        var currentPosition = 0
        var currentNode = head
        
        while currentPosition < position {
            currentPosition += 1
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    /// Adds the node at the give position
    /// - parameter node: node to be added to the list
    /// - parameter at: position of the node. 0 indexed
    public func add(node: ListNode<T>, at position: Int) {
        if position == 0 {
            node.next = head
            head = node
            return
        }
        
        var currentPosition = 0
        var currentNode = head
        
        while currentPosition < position - 1 {
            currentPosition += 1
            currentNode = currentNode?.next
            
            if currentNode == nil {
                return
            }
        }
        
        node.next = currentNode?.next
        currentNode?.next = node
    }
    
    /// appends a given linked list at the end of this list
    /// - parameter newList: new linked list to be added to this linked list.
    public func append(newList: ListNode<T>?) {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode!.next
        }
        
        currentNode?.next = newList
    }
}
