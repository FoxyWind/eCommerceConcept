import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let mainView = MainViewController()
        let nav = UINavigationController(rootViewController: mainView)
        window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
