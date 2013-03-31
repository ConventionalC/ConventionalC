#import "NSBundle+ConventionalC.h"
#import "ConventionalC_Shared.h"

@implementation NSBundle(ConventionalC)

-(NSURL*)URLForResource:(NSString*)resource
{
    return [self URLForResource:resource withExtension:nil];
}

@end
