//
//  ContentView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct HomeScreenView: View {
	var questions = Questions()
	
    var body: some View {
        VStack {
			if let questions = questions.questionBank {
				ForEach(questions.questions, id: \.self) {question in
					VStack {
						Text(question.question)
							.padding()
						Text(question.choices[question.correctChoice])
							.padding()
					}
				}
			}
			
        }
        .padding()
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
