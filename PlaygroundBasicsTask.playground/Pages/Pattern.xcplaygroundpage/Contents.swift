import Foundation
/*:
 # Паттерны проектирования
 
 В этом разделе ты узнаешь:
 - что такое паттерны, какие проблемы они решают
 - какие бывают их виды и как их реализовать на языке Swift
 
 Паттерн проектирования — это часто встречающееся решение определённой проблемы при проектировании архитектуры программ.
 В отличие от готовых функций или библиотек, паттерн нельзя просто взять и скопировать в программу. Паттерн представляет собой не какой-то конкретный код, а общую концепцию решения той или иной проблемы, которую нужно будет ещё подстроить под нужды каждой программы.
 
 Паттерны отличаются по уровню сложности, детализации и охвата проектируемой системы.
 
 Самые низкоуровневые и простые паттерны — идиомы. Они не универсальны, поскольку применимы только в рамках одного языка программирования. Самые универсальные — архитектурные паттерны, которые можно реализовать практически на любом языке. Они нужны для проектирования всей программы, а не отдельных её элементов.
 Кроме того, паттерны отличаются и предназначением.  Можно выделить три основные группы:
 - порождающие (фабричный метод, абстрактная фабрика, строитель, прототип, одиночка) - беспокоятся о гибком создании объектов без внесения в программу лишних зависимостей
 - стуктурные (адаптер, мост, компоновщик, декоратор, фасад, легковес, заместитель) - показывают различные способы построения связей между объектами
 - поведенческие (цепочка обязанностей, команда, итератор, посредник, снимок, наблюдатель, состояние, стратегия, шаблонный метод, посетитель) - заботятся об эффективной коммуникации между объектами.
 
 Внимательно изучи некоторые виды паттернов:
 - [Фабричный метод](https://refactoring.guru/ru/design-patterns/factory-method)
 - [Абстрактная фабрика](https://refactoring.guru/ru/design-patterns/abstract-factory)
 - [Строитель](https://refactoring.guru/ru/design-patterns/builder)
 - [Прототип](https://refactoring.guru/ru/design-patterns/prototype)
 - [Декоратор](https://refactoring.guru/ru/design-patterns/decorator)
 - [Адаптер](https://refactoring.guru/ru/design-patterns/adapter)
 - [Мост](https://refactoring.guru/ru/design-patterns/bridge)
 - [Цепочка обязанностей](https://refactoring.guru/ru/design-patterns/chain-of-responsibility)
 - [Команда](https://refactoring.guru/ru/design-patterns/command)
 
 Закрепи пройденный материал:
 #### Задание 1
 - Предположим, твой модуль отвечает за производство пиццы. Напиши код, который будет реализовывать обьект создания пиццы во время выполнения программы. Например, если пользователь хочет пиццу с сыром, то твой модуль создаст обьект CheesePizza,  а если пользователь хочет пиццу с пепперони - обьект PepperoniPizza
 - Note: 👆 _Используй фабричный метод_
 */
// Добавь код сюда:
protocol Pizza: class {
    var isTasty: Bool { get set }
}

class CheesePizza: Pizza {
    var isTasty: Bool = true
}

class PepperoniPizza: Pizza {
    var isTasty: Bool = false
}

protocol PizzaCreator: class {
    func createPizza() -> Pizza
}

class CheesePizzaCreator: PizzaCreator {
    func createPizza() -> Pizza {
        return CheesePizza()
    }
}

class PepperoniPizzaCreator: PizzaCreator {
    func createPizza() -> Pizza {
        return PepperoniPizza()
    }
}
/*:
 ---
 #### Задание 2
 - Предположим, твой модуль связан с продажей средств передвижения.  От типа (велосипед, автомобиль,  электоро - самокат, скутер, мотоцикл) конкретного средства зависит его отображение. Помимо этого,  все средства передвижения различаются состоянием (новое и б/y), типом потребляемого топлива (не потребляет, бензин, электричество) и максимальным количеством людей, которые могут перевести. Напиши код, который будет создавать объекты средств передвижения  с учетом его характеристик.
 - Note: 👆 _Используй абстрактую фабрику_
 */
// Добавь код сюда:
protocol TransportFactory {
    func createBike() -> Bike
    func createMotorcycle() -> Motorcycle
    func createCar() -> Car1
}

protocol Transport: class {
    var isNew: Bool { get set }
    var fuelType: String { get set }
    var maxPepopleToTransport: Int { get set }
}

class Bike: Transport {
    var isNew: Bool
    var fuelType: String = "NoFuel"
    var maxPepopleToTransport: Int = 2
    
    init(isNew: Bool) {
        self.isNew = isNew
    }
}

class Motorcycle: Transport {
    var isNew: Bool
    var fuelType: String = "Gas"
    var maxPepopleToTransport: Int = 2
    
    init(isNew: Bool) {
        self.isNew = isNew
    }
}

class Car1: Transport {
    var isNew: Bool
    var fuelType: String = "Gas"
    var maxPepopleToTransport: Int = 4
    
    init(isNew: Bool) {
        self.isNew = isNew
    }
}

class NewTransportFactory: TransportFactory {
    func createBike() -> Bike {
        return Bike(isNew: true)
    }
    
    func createMotorcycle() -> Motorcycle {
        return Motorcycle(isNew: true)
    }
    
    func createCar() -> Car1 {
        return Car1(isNew: true)
    }
}

class UsedTransportFactory: TransportFactory {
    func createBike() -> Bike {
        return Bike(isNew: false)
    }
    
    func createMotorcycle() -> Motorcycle {
        return Motorcycle(isNew: false)
    }
    
    func createCar() -> Car1 {
        return Car1(isNew: false)
    }
}
/*:
 ---
 #### Задание 3
 - Предположим, твой модуль связан с созданием автомобиля. Автомобиль - это очень сложный обьект, так как машины  могут отличаться типом двигателя, количеством сидений, могут иметь или не иметь GPS и системы навигаций, кроме того автомобили могут быть городскими, спортивными и внедорожниками. Реализуй систему, которая будет  поэтапно конструировать  автомобиль (устанавливать  сидения,  двигатель, красить кузов  и так далее).
 - Note: 👆 _Используй паттерн строитель_
 */
// Добавь код сюда:
protocol Builder: class {
    func reset()
    func setSeats(quantity: Int)
    func setEngine(engineType: String)
    func setGPS()
}

class CarBuilder: Builder {
    private var result = Car()
    
    func reset() {
        result = Car()
    }
    
    func setSeats(quantity: Int) {
        result.seats = quantity
    }
    
    func setEngine(engineType: String) {
        result.engine = engineType
    }
    
    func setGPS() {
        result.GPS = true
    }
    
    func getResult() -> Car {
        return result
    }
}

class Director {
    func makeSportsCar(builder: CarBuilder) {
        builder.reset()
        builder.setSeats(quantity: 2)
        builder.setGPS()
        builder.setEngine(engineType: "Sport")
    }
    
    func makeSimpleCar(builder: CarBuilder) {
        builder.reset()
        builder.setSeats(quantity: 4)
        builder.setEngine(engineType: "Simple")
    }
}

class Car {
    var seats: Int?
    var engine: String?
    var GPS: Bool = false
}
/*:
 ---
 #### Задание 4
 - Предположим, твой модуль связан с  работой кофейни. При добавлении нового инредиента к кофе, например, взбитые сливки, необходимо рассчитать новую стоимость продукта и получить новое описание состава напитка. Представь это в виде кода.
 - Note: 👆 _Используй паттерн декоратор_
 */
// Добавь код сюда:
protocol Component: class {
    func getValue() -> Int
}

class Coffe: Component {
    func getValue() -> Int {
        return 10
    }
}

class Decorator: Component {
    private var component: Component

    init(_ component: Component) {
        self.component = component
    }

    func getValue() -> Int {
        return component.getValue()
    }
}

class Cream: Decorator {
    override func getValue() -> Int {
        return super.getValue() + 2
    }
}

class Cinnamon: Decorator {
    override func getValue() -> Int {
        return super.getValue() + 2
    }
}

let coffe = Coffe()
let cream = Cream(coffe)
let cinnamon = Cinnamon(cream)
print("Total: \(cinnamon.getValue())")
/*:
 ---
 #### Задание 5
 - Предположим, у тебя есть некий сервис, который выводит в консоль текущую дату, но, например, на арабском  языке, который не понимает твой клиент. Сделай так, чтобы твой клиент мог использовать сервис вывода даты в консоль на понятном ему языке.
 - Note: 👆 _Используй паттерн адаптер_
 */
// Добавь код сюда:
protocol Target {
    func request() -> String
}

class Adaptee {
    public func specificRequest() -> String {
        return "الإثنين 2015.5.5 - 16:16 مساء  بتوقيت ابوظبي"
    }
}

class Adapter: Target {
    private var adaptee: Adaptee
    
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    func request() -> String {
        var dateString = adaptee.specificRequest()
        dateString = dateString.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.-:").inverted)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd - HH:mm"

        let date = formatter.date(from: dateString)
        return "Adapter: (TRANSLATED) \(date!)"
    }
}
class Client {
    func someClientCode(target: Target) {
        print(target.request())
    }
}
let adaptee = Adaptee()
let adapter = Adapter(adaptee)
let client = Client()
client.someClientCode(target: adapter)
/*:
 ---
 #### Задание 6
 - Предположим, твой модуль представляет собой некий конвеер, который обрабатывает  различные предметы, которые на него попадают. На данный момент есть возможность переработать следующие типы предметов: пищевые отходы, электронику, бумагу и стекло. Для каждого типа предмета в системе должен быть предусмотрен свой обработчик, который принимает на вход предмет, сканирует его и определяет возможность переработки. Если этот предмет того типа, который он "умеет" обрабатывать, то он выполняет обработку, если нет, то передает следующему обработчику. Если же никто из обработчиков не смог переработать предмет, то предмет должен в конечном итоге попасть "в руки"  обьекту "Склад", который дальше уже не передает предмет, а ставит на нем специальный маркер.
 - Note: 👆 _Используй паттерн цепочка обязанностей_
 */
// Добавь код сюда:
protocol Handler: class {
    var next: Handler? { get set }
    
    func setNext(h: Handler) -> Handler
    func handle(request: String) -> String?
}

extension Handler {
    func setNext(h: Handler) -> Handler {
        self.next = h
        return h
    }

    func handle(request: String) -> String? {
        return next?.handle(request: request)
    }
}

class GlassHandler: Handler {
    var next: Handler?
    
    func handle(request: String) -> String? {
        if request.lowercased() == "glass" {
            return "GlassHandler did a job"
        } else {
            return next?.handle(request: request)
        }
    }
}

class FoodWasteHandler: Handler {
    var next: Handler?
    
    func handle(request: String) -> String? {
        if request.lowercased() == "foodwaste" {
            return "FoodWasteHandler did a job"
        } else {
            return next?.handle(request: request)
        }
    }
}

class ElectronicsHandler: Handler {
    var next: Handler?
    
    func handle(request: String) -> String? {
        if request.lowercased() == "electronics" {
            return "ElectronicsHandler did a job"
        } else {
            return next?.handle(request: request)
        }
    }
}

class PaperHandler: Handler {
    var next: Handler?
    
    func handle(request: String) -> String? {
        if request.lowercased() == "paper" {
            return "PaperHandler did a job"
        } else {
            return next?.handle(request: request)
        }
    }
}

class Conveyor {
    func handleTrash(handler: Handler) {
        let trash = ["Glass", "Paper", "asfdasdf", "FoodWaste"]
        
        for item in trash {
            guard let result = handler.handle(request: item) else {
                Storage.storage.moveToTrash(item)
                print("Couldn't handle \(item). It is moved to storage.")
                return
            }
            print(result)
        }
    }
}

class Storage {
    private var trash = [String]()
    
    public static let storage = Storage()
    
    public func moveToTrash(_ string: String) {
        trash.append(string)
    }
}

let conveyor = Conveyor()
let glassHandler = GlassHandler()
let foodWasteHandler = FoodWasteHandler()
let paperHandler = PaperHandler()
let electronicsHandler = ElectronicsHandler()
glassHandler.setNext(h: foodWasteHandler).setNext(h: paperHandler).setNext(h: electronicsHandler)
conveyor.handleTrash(handler: glassHandler)
/*:
 ---
 #### Задание 7
 - Предположим, твой модуль представляет системное меню. Разработай систему, которая обрабатывает нажатия на пункты меню с учетом версии ПО.
 - Note: 👆 _Используй паттерн команда_
 */
// Добавь код сюда:
protocol Command: class {
    func execute()
}

class GetterConcreteDataFromServer: Command {
    private var softVersion: String
    private let server: Server
    
    init(soft: String, server: Server) {
        self.softVersion = soft
        self.server = server
    }
    
    func execute() {
        server.operation(software: softVersion)
    }
}

class PrintInConsole: Command {
    func execute() {
        print("This command did some simple job")
    }
}

class UIElements {
    private var command: Command?
    
    func setCommand(command: Command) {
        self.command = command
    }
    
    func executeCommand() {
        command?.execute()
    }
}

class Server {
    func operation(software: String) {
        print("Server is doing something depends on software version")
    }
}
