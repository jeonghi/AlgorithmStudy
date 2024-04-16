import Foundation

var n = Int(readLine()!)!

var answer = Array(1...n)

var queue = QueuePointer<Int>(answer)

while(!queue.isEmpty) {
  let first = queue.dequeue()!
  if(queue.isEmpty){
    print(first)
    break
  }
  let second = queue.dequeue()!
  queue.enqueue(with: second)
}

struct QueuePointer<T> {
  private var elements: [T] = []
  private var front = 0
  
  init(_ sequence: [T] = []){
    elements = sequence
  }
  
  var isEmpty: Bool {
    elements.count < front + 1
  }
  
  var count: Int {
    elements.count - front
  }
  
  func peek() -> T? {
    front < elements.count ? elements[front] : nil
  }
  
  mutating func enqueue(with element: T) {
    elements.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    if !isEmpty {
      defer { front += 1 }
      return elements[front]
    } else {
      return nil
    }
  }
}
