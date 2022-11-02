

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

private func parent3(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent.parent
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
private class HomeComponentDependency887e91671f4424758155Provider: HomeComponentDependency {


    init() {

    }
}
/// ^->MainComponent->HomeComponent
private func factory9bc7b43729f663f09312e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeComponentDependency887e91671f4424758155Provider()
}
private class ProfileComponentDependency54eff3e2836331fcf5bcProvider: ProfileComponentDependency {
    var getUserProfileUseCase: GetUserProfileUseCase {
        return mainComponent.getUserProfileUseCase
    }
    var saveUserProfileUseCase: SaveUserProfileUseCase {
        return mainComponent.saveUserProfileUseCase
    }
    var logoutUseCase: LogoutUseCase {
        return mainComponent.logoutUseCase
    }
    var getTokenUseCase: GetTokenUseCase {
        return mainComponent.getTokenUseCase
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->HomeComponent->ProfileComponent
private func factorybd650a9e32c86f0fdd27f18a7758ab7ce8b9cf79(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileComponentDependency54eff3e2836331fcf5bcProvider(mainComponent: parent2(component) as! MainComponent)
}
private class MoviesComponentDependencyc4af3944b260ec3bd2b5Provider: MoviesComponentDependency {
    var getAuthStatusUseCase: GetAuthStatusUseCase {
        return mainComponent.getAuthStatusUseCase
    }
    var getTokenUseCase: GetTokenUseCase {
        return mainComponent.getTokenUseCase
    }
    var getFavoritesUseCase: GetFavoritesUseCase {
        return mainComponent.getFavoritesUseCase
    }
    var deleteFavoriteUseCase: DeleteFavoriteUseCase {
        return mainComponent.deleteFavoriteUseCase
    }
    var loadMoviesAtPositionUseCase: LoadMoviesAtPositionUseCase {
        return mainComponent.loadMoviesAtPositionUseCase
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->HomeComponent->MoviesComponent
private func factoryf7325156a5bbfdeeb2f5f18a7758ab7ce8b9cf79(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MoviesComponentDependencyc4af3944b260ec3bd2b5Provider(mainComponent: parent2(component) as! MainComponent)
}
private class MovieDetailsComponentDependency1308afb98216b0e51640Provider: MovieDetailsComponentDependency {
    var loadMovieDetailsUseCase: LoadMovieDetailsUseCase {
        return mainComponent.loadMovieDetailsUseCase
    }
    var getFavoriteStatusUseCase: GetFavoriteStatusUseCase {
        return mainComponent.getFavoriteStatusUseCase
    }
    var toggleFavoriteStatusUseCase: ToggleFavoriteStatusUseCase {
        return mainComponent.toggleFavoriteStatusUseCase
    }
    var getTokenUseCase: GetTokenUseCase {
        return mainComponent.getTokenUseCase
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->HomeComponent->MoviesComponent->MovieDetailsComponent
private func factory50ea0c04081e891860616c336a169e0a154aa5b8(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MovieDetailsComponentDependency1308afb98216b0e51640Provider(mainComponent: parent3(component) as! MainComponent)
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
extension HomeComponent: Registration {
    public func registerItems() {


    }
}
extension ProfileComponent: Registration {
    public func registerItems() {
        keyPathToName[\ProfileComponentDependency.getUserProfileUseCase] = "getUserProfileUseCase-GetUserProfileUseCase"
        keyPathToName[\ProfileComponentDependency.saveUserProfileUseCase] = "saveUserProfileUseCase-SaveUserProfileUseCase"
        keyPathToName[\ProfileComponentDependency.logoutUseCase] = "logoutUseCase-LogoutUseCase"
        keyPathToName[\ProfileComponentDependency.getTokenUseCase] = "getTokenUseCase-GetTokenUseCase"
    }
}
extension MoviesComponent: Registration {
    public func registerItems() {
        keyPathToName[\MoviesComponentDependency.getAuthStatusUseCase] = "getAuthStatusUseCase-GetAuthStatusUseCase"
        keyPathToName[\MoviesComponentDependency.getTokenUseCase] = "getTokenUseCase-GetTokenUseCase"
        keyPathToName[\MoviesComponentDependency.getFavoritesUseCase] = "getFavoritesUseCase-GetFavoritesUseCase"
        keyPathToName[\MoviesComponentDependency.deleteFavoriteUseCase] = "deleteFavoriteUseCase-DeleteFavoriteUseCase"
        keyPathToName[\MoviesComponentDependency.loadMoviesAtPositionUseCase] = "loadMoviesAtPositionUseCase-LoadMoviesAtPositionUseCase"

    }
}
extension MovieDetailsComponent: Registration {
    public func registerItems() {
        keyPathToName[\MovieDetailsComponentDependency.loadMovieDetailsUseCase] = "loadMovieDetailsUseCase-LoadMovieDetailsUseCase"
        keyPathToName[\MovieDetailsComponentDependency.getFavoriteStatusUseCase] = "getFavoriteStatusUseCase-GetFavoriteStatusUseCase"
        keyPathToName[\MovieDetailsComponentDependency.toggleFavoriteStatusUseCase] = "toggleFavoriteStatusUseCase-ToggleFavoriteStatusUseCase"
        keyPathToName[\MovieDetailsComponentDependency.getTokenUseCase] = "getTokenUseCase-GetTokenUseCase"
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
    registerProviderFactory("^->MainComponent->HomeComponent", factory9bc7b43729f663f09312e3b0c44298fc1c149afb)
    registerProviderFactory("^->MainComponent->HomeComponent->ProfileComponent", factorybd650a9e32c86f0fdd27f18a7758ab7ce8b9cf79)
    registerProviderFactory("^->MainComponent->HomeComponent->MoviesComponent", factoryf7325156a5bbfdeeb2f5f18a7758ab7ce8b9cf79)
    registerProviderFactory("^->MainComponent->HomeComponent->MoviesComponent->MovieDetailsComponent", factory50ea0c04081e891860616c336a169e0a154aa5b8)
    registerProviderFactory("^->MainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->MainComponent->LoginComponent", factory7d788d11c001389505f7e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
