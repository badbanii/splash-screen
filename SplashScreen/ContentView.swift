
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
        Text("Splash Screen").foregroundColor(Color.pink)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainScreen: View {
    var body: some View {
        Text("Main Screen").foregroundColor(Color.pink)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
