
//
//  ContentView.swift
//  TripIT
//
//  Created by lionel jones on 8/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = "lionel5116"
    @State private var password = "5116"
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                     
                    /* I will research this later on re-usable butons
                     with functions
                    CommonReusableButton(btnTitle: "Login", 
                                         frameWidth:300,
                                         frameHeight:50,
                                         foregroundColor:.white,
                                         backgroundColor:.blue,
                                         conrnerRadius:10
                                         ) 
                     */
                    NavigationLink(destination: Menu(),isActive: $showingLoginScreen) {
                        EmptyView();
                    }
                    
                }//VStack
            }  //ZStack
            .navigationBarHidden(true)
        } //NavigationView
    }//View (body)
    
    func authenticateUser(username: String, password: String) {
        //your own database and logic will go here
        if username.lowercased() == "lionel5116" {
            wrongUsername = 0
            if password.lowercased() == "5116" {
                wrongPassword = 0
                showingLoginScreen = true
                print("You got it.. Rick James Approves")
            }
            else {
                wrongPassword = 2
            }
        } else {
            wrongPassword = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
