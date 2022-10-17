

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AuthorizationComponentDependencydf77d81b4f68502c365aProvider: AuthorizationComponentDependency {
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
/// ^->MainComponent->LoginComponent->AuthorizationComponent
private func factorya6199ac68a26a06ced8ff18a7758ab7ce8b9cf79(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthorizationComponentDependencydf77d81b4f68502c365aProvider(mainComponent: parent2(component) as! MainComponent)
}
private class RegistrationComponentDependency2c8ea1f383264282a7c7Provider: RegistrationComponentDependency {
    var registerUseCase: RegisterUseCase {
        return mainComponent.registerUseCase
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
/// ^->MainComponent->LoginComponent->RegistrationComponent
private func factory43ef21cc81db779b06e1f18a7758ab7ce8b9cf79(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RegistrationComponentDependency2c8ea1f383264282a7c7Provider(mainComponent: parent2(component) as! MainComponent)
}
private class LoginComponentDependency09f1bea0f04d764af082Provider: LoginComponentDependency {


    init() {

    }
}
/// ^->MainComponent->LoginComponent
private func factory7d788d11c001389505f7e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoginComponentDependency09f1bea0f04d764af082Provider()
}

#else
extension AuthorizationComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthorizationComponentDependency.loginUseCase] = "loginUseCase-LoginUseCase"
        keyPathToName[\AuthorizationComponentDependency.saveAuthStatusUseCase] = "saveAuthStatusUseCase-SaveAuthStatusUseCase"
        keyPathToName[\AuthorizationComponentDependency.saveTokenUseCase] = "saveTokenUseCase-SaveTokenUseCase"
    }
}
extension RegistrationComponent: Registration {
    public func registerItems() {
        keyPathToName[\RegistrationComponentDependency.registerUseCase] = "registerUseCase-RegisterUseCase"
        keyPathToName[\RegistrationComponentDependency.saveAuthStatusUseCase] = "saveAuthStatusUseCase-SaveAuthStatusUseCase"
        keyPathToName[\RegistrationComponentDependency.saveTokenUseCase] = "saveTokenUseCase-SaveTokenUseCase"
    }
}
extension MainComponent: Registration {
    public func registerItems() {


    }
}
extension LoginComponent: Registration {
    public func registerItems() {


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
    registerProviderFactory("^->MainComponent->LoginComponent->AuthorizationComponent", factorya6199ac68a26a06ced8ff18a7758ab7ce8b9cf79)
    registerProviderFactory("^->MainComponent->LoginComponent->RegistrationComponent", factory43ef21cc81db779b06e1f18a7758ab7ce8b9cf79)
    registerProviderFactory("^->MainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->MainComponent->LoginComponent", factory7d788d11c001389505f7e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
