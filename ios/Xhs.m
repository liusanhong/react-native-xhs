// Xhs.m

#import "Xhs.h"

#import <XiaoHongShuOpenSDK/XHSApi.h>
@implementation Xhs

RCT_EXPORT_MODULE()



RCT_EXPORT_METHOD(register:(NSString *)key :(NSString *)universalLink :(RCTResponseSenderBlock)callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL init =[XHSApi registerApp:key universalLink:universalLink delegate:self];
        if (init) {
            callback(@[@"success"]);
        }else{
            callback(@[@"error"]);
        }
    });

}


RCT_EXPORT_METHOD(shareImage:(NSString *)title :(NSString *)content :(NSString *)imageUrl :(RCTResponseSenderBlock)callback) {

    dispatch_async(dispatch_get_main_queue(), ^{

        XHSOpenSDKShareRequest *shareRequest = [[XHSOpenSDKShareRequest alloc] init];
        shareRequest.mediaType = XHSOpenSDKShareMediaTypeImage;
        NSMutableArray<XHSShareInfoImageItem *> *imageResources = [NSMutableArray array];
        XHSShareInfoImageItem *imageObject = [[XHSShareInfoImageItem alloc] init];
        /// 图片远程url 或者本地沙盒路径
        imageObject.imageUrl = imageUrl;

        XHSShareInfoTextContentItem * textItem = [[XHSShareInfoTextContentItem alloc]init];
        textItem.title = title;
        textItem.content = content;
        [imageResources addObject:imageObject];
        shareRequest.textContentItem = textItem;
        shareRequest.imageInfoItems = imageResources;
        [XHSApi sendRequest:shareRequest completion:^(BOOL success) {
            if (success) {
                callback(@[@"success"]);
            }else{
                callback(@[@"error"]);
            }

        }];

    });

}

RCT_EXPORT_METHOD(shareImages:(NSString *)title :(NSString *)content :(NSArray *)imageUrls :(RCTResponseSenderBlock)callback) {

    dispatch_async(dispatch_get_main_queue(), ^{

        XHSOpenSDKShareRequest *shareRequest = [[XHSOpenSDKShareRequest alloc] init];
        shareRequest.mediaType = XHSOpenSDKShareMediaTypeImage;
        NSMutableArray<XHSShareInfoImageItem *> *imageResources = [NSMutableArray array];
        XHSShareInfoImageItem *imageObject = [[XHSShareInfoImageItem alloc] init];
        /// 图片远程url 或者本地沙盒路径
        for (NSString *urlString in imageUrls) {
            XHSShareInfoImageItem *imageObject = [[XHSShareInfoImageItem alloc] init];
            imageObject.imageUrl = urlString; // 假定 XHSShareInfoImageItem 有一个 imageUrl 属性
            [imageResources addObject:imageObject];
        }
        XHSShareInfoTextContentItem * textItem = [[XHSShareInfoTextContentItem alloc]init];
        textItem.title = title;
        textItem.content = content;
        shareRequest.textContentItem = textItem;
        shareRequest.imageInfoItems = imageResources;
        [XHSApi sendRequest:shareRequest completion:^(BOOL success) {
            if (success) {
                callback(@[@"success"]);
            }else{
                callback(@[@"error"]);
            }

        }];

    });

}

RCT_EXPORT_METHOD(shareVideo:(NSString *)title :(NSString *)content :(NSString *)imageUrl :(NSString *)videoUrl :(RCTResponseSenderBlock)callback) {

    dispatch_async(dispatch_get_main_queue(), ^{

        XHSOpenSDKShareRequest *shareRequest = [[XHSOpenSDKShareRequest alloc] init];
        shareRequest.mediaType = XHSOpenSDKShareMediaTypeVideo;

        /// 视频
        NSMutableArray<XHSShareInfoVideoItem *> *videoResources = [NSMutableArray array];

        XHSShareInfoVideoItem *videoObject = [[XHSShareInfoVideoItem alloc] init];
        /// 视频
        videoObject.videoUrl = videoUrl;
        /// 视频封面
        videoObject.coverUrl = imageUrl;
        XHSShareInfoTextContentItem *messageObject = [[XHSShareInfoTextContentItem alloc] init];
        messageObject.title = title;
        messageObject.content = content;

        [videoResources addObject:videoObject];
        shareRequest.videoInofoItems = videoResources;
        shareRequest.textContentItem = messageObject;
        [XHSApi sendRequest:shareRequest completion:^(BOOL success) {
            if (success) {
                callback(@[@"success"]);
            }else{
                callback(@[@"error"]);
            }
        }];

    });

}

RCT_EXPORT_METHOD(isXhsInstalled:(RCTResponseSenderBlock)callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL installed = [XHSApi isXHSAppInstalled];
        callback(@[@(installed)]);
    });
}


@end
