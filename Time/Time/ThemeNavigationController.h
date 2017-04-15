//
//  ThemeNavigationController.h
//  xixun
//
//  Created by huangli on 16/9/1.
//  Copyright © 2016年 3N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeNavigationController : UINavigationController<UINavigationControllerDelegate>

-(void)setTitle:(NSString *)title tabBarItemImageName:(NSString *)imageName tabBarItemSelectedImageName:(NSString *)imageName;
@end
