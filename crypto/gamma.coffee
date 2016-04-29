gamma = (text, condition) ->
  chippedText = ""
  chippLetter = (letter) ->
    letterIn2 = inputLetter = letter.charCodeAt().toString(2)
    shift = ""
    for i in [0...letterIn2.length]
      tempCondition = (+letterIn2[condition[0]]) ^ (+letterIn2[condition[1]])
      shift += letterIn2[letterIn2.length - 1]
      letterIn2 = tempCondition.toString() + letterIn2.slice(0, -1)
    chipp = ""
    chipp += inputLetter[i] ^ shift[i] for i in [0...inputLetter.length]
    [chipp, shift]
  letters = (chippLetter letter for letter in text)
  letters

dechipp = (lett) ->
  makeIt = (text, keys) ->
    letter = ""
    letter += (text[i] ^ keys[i]).toString() for i in [0...text.length]
    letter = String.fromCharCode(parseInt(letter, 2))
    letter
  dechippedtext = ""
  dechippedtext += makeIt(value[0], value[1]) for value in lett
  dechippedtext

lett = gamma('Привет', [2, 5])
console.log('Слева - зашифрованный текст, справа ключ: \n\n', lett)
console.log('Расшифрованный текст: \n', dechipp(lett))
