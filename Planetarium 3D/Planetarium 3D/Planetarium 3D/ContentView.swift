//
//  AppDelegate.swift
//  Planetarium 3D
//
//  Created by Sophie Nguyen on 5/13/23.
//

import SwiftUI
import SceneKit

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        Home()
    }
}


struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}


struct Home : View {
    
    @State var models = [
        
        Model(id: 0, name: "Earth", modelName: "Earth.usdz", details: "The third planet from the sun and the only known planet to support life. Earth has an atmosphere that contains oxygen, nitrogen, and carbon dioxide, and it has a magnetic field that protects the planet from the solar wind."),
        
        Model(id: 0, name: "Jupiter", modelName: "Jupiter.usdz", details: "The fifth planet from the sun and the largest planet in the solar system. Jupiter is a gas giant and has a thick atmosphere of hydrogen, helium, and other gases. It also has a system of rings and numerous moons."),
        
        Model(id: 0, name: "Mars", modelName: "Mars.usdz", details: "The fourth planet from the sun and also known as the Red Planet. Mars has a thin atmosphere of carbon dioxide and nitrogen, and it has polar ice caps made of water and carbon dioxide. It also has the largest volcano and the deepest canyon in the solar system."),
        
        Model(id: 0, name: "Pluto", modelName: "Pluto.usdz",details: "A dwarf planet located in the Kuiper Belt, beyond the orbit of Neptune. Pluto has a thin atmosphere of nitrogen, methane, and carbon monoxide, and it has a system of five known moons."),
        
        Model(id: 0, name: "Venus", modelName: "Venus.usdz",details: "The second planet from the sun and the hottest planet in the solar system. Venus has a thick atmosphere of carbon dioxide, sulfuric acid, and other gases, which creates a strong greenhouse effect."),
    ]

    @State var index = 0

    var body: some View{
        
        VStack{
            
            
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
    
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
            
            ZStack{
                
                
                HStack{
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            if index > 0{
                                
                                index -= 1
                            }
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == 0 ? true : false)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            if index < models.count{
                                
                                index += 1
                            }
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                    
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical,30)
            
    
            
            VStack(alignment: .leading, spacing: 15, content: {
                
                Text(models[index].details)
                
            })
            .padding(.horizontal)
            
            Spacer(minLength: 0)
        }
    }
}




