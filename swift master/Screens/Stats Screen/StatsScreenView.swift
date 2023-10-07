//
//  StatsView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import SwiftUI
import Charts

struct StatsScreenView: View {
	@State private var scores = [ScoreData]()
	var body: some View {
		VStack {
			Text("Stats")
				.font(.title)
				.fontWeight(.bold)
			Spacer()
			if !scores.isEmpty {
				Text("Check out your past scores")
				Chart(scores, id: \.id) { score in
					BarMark (
						x: .value("Attempt", score.id),
						y: .value("Score", score.score)
					)
					.foregroundStyle(by: .value("Difficulty", score.difficultyLabel))
				}
				.chartXAxis(.hidden)
				.chartForegroundStyleScale([
					"Easy": Color.green,
					"Medium": Color.blue,
					"Hard": Color.pink
				])
				.chartYScale(domain: [0, 10])
				.frame(width: 350, height: 250)
				.chartYAxis {
					AxisMarks(values: .automatic(desiredCount: 5))
				}
				
				Spacer()
			} else {
				VStack {
					Text("Oops!")
						.font(.title2)
						.padding(.bottom, 15)
					
					Text("Looks like there are no stats to show.")
					Text("Please attempt a few quizzes to see stats.")
				}
				Spacer()
			}
		}
		.navigationTitle("Stats")
		.onAppear {
			let storedScores = UserDefaultsViewModel().fetchStorageValues()
			scores = storedScores.map { score in
				var updatedScore = score
				switch score.difficulty {
					case 0:
						updatedScore.difficultyLabel = "Easy"
					case 1:
						updatedScore.difficultyLabel = "Medium"
					case 2:
						updatedScore.difficultyLabel = "Hard"
					default:
						break
				}
				return updatedScore
			}
		}
	}
}

struct StatsScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StatsScreenView()
	}
}
