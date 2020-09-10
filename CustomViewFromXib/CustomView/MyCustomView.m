//
//  MyCustomView.m
//  QXMember
//
//  Created by iMac on 2020/9/10.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MyCustomView.h"

@implementation MyCustomView

/*
 以代码的方式初始化时，会通过这个方法进行初始化
 例如：[[MyCustomView alloc] init];
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

/*
以xib的方式初始化时，会通过这个方法进行初始化
例如：在xib中，把view的class设置为MyCustomView
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

- (UIView*)loadViewFromNib {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:bundle];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:view];
    
    return view;
    
}

- (IBAction)bntTap:(id)sender {
    
    NSLog(@"bntTap");

}

@end
