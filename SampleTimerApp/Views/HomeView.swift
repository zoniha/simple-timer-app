import SwiftUI

struct HomeView: View {
	var body: some View {
		NavigationView {
			ZStack {
				Image("wallpaper")
					.resizable()
					.edgesIgnoringSafeArea(.all)
					.aspectRatio(contentMode: .fill)
				VStack(spacing: 30.0) {
					Text("残り〇〇秒")
						.font(.largeTitle)
						.foregroundColor(.white)
					HStack {
						Button(action: {}, label: {
							Text("スタート")
								.font(.title)
								.foregroundColor(.white)
								.frame(width: 140, height: 140)
								.background(Color("startColor"))
								.clipShape(Circle())
						})
						Button(action: {}, label: {
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
			.navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
				Text("秒数設定")
					.foregroundColor(.white)
			}
			)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
