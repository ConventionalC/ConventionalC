#import "NSBundle+ConventionalC.h"

@implementation NSBundle(ConventionalC)

-(NSURL*)URLForResource:(NSString*)resource
{
    return [self URLForResource:resource withExtension:nil];
}

@end
