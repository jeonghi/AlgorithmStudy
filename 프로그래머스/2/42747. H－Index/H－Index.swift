import Foundation

func solution(_ citations:[Int]) -> Int {
    // 논문의 인용 횟수를 내림차순으로 정렬합니다.
    let sortedCitations = citations.sorted(by: >)
    
    // h-인덱스를 찾기 위한 변수를 초기화합니다.
    var hIndex = 0
    
    // 각 논문의 인용 횟수를 확인하면서 h-인덱스를 계산합니다.
    for (index, citation) in sortedCitations.enumerated() {
        // 현재 논문의 인용 횟수가 현재 인덱스 + 1보다 크거나 같다면
        if citation >= index + 1 {
            // h-인덱스를 업데이트합니다.
            hIndex = index + 1
        } else {
            // 그렇지 않다면 반복을 중지합니다.
            break
        }
    }
    
    // 계산된 h-인덱스를 반환합니다.
    return hIndex
}