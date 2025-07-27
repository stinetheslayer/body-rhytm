//
//  ProfilePage.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 16/12/23.
//

import SwiftUI

class AppSettings: ObservableObject {
    @Published var isDarkMode = false
}

struct ProfileView: View {
    @EnvironmentObject var appSettings: AppSettings
    @State private var isDarkMode = false
    @State var name: String
    @State var age: String
    @State var weight: String
    @State var height: String
    let profileImage: UIImage?
    
    @State private var isEditingName = false
      @State private var isEditingAge = false
    @State private var isEditingWeight = false
        @State private var isEditingHeight = false
      @State private var editedName = ""
      @State private var editedAge = ""
    @State private var editedWeight = ""
        @State private var editedHeight = ""

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color("Color1"),
                Color("Color2"),
                Color("Color3"),
                Color("Color4")
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
           
                VStack(spacing: 0) {
                    // Rectangle at the top with photo, name, and age
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.3)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .position(x:180, y: 200)
                            .frame(height: 300)
                            .padding()
                            .overlay(
                                VStack(spacing: 5) {
                                    if let profileImage = profileImage {
                                        Image(uiImage: profileImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                            .shadow(radius: 5)
                                    }
                                    Text(name)
                                        .font(.title)
                                        .foregroundColor(Color("LabelColor"))
                                        .padding()
                                    
                                    Text("Age: \(age)")
                                        .foregroundColor(Color("LabelColor"))
                                    
                                    
                                    // HStack of 3 rectangles with weight, height, and logout
                                    HStack {
                                        // Rectangle for weight
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color("Color5").opacity(0.3),
                                                    Color("Color6").opacity(0.3)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))
                                            .frame(height: 100)
                                            .padding()
                                            .overlay(
                                                VStack {
                                                    Image( "WeightScale")
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    Text("Weight")
                                                        .font(.headline)
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    Text(weight)
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    
                                                }
                                            )
                                        
                                        Spacer()
                                        
                                        // Rectangle for height
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color("Color5").opacity(0.3),
                                                    Color("Color6").opacity(0.3)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))
                                            .frame(height: 100)
                                            .padding()
                                            .overlay(
                                                VStack {
                                                    Image("HeightScale")
                                                        .foregroundColor(Color("LabelColor"))
                                                    Text("Height")
                                                        .font(.headline)
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    Text(height)
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    
                                                }
                                            )
                                        
                                        Spacer()
                                        
                                        // Rectangle for logout
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color("Color5").opacity(0.3),
                                                    Color("Color6").opacity(0.3)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))
                                            .frame(height: 100)
                                            .padding()
                                            .overlay(
                                                VStack {
                                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                                    
                                                    Text("Logout")
                                                        .font(.headline)
                                                        .foregroundColor(Color("LabelColor"))
                                                    
                                                    
                                                        .foregroundColor(Color("LabelColor"))
                                                }
                                            )
                                            .onTapGesture {
                                                // Handle logout action
                                            }
                                    }
                                    .padding()
                                    
                                }
                                    .position(x:200, y: 230)
                            )
                    }
                    .position(x:195, y: 150)
                
                    VStack(spacing: 20){
                        // Dark Mode toggle
                                           RoundedRectangle(cornerRadius: 10)
                                               .fill(LinearGradient(
                                                   gradient: Gradient(colors: [
                                                       Color("Color5").opacity(0.3),
                                                       Color("Color6").opacity(0.3)
                                                   ]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing
                                               ))
                                               .frame(height: 50)
                                               .padding()
                                               .overlay(
                                                   HStack {
                                                       Text("Dark Mode")
                                                           .font(.headline)
                                                           .foregroundColor(Color("LabelColor"))

                                                       Spacer()

                                                       Toggle("", isOn: $appSettings.isDarkMode)
                                                           .accessibilityLabel("change the screen mood")
                                                           .labelsHidden()
                                                           .toggleStyle(SwitchToggleStyle(tint: Color("LabelColor")))
                                                           .onChange(of: isDarkMode, perform: { value in
                                                               // Set the preferred color scheme based on the dark mode toggle
                                                               if isDarkMode {
                                                                   UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                                                               } else {
                                                                   UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                                                               }
                                                           })
                                                   }
                                                   .padding()
                                               )
                                               .padding()
                        
                        // Edit Name Rectangle
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .frame(height: 50)
                        
                            .padding()
                            .overlay(
                                Button(action: {
                                    isEditingName = true
                                }) {
                                    HStack {
                                        Text("Edit Name")
                                            .font(.headline)
                                            .foregroundColor(Color("LabelColor"))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "pencil")
                                            .accessibilityLabel("Edit name button")
                                            .foregroundColor(Color("LabelColor"))
                                    }
                                    .padding()
                                }
                            )
                            .position(x:180, y: 0)
                            .popover(isPresented: $isEditingName, content: {
                                EditProfilePopoverView(title: "Edit Name", currentValue: name, editedValue: $editedName, onSave: {
                                    // Handle saving the new name
                                    name = editedName
                                    isEditingName = false
                                })
                            })
                            .padding()
                        
                        // Edit Age Rectangle
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .frame(height: 50)
                            .padding()
                            .overlay(
                                Button(action: {
                                    isEditingAge = true
                                }) {
                                    HStack {
                                        Text("Edit Age")
                                            .font(.headline)
                                            .foregroundColor(Color("LabelColor"))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "pencil")
                                            .accessibilityLabel("Edit age button")
                                            .foregroundColor(Color("LabelColor"))
                                    }
                                    .padding()
                                }
                            )
                            .position(x:180, y: 0)
                            .popover(isPresented: $isEditingAge, content: {
                                EditProfilePopoverView(title: "Edit Age", currentValue: age, editedValue: $editedAge, onSave: {
                                    // Handle saving the new age
                                    age = editedAge
                                    isEditingAge = false
                                })
                            })
                            .padding()
                        // Edit Weight Rectangle
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .frame(height: 50)
                            .padding()
                            .overlay(
                                Button(action: {
                                    isEditingWeight = true
                                }) {
                                    HStack {
                                        Text("Edit Weight")
                                            .font(.headline)
                                            .foregroundColor(Color("LabelColor"))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "pencil")
                                            .accessibilityLabel("Edit weight button")
                                            .foregroundColor(Color("LabelColor"))
                                    }
                                    .padding()
                                }
                            )
                            .position(x:180, y: 0)
                            .popover(isPresented: $isEditingWeight, content: {
                                EditProfilePopoverView(title: "Edit Weight", currentValue: weight, editedValue: $editedWeight, onSave: {
                                    // Handle saving the new weight
                                    weight = editedWeight
                                    isEditingWeight = false
                                })
                            })
                            .padding()
                        // Edit Height Rectangle
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .frame(height: 50)
                            .padding()
                            .overlay(
                                Button(action: {
                                    isEditingHeight = true
                                }) {
                                    HStack {
                                        Text("Edit Height")
                                            .font(.headline)
                                            .foregroundColor(Color("LabelColor"))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "pencil")
                                            .accessibilityLabel("Edit height button")
                                            .foregroundColor(Color("LabelColor"))
                                    }
                                    .padding()
                                }
                            )
                            .position(x:180, y: 0)
                            .popover(isPresented: $isEditingHeight, content: {
                                EditProfilePopoverView(title: "Edit Height", currentValue: height, editedValue: $editedHeight, onSave: {
                                    // Handle saving the new height
                                    height = editedHeight
                                    isEditingHeight = false
                                })
                            })
                            .padding()
                    }
                    .position(x:195, y:150)
                    
                  // tapbar here
            }
            
                  .navigationBarTitle("Profile", displayMode: .inline)
                  .preferredColorScheme(appSettings.isDarkMode ? .dark : .light)
                  .position(x: 200, y:350)
        )
              }
          }

struct EditProfilePopoverView: View {
    let title: String
    let currentValue: String
    @Binding var editedValue: String
    let onSave: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding()

            TextField("Enter \(title.lowercased())", text: $editedValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                onSave()
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        // For preview, you can pass sample data
        ProfileView(name: "John Doe", age: "25", weight: "70 kg", height: "180 cm", profileImage: UIImage(named: "Ikigai"))
            .environmentObject(AppSettings())
    }
}
