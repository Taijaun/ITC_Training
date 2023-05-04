//
//  VehicleFactory.swift
//  SingletonAndSubscriber
//
//  Created by Taijaun Pitt on 04/05/2023.
//

import Foundation

protocol VehicleProtocol{
    func move() -> String
    func hasWheels() -> Bool
}

class VehicleFactory {
    
    func createVehicle(type: String) -> VehicleProtocol? {
        if type == "Car"{
            return Car()
        } else if type == "Bicycle"{
            return Bicycle()
        } else if type == "Helicopter"{
            return Helicopter()
        } else {
            return nil
        }
    }
    
    
}

class Car:VehicleProtocol {
    
    func move()-> String {
        return "Driving"
    }
    
    func hasWheels() -> Bool {
        print("Cars have wheels")
        return true
    }
}

class Bicycle: VehicleProtocol {
    func move()-> String {
        return "Pedaling"
    }
    
    func hasWheels() -> Bool {
        print("Bicycles have wheels")
        return true
    }

}

class Helicopter: VehicleProtocol {
    func move()-> String {
        return "Flying"
    }
    
    func hasWheels() -> Bool {
        print("Helicopters do not have wheels")
        return false
    }
    
    
    
}
