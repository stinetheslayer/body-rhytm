//
//  WelcomePage.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 16/12/23.
//

import SwiftUI
import UIKit


struct WelcomeScreen: View {
    
    
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var selectedImage: UIImage? // New state to store the selected image
    @State private var showImagePicker: Bool = false
    @State private var isProfileViewActive: Bool = false // Added state to control navigation
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
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
            VStack(spacing: 5) {
                Text("Welcome to BodyRhythm")
                    .font(.system(size: 48))
                    .foregroundColor(Color("LabelColor"))
                    .frame(width: 320, height: 170)
                
                Button(action: {
                                // Handle button action (e.g., open image picker)
                    self.showImagePicker.toggle()
                            }) {
                                HStack {
                                    Text("Import Image")
                                    Spacer()
                                    Image(systemName: "square.and.arrow.down.fill")
                                        .accessibilityLabel("Add image button")
                                }
                                .padding()
                            }
                            .background(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("Color5").opacity(0.3),
                                    Color("Color6").opacity(0.3)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .foregroundColor(Color("LabelColor"))
                            .cornerRadius(10)
                            .frame(width: 361, height: 44)
                            .sheet(isPresented: $showImagePicker) {
                                ImagePicker(selectedImage: self.$selectedImage)
                                        }
                
                // Additional rectangles with labels and text fields
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color("Color5").opacity(0.3),
                            Color("Color6").opacity(0.3)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .cornerRadius(10)
                    .frame(width: 361, height: 44)
                    .overlay(
                        HStack {
                            Text("Name")
                                .foregroundColor(Color("LabelColor"))
                            TextField("e.g John", text: $name)
                                .accessibilityLabel("Enter Your name here")
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(Color("LabelColor"))
                        }
                        
                            .padding()
                    )
                    .padding()
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color("Color5").opacity(0.3),
                            Color("Color6").opacity(0.3)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .cornerRadius(10)
                    .frame(width: 361, height: 44)
                    .overlay(
                        HStack {
                            Text("Age")
                                .foregroundColor(Color("LabelColor"))
                            TextField("e.g 18", text: $age)
                                .accessibilityLabel("Enter Your age here")
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(Color("LabelColor"))
                        }
                            .padding()
                    )
                    .padding()
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color("Color5").opacity(0.3),
                            Color("Color6").opacity(0.3)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .cornerRadius(10)
                    .frame(width: 361, height: 44)
                    .overlay(
                        HStack {
                            Text("Weight")
                                .foregroundColor(Color("LabelColor"))
                            TextField("e.g 60kg", text: $weight)
                                .accessibilityLabel("Enter Your weight here")
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(Color("LabelColor"))
                        }
                            .padding()
                    )
                    .padding()
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color("Color5").opacity(0.3),
                            Color("Color6").opacity(0.3)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .cornerRadius(10)
                    .frame(width: 361, height: 44)
                    .overlay(
                        HStack {
                            Text("Height")
                                .foregroundColor(Color("LabelColor"))
                            TextField("e.g 175 cm", text: $height)
                                .accessibilityLabel("Enter Your height here")
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(Color("LabelColor"))
                        }
                            .padding()
                    )
                    .padding()
                
                Text("Before we begin, kindly share essential details about your body measurements. This information will be utilized to customize and optimize your personalized data experience.")
                    .multilineTextAlignment(.center)
                    .frame(width: 361, height: 80)
                    .foregroundColor(Color("LabelColor"))
                    .padding()
                
                
                HStack {
                                       Button("Skip") {
                                           // Handle skip action
                                           navigateToProfileView()
                                       }
                                       .foregroundColor(Color("LabelColor"))

                                       Spacer()

                    NavigationLink(
                        destination: MainTabbedView().navigationBarHidden(true),
                        isActive: $isProfileViewActive
                    ) {
                        Button("Done") {
                            // Validate and navigate to ProfileView
                            if isInputValid() {
                                navigateToProfileView()
                            } else {
                                // Show an alert or handle validation error
                                showAlert = true
                            }
                        }
                        .foregroundColor(Color("LabelColor"))
                    }
                    .navigationBarHidden(true) // Hide the navigation bar if needed

                                   }
                                   .padding()
                                   .alert(isPresented: $showAlert) {
                                                          Alert(
                                                              title: Text("Step to Proceed"),
                                                              message: Text("Please fill in all fields"),
                                                              dismissButton: .default(Text("OK"))
                                                          )
                                                      }

                                   Spacer()
                               }
                               .padding()
                           )
            
                       }
                   }

                   private func isInputValid() -> Bool {
                       // Perform validation logic here
                       return !name.isEmpty && !age.isEmpty && !weight.isEmpty && !height.isEmpty
                   }

                   private func navigateToProfileView() {
                       // Navigate to ProfileView and pass the information
                       isProfileViewActive = true
                   }
               }


struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .environmentObject(AppSettings())
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // No update needed
    }
}
