/*
  Дана строка, состоящая из слов, разделенных одним пробелом. 
  Напечатать в алфавитном порядке все гласные буквы, которые входят в слова с четным номером.
*/

function findVowels(string)
{
  const vowels = ['a', 'e', 'i', 'o', 'u', 'y']
  return Array.from(
    new Set(
            string
  	          .split(' ')
              .filter((word, index) => index % 2 === 0)
              .map(word => word
                            .split('')
                            .filter(letter => vowels.includes(letter.toLowerCase()))
                            .join('')
              )
              .join('')
              .split('')
              .map(letter => letter.toLowerCase())
              .sort()
    )
  )
    .join(' ')
}

console.log(findVowels('hello world how are you today?')); // => 'e o u y'
console.log(findVowels('')); // => ''