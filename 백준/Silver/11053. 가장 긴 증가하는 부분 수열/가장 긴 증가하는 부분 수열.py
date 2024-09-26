import sys


def lis(arr: [int]) -> int:
    n: int = len(arr)  # arr size
    mem: [int] = [0 for _ in range(n)]  # memorization

    def recursive(i: int) -> int:

        # 최대 후보 값
        max_value = 0

        # 현재 값
        curr: int = arr[i]


        # i번째 원소보다 작은 인덱스에서만 읽어오기
        for j in range(0, i):

            # 현재 값보다 작은 애들만 비교하기
            if arr[j] < curr:
                max_value = max(max_value, mem[j])

        mem[i] = max_value + 1
        return mem[i]

    return max(recursive(i) for i in range(n))


f = sys.stdin
_ = f.readline()
num_list: [int] = list(map(int, f.readline().split()))

# 가장 긴 증가하는 부분 수열의 길이 구하기
print(lis(num_list))
