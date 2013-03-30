#import <UIKit/UIKit.h>

@interface UIToolbar(ConventionalC)

+(UIToolbar*)toolbarWithItems:(NSArray*)items;
-(void)removeItem:(UIBarButtonItem*)i;
-(void)removeLastItem;
-(void)addItem:(UIBarButtonItem*)i;

@end
