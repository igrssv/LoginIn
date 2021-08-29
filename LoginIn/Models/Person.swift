//
//  Person.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 27.08.2021.
//

struct Person {
    let loginAndPassword: User
    let name: String
    let surname: String
    let photo: String
    let hobbies: [Hobbies]
    let age: String
    let citi: String
    let message: String

    static func getPerson() -> Person {
        Person(loginAndPassword: User(login: "User", password: "Password"),
               name: "Igor",
               surname: "Sysoev",
               photo: "myPhoto",
               hobbies: [Hobbies(hobbi: "Bicycle rides"),
                         Hobbies(hobbi: "Bar Hopping"),
                         Hobbies(hobbi: "Rock concert"),
                         Hobbies(hobbi: "Playing guitar"),
                         Hobbies(hobbi: "Cars")],
               age: "Age: 27 ",
               citi: "Citi: Moscow",
               message: "📨: igrssv")            
    }
}

struct User {
    let login: String
    let password: String
}


struct Hobbies {
    let hobbi: String
}



