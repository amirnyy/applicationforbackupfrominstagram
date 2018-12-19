//
//  main.m
//  App for backup instagram
//
//  Created by Алексей Мирный on 13/12/2018.
//  Copyright © 2018 Алексей Мирный. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, User!");
        char  buffer[255];
        NSLog(@"Enter your API:");
        scanf("%s", buffer);
        NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://twitter.com/getibox"] encoding:NSUTF8StringEncoding error:nil];
        if (URLString == nil){ //Проверка интернет соединения
            NSLog(@"No internet connection");
            return 1;
        }
        NSString *requestURL =[@"https://api.instagram.com/v1/users/self/media/recent/?access_token=" stringByAppendingString:[NSString stringWithFormat:@"%s",buffer]];
        NSString *URLString2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:requestURL] encoding:NSUTF8StringEncoding error:nil];
        if ([URLString2 isEqualToString:@"{\"meta\": {\"code\": 400, \"error_type\": \"OAuthAccessTokenException\", \"error_message\": \"The access_token provided is invalid.\"}}"])
        { //Проверка валидности API
            NSLog(@"Your API is not valid");
            return 2;
        }
        NSData *responseData = [NSData dataWithContentsOfURL:[NSURL URLWithString:requestURL]];
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *data = [responseDic objectForKey:@"data"];
        int counter = 0;
        NSLog(@"Downloading has started");
        for (NSDictionary *content in data ){
            if ([[content objectForKey:@"type"] isEqualToString:@"image"]) //Скачивание постов с изображениями
            {
                NSString *stringURL = [[[content objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
                counter++;
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
                NSString *downloadsDirectory = [paths objectAtIndex:0];
                NSString *filePath = [[[downloadsDirectory stringByAppendingPathComponent:@"image"] stringByAppendingString:[NSString stringWithFormat:@"%d",counter]] stringByAppendingString:@".jpg"];
                NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
                if (urlData == nil){ //Проверка на потерю интернет соединения
                    NSLog(@"Connection lost");
                    return 1;
                }
                [urlData writeToFile:filePath atomically:YES];
            }
            else if ([[content objectForKey:@"type"] isEqualToString:@"video"]) //Скачивание постов с видео
            {
                NSString *stringURL = [[[content objectForKey:@"videos"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
                counter++;
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
                NSString *downloadsDirectory = [paths objectAtIndex:0];
                NSString *filePath = [[[downloadsDirectory stringByAppendingPathComponent:@"video"] stringByAppendingString:[NSString stringWithFormat:@"%d",counter]] stringByAppendingString:@".mp4"];
                NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
                if (urlData == nil){ //Проверка на потерю интернет соединения
                    NSLog(@"Connection lost");
                    return 1;
                }
                [urlData writeToFile:filePath atomically:YES];
            }
            else if ([[content objectForKey:@"type"] isEqualToString:@"carousel"]){ //Скачивание постов "каруселей"
                NSArray *carousel_data = [content objectForKey:@"carousel_media"];
                counter++;
                int counter_carousel = 0;
                for (NSDictionary *carousel_content in carousel_data){
                    if ([[carousel_content objectForKey:@"type"] isEqualToString:@"image"])
                    {
                        NSString *stringURL = [[[content objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
                        counter_carousel++;
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
                        NSString *downloadsDirectory = [paths objectAtIndex:0];
                        NSString *filePath = [[[[downloadsDirectory stringByAppendingPathComponent:@"image"] stringByAppendingString:[NSString stringWithFormat:@"%d",counter]] stringByAppendingString:[NSString stringWithFormat:@"_%d",counter_carousel]] stringByAppendingString:@".jpg"];
                        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
                        if (urlData == nil){ //Проверка на потерю интернет соединения
                            NSLog(@"Connection lost");
                            return 1;
                        }
                        [urlData writeToFile:filePath atomically:YES];
                    }
                    else if ([[content objectForKey:@"type"] isEqualToString:@"video"])
                    {
                        NSString *stringURL = [[[content objectForKey:@"videos"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
                        counter_carousel++;
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
                        NSString *downloadsDirectory = [paths objectAtIndex:0];
                        NSString *filePath = [[[[downloadsDirectory stringByAppendingPathComponent:@"video"] stringByAppendingString:[NSString stringWithFormat:@"%d",counter]] stringByAppendingString:[NSString stringWithFormat:@"_%d",counter_carousel]] stringByAppendingString:@".mp4"];
                        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
                        if (urlData == nil){ //Проверка на потерю интернет соединения
                            NSLog(@"Connection lost");
                            return 1;
                        }
                        [urlData writeToFile:filePath atomically:YES];
                    }
                }
            }
        }
        NSLog(@"Downloading has ended, goodbye!");
    }
    return 0;
}
