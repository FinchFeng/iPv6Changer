////
////  networkchanger.swift
////  iPv6Changer
////
////  Created by 冯奕琦 on 2018/10/29.
////  Copyright © 2018年 冯奕琦. All rights reserved.
////
//
//import Foundation
//import NetworkExtension
//
//public class VPNConnect {
//    private static let vpnDescription = "DNS OnDemand to GoogleDNS"
//    private static let vpnServerDescription = "OnDemand DNS to GoogleDNS"
//    
//    public var manager:NETunnelProviderManager = NETunnelProviderManager()
//    public var dnsEndpoint1:String = "8.8.8.8"
//    
//    public var connected:Bool {
//        get {
//            return self.manager.isOnDemandEnabled
//        }
//        set {
//            if newValue != self.connected {
//                update(
//                    body: {
//                        self.manager.isEnabled = newValue
//                        self.manager.isOnDemandEnabled = newValue
//                        
//                },
//                    complete: {
//                        if newValue {
//                            do {
//                                try (self.manager.connection as? NETunnelProviderSession)?.startVPNTunnel(options: nil)
//                            } catch let err as NSError {
//                                NSLog("\(err.localizedDescription)")
//                            }
//                        } else {
//                            (self.manager.connection as? NETunnelProviderSession)?.stopVPNTunnel()
//                        }
//                }
//                )
//            }
//        }
//    }
//    
//    public init() {
//        refreshManager()
//    }
//    
//    public func refreshManager() -> Void {
//        NETunnelProviderManager.loadAllFromPreferences(completionHandler: { (managers, error) in
//            if nil == error {
//                if let managers = managers {
//                    for manager in managers {
//                        if manager.localizedDescription == VPNConnect.vpnDescription {
//                            self.manager = manager
//                            return
//                        }
//                    }
//                }
//            }
//            self.setPreferences()
//        })
//    }
//    
//    private func update(body: @escaping ()->Void, complete: @escaping ()->Void) {
//        manager.loadFromPreferences { error in
//            if (error != nil) {
//                NSLog("Load error: \(String(describing: error?.localizedDescription))")
//                return
//            }
//            body()
//            self.manager.saveToPreferences { (error) in
//                if nil != error {
//                    NSLog("vpn_connect: save error \(error!)")
//                } else {
//                    complete()
//                }
//            }
//        }
//    }
//    
//    private func setPreferences() {
//        self.manager.localizedDescription = VPNConnect.vpnDescription
//        let proto = NETunnelProviderProtocol()
//        proto.providerBundleIdentifier = "com.popmedic.vpntunnel.provider"
//        proto.serverAddress = VPNConnect.vpnServerDescription
//        self.manager.protocolConfiguration = proto
//        // TLDList is a struct I created in its own swift file that has an array of all top level domains
//        let evaluationRule = NEEvaluateConnectionRule(matchDomains: TLDList.tlds,
//                                                      andAction: NEEvaluateConnectionRuleAction.connectIfNeeded)
//        evaluationRule.useDNSServers = [self.dnsEndpoint1]
//        let onDemandRule = NEOnDemandRuleEvaluateConnection()
//        onDemandRule.connectionRules = [evaluationRule]
//        onDemandRule.interfaceTypeMatch = NEOnDemandRuleInterfaceType.any
//        self.manager.onDemandRules = [onDemandRule]
//    }
//}
