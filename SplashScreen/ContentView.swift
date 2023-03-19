
import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreen()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    })
            } else {
                MainScreen()
            }
        }
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
