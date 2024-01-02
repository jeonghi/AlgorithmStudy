import Foundation

var n = Int(readLine()!)!
var s2i: [String: Bool] = [:]

for _ in 1...n {
  let input = readLine()!.split(separator: " ").map{String($0)}
  let staff: String = input[0]
  let isLeave: Bool = input[1] == "leave"
  s2i[staff] = isLeave
}

Array(s2i.keys.filter{s2i[$0] == false}).sorted(by: >).forEach {
  print($0)
}
