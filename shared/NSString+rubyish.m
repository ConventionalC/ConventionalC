#import "NSString+rubyish.h"

@implementation NSString(rubyish)

-(NSString*)capitalized { return self.capitalizedString; }

-(NSString*)downcased { return self.lowercaseString; }

-(BOOL)isEmpty { return !self.length; }

-(BOOL)includes:(NSString*)string
{
    return [self rangeOfString:string].length;
}

-(NSUInteger)size { return self.length; }

-(NSString*)stripped
{
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

-(NSString*)upcased { return self.uppercaseString; }

@end
