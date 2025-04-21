//
//  DIContainer.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 18/04/2025.
//

// MARK: - Service Protocols
protocol UserServiceProtocol {
    func getCurrentUser() -> String
}

protocol LoggingServiceProtocol {
    func log(_ message: String)
}

protocol NetworkServiceProtocol {
    func fetch() async
}

// MARK: - Service Implementation
struct UserService: UserServiceProtocol {
    func getCurrentUser() -> String {
        "JaneDoe"
    }
}

struct LoggingService: LoggingServiceProtocol  {
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

struct NetworkService: NetworkServiceProtocol {
    func fetch() async {
        Task {
            print("Did fetch")
        }
    }
}

// MARK: - HasProperty Protocols
protocol HasUserService {
    var userService: UserServiceProtocol { get }
}

protocol HasLoggingService {
    var loggingService: LoggingServiceProtocol { get }
}

protocol HasNetworkService {
    var networkService: NetworkServiceProtocol { get }
}


// MARK: - DI Container
typealias ApplicationDIContainer = HasUserService & HasLoggingService & HasNetworkService

struct DefaultDIContainer: ApplicationDIContainer {
    let userService: UserServiceProtocol = UserService()
    let loggingService: LoggingServiceProtocol = LoggingService()
    let networkService: NetworkServiceProtocol = NetworkService()
}



// MARK: - Usage
final class UserPresenter {
    typealias UserPresenterDependencies = HasUserService & HasLoggingService & HasNetworkService
    
    private let dependencies: UserPresenterDependencies
    
    init(dependencies: UserPresenterDependencies) {
        self.dependencies = dependencies
    }
    
    func processUser() async {
        let user = dependencies.userService.getCurrentUser() //🎊
        dependencies.loggingService.log("User : \(user)") //🎊
        await dependencies.networkService.fetch() //🎊
    }
}
