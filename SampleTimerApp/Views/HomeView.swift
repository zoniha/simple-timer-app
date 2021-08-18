import SwiftUI

struct HomeView: View {
    var body: some View {
		NavigationView {
			ZStack {
				Image("wallpaper")
					.resizable()
					.edgesIgnoringSafeArea(.all)
					.aspectRatio(contentMode: .fill)
			}
			.navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
				Text("秒数設定")
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
