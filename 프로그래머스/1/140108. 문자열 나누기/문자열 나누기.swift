import Foundation

func solution(_ s:String) -> Int {
  
  var pick: Character? = nil
  var count: Int = 0
  
  var equal: Int = 0
  var nonEqual: Int = 0
  
  for i in s {
    if pick == nil {
      pick = i
    }
    
    if(pick == i) {
      equal += 1
    } else {
      nonEqual += 1
    }
    
    if(equal == nonEqual) {
      count += 1
      equal = 0
      nonEqual = 0
      pick = nil
    }
  }
  
  
  if(equal != nonEqual) {
    count += 1
  }
  return count
}
