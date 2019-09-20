//
//  ArchiveDeviceInfos.m
//  UMSAgent
//
//  Created by Rachel on 2017/11/2.
//

#import <mach/mach_host.h>
#import <sys/utsname.h>

#import "ArchiveDeviceInfos.h"
#import "KeychainStore.h"

@implementation ArchiveDeviceInfos

/**
 *  获取设备UUID
 */
+ (NSString *)getDeviceUUID {
    // 获取boundleId ——> 作为key
    NSString *boundleId = [[NSBundle mainBundle] bundleIdentifier];
    
    // 从keyChain中获取UUID
    NSString *uuidStr = [KeychainStore readUuidWithService:boundleId];
    
    // 首次运行app，UUID为nil，则生成一个UUID并将其保存到keychain
    if ([uuidStr isEqualToString:@""] || !uuidStr) {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
        [KeychainStore saveUuid:uuidStr service:boundleId];
    }
    
    return uuidStr;
}

/**
 *  获取设备型号标识
 */
+ (NSString *)modelIdentifier {
    NSString *modelIdentifier = @"";
#ifdef _OS_IOS
    // iOS
    struct utsname systemInfo;
    uname(&systemInfo);
    modelIdentifier = [NSString stringWithCString:systemInfo.machine
                                         encoding:NSUTF8StringEncoding];
#else
    // Mac
    io_service_t service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
    CFStringRef model = IORegistryEntryCreateCFProperty(service, CFSTR("model"), kCFAllocatorDefault, 0);
    modelIdentifier = [[NSString alloc] initWithData:(__bridge NSData *)model
                                            encoding:NSUTF8StringEncoding];
    CFRelease(model);
    IOObjectRelease(service);
    modelIdentifier = [modelIdentifier stringByReplacingOccurrencesOfString:@"\0" withString:@""];
#endif
    return modelIdentifier;
}

@end

