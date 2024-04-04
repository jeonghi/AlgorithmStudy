import Foundation


let _ = readLine()!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let m = Int(readLine()!)!

print(solution(m, arr))

func solution(_ m:Int, _ arr:[Int]) -> Int {

  var dict: [Int: Void] = [:]
  var answer = 0

  let sortedArr = arr.filter{$0 < m}.sorted()
  
  
  sortedArr.forEach{dict[$0] = ()}
  sortedArr.forEach {
    let idx = m - $0
    if $0 < idx && dict[idx] != nil {
      answer += 1
    }
  }
  
  return answer
}
