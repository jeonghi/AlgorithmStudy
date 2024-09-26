import sys
def fibo(n: int, mem: [int] = None) -> int:

    if mem is None:
        mem = [0 for i in range(0, n + 1)]

    cached = mem[n]

    if(cached):
        return cached

    answer: int
    if(n <= 2):
        answer = 1
    else:
        answer = fibo(n-2, mem) + fibo(n-1, mem)
    
    mem[n] = answer
    return answer

f = sys.stdin
n: int = int(f.readline().strip())
print(fibo(n))