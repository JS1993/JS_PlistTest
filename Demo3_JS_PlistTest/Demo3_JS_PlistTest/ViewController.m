//
//  ViewController.m
//  Demo3_JS_PlistTest
//
//  Created by  江苏 on 16/3/11.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *mySv;
@property (strong, nonatomic) IBOutlet UITextField *myTF;
@property(strong,nonatomic)NSArray* facesArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"emoticons" ofType:@"plist"];
    self.facesArr=[NSArray arrayWithContentsOfFile:plistPath];
    for (int i=0; i<self.facesArr.count; i++) {
        NSDictionary* faceDic=self.facesArr[i];
        NSString* imageName=[faceDic objectForKey:@"png"];
        UIImage * imagex=[UIImage imageNamed:imageName];
        UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(i%8*40, i/8*40, 40, 40)];
        [btn setImage:imagex forState:UIControlStateNormal];
        btn.tag=i;
        [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.mySv addSubview:btn];
    }
    [self.mySv setContentSize:CGSizeMake(0, self.facesArr.count/8*40)];
}
-(void)clicked:(UIButton*)button{
    NSDictionary* faceDic=self.facesArr[button.tag];
    NSString* txt=[faceDic objectForKey:@"chs"];
    self.myTF.text=[self.myTF.text stringByAppendingString:txt];
}   
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
