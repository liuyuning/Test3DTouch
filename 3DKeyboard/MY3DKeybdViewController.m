//
//  MY3DKeybdViewController.m
//  Test3DTouch
//
//  Created by liuyuning on 15/10/14.
//  Copyright © 2015年 liuyuning. All rights reserved.
//

#import "MY3DKeybdViewController.h"

@interface MY3DKeybdViewController ()

@end

@implementation MY3DKeybdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor blueColor];
    button.frame = CGRectMake(10, 10, 80, 40);
    [button setTitle:@"BACK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];

    imageView.frame = CGRectMake(10, 50, 300, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)actionBack:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *previewActionOK = [UIPreviewAction actionWithTitle:@"确认" style:UIPreviewActionStyleDestructive handler:
                                        ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                            
                                            NSLog(@"%@",action);
                                            NSLog(@"%@",previewViewController);
                                            
                                        }];
    UIPreviewAction *previewActionCancel = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:
                                            ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                                
                                                NSLog(@"%@",action);
                                                NSLog(@"%@",previewViewController);
                                                [self actionBack:nil];
                                                
                                            }];
    
    
    return @[previewActionOK,previewActionCancel];
    
}

@end
