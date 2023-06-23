//
//  ContentView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct HomeScreenView: View {
	var questions = Questions().questionBank
	@State var currentQuestion: Int = 0
	let languages: [String] = ["Swift/SwiftUI"]
	@State var difficulty: Int = 0
	@State var cancellationRequested = false

	var body: some View {
		NavigationStack {
			
			Text("Swift Master")
				.font(.title)

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
			
			if let questions {
				NavigationLink("Begin Quiz") {
					QuestionScreenView(question: questions.questions[currentQuestion], questionNumber: currentQuestion, cancellationRequested: $cancellationRequested)
						.navigationBarBackButtonHidden(true)
						.toolbar {
							ToolbarItem(placement: .bottomBar) {
								HStack {
									Button("Next") {
										currentQuestion += 1
									}
									.padding(7)
									.background(Color.pink)
									.foregroundColor(.black)
									.cornerRadius(5)
									.shadow(radius: 2)
									
									Button("Cancel Quiz") {
										cancellationRequested = true
										currentQuestion = 0
									}
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
