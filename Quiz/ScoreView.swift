//
//  ScoreView.swift
//  Quiz
//
//  Created by YJ Soon on 12/6/21.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalScore: Int
    
    var body: some View {
        ZStack {
            Color.red
                .opacity(/*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Your score was:")
                Text("\(score)/\(totalScore)")
                    .fontWeight(.bold)
                    .padding(.all)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 15, totalScore: 20)
    }
}
