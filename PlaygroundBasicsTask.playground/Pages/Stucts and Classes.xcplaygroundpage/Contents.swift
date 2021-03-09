import Foundation
/*:
# Структуры и классы

В этом разделе ты узнаешь:
- что такое структуры и классы, чем они отличаются
- что такое свойства и методы
- что такое наследование классов и расширение классов и структур
- что такое инициализация и деинициализация

Внимательно изучи:
- [Структуры и классы](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#)
- [Свойства](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Методы](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
- [Наследование](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Инициализация](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Деинициализация](https://docs.swift.org/swift-book/LanguageGuide/Deinitialization.html)
- [Расширения](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви структуру _Point_, которая будет содержать два  свойства _x_ и _y_ типа `Double`.
 */

// Добавь код сюда:
print("\n-------TASK №1-------")
struct Point {
    var x: Double
    var y: Double
}
/*:
 - Создай экземпляр структуры `Point` c именем _point_ (значения  для _x_ и _y_ задай на свое усмотрение).
 */
// Добавь код сюда:
var point = Point(x: 10.0, y: 11.0)

/*:
 - Выведи в консоль значения для _x_ и _y_.
 */
// Добавь код сюда:
print("x: \(point.x), y: \(point.y)")

/*:
 - Измени значения _x_ и _y_. Выведи новые значение в консоль.
 */
// Добавь код сюда:
point.x = 12.0
point.y = 13.0
print("x: \(point.x), y: \(point.y)")
print("--------------------")
/*:
---
#### Задание 2
- Объяви структуру _Line_, которая будет иметь два  свойства _p1_ и _p2_ типа `Point`.
 - Добавь метод _length_ в структуру, который будет возвращать длину отрезка типа `Double`.
 - Note: 👆 _Для вычисления длины используй следующую формулу:_\
  ![Length](Playground.Length.png)
 */
// Добавь код сюда:
print("\n-------TASK №2-------")
struct Line {
    let p1: Point
    let p2: Point
    
    func getLength() -> Double {
        return sqrt(pow((p1.x - p2.x), 2) + pow((p1.y - p2.y), 2))
    }
    
}

/*:
 - Создай экземпляр структуры  `Line` c именем _line_ (значения  для _p1_ и _p2_ задай на свое усмотрение).
 - Выведи в консоль длину линии _line_.
 */
// Добавь код сюда:
let point1 = Point(x: 0.0, y: 5.0)
let point2 = Point(x: 1.0, y: 0.0)
let line = Line(p1: point1, p2: point2)
print("Length of line is \(line.getLength())")
print("--------------------")
/*:
---
#### Задание 3
 - Объяви класс _Weather_, который будет иметь два свойства _windSpeed_ и _chanceOfRain_ типа `Int`.
 */
// Добавь код сюда:
print("\n-------TASK №3-------")
class Weather {
    var windSpeed: Int = 0
    var chanceOfRain: Int
    
    init(windSpeed: Int, chanceOfRain: Int) {
        self.windSpeed = windSpeed
        self.chanceOfRain = chanceOfRain
    }
    
    func isDayForWalk() -> Bool {
        
        if windSpeed < 5, chanceOfRain < 30 {
            return true
        }
        
        return false
    }
    
}
/*:
 - У класса должен быть обязательный инициализатор, который принимает значения скорости ветра (_windSpeed_) и шанс дождя (_chanceOfRain_)
 */
// Добавь код сюда:

/*:
 - Добавь в класс функцию _isDayForWalk_. Если скорость ветра (_windSpeed_) меньше 5 метров и шанс дождя (_chanceOfRain_) меньше 30 процентов, то функция должна вернуть _true_,  иначе  - _false_.
 */
// Добавь код сюда:

/*:
 - Создай экземпляр класса и выведи в консоль удачный ли сегодня день для прогулок 😉.
 */
// Добавь код сюда:
let weather = Weather(windSpeed: 4, chanceOfRain: 20)
print(weather.isDayForWalk() ? "It's nice day for a walk" : "You better stay home")
print("--------------------")
/*:
---
#### Задание 4
 - Объяви класс _Point2D_, который будет иметь два свойства _x_ и _y_ типа `Double`. Свойства должны быть инициализированными 0 по умолчанию.
 */
// Добавь код сюда:
print("\n-------TASK №4-------")
class Point2D {
    var x: Double = 0.0
    var y: Double = 0.0
    
    func reset() {
        x = 0.0
        y = 0.0
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
}
/*:
 - Добавь в класс `Point2D`, метод  _reset_, который будет устанавливать координаты _x_ и _y_ в 0.
*/
// Добавь код сюда:

/*:
 - Добавь инициализатор в класс `Point2D`, который в качестве параметров будет принимать значения для координат _x_ и _y_.
 */
// Добавь код сюда:

/*:
- Объяви класс _Point3D_, который будет дочерним классом по отношению к классу `Point2D`. Добавь в него свойство _z_, которое будет проинициализировано по умолчанию нулем.
 */
// Добавь код сюда:
class Point3D: Point2D {
    var z: Double = 0.0
    
    init(x: Double, y: Double, z: Double) {
        super.init(x: x, y: y)
        self.z = z
    }
    
    override func reset() {
        super.reset()
        z = 0.0
    }
    
}

/*:
 - Добавь инициализатор, который будет в качестве параметров принимать значения для координат _x_, _y_ и _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */
// Добавь код сюда:

/*:
 - Создай экземпляр класса `Point3D` с именем _point3D_.
 */
// Добавь код сюда:
let point3D = Point3D(x: 10.0, y: 11.0, z: 12.0)
/*:
 - Сделай так, чтобы при вызове метода _reset_, также сбрасывалась в ноль и координата _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */

// Добавь код сюда:
point3D.reset()
print("--------------------")
/*:
---
#### Задание 5
 - Реализуй иерархию классов, представленной на рисунке:

 ![Telephone inheritance](Playground.TelephoneInheritance.png)
 */
// Добавь код сюда:
print("\n-------TASK №5-------")
class Telephone {
    func makeCall() {
    }
    
    func hangUp() {
    }
}

class LandLine: Telephone {
    
}

class Rotary: LandLine {
    var rotaryInput: String = ""
}

class PushButton: LandLine {
    var buttonInput: String = ""
}

class Cellular: Telephone {
    func sendSMS() {
    }
}

class Smart: Cellular {
    var touchInpur: String = ""
    var accessInternet: Bool = false
}

class NonSmart: Cellular {
    var buttonInput = ""
}

class iPhone: Smart {
    let iOS = ""
}

class Android: Smart {
    let androidOS = ""
}

class Windows: Smart {
    let windowsOS = ""
}
print("--------------------")


/*:
---
#### Задание 6
 - Приведи пример структуры, имеющей одно приватное свойства, которое инициализируется при помощи замыкания.
*/
// Добавь код сюда:
print("\n-------TASK №6-------")
struct Person {
    private let id: Int = {
        return Int.random(in: 100...999)
    }()
    
    func getID() -> Int {
        return id
    }
}

let person = Person()
person.getID()
print("--------------------")


//: [Назад: Коллекции. Словари](@previous)  |  Страница 10  |  [Вперед: Протоколы](@next)
