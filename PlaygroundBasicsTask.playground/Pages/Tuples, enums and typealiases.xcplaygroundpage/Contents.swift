import Foundation
/*:
# Кортежи, перечисления и псевдонимы типов

В этом разделе ты узнаешь:
- что такое перечисления (`enum`)
- как производить итерацию по кейсам перечисления
- что такое ассоциативные значения
- что такое кортежи  (`tuple`)
- что такое пвсевдонимы типа (`typealias`)

Внимательно изучи:
- [Перечисления](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Кортежи](https://medium.com/swift-programming/swift-tuple-328aecff50e7)
- [Псевдонимы типов](https://www.avanderlee.com/swift/typealias-usage-swift/)

Закрепи пройденный материал:

#### Задание 1
 
 - Создай кортеж с тремя параметрами: твой любимый фильм, любимый  город и любимое блюдо. Все элементы кортежа должны быть именованы.
 - Выведи в консоль твой любимый город (данные возьми из кортежа).
 */
// Добавь код сюда:
print("\n-------TASK №1-------")
let favourites = (movie: "The Lord Of The Rings", city: "New York City", meal: "Pasta")
print(favourites.city)
print("--------------------")
/*:
---
#### Задание 2

- Напиши функцию _minMax_, которая принимает в качестве параметра массив целых чисел и возвращает минимальное и максимальное из них в виде кортежа.
- Результат работы функции выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 minmax([2, 3, 10, 1])\
 _Output:_\
 (1, 10)
*/

// Добавь код сюда:
print("\n-------TASK №2-------")
func minmax(_ array: [Int]) -> (min: Int, max: Int) {
    let maximum = array.reduce(Int.min, { max($0, $1) })
    let minimum = array.reduce(Int.max, { min($0, $1) })
    return (minimum, maximum)
}

print(minmax([2, 3, 10, 1]))
print("--------------------")
/*:
---
#### Задание 3
 
 - Обьяви перечисление (`enum`) _Season_, описывающее времена года и состояющее из следующих строковых значений: _winter_, _spring_, _summer_, _autumn_.

 - Напиши функцию, которая выводит в консоль все элементы из этого перечисления.
 - Example: 😉\
 _Output:_\
 Seasons:\
 winter\
 spring\
 summer\
 autumn
 */

// Добавь код сюда:
print("\n-------TASK №3-------")
enum Season: CaseIterable {
    case winter, spring, summer, autumn
}

func printAllSeasons() {
    print("Seasons:")
    
    for season in Season.allCases {
        print(season)
    }
    
}

printAllSeasons()
print("--------------------")

/*:
---
#### Задание 4
 
 - Обьяви перечисление (`enum`) _CoinType_, описывающее различные стоимости монет.
 - Note: 👆 _В качестве примера возьми следующие значения:\
 penny = 1\
 nickle = 5\
 dime = 10\
 quarter = 25_
 */
/*:
 - Обьяви массив _money_, элементами которого являются кортежи _(amount, type)_. Проинициализируй массив любыми соответствующими его типу значениями.
*/
// Добавь код сюда:
print("\n-------TASK №4-------")
enum CoinType: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

var money: [(amount: Int, type: CoinType)] = [(10, .penny),(15,.nickle),(3,.quarter),(20,.penny),(3,.dime),(7,.quarter)]
/*:
 - Выведи в консоль общую стоимость монет.
 - Example: 😉\
 _Input:_\
 var moneyArray : [(Int,CoinType)] = [(10, .penny),(15,.nickle),(3,.quarter),(20,.penny),(3,.dime),(7,.quarter)]\
 _Output:_\
 All: 385
*/
// Добавь код сюда:
var result = 0

for item in money {
    result += item.amount * item.type.rawValue
}

print(result)
print("--------------------")

/*:
---
#### Задание 5
 
 - Объяви псевдоним (`typealias`) типа `String` с именем _Text_.
 */
// Добавь код сюда:
print("\n-------TASK №5-------")
typealias Text = String
/*:
 - Объяви три константы типа `Text`. Значения двух констант должны состоять только из цифр, третьей — из цифр и букв.
 */
// Добавь код сюда:
let firstConstant: Text = "123"
let secondConstant: Text = "12345"
let thirdConstant: Text = "123abc"

/*:
 - Из всех трех констант найди те, которые состоят только из цифр, и выведи их в консоль.
*/
// Добавь код сюда:
if let first = Int(firstConstant) {
    print(first)
}

if let second = Int(secondConstant) {
    print(second)
}

if let third = Int(thirdConstant) {
    print(third)
}
/*:
 - Создай псевдоним для типа `(numberOne: Text?, numberTwo: Text?)?` с именем _TupleType_.
  - Note: 👆 _Обрати внмиание, что данный тип является опциональным и также содержит в себе опциональные значения_
 */
// Добавь код сюда:
typealias TupleType = (numberOne: Text?, numberTwo: Text?)?
/*:
 - Создай три переменные типа `TupleType`, содержащие следующие значения: _(“190”, “67”)_, _(“100”, nil)_, _(“-65”, “70”)_.
 - Выведите значения элементов тех кортежей, в которых ни один из элементов не инициализирован как `nil`.
 */
// Добавь код сюда:
let first: TupleType = (numberOne: "190", numberTwo: "67")
let second: TupleType = (numberOne: "100", numberTwo: nil)
let third: TupleType = (numberOne: "-65", numberTwo: "70")

if let numberOne = first?.numberOne, let numberTwo = first?.numberTwo {
    print(numberOne, " ", numberTwo)
}

if let numberOne = second?.numberOne, let numberTwo = second?.numberTwo {
    print(numberOne, " ", numberTwo)
}

if let numberOne = third?.numberOne, let numberTwo = third?.numberTwo {
    print(numberOne, " ", numberTwo)
}
print("--------------------")
//: [Назад: Замыкания](@previous)  |  Страница 8  |  [Вперед: Коллекции. Словари](@next)
