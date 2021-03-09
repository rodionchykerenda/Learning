import Foundation
/*:
# Коллекции. Словари

 В этом разделе ты узнаешь:
 -  что такое словарь
 - как его создать
 - как получить доступ к его элементам

Внимательно изучи:
- [Словари](https://developer.apple.com/documentation/swift/dictionary)
- [Коллекции. Словари](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

Закрепи пройденный материал:

#### Задание 1
 
 - Обьяви переменную _country_, которая преставляет собой словарь (`dicitionary`). Укажи, что в словаре будут хранится данные типа `String`.
 - Note: 👆 _В качестве примера проинициализируй его следующими значениями в формате <ключ> : <значение>\
 "VA": "Vatican"\
 "UA": "Ukraine"\
 "IT": "Italy"_
 */

// Добавь код сюда:
print("\n-------TASK №1-------")
var country: [String: String] = ["VA": "Vatican",
                                  "UA": "Ukraine",
                                  "IT": "Italy"]

/*:
 - Выведи в консоль все ключи из словаря.
 */
// Добавь код сюда:
print(country.keys)

/*:
 - Выведи в консоль все значения из словаря.
 */
// Добавь код сюда:
print(country.values)
/*:
 - Выведи в консоль название самой маленькой страны.
 - Note: 👆 _Получи из словаря значение по ключу VA_
 */
// Добавь код сюда:
print(country["VA"]!)
print("--------------------")


/*:
---
#### Задание 2
 
 - Обьяви переменную people, которая преставляет собой массив словарей. Учти, что в словаре будут храниться данные типа `String`.
 - Note: 👆 _В качестве примера проинициализируй  массив следующими значениями:\
 ["firstName": "Calvin",\
 "lastName": "Newton"],\
 ["firstName": "Garry",\
 "lastName": "Mckenzie"],\
 ["firstName": "Leah",\
 "lastName": "Rivera"],\
 ["firstName": "Sonja",\
 "lastName": "Moreno"],\
 ["firstName": "Noel",\
 "lastName": "Bowen"]_
 */

// Добавь код сюда:
print("\n-------TASK №2-------")
var people: [[String: String]] =  [["firstName": "Calvin",
                                 "lastName": "Newton"],
                                 ["firstName": "Garry",
                                 "lastName": "Mckenzie"],
                                 ["firstName": "Leah",
                                 "lastName": "Rivera"],
                                 ["firstName": "Sonja",
                                 "lastName": "Moreno"],
                                 ["firstName": "Noel",
                                 "lastName": "Bowen"]]

/*:
- Создай массив строк _firstNames_, состоящий из значений по ключу _“firstName”_, для каждого из словаря.
 - Выведи в консоль полученный массив.
 - Example: 😉\
 _Output:_\
 firstNames = ["Calvin","Garry","Leah","Sonja","Noel"]
 */
// Добавь код сюда:
var firstNames = [String]()

people.forEach { (dictionary) in
    firstNames.append(dictionary["firstName"] ?? "Empty")
}

print(firstNames)
print("--------------------")

/*:
---
#### Задание 3
 - Исходными данными является массив словарей. Каждый словарь описывает человека и количество набранных им баллов.
*/

var newPeople: [[String:Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 23
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]
/*:
 Выведи в консоль _“таблицу лидеров”_ в следующем формате:
 _<Number>. <full name> - <score>_
 - Note: 👆 _Обрати внимание на то, что первым в списке должен быть человек, набравший максимальное число баллов._
 */
/*:
 - Example: 😉\
 _Output:_
 1. Garry Mckenzie - 23
 2. Noel Bowen - 16
 3. Calvin Newton - 13
 4. Leah Rivera - 10
 5. Sonja Moreno - 3
*/
// Добавь код сюда:te
print("\n-------TASK №3-------")
let sortedArray = newPeople.sorted {($0["score"] as! Int) > ($1["score"] as! Int)}
var i = 1

sortedArray.forEach { (dictionary) in
    print("\(i). \(dictionary["firstName"] ?? "Empty") \(dictionary["lastName"] ?? "Empty") - \(dictionary["score"] ?? "Empty")")
    i += 1
}

print("--------------------")
//: [Назад: Кортежи, перечисления и псевдонимы типов](@previous)  |  Страница 9  |  [Вперед: Структуры и классы](@next)
