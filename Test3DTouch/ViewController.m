//
//  ViewController.m
//  Test3DTouch
//
//  Created by liuyuning on 15/10/14.
//  Copyright © 2015年 liuyuning. All rights reserved.
//

#import "ViewController.h"
#import "PreViewController.h"



@interface ViewController ()<UIViewControllerPreviewingDelegate>

@property(nonatomic,strong)UIImageView *imageView;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"格子"]];
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 80, 80)];
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.image = [UIImage imageNamed:@"Button"];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    
    [self registerForPreviewingWithDelegate:self sourceView:self.imageView];
    
    
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(actionLongPress:)];
    [self.view addGestureRecognizer:longPressGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    
    UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithForceTouchCapability:UIForceTouchCapabilityAvailable];
    NSLog(@"prev:%d",previousTraitCollection.forceTouchCapability);
    NSLog(@"curt:%d",traitCollection.forceTouchCapability);
}


- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    NSLog(@"%@",previewingContext);//<_UIViewControllerPreviewSourceViewRecord: 0x14fe876b0>
    
    PreViewController *viewController = [[PreViewController alloc] init];
    return viewController;
    
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self presentViewController:viewControllerToCommit animated:YES completion:^{
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touchesBegan");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    NSLog(@"touchesMoved");
    
    UITouch *touch = [touches anyObject];
    NSLog(@"%f,%f",touch.maximumPossibleForce,touch.force);
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"touchesEnded");
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"touchesCancelled");
}

- (void)actionLongPress:(UILongPressGestureRecognizer *)sender{
    //[sender ]
}

@end






