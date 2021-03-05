import Foundation
/*:
# Универсальные шаблоны

В этом разделе ты узнаешь:
- что такое универсальные шаблоны
- что такое универсальные функции
- что такое универсальные типы
- что такое ограничение типа
- что такое связанные типы

Внимательно изучи:
- [Универсальные типы](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

Закрепи пройденный материал:
#### Задание 1
 - Оптимизируй приведенный ниже код:
*/

func areIntEqual(x: Int, _ y: Int) -> Bool {
  return x == y
}

func areStringsEqual(x: String, _ y: String) -> Bool {
  return x == y
}

// Добавь код сюда:

/*:
---
#### Задание 2
 - Оптимизируй приведенный ниже код:
*/
func existsManual(item:String, inArray:[String]) -> Bool {
    var index:Int = 0
    var found = false

    while (index < inArray.count && found == false)
    {
        if item == inArray[index]
        {
            found = true
        }
        else
        {
            index = index + 1
        }
    }

    if found
    {
        return true
    }
    else
    {
        return false
    }
}

/*:
func existsManual(item:String, inArray:[String]) -> Bool
...
func existsManual(item:Int, inArray:[Int]) -> Bool
...
func existsManual(item:Float, inArray:[Float]) -> Bool
...
func existsManual(item:Double, inArray:[Double]) -> Bool
...
// "Person" is a custom class we'll create
func existsManual(item:Person, inArray:[Person]) -> Bool
*/

// Добавь код сюда:


//: [Назад:  Делегаты](@previous)  |  Страница 13]  [Вперед:  Паттерны проектирования](@next)
