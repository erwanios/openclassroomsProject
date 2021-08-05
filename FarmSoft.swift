//
//  FarmSoft.swift
//  
//
//  Created by Erwan Pastol on 09/07/2021.
//

import Foundation


//           **************************FarmSoft**************************
var money = 0.0

var barn = ["milk": 0, "wheat": 0, "wool": 0]



func sell() {
    money += Double(barn["milk"]!) * 0.50
    money += Double(barn["wheat"]!) * 0.30
    money += Double(barn["wool"]!) * 1
    // On vide la grange :
    barn = ["milk": 0, "wheat": 0, "wool": 0]
}

func feedAnimals() {
    money -= 4
}

func harvest(retrieving quantity:Int) {
    barn["wheat"]! += quantity
}

func mowSheep(retrieving quantity: Int) {
    barn["wool"]! += quantity
}

func milkCows(retrieving quantity: Int) {
    barn["milk"]! += quantity
}

func readQuantity(of type: String) -> Int? {
    // On demande la quantité désirée
    print("Combien de \(type) avez vous récuperé ?")
    
    // On convertie et renvoi la réponse
    if let line = readLine() {
        if let quantity = Int(line){
            return quantity
        }
    }
    // Si la valeur n'a pas été interprétée
    print("Je n'ai pas compris.")
    return nil
}


func addNewActivity() {
      print("Qu-avez vous fait aujourd'hui ?"
            + "\n1. J'ai nourri mes animaux"
            + "\n2. J'ai vendu mes produits"
            + "\n3. J'ai trait mes vaches"
            + "\n4. J'ai moissoné"
            + "\n5. J'ai tondu mes moutons")
    if let choice = readLine() {
        switch choice {
        case "1" :
            feedAnimals()
        case "2" :
            sell()
        case "3" :
            if let quantity = readQuantity(of: "🍼") {
                milkCows(retrieving: quantity)
            }
        case "4" :
            if let quantity = readQuantity(of: "🌾") {
                harvest(retrieving: quantity)
            }
        case "5" :
            if let quantity = readQuantity(of: "☁️") {
            mowSheep(retrieving: quantity)
            }
        default:
            print("Je ne comprends pas")
        }
        print("🎉 Super 🎉")
    }
}


func presentMenu() {
    print("Que voulez-vous faire?"
  + "\n1. 🏄🏼‍♂️ Enregistrer une nouvelle activité"
  + "\n2. 🏦 Consulter ma banque"
  + "\n3. 🏡 Consulter ma grange")

    if let choice = readLine() {
        switch choice {
        case "1" :
            addNewActivity()
        case "2":
        print("Votre banque contient \(money) euros !")
        case "3":
        print("Votre grange contient :"
             + "\n 🍼 \(barn["milk"]!) bidon de lait"
             + "\n 🌾 \(barn["wheat"]!) bottes de blé"
             + "\n ☁️ \(barn["wool"]!) pelottes de laine")
        default:
        print("Je ne comprends pas 🥴 .")
    }
}
}
    while true {
        presentMenu()
    }
