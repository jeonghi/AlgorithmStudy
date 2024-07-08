import Foundation

func solution(_ numbers:[Int]) -> String {
    
    let sortedArr = numbers.map{ String($0) }.sorted{ $0 + $1 > $1 + $0 }
    let answer = sortedArr.reduce(into: "") { $0 += $1 }
    
    // 결과가 0으로 시작하는 경우 "0" 반환
    if answer.first == "0" {
        return "0"
    }
    return answer
}