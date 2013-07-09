#import "NSString+rubyish.h"

@implementation NSString(rubyish)

-(const void *)bytes
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.bytes;
}

-(NSUInteger)bytesize
{
    return [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}

-(NSString*)capitalized { return self.capitalizedString; }

-(NSComparisonResult)casecmp:(NSString*)with { return [self caseInsensitiveCompare:with]; }

-(NSString*)chr { return self.isEmpty ? nil : [self substringToIndex:1]; }

-(NSString*)downcased { return self.lowercaseString; }

-(void)eachByte:(void(^)(char b))block
{
    NSUInteger length = self.bytesize;
    const char* bytes = self.bytes;
    for(int i = 0; i<length; i++)
        block(bytes[i]);
}

-(void)eachChar:(void(^)(unichar c))block
{
    unichar buffer[self.length];
    [self getCharacters:buffer range:NSMakeRange(0, self.length)];
    for(int i = 0; i < self.length; ++i)
        block(buffer[i]);
}

-(void)eachLine:(void(^)(NSString *line))block
{
    [self enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
            block(line);
        }];
}

-(BOOL)isEmpty { return !self.length; }

-(BOOL)endsWith:(NSString*)suffix { return [self hasSuffix:suffix]; }

-(BOOL)endsWithAny:(NSArray*)suffixes
{
    for(NSString* suffix in suffixes)
        if([self endsWith:suffix])
            return YES;
    return NO;
}

-(BOOL)includes:(NSString*)string { return [self rangeOfString:string].length; }

-(NSString*)lstripped
{
    int i;
    for(i = 0; i < self.length; i++)
        if(![NSCharacterSet.whitespaceAndNewlineCharacterSet characterIsMember: [self characterAtIndex:i]])
            break;
    return [self substringFromIndex: i];
}

-(NSString*)reversed //http://rosettacode.org/wiki/Reverse_a_string#Objective-C
{
    NSInteger l = self.length - 1;
	NSMutableString *ostr = [NSMutableString stringWithCapacity:self.length];
	while (l >= 0)
	{
		NSRange range = [self rangeOfComposedCharacterSequenceAtIndex:l];
		[ostr appendString:[self substringWithRange:range]];
		l -= range.length;
	}
	return ostr;
}

-(NSString*)rstripped
{
    NSInteger i;
    for(i = self.length-1; i >= 0; i--)
        if(![NSCharacterSet.whitespaceAndNewlineCharacterSet characterIsMember: [self characterAtIndex:i]])
            break;
    return [self substringToIndex: i+1];
}

-(NSUInteger)size { return self.length; }

-(BOOL)startsWith:(NSString*)prefix { return [self hasPrefix:prefix]; }

-(BOOL)startsWithAny:(NSArray*)prefixes
{
    for(NSString* prefix in prefixes)
        if([self startsWith:prefix])
            return YES;
    return NO;
}

-(NSString*)stripped
{
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

-(NSString*)swapcased
{
    unichar *s = calloc(self.length, sizeof(unichar));
    [self getCharacters:s];
    for(int i=0;i<self.length;i++)
    {
        if(s[i] >= 'A' && s[i] <= 'Z')
            s[i] = s[i] + 'a' - 'A';
        else if(s[i] >= 'a' && s[i] <= 'z')
            s[i] = s[i] - ('a' - 'A');
    }
    return [NSString stringWithCharacters:s length:self.length];
}

-(NSString*)upcased { return self.uppercaseString; }

@end
