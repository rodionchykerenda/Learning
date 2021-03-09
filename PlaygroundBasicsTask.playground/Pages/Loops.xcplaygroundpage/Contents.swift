import Foundation

/*:
# Управление потоком

В этом разределе ты узнаешь:
- что такое управление потоком
- для чего нужны циклы

  `while` _condition_ {\
    _statements_\
   }

  `repeat` {\
    _statements_\
    } _while_ condition


  `for` _value_ `in` _range_ {\
    _statements_\
    }

- что такое условные инструкции
- какие бывают операторы передачи управления
- как проверить доступность API

 Внимательно изучи:
- [Управление потоком](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Цикл For in](https://www.avanderlee.com/swift/loops-swift/)
- [Циклы for, while, repeat](https://www.avanderlee.com/swift/loops-swift/)
- [For each](https://developer.apple.com/documentation/swift/array/1689783-foreach)
- [Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html)
- [Conditional Statements](https://learnappmaking.com/swift-conditionals-if-statement-how-to/)
- [Доступность API](https://www.hackingwithswift.com/example-code/language/how-to-use-available-to-check-for-api-availability)

Закрепи пройденный материал:

#### Задание 1
 - Обьяви переменную `n` и проинициализируй ее  любым целочисленными значением.
*/
// Добавь код сюда:
var n = 5
/*:
 - Напиши код, который выведет в консоль фразу _I like Swift!_ `n` раз.
 
 - Note: 👆 _Для решения используй циклы_ `for` _или_ `while`
*/
/*:
 
 - Example: 😉
_Input:_\
var n = 3\
_Output:_\
 I like Swift!\
 I like Swift!\
 I like Swift!
 */

// Добавь код сюда:
print("\n-------TASK №1-------")
for _ in 1...n {
    print("I like Swift!")
}
print("--------------------")
/*:
---
#### Задание 2
 
 - Выведи в консоль первые `n` квадратов чисел (_квадрат - произведение числа на себя, например 4 = 2 * 2_).
 
 - Example: 😉
_Input:_\
n = 5\
 _Output_:\
 1\
 4\
 9\
 16\
 25
*/
// Добавь код сюда:
print("\n-------TASK №2-------")
print("\nTask 2.1:")
for i in 1...n {
    print(i*i)
}
/*:
 - Выведи в консоль степени числа `2`, которые меньше или равны `n`.
 
 - Example: 😉
 _Input:_\
n = 100\
 _Output:_\
 2\
 4\
 8\
 16\
 32\
 64
 */
 // Добавь код сюда:
print("\nTask 2.2:")
var i = 0
while (Int(NSDecimalNumber(decimal: pow(2, i)))) <= n {
    print(pow(2, i))
    i += 1
}
    

/*:
 - Нарисуй в консоли квадрат из `n` на `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐
 
 */
// Добавь код сюда:
print("\nTask 2.3:")
for _ in 1...n {
    var helperString: String = ""
    for _ in 1...n {
        helperString.append("⭐")
    }
    print(helperString)
}
/*:
 - Нарисуй в консоли треугольник из `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐\
 ⭐⭐\
 ⭐⭐⭐\
 ⭐⭐⭐⭐
 */
// Добавь код сюда:
print("\nTask 2.4:")
for i in 1...n {
    var helperString: String = ""
    for _ in 1...i {
        helperString.append("⭐")
    }
    print(helperString)
}
print("--------------------")
/*:
---
#### Задание 3:
 - Создай массив из 20-30 значений любого типа.
 - Сделай линейную сортировку (linear sort).
 - Сделайте сортировку пузырьком (bubble sort).
 - Сделайте быструю сортировку  (quick sort).
*/
// Добавь код сюда:
// MARK: -  BubbleSort
func bubbleSort(_ array: inout [Int]) {
    var swap = true
    while swap {
        swap = false
        for i in 0..<array.count - 1 {
            if array[i] > array[i + 1] {
                let temp = array[i + 1]
                array[i + 1] = array[i]
                array[i] = temp
                swap = true
            }
        }
    }
}

// MARK: -  QuickSort
print("\n-------TASK №3-------")
func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    var changeAbleArray = array
    
    let pivot = partition(&changeAbleArray)
    let leftArray = quickSort(Array(changeAbleArray[0..<pivot]))
    let rightArray = quickSort(Array(changeAbleArray[pivot..<array.count]))

    return leftArray + rightArray
}

func partition(_ array: inout [Int]) -> Int {
    var i = -1
    let pivot = array[array.count - 1]
    
    for j in 0..<(array.count - 1) {
        if array[j] <= pivot {
            i += 1
            let swapConstant = array[i]
            array[i] = array[j]
            array[j] = swapConstant
        }
    }
    let swapConstant = array[i + 1]
    array[i + 1] = array[array.count - 1]
    array[array.count - 1] = swapConstant
    
    return i + 1
}

// MARK: -  LinearSort
func linearSort(_ array: inout [Int]) {
    for j in 0..<array.count {
        var min = j
        for i in j..<array.count {
            if array[i] < array[min] {
                min = i
            }
        }
        let temp = array[min]
        array[min] = array[j]
        array[j] = temp
    }
}

var array = [1, 14, 32, 8, 90, 1, 4 , 0, 12, 1, 14, 32, 8, 90, 1, 4 , 0, 12, 1, 14, 32, 8, 90, 1, 4 , 0, 12, 5, 6, 7, 8]
print("Sorted Array:")
linearSort(&array)
print(array)
print("--------------------")
/*:
---
### Продвинутый уровень:

#### Задание 4:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:
print("\n-------TASK №4-------")
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
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым словом.
 - Выведи в консоль True, если строка является изограммой и false, если нет
*/
/*:
- Note: 👆 _Изограмма - это слово или фраза, в которой нет повторяющихся букв_\
*/
/*:
- Example: 😉\
_Input:_\
let word ="Password"\
_Output:_\
false
*/
/*:
- Example: 😉\
_Input:_\
let word ="Algorism"\
_Output:_\
 True
*/
// Добавь код сюда:
print("\n-------TASK №5-------")
let word = "Password"
func isIsogram(_ string: String) -> Bool {
    var charectersSet = Set<Character>()
    for char in string {
        if charectersSet.contains(char) {
            return false
        }
        charectersSet.insert(char)
    }
    return true
}
print(isIsogram(word))
print("--------------------")
/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым значением.
 - Повтори в новой строке каждую букву исходной по 3 раза.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let word ="Hello"\
_Output:_\
 "hhheeellllllooo"
*/
// Добавь код сюда:
print("\n-------TASK №6-------")
var resultString = ""
for char in word {
    for _ in 1...3 {
        resultString.append(char)
    }
}
print(resultString)
print("--------------------")
/*:
---
#### Задание 6:
 - Обьяви массив, состояющий из строк и целых чисел.
 - Удали из массива все строки.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let array =[1, 2, "a", "b"] \
_Output:_\
 [1, 2]
*/
// Добавь код сюда:
print("\n-------TASK №7-------")
var newArray = [1, 2, "a", "b"] as [Any]

newArray = newArray.filter({ ($0 as? String) == nil })
print(newArray)
print("--------------------")

//: [Назад: Коллекции. Массивы и множества](@previous)  |  Страница 5  |  [Вперед:  Функции](@next)
