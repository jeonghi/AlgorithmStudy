import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    // 장르 : ( id, 총량 )
    var genreTable = (0..<genres.count).reduce(into: [String: [(Int, Int)]]()) { table, id in
                                                                                let genre = genres[id]
                                                                                let play = plays[id]
                                                                                table[genre, default: []].append((id, play))
    }
    
  // 장르별 총 플레이 수를 계산
    let genrePlayCounts = genreTable.mapValues { list in
        list.reduce(0) { $0 + $1.1 }
    }
    
    // 장르를 총 플레이 수로 정렬
    let sortedGenres = genrePlayCounts.sorted { $0.value > $1.value }.map { $0.key }
    
    var result = [Int]()
    
    // 정렬된 장르 순서대로, 각 장르에서 가장 많이 재생된 노래 2곡 선택
    for genre in sortedGenres {
        let songs = genreTable[genre]!.sorted { $0.1 > $1.1 }.prefix(2)
        result.append(contentsOf: songs.map { $0.0 })
    }
    
    return result
}