//
//  iLogger.m
//  iLogger
//
//  Created by Rajesh on 3/23/15.
//

#import "iLogger.h"

@interface iLogger()
{
    NSString *stToBeWritten;
    NSString *strFilePath;
}

@end
@implementation iLogger

+ (instancetype)sharedLogger
{
    static iLogger *logger;
    if (!logger)
    {
        logger = [[self alloc] init];
    }
    return logger;
}

+ (void)print:(NSString *)stParam;
{
#ifdef DEBUG
    NSLog(@"%@",stParam);
#endif
    [[self sharedLogger] logValueInFile:stParam];
}

- (void)logValueInFile:(NSString *)stParam
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
//    });
    [[self stToBeWritten:stParam] writeToFile:[self filePath] atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];

}

- (NSString *)filePath
{
    if (!strFilePath)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"/Logs"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
            [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
        strFilePath = [NSString stringWithFormat:@"%@/Log.txt",dataPath];
    }
    return strFilePath;
}

- (NSString *)stToBeWritten:(NSString *)newString
{
    if (!stToBeWritten)
    {
        stToBeWritten = [NSString stringWithContentsOfFile:[self filePath] encoding:NSUTF8StringEncoding error:NULL];
    }
    if (stToBeWritten)
    {
        stToBeWritten = [NSString stringWithFormat:@"%@ \n\n %@",stToBeWritten,newString];
    }
    else
        stToBeWritten = [NSString stringWithFormat:@"%@",newString];
    return stToBeWritten;
}
- (NSString *)getLogs
{
    return [self stToBeWritten:@""];
}

- (void)deleteLogs
{
    stToBeWritten = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"/Logs/Log.txt"];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end
