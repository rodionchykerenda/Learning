import Foundation
/*:
# Коллекции. Массивы и множества

В этом разделе ты узнаешь:
- какие бывают коллекции
- что такое массвы и множества, чем они отличаются
- что такое изменчивость коллекций
- какие существуют способы создания массивов и множеств
- как получить доступ к элементам
- что такое равенство множеств

Внимательно изучи:
- [Типы коллекций](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

Закрепи пройденный материал:

#### Задание 1
 
- Обьяви переменную _listOfNumbers_, представляющую собой массив, который соостоит из целых чисел. Проицинициализируй его любыми значениями.
*/
// Добавь код сюда:
print("-------TASK №1-------")
var listOfNumbers = [2 ,6 , 100, 3, 106, 7]

/*:
 - Выведи в консоль максимальное значение из этого массива.
 - Example: 😉\
 _Input:_\
 var listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Max: 106
*/
// Добавь код сюда:
print("\nTask 1.1:")
print(listOfNumbers.max(by: <) ?? "There are no max values")

/*:
 - Выведи в консоль все нечетные числа из этого массива.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Odd numbers: 3, 7
 */
// Добавь код сюда:
print("\nTask 1.2:")
for item in listOfNumbers {
    if item % 2 != 0 {
        print(item)
    }
}
/*:
 - Выведи в консоль сумму всех элементов массива.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Sum: 224
 */
// Добавь код сюда:
print("\nTask 1.3:")
var sum = 0
for item in listOfNumbers {
    sum += item
}
print(sum)
/*:
 - Выведи в консоль все числа из этого массива, которые расположены по нечетным индексам.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Numbers with odd indexes: 6, 3, 7
 */
// Добавь код сюда:
print("\nTask 1.4:")
for index in 0..<listOfNumbers.count {
    if index % 2 != 0 {
        print(listOfNumbers[index])
    }
}
/*:
 - Выведи в консоль числа из этого массива в обратном порядке.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Going back: 7, 106, 3, 100, 6, 2
 */
// Добавь код сюда:
print("\nTask 1.5:")
for index in stride(from: listOfNumbers.count - 1, to: -1, by: -1) {
    print(listOfNumbers[index])
}
/*:
 - Получи новый массив, путем сортировки массива по возрастанию.
 - Выведи его в консоль.
 
 - Note: 👆 _Для сортировки используй метод sorted(by:)_
 */
/*:
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Sorted array: [2, 3, 6, 7, 100, 106]
 */
// Добавь код сюда:
print("\nTask 1.6:")
let sortedArray = listOfNumbers.sorted(by: >)
print("Sorted array: \(sortedArray)")
/*:
 - Обьяви целочисленную переменную _x_ и присвой ей любое значение.
  */
// Добавь код сюда:
let x = 3
/*:
 - Проверь наличие _x_ в массиве _listOfNumbers_. Если есть, выведи в консоль _true_, если нет - _false_.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 x = 3\
 _Output:_\
 true
 */
// Добавь код сюда:
print("\nTask 1.7:")
var resultBool = false
for item in listOfNumbers {
    if item == x {
        resultBool = true
        break
    }
}
print(resultBool)
print("--------------------")

/*:
---
#### Задание 2
 - Обьяви переменную _otherNumbers_, представляющую собой массив, который соостоит из целых чисел. Проицинициализируй его любыми значениями.

 */
// Добавь код сюда:
print("-------TASK №1-------")
var otherNumbers = [44 , 4, 12]

/*:
 - Выведи в консоль все элементы из массива _listOfNumbers_, которые есть в массиве _otherNumbers_.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 otherNumbers = [2 ,6, 12]\
 _Output:_\
 Intersection: [2, 6]
  */
/*:
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 otherNumbers = [44 , 4, 12]\
 _Output:_\
 Intersection: No data
 
 */
// Добавь код сюда:
var resultArray = [Int]()
for i in otherNumbers {
    if listOfNumbers.contains(i) {
        resultArray.append(i)
    }
}


if resultArray.count == 0 {
    print("Intersection: No data")
} else {
    print("Intersection: \(resultArray)")
}
print("--------------------")
/*:
---
### Продвинутый уровень:

#### Задание 3:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:
print("\n-------TASK №3-------")
let firstCountry = "Ukraine"
let secondCountry = "France"
let thirdCountry = "Turkey"
let fourthCountry = "America"
let fifthCountry = "Egypt"

var stringArray: [String] = [firstCountry, secondCountry, thirdCountry, fourthCountry, fifthCountry, "Portugal", "Poland", "Wales", "Mexico", "Canada"]
var resultStringArray = [String]()
for string in stringArray {
    if string.count > 5 {
        if string.contains("a") {
            let newString = string.replacingOccurrences(of: "a", with: "+", options: .literal, range: nil)
            resultStringArray.append(newString)
        } else {
            resultStringArray.append(string)
        }
    }
}
print("Result string array: \(resultStringArray)")
print("--------------------")

/*:
---
#### Задание 4:
 - Создай два массива a и b, элементами которых будут целые положительные числа.
 - Создай два множества aSet и bSet, на основаниии этих элементов.
 - Выведи в консоль true, если  множетсво aSet является подмножеством bSet, false - в противном случае.
*/
/*:
- Example: 😉\
_Input:_\
subset =([1, 3], [1, 3, 3, 5])\
_Output:_\
True
*/
/*:
- Example: 😉\
_Input:_\
subset([1, 3, 10], [10, 8, 8, 8]))\
_Output:_\
False
*/

// Добавь код сюда:
print("\n-------TASK №4-------")
let a = [1, 3, 1, 5, 6]
let b = [1, 3, 3, 5, 8, 9]

let aSet: Set = Set(Array(a[0...2]))
let bSet: Set = Set(Array(b[0...4]))

print(aSet.isSubset(of: bSet))
print("--------------------")
//: [Назад: Простые типы данных](@previous)  |  Страница 4  |  [Вперед: Управление потоком](@next)


