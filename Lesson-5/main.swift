//
//  main.swift
//  Lesson-5
//
//  Created by Daniil.Startsev on 02.05.2022.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum Window: String {
    case open
    case close
}
enum Engine {
    case start
    case stop
}
protocol Car {
        var model: String {get set}
        var productionYear: String {get set}
        var engine: Engine {get set}
        var window: Window {get set}
        
    }
extension Car {
        
        mutating func startEngine() {
             self.engine = .start
        }
        mutating func stopEngine() {
             self.engine = .stop
        }
        mutating func openWindow() {
            self.window = .open
        }
        mutating func closeWindow() {
            self.window = .close
        }
}
    

class trunkCar: Car, CustomStringConvertible {
    var description: String {
        return "модель авто \(model), год выпуска \(productionYear), двигатель \(engine), окна \(window), кузов \(bodyType)"
    }
    
    var model: String
    var productionYear: String
    var engine: Engine
    var window: Window
    var bodyType : BodyType
    
    enum BodyType {
        case cistern
        case wagon
}
    func cisternBody() {
        bodyType = .cistern
    }
    func wagonBody() {
        bodyType = .wagon
    }
    init(model: String, productionYear: String, engine: Engine, window: Window, bodyTupe : BodyType) {
        self.model = model
        self.productionYear = productionYear
        self.engine = engine
        self.window = window
        self.bodyType = bodyTupe
    }
}

class sportCar: Car, CustomStringConvertible {
    var description: String {
        return "модель авто \(model), год выпуска \(productionYear), двигатель \(engine), окна \(window), кузов \(bodyType)"
    }
    
    var model: String
    var productionYear: String
    var engine: Engine
    var window: Window
    var bodyType : BodyType
    enum BodyType {
         case sedan
         case coupe
     }
    func sedanBody() {
        bodyType = .sedan
    }
    func coupeBody() {
        bodyType = .coupe
    }
    init(model: String, productionYear: String, engine: Engine, window: Window, bodyType: BodyType) {
        self.model = model
        self.productionYear = productionYear
        self.engine = engine
        self.window = window
        self.bodyType = bodyType
    }
    
}

var car1 = sportCar(model: "BMW", productionYear: "2019", engine: .stop, window: .close, bodyType: .sedan)

car1.productionYear = "1990"
car1.model = "Турбо Жига"
print(car1)

var car2 = trunkCar(model: "Газель", productionYear: "2012", engine: .start, window: .open, bodyTupe: .wagon)

car2.engine = .stop
car2.window = .close
print(car2)

