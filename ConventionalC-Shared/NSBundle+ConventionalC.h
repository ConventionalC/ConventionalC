#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

@interface NSBundle(ConventionalC)

-(NSURL*)URLForResource:(NSString*)resource;

@end
