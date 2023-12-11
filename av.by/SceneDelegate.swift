import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // MARK: - WINDOW:

        let window = UIWindow(windowScene: windowScene)

        // MARK: - TAB BAR ITEMS:

        let main = MainHomeVC()
        main.title = "Поиск"
        main.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        let favorites = Favorites()
        favorites.title = "Избранное"
        favorites.tabBarItem.image = UIImage(systemName: "bookmark.circle.fill")

        let ads = Ads()
        ads.title = "Объявления"
        ads.tabBarItem.image = UIImage(systemName: "plus.rectangle.portrait.fill")

        let dialogues = Dialogues()
        dialogues.title = "Диалоги"
        dialogues.tabBarItem.image = UIImage(systemName: "ellipsis.message")

        let others = Others()
        others.title = "Прочее"
        others.tabBarItem.image = UIImage(systemName: "list.bullet")

        // MARK: - NAVIGATION BAR ITEMS:

        let mainNavigationController = UINavigationController(rootViewController: main)
        let favoritesNavigationController = UINavigationController(rootViewController: favorites)
        let adsNewJumpNavigationController = UINavigationController(rootViewController: ads)
        let dialoguesNavigationController = UINavigationController(rootViewController: dialogues)
        let othersNavigationController = UINavigationController(rootViewController: others)

        // MARK: - ROOT:

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([mainNavigationController, favoritesNavigationController, adsNewJumpNavigationController, dialoguesNavigationController, othersNavigationController], animated: true)

        // MARK: - TAB BAR UI CONFIGURATE:

        tabBarController.tabBar.tintColor = .systemCyan
        tabBarController.tabBar.backgroundColor = .backgroundTabBar

        // MARK: - HELPERS:

        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
