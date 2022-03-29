import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupInitialUI()
        return true
    }

    func setupInitialUI() {
        let contentService = ContentService(networking: URLSessionNetworking())
        let mainVC = MainVC.create(contentService: contentService)
        let navMainVC = UINavigationController(rootViewController: mainVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navMainVC
        window?.makeKeyAndVisible()
    }
}

