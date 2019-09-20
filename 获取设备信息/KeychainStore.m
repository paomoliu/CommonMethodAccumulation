//
//  KeychainStore.m
//  FSMeetingClient
//
//  Created by Rachel on 2017/11/1.
//

#import "KeychainStore.h"

@implementation KeychainStore

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            nil];
}

// 保存UUID ——> 钥匙串
+ (void)saveUuid:(NSString *)uuid service:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // 将UUID保存到字典中
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:uuid] forKey:(id)kSecValueData];
    // 将数据存入钥匙串
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
    if (status == errSecSuccess) {
        NSLog(@"success");
    }
}

// 从钥匙串中读取UUID
+ (id)readUuidWithService:(NSString *)service {
    id result = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    CFDataRef keyData = NULL;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData);
    if (status == errSecSuccess) {
        result = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
    }
    
    return result;
}

@end
