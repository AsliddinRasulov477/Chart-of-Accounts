import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.string(forKey: "AppleLanguage") == nil {
            UserDefaults.standard.setValue("ru", forKey: "AppleLanguage")
        }
        
        LocalizationSystem.shared.locale = Locale(identifier: UserDefaults.standard.string(forKey: "AppleLanguage") ?? Locale.current.identifier)
        
        return true
    }
    
    
}

