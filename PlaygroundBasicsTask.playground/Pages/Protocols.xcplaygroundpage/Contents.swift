import Foundation
/*:
# Протоколы

В этом разделе ты узнаешь:
- что такое протокол
- какой у него синтакисис
- что значит фраза " класс (структура) удовлетворяет протокол".

Внимательно изучи:
- [Протокол](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви протокол _Employee_. Он должен содержать одно свойство _hours_ типа `Int` и один метод _work()_ без параметров и возвращаемого значения.
 */
// Добавь код сюда:
protocol Employee {
    var hours: Int { get set }
    
    func work()
}
/*:
 - Обьяви два класса _Painter_ и _Doctor_.
 - Укажи, что оба этих класса удовлетворяют протоколу.
 - Реализуй протокол в каждом из классов.
 */
// Добавь код сюда:
class Painter: Employee {
    var hours: Int = 1
    
    func work() {
        print("Painting")
    }
}

class Doctor: Employee {
    var hours: Int = 10
    
    func work() {
        print("Treating")
    }
}
/*:
 - Создай экземпляры каждого из классов.
 - Вызови метод _work_ для каждого из них.
 */
let painter = Painter()
let doctor = Doctor()
painter.work()
doctor.work()
/*:
---
#### Задание 2
 - Реализуй иерархию классов, представленную на рисунке:
 ![Telephone](Playground.Telephone.Protocols.png)
 - Note: 👆 _Обрати внимание, что классы iOS, androidOS  и windowsOS удовлетворяют протоколу Internetable_
 */
// Добавь код сюда:
protocol Telephone {
    func makeCall()
    func hangUp()
}

protocol Landline: Telephone {}

protocol Cellular: Telephone {
    func sendSMS()
}

protocol Rotaryable {
    var rotaryInput: String { get set }
}

protocol PushButtonable {
    var buttonInput: String { get set }
}

protocol Touchable {
    var touchInput: String { get set }
}

protocol Internetable {
    var accessInternet: Bool { get set }
}

class Rotary: Landline, Rotaryable {
    var rotaryInput: String = ""
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}

class PushButton: Landline, PushButtonable {
    var buttonInput: String = ""
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}

class NonSmart: Cellular, PushButtonable {
    func sendSMS() {
        print("sending")
    }
    
    var buttonInput: String = ""
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}

class iPhone: Cellular, Touchable, Internetable {
    func sendSMS() {
        print("sending")
    }
    
    var touchInput: String = ""
    
    var accessInternet: Bool = false
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}

class AndroidPhone: Cellular, Touchable, Internetable {
    func sendSMS() {
        print("sending")
    }
    
    var touchInput: String = ""
    
    var accessInternet: Bool = false
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}

class WindowsPhone: Cellular, Touchable, Internetable {
    func sendSMS() {
        print("sending")
    }
    
    var touchInput: String = ""
    
    var accessInternet: Bool = false
    
    func makeCall() {
        print("calling")
    }
    
    func hangUp() {
        print("hanging up")
    }
}
//: [Назад: Структуры и классы](@previous)  |  Страница 11  |  [Вперед: Делегаты](@next)
