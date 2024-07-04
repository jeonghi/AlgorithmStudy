import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    // 의상 종류에 몇 개의 의상이 있는지 해시테이블로 만든다.
    
    // 의상 이름은 중복 되지 않는다.
    let clotheTable: [String: Int] = clothes.reduce(into: [String: Int]()) { hashtable, clothe in
        hashtable[clothe[1], default: 0] += 1
    }
    
    // 헤드기어 : 노란 모자, 초록 터번
    // 눈 : 파란 선글라스
    
    // 답 = (헤드기어 갯수 + 1) * (눈 의상 갯수 + 1) -1
    let answer = clotheTable.reduce(into: 1) { $0 *= ($1.value + 1) } - 1
    return answer
}