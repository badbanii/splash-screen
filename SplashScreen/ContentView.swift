
import SwiftUI

struct ContentView: View {
    @StateObject var navigationStack = NavigationStack(ViewScreen.splash)
    
    var body: some View {
        VStack {
            switch navigationStack.currentScreen {
            case .splash:
                SplashScreen()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            navigationStack.advance(to: .main)
                        }
                    })
            case .main:
                MainScreen()
            }
        }
        .environmentObject(navigationStack)
    }
}

struct SplashScreen: View {
    var body: some View {
        Text("Splash Screen")
            .foregroundColor(Color.indigo)
            .font(.system(size: 36))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainScreen: View {
    var body: some View {
        Text("Main Screen")
            .foregroundColor(Color.yellow)
            .font(.system(size: 36))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.indigo)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
