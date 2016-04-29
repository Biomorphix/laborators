# matrix = [
#   [3, 4, 2, 1],
#   [1, 7, 1, 1],
#   [2, 1, 3, 5],
#   [4,-3, 4, 6]
# ]
# results = [16, 23, 10, 1]

matrix = [
  [10, 1, 1],
  [2, 10, 1],
  [2, 2, 10]
]
results = [12, 13, 14]

copy = (arr) ->
  arr2 = []
  arr2.push(arr[i]) for i in [0...arr.length]
  arr2

seidel = (m, b, e) ->
  x = []
  x.push(0) for i in [0...m.length]
  conv = false
  while !conv
    p = copy(x)
    for i in [0...m.length]
      result = 0
      result += m[i][j] * x[j] for j in [0...i]
      result += m[i][j] * p[j] for j in [i+1...m.length]
      x[i] = (b[i] - result) / m[i][i]
      conv = 0
      conv += Math.pow(x[i] - p[i], 2) for i in [0...m.length]
      conv = conv < e
    console.log(x)
  x
xs = seidel(matrix, results, 0.001)
