import Foundation
/*:
 # Делегаты

 Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность экземпляру другого типа. Этот шаблон реализуется определением протокола, который инкапсулирует делегируемые полномочия, таким образом, что соответствующий протоколу тип (делегат) гарантировано получит функциональность, которая была ему делегирована. Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.
 */
/*:
 Более подробно ты можешь прочитать [тут.](https://docs.google.com/document/d/1ZRHiPgmIqsOQIihG8Ad0WPgyajWR2zKux-EKt0pYQwQ/edit?usp=sharing)
 */

/*:
 ---
 ## Задание 1
 
 Ты завел будильник и после того как он зазвонит, тебе надо его выключить. Напиши программный код. Схематически это выглядит так:\
  ![Delegate.Task1](Playground.Delegate.Task1.png)
 */

// Добавь код сюда:
class User {
    func handleAlarm() {
        let alarm = Alarm()
        alarm.delegete = self
        alarm.turnOn()
    }
}

extension User: AlarmDelegate {
    func alarmDidRing() {
        print("User: Need to turn it off")
    }
}

class Alarm {
    weak var delegete: AlarmDelegate?
    
    func turnOn() {
        print("Alarm is setted")
        delegete?.alarmDidRing()
    }
}

protocol AlarmDelegate: class {
    func alarmDidRing()
}
/*:
---
## Задание 2

Ты решил сделать ремонт у себя в комнате и  нанял строителя. После того как строитель выполнит подготовительные работы, он должен позвонить тебе с определенным вопросом. Получив от тебя ответ на вопрос, строитель продолжит свою работу. Через некоторое время он позвонит тебе еще раз и сообщит, что закончил ремонт. Опиши эту ситуацию программно. Схематически это выглядит так:\
![Delegate.Task2](Playground.Delegate.Task2.png)
*/
// Добавь код сюда:
class Customer {
    func handleRepair() {
        let employee = Employee()
        employee.delegate = self
        employee.doRepair()
    }
}

extension Customer: EmployeeDelegate {
    func didEndSettingUp() -> String {
        return "Orange"
    }
    
    func didFinishWork() {
        print("Job is finished")
    }
    
    
}

class Employee {
    weak var delegate: EmployeeDelegate?
    var color: String = ""
    
    func doRepair() {
        setUp()
        color = delegate?.didEndSettingUp() ?? "Yellow"
        continueWork()
        delegate?.didFinishWork()
    }
    
    private func setUp() {
        print("Employee: Setting up")
    }
    
    private func continueWork() {
        print("Continue working with selected color: \(color)")
    }
}

protocol EmployeeDelegate: class {
    func didEndSettingUp() -> String
    func didFinishWork()
}

let customer = Customer()
customer.handleRepair()
//: [Назад: Протоколы](@previous)  |  Страница 12]  [Вперед:  Универсальные шаблоны](@next)
