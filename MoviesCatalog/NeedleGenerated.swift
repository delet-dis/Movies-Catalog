

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AuthorizationComponentDependency01c300e9208281b9a593Provider: AuthorizationComponentDependency {
    var loginUseCase: LoginUseCase {
        return mainComponent.loginUseCase
    }
    var saveAuthStatusUseCase: SaveAuthStatusUseCase {
        return mainComponent.saveAuthStatusUseCase
    }
    var saveTokenUseCase: SaveTokenUseCase {
        return mainComponent.saveTokenUseCase
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->AuthorizationComponent
private func factory36d2db3a6303047193540ae93e637f014511a119(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthorizationComponentDependency01c300e9208281b9a593Provider(mainComponent: parent1(component) as! MainComponent)
}
private class LoginComponentDependency09f1bea0f04d764af082Provider: LoginComponentDependency {
    var authorizationComponent: AuthorizationComponent {
        return mainComponent.authorizationComponent
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->LoginComponent
private func factory7d788d11c001389505f70ae93e637f014511a119(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoginComponentDependency09f1bea0f04d764af082Provider(mainComponent: parent1(component) as! MainComponent)
}

#else
extension AuthorizationComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthorizationComponentDependency.loginUseCase] = "loginUseCase-LoginUseCase"
        keyPathToName[\AuthorizationComponentDependency.saveAuthStatusUseCase] = "saveAuthStatusUseCase-SaveAuthStatusUseCase"
        keyPathToName[\AuthorizationComponentDependency.saveTokenUseCase] = "saveTokenUseCase-SaveTokenUseCase"
    }
}
extension MainComponent: Registration {
    public func registerItems() {


    }
}
extension LoginComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoginComponentDependency.authorizationComponent] = "authorizationComponent-AuthorizationComponent"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

private func register1() {
    registerProviderFactory("^->MainComponent->AuthorizationComponent", factory36d2db3a6303047193540ae93e637f014511a119)
    registerProviderFactory("^->MainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->MainComponent->LoginComponent", factory7d788d11c001389505f70ae93e637f014511a119)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
