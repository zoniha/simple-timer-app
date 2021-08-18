import SwiftUI

struct SettingView: View {
	@State var timerValue = 10

	var body: some View {
		ZStack {
			Image("wallpaper")
				.resizable()
				.edgesIgnoringSafeArea(.all)
				.aspectRatio(contentMode: .fill)
			VStack {
				Spacer()
				Text("\(timerValue)秒")
					.font(.largeTitle)
					.foregroundColor(.white)
				Spacer()
				Picker(selection: $timerValue, label: Text("選択")) {
					Text("10")
						.tag(10)
						.foregroundColor(.white)
					Text("20")
						.tag(20)
						.foregroundColor(.white)
					Text("30")
						.tag(300)
						.foregroundColor(.white)
					Text("40")
						.tag(40)
						.foregroundColor(.white)
					Text("50")
						.tag(50)
						.foregroundColor(.white)
					Text("60")
						.tag(60)
						.foregroundColor(.white)
				}
				Spacer()
			}
		}
	}
}

struct SettingView_Previews: PreviewProvider {
	static var previews: some View {
		SettingView()
	}
}
