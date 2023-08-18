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
		ZStack {
			NavigationStack {
				Text("Swift Master")
					.font(.title)
				
				Text("Welcome to Swift Master, your one stop destinaton for tuning your swift skills!")
					.padding()
				
				Text("Choose a difficulty level: ")
					.padding(.top, 25)
				
				Picker("Level", selection: $vm.difficulty) {
					Text("Easy").tag(0)
					Text("Medium").tag(1)
					Text("Expert").tag(2)
					Text("Random").tag(3)
				}
				.padding()
				.pickerStyle(.segmented)
				
				Button {
					if !vm.allQuestions.isEmpty {
						vm.generateQuiz()
					}
					
				} label: {
					BeginQuizButton()
				}
				.navigationDestination(isPresented: $vm.showQuiz) {
					QuestionScreenView(questions: vm.questions, questionNumber: vm.currentQuestionNumber, selectedOption: $vm.selectedOption, cancellationRequested: $vm.cancellationRequested)
						.navigationBarBackButtonHidden(true)
						.toolbar {
							ToolbarItem(placement: .bottomBar) {
								HStack {
									Button("Cancel Quiz") {
										vm.cancellationRequested = true
										vm.clearStates()
									}
									
									Spacer()
									
									Button {
										vm.isAlertActive = true
										vm.checkCorrectAnswer()
									} label: {
										if vm.currentQuestionNumber == vm.questions.count - 1 {
											Text("Finish")
										} else {
											Text("Next")
										}
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
			}
			if vm.showLoader {
				ProgressIndicatorView()
			}
		}
		.edgesIgnoringSafeArea(.all)
		.onAppear {
			Task {
				vm.showLoader = true
				await vm.readFromFirebase()
				vm.showLoader = false
			}
		}
		
		.alert(Text(vm.correctAnswerSelected ? "Bravo!" : "Oops!"), isPresented: $vm.isAlertActive, actions: {
			Button(role: .none) {
				if vm.currentQuestionNumber == vm.questions.count - 1 {
					vm.showQuiz = false
					vm.resultsPresented = true
				} else {
					vm.currentQuestionNumber += 1
				}
				vm.correctAnswerSelected = false
				vm.currentCorrectAnswer = ""
			} label: {
				Text("OK")
			}
		}, message: {
			if vm.correctAnswerSelected {
				Text("Your choice is correct")
			} else {
				Text("The right answer was: \(vm.currentCorrectAnswer)")
			}
		})
		
		.fullScreenCover(isPresented: $vm.resultsPresented) {
			ResultsScreenView(vm: vm)
		}
	}
}

struct HomeScreenView_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreenView()
	}
}
