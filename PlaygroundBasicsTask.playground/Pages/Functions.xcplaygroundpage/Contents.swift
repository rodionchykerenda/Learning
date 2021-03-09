import Foundation
/*:
# Функции

В этом разделе ты узнаешь:
- что такое функции
- как их обьявлять и вызывать
- что такое параметры функции и возвращаемые значения
- что такое ярылки аргументов

Внимательно изучи:
- [Функции](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#)

Закрепи пройденный материал:

#### Задание 1
 
 - Реализуй функцию _calculateMin_, которая принимает в качестве параметров  два значения типа `Int` и возвращает наименьшее из них.
 - Example: 😉\
 _Function Call:_\
 calculateMin(1,2)\
 _Output:_\
 Min: 1
 */
// Добавь код сюда:
print("-------TASK №1-------")
func calculateMin(firstNumber: Int, secondNumber: Int) -> Int {
    if firstNumber < secondNumber {
        return firstNumber
    }
    return secondNumber
}
print("Min:\(calculateMin(firstNumber: 1,secondNumber: 2))")
print("--------------------")
/*:
---
#### Задание 2
 
 - Реализуй функцию _countDown_, которая принимает параметр `n` типа `Int`.
 - Функция должна вывести в консоль  числа от _n_ до 1 с интервалом в 1 секунду, а затем вывести в консоль слово _GO!_
 - Note: 👆 _Для задержки используй стандартную функцию sleep(1)_
 */
/*:
 - Example: 😉\
 _Function Call:_\
 coutdown(3)\
 _Output:_\
 3\
 2\
 1\
 GO!
 */

// Добавь код сюда:
print("\n-------TASK №2-------")
func countDown(n: Int) {
    for i in stride(from: n, to: 0, by: -1) {
        print(i)
//        sleep(1)
    }
    print("GO!")
}
countDown(n: 3)
print("--------------------")
/*:
---
#### Задание 3
 - Реализуй функцию _repeatPrint_, которая принимает в качестве параметров строку _s_ и целое число _n_. Функция должна напечатать строку, переданную в качестве параметра, _n_ раз.
 - Example: 😉\
 _Function Call:_\
 repeatPrint(s: "Hi, NIX", n:2)\
 _Output:_\
 Hi, NIX\
 Hi, NIX
 */
// Добавь код сюда:
print("\n-------TASK №3-------")
func repeatPrint(string: String, n: Int) {
    for _ in 1...n {
        print(string)
    }
}
repeatPrint(string: "Hi, NIX", n: 2)
print("--------------------")

/*:
---
#### Задание 4
 - Реализуй функцию _reverse_, которая в качестве параметра принимает массив с целыми числами. Результатом работы функции должен быть массив с числами в обратном порядке.
 - Полученный массив выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 reverse([1, 2, 3])\
 _Output:_\
 [3, 2, 1]
 */
// Добавь код сюда:
print("\n-------TASK №4-------")
func reverse(_ array: [Int]) -> [Int] {
    var newArray = [Int]()
    for i in stride(from: array.count - 1, to: -1, by: -1) {
        newArray.append(array[i])
    }
    return newArray
}
print(reverse([1,2,3,4]))
print("--------------------")

/*:
---
#### Задание 5
 - Реализуй функцию _factorial_, которая принимает  качестве параметра целое число _n_ и возвращает его факториал.
 - Полученный результат выведи в консоль.
 - Note: 👆 _Факториал натурального числа n - это произведение всех натуральных чисел от 1 до n включительно\
 1! = 1\
 2! = 1 * 2 = 2\
 3! = 1 * 2 * 3 = 6\
 ...\
 7! = 1 * 2 ... * 7 = 5040_
 */
/*:
 
 - Note: 👆 _Для реализации факториала используй рекурсию_
*/
/*:
 - Example: 😉\
 _Function Call:_\
 factorial(5)\
 _Output:_\
 5! = 120
 */
// Добавь код сюда:
print("\n-------TASK №5-------")
func factorial(_ n: Int) -> Int {
    guard n >= 1 else { return 1}
    return n * factorial(n - 1)
}
print(factorial(5))
print("--------------------")
/*:
---
#### Задание 6
 - Напиши функцию, которая на вход принимает масссив, элементами которого являются целые, положительные числа.
 - Результатом работы функции будет массив, состоящий только  из элементов исходного массива, для которых равна количеству символов, переданных в качестве параметра.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([88, 232, 4, 9721, 555], 3)\
 _Output:_\
[232, 555]
 */
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([32, 88, 74, 91, 300, 4050], 1)\
 _Output:_\
[]
 */
// Добавь код сюда:
print("\n-------TASK №6-------")
func filterDigitLength(_ array: [Int], n: Int) -> [Int] {
    var resultArray = [Int]()
    for item in array {
        if String(item).count == n {
            resultArray.append(item)
        }
    }
    return resultArray
}
print(filterDigitLength([88, 232, 4, 9721, 555], n: 3))
print("--------------------")
/*:
---
#### Задание 7
 - Напиши функцию, которая на вход принимает массив строк, представляющий собой названия файлов, а результатом работы функции будет массив, представляющий собой список типов файлов из исходного массива.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["code.html", "code.css"])\
 _Output:_\
["html", "css"]
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["project1.jpg", "project1.pdf", "project1.mp3", "project2.pdf"])\
 _Output:_\
["jpg", "pdf", "mp3"]
 */
// Добавь код сюда:
print("\n-------TASK №7-------")
func getExtension(_ stringArray: [String]) -> [String] {
    var resultString = [String]()
    for item in stringArray {
        let newItem = item.split(separator: ".")[1]
        if !resultString.contains(String(newItem)) {
            resultString.append(String(newItem))
        }
    }
    return resultString
}
print(getExtension(["project1.jpg", "project1.pdf", "project1.mp3", "project2.pdf"]))
print("--------------------")

/*:
---
### Продвинутый уровень:
#### Задание 8:
 - Напиши функцию, которая в качестве параметра принимает массив целых положительных чисел, а возвращает сумму пропущенных чисел в переданном диапазоне.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Минимальное и максимальное значение массива - это границы числового диапазона, которые нужно использовать при поиске отсутсвующих чисел_
*/
/*:
- Example: 😉\
_Function Call:_\
sumOfMissingNumbers([1, 3, 5, 7, 10])\
_Output:_\
Sum of missing numbers = 29
*/

// Добавь код сюда:
print("\n-------TASK №8-------")
func sumOfMissingNumbers(_ array: [Int]) -> Int {
    var result = 0
    var min = array[0]
    var max = array[0]
    for item in array {
        if item < min {
            min = item
        }
        if item > max {
            max = item
        }
        result -= item
    }
    
    for item in min...max {
            result += item
    }
    
    return result
}
print(sumOfMissingNumbers([1, 3, 5, 7, 10]))
print("--------------------")

/*:
---
#### Задание 9:
 - Напиши функцию, которая в качестве параметра строку, а результатом работы функции будет новкя строка, представляющая собой увеличение каждого симолова на  +1.
 - Каждый набор символов отдели каким-то знаком.
 - Каждый набор символов должен начинаться с большой буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй только буквы латинского алфавита (a-z, A-Z)_
*/
/*:
- Example: 😉\
_Function Call:_\
compoutingLetters("abcd")\
_Output:_\
"A-Bb-Cccc=Dddd"
*/
// Добавь код сюда:
print("\n-------TASK №9-------")
func compoutingLetters(_ string: String) -> String {
    var resultString: String = ""
    for i in 0...string.count - 1 {
        for _ in 0...i {
            resultString.append(string[string.index(string.startIndex, offsetBy: i)])
        }
        if i == string.count - 1 {
            break
        }
        resultString.append("-")
    }
    return resultString
}
print(compoutingLetters("abcd"))
print("--------------------")


/*:
---
#### Задание 10:
 - Напиши функцию, которая в качестве параметра принимает строку, а результатом работы функции будет  строка, каждое слово которой начинается с заглавной буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй функции высшего порядка_
*/
/*:
- Example: 😉\
_Function Call:_\
makeTitile("This is a title")\
_Output:_\
This Is A Title
*/

// Добавь код сюда:
print("\n-------TASK №10-------")
func makeTitile(_ string: String) {
    let resultString = string.split(separator: " ").map{String($0).capitalized}.joined(separator: " ")
    print(resultString)
}
makeTitile("This is a title")
print("--------------------")

/*:
---
#### Задание 11:
 - Напиши функцию, которая в качестве параметра принимает массив символов и символ для поиска.
 - Функция должна возвращать сколько раз символ встречается в массиве
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
letterCount(["D", "E", "Y", "H", "A", "D"])\
_Output:_\
D shows 2 times
*/

// Добавь код сюда:
print("\n-------TASK №11-------")
func letterCount(array: [Character], key: Character) {
    var keyCount = 0
    for item in array {
        if item == key {
            keyCount += 1
        }
    }
    print("\(key) shows \(keyCount) times")
}
letterCount(array: ["D", "E", "Y", "H", "A", "D"], key: "D")
print("--------------------")

/*:
---
## Задание 12:
 - Напиши функция, которая будет возвращать true, если все подмножества в массиве, принадоежат множеству, переданному в качестве параметров, а false  - в противном случае.
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2], [2, 3], [1, 3]], [1, 2, 3])\
_Output:_\
True
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2, 3, 4]], [1, 2, 3])\
_Output:_\
False
*/

// Добавь код сюда:
print("\n-------TASK №12-------")
func validateSubsets(subsets: [Set<Int>], array: [Int]) -> Bool {
    for i in 0..<subsets.count {
        if !subsets[i].isSubset(of: array) {
            return false
        }
    }
    return true
}
print(validateSubsets(subsets: [[1, 2], [2, 3], [1, 3]], array: [1, 2, 3]))
print("--------------------")

//: [Назад: Управление потоком](@previous)  |  Страница 6  |  [Вперед: Замыкания](@next)



