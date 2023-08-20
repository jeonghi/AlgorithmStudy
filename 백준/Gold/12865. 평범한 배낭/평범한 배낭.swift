//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/20.
//
import Foundation
let tc = readLine()!.split(separator: " ").map{Int($0)!}
let n = tc[0] // 물품의 수
let k = tc[1] // 버틸 수 있는 무게
var arr: Array<(Int,Int)> = [] //(무게, 가치)
for _ in 1...n {
    let data = readLine()!.split(separator: " ").map{Int($0)!}
    let weight = data[0]
    let value = data[1]
    arr.append((weight, value))
}
arr.sort(by: {$0.0 < $1.0}) // 무게 기준으로 오름차순 정렬
var dp: Array<[Int]> = Array(repeating: Array(repeating: 0, count: k+1), count: n+1) // dp 배열
for j in 1...k { // 배냥의 현재 용량이 j -> 궁극적으로는 k까지
    for i in 1...n { // 처음부터 i번째 물건까지봄
        // arr의 원소는 tuple로, (무게, 가치)
        let weight = arr[i-1].0
        let value = arr[i-1].1
        if(j-weight >= 0){
            dp[i][j] = [dp[i-1][j], dp[i-1][j-weight] + value].max()!
        }else{
            dp[i][j] = dp[i-1][j]
        }
    }
}
print(dp[n][k])
