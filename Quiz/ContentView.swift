//
//  ContentView.swift
//  Quiz
//
//  Created by YJ Soon on 12/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    @State private var isSheetPresented = false
    @State private var currentQuestion = 0
    @State private var correctAnswers = 0
    
    var questions = [
        Question(title: "What day of the week is it?", option1: "Monday", option2: "Saturday", option3: "Sunday", option4: "Wednesday"),
        Question(title: "What does YJ eat?", option1: "Broccoli", option2: "Nutella", option3: "Rice", option4: "MacBooks"),
        Question(title: "Did Jia Chen sleep last night?", option1: "Yes", option2: "No", option3: "Yes but I needed another answer", option4: "Yes?"),
        Question(title: "What is our Q&A platform?", option1: "text-questions", option2: "ed", option3: "Yes but I needed another answer", option4: "scream into the void")
    ]
    
    var body: some View {
        VStack{
            Text(questions[currentQuestion].title)
                .font(.title)
                .padding()
                .frame(width: 360, height: 150, alignment: .center)
                .background(Color.gray)
                .opacity(0.7)
                .cornerRadius(5)
            Spacer()
                .frame(height:400)
            
            HStack {
                VStack{
                    Button(questions[currentQuestion].option1) { didTapOption(1) }
                        .padding()
                        .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(10)
                    Button(questions[currentQuestion].option2) { didTapOption(2) }
                        .padding()
                        .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .cornerRadius(10)

                }
                VStack {
                    Button(questions[currentQuestion].option3) { didTapOption(3) }
                        .padding()
                        .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue)
                        .cornerRadius(10)

                    Button(questions[currentQuestion].option4) { didTapOption(4) }
                        .padding()
                        .padding()
                        .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.green)
                        .cornerRadius(10)

                }
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text(isCorrect ? "Well done!" : "Boooo wrong"),
                  message: Text(isCorrect ? "Congratulations 🎉" : "Try harder please 😔"),
                  dismissButton: .default(Text("OK")){
                    currentQuestion += 1
                    if currentQuestion == questions.count {
                        // We finished! Show the score sheet
                        currentQuestion = 0
                        isSheetPresented = true
                    }
            })
        }
        .sheet(isPresented: $isSheetPresented) {
            ScoreView(score: correctAnswers, totalScore: questions.count)
        }
    }
    
    func didTapOption(_ optionNumber: Int) {
        if optionNumber == 2 {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
