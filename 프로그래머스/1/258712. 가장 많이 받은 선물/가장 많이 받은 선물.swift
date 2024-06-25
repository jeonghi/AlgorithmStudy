import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
  
  let sz = friends.count
  var nameKey: [String: Int] = [:]
  
  for (idx, name) in friends.enumerated() {
    nameKey[name] = idx
  }
  
  var giftHistory = Array(repeating: Array(repeating: 0, count: sz), count: sz)
  
  var giftPoint = Array(repeating: Array(repeating: 0, count: 3), count: sz)
  
  // 지난달 선물내역
  gifts.forEach {
    let tmp = $0.split(separator: " ").map{String($0)}
    
    let from = nameKey[tmp[0]]!
    let to = nameKey[tmp[1]]!
   
    giftHistory[from][to] += 1
    
    giftPoint[from][0] += 1 // 준 내역
    giftPoint[to][1] += 1 // 받은 내역
  }
  
  // 선물 지수 산출
  (0..<sz).forEach {
    giftPoint[$0][2] = giftPoint[$0][0] - giftPoint[$0][1] // 선물지수
  }
  
  var expectedGift = Array(repeating: 0, count: sz)
  
  // 비교 시작
  for i in 0..<sz {
    for j in 0..<sz {
      if(i == j) { continue }
      
      let a = giftHistory[i][j]
      let b = giftHistory[j][i]
      
      if(a == b) {
        let aPoint = giftPoint[i][2]
        let bPoint = giftPoint[j][2]
        
        if(aPoint > bPoint) {
          expectedGift[i] += 1
        }
      }
      else if(a > b) {
        expectedGift[i] += 1
      }
    }
  }
  
  let maxValue = expectedGift.max()
  return maxValue ?? 0
}