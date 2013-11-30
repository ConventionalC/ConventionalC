#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

#ifndef CONVENTIONALC_BLOCKS
    #define CONVENTIONALC_BLOCKS
    #ifndef EmptyBlock
        typedef void(^EmptyBlock)();
    #endif
    typedef id(^ReturnBlock)();
    typedef id(^ObjectReturnBlock)(id object);
    typedef BOOL(^ObjectReturnBoolBlock)(id object);
    typedef id(^IndexReturnBlock)(NSUInteger index);
    typedef void(^IndexBlock)(NSUInteger index);
    typedef void(^ObjectBlock)(id object);
    typedef void(^IndexAndObjectBlock)(NSUInteger index, id object);
#endif

#import "NSArray+ConventionalC.h"
#import "NSArray+rubyish.h"
#import "NSMutableArray+rubyish.h"
#import "NSBundle+ConventionalC.h"
#import "NSDate+ConventionalC.h"
#import "NSObject+ConventionalC.h"
#import "NSSet+rubyish.h"

@interface ConventionalC : NSObject

+(NSString*)typeNameStringForProperty:(NSString*)propertyName inClass:(Class)c;

@end
