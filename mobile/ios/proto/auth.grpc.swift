//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: auth.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

internal protocol Auth_AuthSignInCall: ClientCallUnary {}

fileprivate final class Auth_AuthSignInCallBase: ClientCallUnaryBase<Auth_SignInRequest, Auth_SignInReply>, Auth_AuthSignInCall {
  override class var method: String { return "/auth.Auth/SignIn" }
}


/// Instantiate Auth_AuthServiceClient, then call methods of this protocol to make API calls.
internal protocol Auth_AuthService: ServiceClient {
  /// Synchronous. Unary.
  func signIn(_ request: Auth_SignInRequest) throws -> Auth_SignInReply
  /// Asynchronous. Unary.
  func signIn(_ request: Auth_SignInRequest, completion: @escaping (Auth_SignInReply?, CallResult) -> Void) throws -> Auth_AuthSignInCall

}

internal final class Auth_AuthServiceClient: ServiceClientBase, Auth_AuthService {
  /// Synchronous. Unary.
  internal func signIn(_ request: Auth_SignInRequest) throws -> Auth_SignInReply {
    return try Auth_AuthSignInCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func signIn(_ request: Auth_SignInRequest, completion: @escaping (Auth_SignInReply?, CallResult) -> Void) throws -> Auth_AuthSignInCall {
    return try Auth_AuthSignInCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol Auth_AuthProvider {
  func signIn(request: Auth_SignInRequest, session: Auth_AuthSignInSession) throws -> Auth_SignInReply
}

internal protocol Auth_AuthSignInSession: ServerSessionUnary {}

fileprivate final class Auth_AuthSignInSessionBase: ServerSessionUnaryBase<Auth_SignInRequest, Auth_SignInReply>, Auth_AuthSignInSession {}


/// Main server for generated service
internal final class Auth_AuthServer: ServiceServer {
  private let provider: Auth_AuthProvider

  internal init(address: String, provider: Auth_AuthProvider) {
    self.provider = provider
    super.init(address: address)
  }

  internal init?(address: String, certificateURL: URL, keyURL: URL, provider: Auth_AuthProvider) {
    self.provider = provider
    super.init(address: address, certificateURL: certificateURL, keyURL: keyURL)
  }

  internal init?(address: String, certificateString: String, keyString: String, provider: Auth_AuthProvider) {
    self.provider = provider
    super.init(address: address, certificateString: certificateString, keyString: keyString)
  }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal override func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    let provider = self.provider
    switch method {
    case "/auth.Auth/SignIn":
      return try Auth_AuthSignInSessionBase(
        handler: handler,
        providerBlock: { try provider.signIn(request: $0, session: $1 as! Auth_AuthSignInSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

