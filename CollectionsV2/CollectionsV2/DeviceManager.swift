//
//  DeviceManager.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

struct DeviceManager {
//    static func getPhoneOrPadImageName(for device: Device) -> String? {
//        switch device {
//        case .iPad5:
//            return UIImage(named: "ipad5gen.pdf")
//        case .iPad6:
//            return UIImage(named: "ipad6gen.pdf")
//        case .iPadAir3:
//            return UIImage(named: "ipadAir3gen.pdf")
//        case .iPadMini:
//            return UIImage(named: "ipadMini.pdf")
//        case .iPadMini2:
//            return UIImage(named: "ipadMini2.pdf")
//        case .iPadMini3:
//            return UIImage(named: "ipadMini3.pdf")
//        case .iPadMini4:
//            return UIImage(named: "ipadMini4.pdf")
//        case .iPadMini5:
//            return UIImage(named: "ipadMini5.pdf")
//        case .iPadPro9Inch:
//            return UIImage(named: "ipadPro.pdf")
//        case .iPadPro10Inch:
//            return UIImage(named: "ipadPro10.pdf")
//        case .iPadPro11Inch:
//            return UIImage(named: "ipadPro11.pdf")
//        case .iPadPro12Inch:
//            return UIImage(named: "ipadPro12.1gen.pdf")
//        case .iPadPro12Inch2:
//            return UIImage(named: "ipadPro12.2gen.pdf")
//        case .iPadPro12Inch3:
//            return UIImage(named: "ipadPro12.3gen.pdf")
//        case .iPhone4s:
//            return UIImage(named: "iphone4s.pdf")
//        case .iPhone5:
//            return UIImage(named: "iphone5.pdf")
//        case .iPhone5c:
//            return UIImage(named: "iphone5c.pdf")
//        case .iPhone5s:
//            return UIImage(named: "iphone5s.pdf")
//        case .iPhone6:
//            return UIImage(named: "iphone6.pdf")
//        case .iPhone6Plus:
//            return UIImage(named: "iphone6plus.pdf")
//        case .iPhone6s:
//            return UIImage(named: "iphone6s.pdf")
//        case .iPhone6sPlus:
//            return UIImage(named: "iphone6splus.pdf")
//        case .iPhone7:
//            return UIImage(named: "iphone7.pdf")
//        case .iPhone7Plus:
//            return UIImage(named: "iphone7plus.pdf")
//        case .iPhone8:
//            return UIImage(named: "iphone8.pdf")
//        case .iPhone8Plus:
//            return UIImage(named: "iphone8plus.pdf")
//        case .iPhoneSE:
//            return UIImage(named: "iphoneSe.pdf")
//        case .iPhoneX:
//            return UIImage(named: "iphoneX.pdf")
//        case .iPhoneXR:
//            return UIImage(named: "iphoneXr.pdf")
//        case .iPhoneXS:
//            return UIImage(named: "iphoneXs.pdf")
//        case .iPhoneXSMax:
//            return UIImage(named: "iphoneXsmax.pdf")
//        default:
//            return UIImage(named: "Unknown.pdf")
//        }
//    }
    static func getPhoneOrPadImageName(for device: Device) -> String? {
        switch device {
        case .iPad5:
            return "ipad5gen.pdf"
        case .iPad6:
            return "ipad6gen.pdf"
        case .iPadAir3:
            return "ipadAir3gen.pdf"
        case .iPadMini:
            return "ipadMini.pdf"
        case .iPadMini2:
            return "ipadMini2.pdf"
        case .iPadMini3:
            return "ipadMini3.pdf"
        case .iPadMini4:
            return "ipadMini4.pdf"
        case .iPadMini5:
            return "ipadMini5.pdf"
        case .iPadPro9Inch:
            return "ipadPro.pdf"
        case .iPadPro10Inch:
            return "ipadPro10.pdf"
        case .iPadPro11Inch:
            return "ipadPro11.pdf"
        case .iPadPro12Inch:
            return "ipadPro12.1gen.pdf"
        case .iPadPro12Inch2:
            return "ipadPro12.2gen.pdf"
        case .iPadPro12Inch3:
            return "ipadPro12.3gen.pdf"
        case .iPhone4s:
            return "iphone4s.pdf"
        case .iPhone5:
            return "iphone5.pdf"
        case .iPhone5c:
            return "iphone5c.pdf"
        case .iPhone5s:
            return "iphone5s.pdf"
        case .iPhone6:
            return "iphone6.pdf"
        case .iPhone6Plus:
            return "iphone6plus.pdf"
        case .iPhone6s:
            return "iphone6s.pdf"
        case .iPhone6sPlus:
            return "iphone6splus.pdf"
        case .iPhone7:
            return "iphone7.pdf"
        case .iPhone7Plus:
            return "iphone7plus.pdf"
        case .iPhone8:
            return "iphone8.pdf"
        case .iPhone8Plus:
            return "iphone8plus.pdf"
        case .iPhoneSE:
            return "iphoneSe.pdf"
        case .iPhoneX:
            return "iphoneX.pdf"
        case .iPhoneXR:
            return "iphoneXr.pdf"
        case .iPhoneXS:
            return "iphoneXs.pdf"
        case .iPhoneXSMax:
            return "iphoneXsmax.pdf"
        default:
            return "Unknown.pdf"
        }
    }
    
    static func getInfoString(for device: Device) -> String {
        return "PPI: \(device.ppi ?? 0), Diagonal: \(device.diagonal)"
    }
    
    static func getAllPhones() -> [Device] {
        return Device.allPhones
    }
    
    static func getAllPads() -> [Device] {
        return Device.allPads
    }
    
    static func getAllDevices() -> [Device] {
        return getAllPads() + getAllPhones()
    }
    
    static func getDeviceModel(from device: Device) -> DeviceModel {
        return DeviceModel(name: device.description, description: getInfoString(for: device), ppi: device.ppi, diagonal: device.diagonal, image: DeviceManager.getPhoneOrPadImageName(for: device))
    }
    
    static func makeIphoneModelArray() -> [DeviceModel] {
        let devices = Device.allPhones
        return devices.map {
            DeviceManager.getDeviceModel(from: $0)
        }
    }
    
    static func makeIpadModelArray() -> [DeviceModel] {
        let devices = Device.allPads
        return devices.map {
            DeviceManager.getDeviceModel(from: $0)
        }
    }
    
    static func makeAllDevicesModelArray() -> [DeviceModel] {
        return DeviceManager.makeIphoneModelArray() + DeviceManager.makeIpadModelArray()
    }
}
