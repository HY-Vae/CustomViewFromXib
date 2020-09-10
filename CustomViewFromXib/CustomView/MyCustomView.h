//
//  MyCustomView.h
//  QXMember
//
//  Created by iMac on 2020/9/10.
//  Copyright © 2020 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomView : UIView

@property (weak, nonatomic) UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

NS_ASSUME_NONNULL_END
