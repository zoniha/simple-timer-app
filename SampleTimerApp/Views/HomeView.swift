import SwiftUI

struct HomeView: View {
	@State var timerHandler: Timer?
	@State var count = 0
	@AppStorage("timer_value") var timerValue = 10
	@State var showAlert = false

	var body: some View {
		NavigationView {
			ZStack {
				Image("wallpaper")
					.resizable()
					.edgesIgnoringSafeArea(.all)
					.aspectRatio(contentMode: .fill)
				VStack(spacing: 30.0) {
					Text("\(timerValue - count)秒")
						.font(.largeTitle)
						.foregroundColor(.white)
					HStack {
						Button(action: {
							startTimer()
						}, label: {
							Text("スタート")
								.font(.title)
								.foregroundColor(.white)
								.frame(width: 140, height: 140)
								.background(Color("startColor"))
								.clipShape(Circle())
						})
						Button(action: {
							if let unwrapedTimerHanfler = timerHandler {
								if unwrapedTimerHanfler.isValid {
									unwrapedTimerHanfler.invalidate()
								}
							}
						}, label: {
							Text("ストップ")
								.font(.title)
								.foregroundColor(.white)
								.frame(width: 140, height: 140)
								.background(Color("stopColor"))
								.clipShape(Circle())
						})
					}
				}
			}
			.onAppear {
				count = 0
			}
			.navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
				Text("秒数設定")
					.foregroundColor(.white)
			})
			.alert(isPresented: $showAlert) {
				Alert(title: Text("終了"),
					  message: Text("タイマー終了時間です"),
					  dismissButton: .default(Text("OK"))
				)
			}
		}
	}

	func countDownTimer() {
		count += 1

		// swiftlint:disable empty_count
		if timerValue - count <= 0 {
			timerHandler?.invalidate()
			showAlert = true
		}
	}

	func startTimer() {
		if let unwrapedTimerHandler = timerHandler {
			if unwrapedTimerHandler.isValid {
				return
			}
		}

		if timerValue - count <= 0 {
			count = 0
		}

		timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			countDownTimer()
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
