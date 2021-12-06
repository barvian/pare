import SwiftUI

func makeStoreURL(appID: String, action: String) -> URL {
    #if os(macOS)
    let scheme = "macappstore:"
    #elseif targetEnvironment(simulator)
    let scheme = "https:"
    #else
    let scheme = "itms-apps:"
    #endif

    return URL(string: "\(scheme)//apps.apple.com/app/id\(appID)?action=\(action)")!
}

struct EnabledView: View {
    let reviewURL = makeStoreURL(appID:"1598824876", action: "write-review")
    let reportWebsiteURL = URL(string: "https://forms.gle/mFhJGceqixSEtzmPA")!
    
    #if os(macOS)
    let verticalSpacing: CGFloat = 25
    #else
    let verticalSpacing: CGFloat = 40
    #endif
    
    var body: some View {
        VStack (alignment: .leading, spacing: verticalSpacing) {
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Pare is enabled")
                    .font(.system(.largeTitle, design: .rounded))
                    .accessibilityIdentifier("extension enabled")
                Text("Enjoy your degamified dating apps 👋")
            }

            VStack (alignment: .leading, spacing: 10) {
                Text("Still seeing likes? ")

                Link(destination: reportWebsiteURL, label: {
                    Text("Report an issue")
                        .underline()
                        .bold()
                        .foregroundColor(.primary)
                })
            }

            VStack (alignment: .leading, spacing: 10) {
                Text("Enjoying Pare?")

                Link(destination: reviewURL, label: {
                    Text("Review on App Store")
                        .underline()
                        .bold()
                        .foregroundColor(.primary)
                })
            }
        }
    }
}

struct EnabledView_Previews: PreviewProvider {
    static var previews: some View {
        EnabledView()
    }
}
