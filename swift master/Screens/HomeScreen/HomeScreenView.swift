//
//  ContentView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct HomeScreenView: View {
	@StateObject var vm = HomeScreenViewModel()
	
	var body: some View {
		NavigationStack {
			
			Text("Swift Master")
				.font(.title)

			Text("Welcome to Swift Master, your one stop destinaton for iOS preparation and landing your next iOS role!")
				.padding()
			
			Text("Choose a difficulty level: ")
			//TODO: Select based on difficulty and randomize
			Picker("Level", selection: $vm.difficulty) {
				Text("Easy").tag(0)
				Text("Medium").tag(1)
				Text("Expert").tag(2)
				Text("Random").tag(3)
			}
			.padding()
			.pickerStyle(.segmented)
			
			if let questions = vm.questionBank?.questions {
				NavigationLink("Begin Quiz") {
					QuestionScreenView(question: questions[vm.currentQuestion], questionNumber: vm.currentQuestion, cancellationRequested: $vm.cancellationRequested)
						.navigationBarBackButtonHidden(true)
						.toolbar {
							ToolbarItem(placement: .bottomBar) {
								HStack {
									Button("Cancel Quiz") {
										vm.cancellationRequested = true
										vm.currentQuestion = 0
									}
									
									Spacer()
									
									Button("Next") {
										//TODO: Handle last question/total questions
										vm.currentQuestion += 1
									}
									.padding(7)
									.background(Color.pink)
									.foregroundColor(.black)
									.cornerRadius(5)
									.shadow(radius: 2)
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
		}
		.padding()
	}
}

struct HomeScreenView_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreenView()
	}
}
