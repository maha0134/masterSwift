//
//  ContentView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct HomeScreenView: View {
	var questions = Questions()
	@State var currentQuestion: Int = 0
	let languages: [String] = ["Swift/SwiftUI"]
	@State var difficulty: Int = 0
	
	var body: some View {
		NavigationStack {
			
			Text("Swift Master")
				.font(.title)
			Text("")
			Text("Welcome to Swift Master, your one stop destinaton for iOS preparation and landing your next iOS role!")
				.padding()
			
			Text("Choose a difficulty level: ")
			
			Picker("Level", selection: $difficulty) {
				Text("Easy").tag(0)
				Text("Medium").tag(1)
				Text("Expert").tag(2)
				Text("Random").tag(3)
			}
			.pickerStyle(.segmented)
			
			if let questions = questions.questionBank {
				NavigationLink("Begin Quiz") {
					QuestionScreenView(question: questions.questions[currentQuestion], questionNumber: currentQuestion)
						.navigationBarBackButtonHidden(true)
						.toolbar {
							ToolbarItem(placement: .bottomBar) {
								
								Button("Next") {
									currentQuestion += 1
								}
								.padding(7)
								.background(Color.pink)
								.foregroundColor(.black)
								.cornerRadius(5)
								.shadow(radius: 2)
								
							}
						}
				}
				.padding(10)
				.background(Color.pink)
				.foregroundColor(.black)
				.cornerRadius(5)
				.shadow(radius: 2)
				.padding(.top, 30)
			}
			
			Spacer()
		}
		.padding()
	}
}

struct HomeScreenView_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreenView(difficulty: 0)
	}
}
