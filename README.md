# ModernCoordinator

A lightweight library based on the Coordinator pattern and is a compact version from [XCoordinator](https://github.com/quickbirdstudios/XCoordinator).

Coordinator is creating reduce burden of navigations for UIViewController that allow groups a particular flow to visualize the transition between views.

![alt text](Images/MVVM-C.png?raw=true)


## Usage

Create a Route which defines all navigation paths for a particular flow, and preparation of transition based on route being triggered in your Coordinator. 
In following example, I create the `HomeRoute` enum describes which routes can be triggered.

```swift
enum HomeRoute: Route {    
    case home
    case detail
    case back
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController, initialRoute: .home)
    }
    
    override func performTransition(for route: HomeRoute) {
        switch route {
        case .home:
            let homeVC = HomeViewController()
            homeVC.viewModel = HomeViewModel(router: strongRouter)
            transitionPerformer.push(homeVC)
        case .detail:
            let homeVC = DetailViewController()
            homeVC.viewModel = DetailViewModel(router: strongRouter)
            transitionPerformer.push(homeVC)
        case .back:
            transitionPerformer.pop()
        }
    }
}

```

Routes are only allowed triggers within Coordinators and ViewModels. In following example, It describes how to trigger routes in ViewModel:

```swift
class HomeViewModel {
    let router: StrongRouter<HomeRoute>

    init(router: StrongRouter<HomeRoute>) {
        self.router = router
    }

    func toDetail() {
        router.trigger(.detail)
    }
}
```

## Custom Coordinators

A custom Coordinator can be used `BaseCoordinator` as superclass for custom implementtation.

```swift
open class NavigationCoordinator<RouteType: Route>: BaseCoordinator<RouteType, NavigationTransition> {
    public init(rootViewController: RootViewController = RootViewController(), isNavigationBarHidden: Bool = false, initialRoute: RouteType...) {
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
        rootViewController.isNavigationBarHidden = isNavigationBarHidden
    }
}
```
## Custom Transitions

Create a transition using `Transition` for default implementation which define transitions based on type of `RootViewController`.
For example, the `UINavigationController` can have `push`, `pop`, `setRoot`, `popToRoot` .But `UIViewController` have only `present`, `dismiss` transition. Also you can following `RootTransition` for own custom transition.


```swift
public typealias NavigationTransition = Transition<UINavigationController>
public extension Transition where RootViewController == UINavigationController {
    func push(_ presentable: Presentable, animated: Bool = true, hidesBottomBarWhenPushed: Bool = false) {
        let viewController = presentable.viewController
        guard viewController is UINavigationController == false else {
            return
        }
        viewController.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        rootViewController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true)  {
        rootViewController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true)  {
        rootViewController.popToRootViewController(animated: animated)
    }
    
    func setRoot(_ presentable: Presentable, animated: Bool = true) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        rootViewController.setViewControllers([viewController], animated: animated)
    }
    
    func setRoot(_ presentables: [Presentable], animated: Bool = true) {
        let viewControllers = presentables.map({ $0.viewController })
        guard !viewControllers.contains(rootViewController) else {
            return
        }
        rootViewController.setViewControllers(viewControllers, animated: animated)
    }
}
```

## Installation

### CocoaPods
ModernCoordinator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ModernCoordinator'
```

### Carthage
ModernCoordinator is available through [Carthage](https://github.com/Carthage/Carthage). To install it, add this to your Cartfile: 

```
github "phamdinhduc795397/ModernCoordinator"
```

### Swift Package Manager
Swift Package Manager is supported.

## Acknowledments
- [XCoordinator](https://github.com/quickbirdstudios/XCoordinator)

## Author

Duc Pham, phamdinhduc795397@gmail.com

## License

Coordinator is available under the MIT license. See the LICENSE file for more info.
