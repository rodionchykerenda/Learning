import Foundation
/*:
# Типы данных

В этом разделе ты узнаешь:
- что такое константы и переменные
- для чего нужны базовые оператор
- почему Swift считается строготипизированным языком программирования
- разберешься чем типы для целых чисел отчиличаются от типов для чисел с плавающей точкой
- что такое логический тип и как он представлен в Swift
- какие бывают строковые типы
- как делать преобразование типов
- что такое опциональны типы

Внимательно изучи:
- [Константы и переменные](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Простые типы данных](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Базовые операторы](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Строки и символы](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)
 - 

Закрепи пройденный материал:

#### Задание 1:
 - Объяви две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
 - Поменяй значения переменных местами.
 - Выведи получившиеся значения в консоль. При этом в каждом варианте выводимых данных текстом напиши, какую переменную ты выводишь.
*/
// Добавь код сюда:
print("-------TASK №1-------")
var firstValue = 1
var secondValue: Int = 2
let helper = firstValue
firstValue = secondValue
secondValue = helper
print("First value: \(firstValue),\nSecond value: \(secondValue)")
print("--------------------")
/*:
---
### Задание 2:
 - Объяви три параметра. Первый из них должен быть константой типа `Float` с произвольным числовым значением, второй — пустой константой типа `Float`, третий — пустой переменной типа `Double`.
 - Установи новое произвольное значение всем параметрам, для которых эта операция возможна.
*/
// Добавь код сюда:
let floatFirstValue: Float = 1.1
let floatSecondValue: Float
let doubleValue: Double
floatSecondValue = 2.2
doubleValue = 3.3


/*:
---
#### Задание 3:
 - Объяви три пустые константы: одну типа `Int`, одну типа `Float` и одну типа `Double`.
 - Проинициализируй их следующими значениями: для `Int` значение 18, для `Float` — 16.4,  для `Double` — 5.7.
 - Найди сумму всех трех констант и запишите ее в переменную типа `Float`. Результат выведи в консоль.
*/
// Добавь код сюда:
print("\n-------TASK №3-------")
let intConstant: Int
let floatConstant: Float
let doubleConstant: Double
intConstant = 18
floatConstant = 16.4
doubleConstant = 5.7
print(Float(intConstant) + floatConstant + Float(doubleConstant))

/*:
- Найди произведение всех трех констант и запиши его в переменную типа `Int`. Результат выведи в консоль.
 - Note: 👆 _Помни, что тебе необходимо получить результат с минимальной погрешностью._
*/
// Добавь код сюда:
let multiplicationResult: Int = Int(floatConstant.rounded(.toNearestOrEven)) * intConstant * Int(doubleConstant.rounded(.toNearestOrEven))
print("Multiplication result is \(multiplicationResult)")
/*:
- Найди остаток от деления константы типа `Float` на константу типа `Double` и запиши ее в переменную типа `Double`. Результат выведи в консоль.
*/
// Добавь код сюда:
let modResult: Double = (Double(floatConstant)).truncatingRemainder(dividingBy: doubleConstant)
print("Remainder of the division is \(modResult)")
print("--------------------")
/*:
---
#### Задание 4:
 - Объяви переменную типа `String` и запиши в нее произвольный строковый литерал.
 - Объяви две переменные типа `Int` и запиши в них произвольные значения.
 - Одним выражением объедини в строковый литерал переменную типа `String` и сумму переменных типа `Int`, а результат запиши в новую константу.
 - Выведи в консоль результат.
 */
// Добавь код сюда:
print("\n-------TASK №4-------")
let firstString = "abcd"
let firstInt = 30
let secondInt = 40
let resultString = firstString + String(firstInt + secondInt)
print("\(resultString)")
print("--------------------")
/*:
---
#### Задание 5:
 - Объяви две логические переменные. Значение первой должно быть равно _true_, второй — _false_.
 - Запиши в две константы результат использования их в качестве операндов для операторов логического `И` или `ИЛИ`.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
print("\n-------TASK №5-------")
var firstBool = true
var secondBool = false
let firstResult = firstBool && secondBool
let secondResult = firstBool || secondBool
print("Logical AND value is \(firstResult)")
print("Logical OR value is \(secondResult)")
print("--------------------")


/*:
---
#### Задание 6:
 - Напиши при помощи строк свое имя, фамилию и дату рождения.
 - Собери эти строки в одну и выведи в консоль получившееся значение.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
print("\n-------TASK №6-------")
let nameSurname = "Rodion Chykerenda"
let dateOfBirth = "14.01.2000"
let resultStr = nameSurname + " " + dateOfBirth
print("My name is \(nameSurname)")
print("I was born in \(dateOfBirth)")
print("Result string is \(resultStr)")
print("--------------------")

/*:
---
## Продвинутый уровень:

#### Задание 7:
 - Создай 5 строк с названием стран.
 - Если в названии страны встречается буква А, выведи ее нзавание в консоль.
*/
// Добавь код сюда:
print("\n-------TASK №7-------")
let firstCountry = "Ukraine"
let secondCountry = "France"
let thirdCountry = "Turkey"
let fourthCountry = "America"
let fifthCountry = "Egypt"

var stringArray: [String] = [firstCountry, secondCountry, thirdCountry, fourthCountry, fifthCountry]

for item in stringArray {
    
    if item.lowercased().contains("a") {
        print(item)
    }
}

print("--------------------")
/*:
---
#### Задание 8:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:
print("\n-------TASK №8-------")
let cyrillicString = "строкаттт"
let cyrillicUppercasedString = cyrillicString.uppercased().applyingTransform(StringTransform.toLatin, reverse: false)

func getIndexes(of character: Character, in string: String) -> [Int]? {
    var resultArray = [Int]()
    
    for index in 0..<string.count {
        
        if string[string.index(string.startIndex, offsetBy: index)] == character {
            resultArray.append(index)
        }
        
    }
    
    if resultArray.count == 0 {
        return nil
    }
    
    return resultArray
}

let character = Character("ы")

if let resultArray = getIndexes(of: character, in: cyrillicString) {
    print("Indexes of \"\(character)\" in string \"\(cyrillicString)\" are: \(resultArray)")
} else {
    print("There are no \"\(character)\"-charecterss in \"\(cyrillicString)\"")
}

print("--------------------")

/*:
---
#### Задание 9:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

//: [Назад: Playground](@previous)  |  Страница 3  |  [Вперед: Коллекции. Массивы и множества](@next)
