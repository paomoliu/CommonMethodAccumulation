//
//  NSString+StringDetection.h
//  FSMeetingClient
//
//  Created by Rachel on 2018/10/15.
//

#import <Foundation/Foundation.h>

@interface NSString (StringDetection)

/**
 *  Determine if Chinese is included in the string.
 *
 *  @return YES, including Chinese; otherwise not included.
 */
+ (BOOL)fm_isContainChinese:(NSString *)string;
/**
 *  Determine if the given string is an empty string.
 *
 *  @param string String to be judged.
 *  @return YES, empty string; otherwise non-empty string.
 */
+ (BOOL)fm_isEmptyString:(NSString *)string;
/**
 *  Determine if emoji is included in the string.
 *
 *  @param string String to be judged.
 *  @return Returns the range of emoji in the string（You can also return a BOOL）. Determine whether emoji is included by the length of range
 */
+ (NSRange)fm_stringContainsEmoji:(NSString *)string;

@end
