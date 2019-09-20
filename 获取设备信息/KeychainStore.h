//
//  KeychainStore.h
//  FSMeetingClient
//
//  Created by Rachel on 2017/11/1.
//

#import <Foundation/Foundation.h>

@interface KeychainStore : NSObject

+ (void)saveUuid:(NSString *)uuid service:(NSString *)service;
+ (id)readUuidWithService:(NSString *)service;

@end
