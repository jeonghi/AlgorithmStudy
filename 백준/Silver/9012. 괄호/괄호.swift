import Foundation


var tc = Int(readLine()!)!

_ = (0..<tc)
  .map { _ in readLine()! }
  .map { String($0) }
  .map { solution(arr: $0) }
  .compactMap { $0 ? "YES" : "NO" }
  .map { print($0) }

func solution(arr: String) -> Bool {
  
  let stk = Stack<Character>()
  for chr in arr {
    switch chr {
    case "(":
      stk.push(chr)
    case ")":
      if(stk.pop() != "(") {
        return false
      }
    default:
      return false
    }
  }
  
  return stk.isEmpty()
}

class Stack<T> {
  
  var arr: Array<T> = []
  
  func push(_ newElement: T) {
    arr.append(newElement)
  }
  
  func pop() -> T? {
    arr.popLast()
  }
  
  func peek() -> T? {
    arr.last
  }
  
  func isEmpty() -> Bool {
    arr.isEmpty
  }
}


