//
//  ViewController.m
//  NSUrlSessionTest
//
//  Created by 9527 on 2017/4/6.
//  Copyright © 2017年 9527. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionTaskDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //2,程序自动安装证书的方式
    NSURLSession *sesson = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
    NSURL *url = [NSURL URLWithString:@"https://openapi.biyabi.com/webservice.asmx/GetNewInfoDetial"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"iInfoID=490008" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask *task = [sesson dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error:%@",error);
        NSLog(@"data:%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
  
    [task resume];
}


#pragma mark -----NSURLSessionTaskDelegate-----
//NSURLAuthenticationChallenge 中的protectionSpace对象存放了服务器返回的证书信息
//如何处理证书?(使用、忽略、拒绝。。)
//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler//通过调用block，来告诉NSURLSession要不要收到这个证书
//{
//    //(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
//    //NSURLSessionAuthChallengeDisposition （枚举）如何处理这个证书
//    //NSURLCredential 授权
//    
//    //证书分为好几种：服务器信任的证书、输入密码的证书  。。，所以这里最好判断
//    
//    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){//服务器信任证书
//        
//        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];//服务器信任证书
//        if(completionHandler)
//            completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//    }
//    
//    
//    NSLog(@"....completionHandler---:%@",challenge.protectionSpace.authenticationMethod);
//    
//}
//




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
