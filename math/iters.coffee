matrix = [
  [3, 4, 2, 1],
  [1, 7, 1, 1],
  [2, 1, 3, 5],
  [4,-3, 4, 6]
]
results = [16, 23, 10, 1]
# Another matrix
# matrix = [
#   [10, 2, -1],
#   [-2, -6, -1],
#   [1, -3, 12]
# ]
# results = [
#   5, 24.42, 36
# ]

doIteration = (matrix, xs, i) ->
  matrix = prepareMatrix(matrix)
  while i != 0
    newXs = []
    for j in [0...matrix.length]
      newXs[j] = makeFunc(matrix[j])(xs, j)
    xs = newXs
    i--
    console.log(xs)
  xs

###
I believe that it should be better, but I'm too lazy ass to optimize it
###
prepareMatrix = (matrix) ->
  tempMatrix = []
  # console.log(matrix)
  for iter in [0...matrix.length]
    max = matrix[iter][iter]
    for j in [iter...matrix.length]
      if Math.abs(matrix[j][iter]) > Math.abs(max)
        temp = matrix[iter]
        matrix[iter] = matrix[j]
        matrix[j] = temp
        tempres = results[iter]
        results[iter] = results[j]
        results[j] = tempres

  for iteration in [0...matrix.length]
    tempMatrix.push([])
    results[iteration] = results[iteration] / matrix[iteration][iteration]
    for i in [0...matrix[iteration].length]
      tempMatrix[iteration][i] = matrix[iteration][i] / matrix[iteration][iteration]
  tempMatrix

makeFunc = (variables) ->
  func = (xs, index) ->
    result = 0
    for i in [0...xs.length]
      if index != i
        result += (xs[i] * variables[i])
    results[index] - result

console.log(doIteration(matrix, [0, 0, 0, 0], 10))
