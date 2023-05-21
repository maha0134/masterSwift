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
	let languages: [String] = ["Swift/SwiftUI", "JavaScript", "React", "React Native"]
	//	let languages: [String] = ["Swift/SwiftUI"]
	@State var difficulty: Int = 0
	
	var body: some View {
		NavigationStack {
			
			Text("Master Swift")
				.font(.title)
			
			Text("Welcome to Master Swift!")
				.font(.headline)
				.padding()
			
			Text("Select a language:")
			
			ForEach(languages, id: \.self) { language in
				Text(language)
					.padding(10)
					.background(Color.green)
			}
			
			Text("Choose a difficulty level: ")
				.padding(.top, 20)
			
			Picker("Level", selection: $difficulty) {
				Text("Easy").tag(0)
				Text("Medium").tag(1)
				Text("Expert").tag(2)
				Text("Random").tag(3)
			}
			.pickerStyle(.segmented)
			
			if let questions = questions.questionBank {
				NavigationLink("Begin Test") {
					QuestionScreenView(question: questions.questions[currentQuestion], questionNumber: currentQuestion)
						.navigationBarBackButtonHidden(true)
						.toolbar {
							ToolbarItem(placement: .bottomBar) {
								Button("Next") {
									currentQuestion += 1
								}
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
