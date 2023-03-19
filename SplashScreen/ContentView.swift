
import SwiftUI

struct ContentView: View {
    @StateObject var navigationStack = NavigationStack(ViewScreen.splash)
    
    var body: some View {
     
        VStack {
            switch navigationStack.currentScreen {
            case .splash:
                SplashScreen()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
        VStack{
            Text("Splash Screen")
                .foregroundColor(Color.indigo)
                .font(.system(size: 36))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
    
            Text("Made by tuly")
                .foregroundColor(Color.indigo)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity)
                .padding(20)
        }
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
