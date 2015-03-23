//
//  iLogger.h
//  iLogger
//
//  Created by Rajesh on 3/23/15.
//

# define DLog(fmt, ...) [iLogger print:[NSString stringWithFormat:(@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]]

#import <Foundation/Foundation.h>

@interface iLogger : NSObject
+ (instancetype)sharedLogger;
- (NSString *)getLogs;
- (void)deleteLogs;
+ (void)print:(NSString *)stParam;
@end
