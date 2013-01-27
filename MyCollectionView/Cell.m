//
//  Cell.m
//  MyCollectionView
//
//  Created by Quy Sang Le on 11/5/12.
//  Copyright (c) 2012 Quy Sang Le. All rights reserved.
//

#import "Cell.h"
#import "QuartzCore/QuartzCore.h"


@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.contentView setBackgroundColor:[UIColor underPageBackgroundColor]];
        
        //cellImage
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 57, 57)];
        [self.imageView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.imageView];
        
        //ProgressView
        self.downloadBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        [self.downloadBar setAccessibilityFrame:CGRectMake(0, 30, 300, 10)];

        [self.contentView addSubview:self.downloadBar];
        [self.downloadBar setHidden:YES];
        
        self.receivedData = [[NSMutableData alloc] init];


    }
    return self;
}

-(void)setDownString:(NSString *)downString{

    _downString = downString;
 	
    NSURLRequest *request = [[NSURLRequest alloc]
 							 initWithURL: [NSURL URLWithString:downString]];
    
    NSURLConnection *connection = [[NSURLConnection alloc]
 								   initWithRequest:request
 								   delegate:self
 								   startImmediately:YES];
 	if(!connection) {
 		NSLog(@"connection failed :(");
 	} else {
 		NSLog(@"connection succeeded  :)");
 		
 	}
}

#pragma mark NSURLConnection delegate methods
- (NSURLRequest *)connection:(NSURLConnection *)connection
 			 willSendRequest:(NSURLRequest *)request
 			redirectResponse:(NSURLResponse *)redirectResponse {
 	NSLog(@"Connection received data, retain count");
    return request;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
 	NSLog(@"Received response: %@", response);
    NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *)response;
    self.barSize = [httpResponse expectedContentLength];
    [self.downloadBar setHidden:NO];

    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
 	NSLog(@"Received %d bytes of data", [data length]);
 	
    [self.receivedData appendData:data];
 	NSLog(@"Received data is now %d bytes", [self.receivedData length]);
    
    float progress = (float)[self.receivedData length] / (float)self.barSize;
    [self.downloadBar setProgress:progress];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
 	NSLog(@"Error receiving response: %@", error);
    //    [[UIAlertView alertWithError:error] runModal];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Once this method is invoked, "responseData" contains the complete result
 	NSLog(@"Succeeded! Received %d bytes of data", [self.receivedData length]);
 	
 	NSString *dataStr=[[NSString alloc] initWithData:self.receivedData encoding:NSASCIIStringEncoding];
 	NSLog(@"Succeeded! Received %@ bytes of data", dataStr);
    
    self.imageView.image = [UIImage imageWithData:self.receivedData];
    [self.downloadBar setHidden:YES];

}




@end
