//
//  HomePageView.swift
//  SingletonAndSubscriber
//
//  Created by Taijaun Pitt on 04/05/2023.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var selection = "Car"
    let vehicles = ["Car", "Bicycle", "Helicopter"]
    let vehicleFactory = VehicleFactory()
    
    var body: some View {
        VStack{
            
            Text("Successfully Logged in")
                .padding(.bottom, 50)
            
            Picker("Choose a vehicle", selection: $selection){
                ForEach(vehicles, id: \.self) { vehicle in
                    Text(vehicle)
                }
            }.pickerStyle(.menu)
            
            displayTransportMethod(vehicle: selection)
                .padding(10)
            
            
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    UserManager.shared.userLogout()
                    print(UserManager.shared.isLoggedin)
                    
                    
                } label: {
                    Text("Logout")
                }

            }
        }
    }
    
    func displayTransportMethod(vehicle: String) -> Text{
        
        guard let createdVehicle = vehicleFactory.createVehicle(type: vehicle) else {return Text("")}
        
        return Text("This Vehicles method of transportation is \(createdVehicle.move())")
        
    }
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
