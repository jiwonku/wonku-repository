//
//  ManbogiNetworkManager.m
//  manbogi
//
//  Created by wonku on 2017. 5. 18..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ManbogiNetworkManager.h"

@implementation ManbogiNetworkManager

@synthesize responseData,request,conn;

static ManbogiNetworkManager *s_manbogiNetworlManager;

+ (instancetype)sharedManbogiNetworkManager
{
    if(s_manbogiNetworlManager == nil)
        s_manbogiNetworlManager = [ManbogiNetworkManager new];
    
    return s_manbogiNetworlManager;
}

-(void)setDelegate:(id)delegate
{
    self.manboNetworkDelegate = delegate;
}

-(void)initAndRequestNetwork:(NSString *)locationInfo
{
    responseData = [NSMutableData data];
    [responseData setLength:0];
    

//    NSURL *url = [NSURL URLWithString:@"https://openapi.naver.com/v1/map/reversegeocode"];
//    String apiURL = "https://openapi.naver.com/v1/map/reversegeocode?query=" + tempData; //json
    
//    NSString *mapUrl = [NSString stringWithFormat:@"https://openapi.naver.com/v1/map/reversegeocode?query=%@", @"126.886254,37.468138"];
//    NSString *mapUrl = [NSString stringWithFormat:@"https://openapi.naver.com/v1/map/reversegeocode?query=126.886254,37.468138"];
    
    
    //Create request
    NSString *mapUrl = [NSString stringWithFormat:@"https://openapi.naver.com/v1/map/reversegeocode?query=%@", locationInfo];

    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:mapUrl]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"EFNh69yTwA39y8cNF4fr" forHTTPHeaderField:@"X-Naver-Client-Id"];
    [request setValue:@"CObqcn4e2x" forHTTPHeaderField:@"X-Naver-Client-Secret"];
    
    //create url connection and start request;
    conn = [NSURLConnection connectionWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (nullable NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    
    return  nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    
    NSDictionary *locationDic = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    if(locationDic == nil)
        return;
    
    NSDictionary *resultDic = [locationDic objectForKey:@"result"];
    NSArray *itemArray = [resultDic objectForKey:@"items"];
    NSDictionary *address = [itemArray objectAtIndex:0];
    NSString *addressString = [address objectForKey:@"address"];
    
    if([self.manboNetworkDelegate respondsToSelector:@selector(setlocatioinToDisplay:)])
       [self.manboNetworkDelegate setlocatioinToDisplay:addressString];    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}


@end
