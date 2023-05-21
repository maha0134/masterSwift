//
//  QuestionScreenView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct QuestionScreenView: View {
	var question: Question
	var questionNumber: Int
    var body: some View {
		VStack {
			HStack {
				Text("Q-\(questionNumber)")
				Spacer()
				Text("Time: 00:00")
			}
			
			Text(question.question)
				.padding(.top, 10)
			
			OptionView(options: question.choices, correctOption: question.correctChoice)
			
		}
		.padding()
    }
}

struct QuestionScreenView_Previews: PreviewProvider {
    static var previews: some View {
		QuestionScreenView(question: (Questions().questionBank?.questions[0])!, questionNumber: 1)
    }
}
