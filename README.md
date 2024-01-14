# react-native-xhs
ReactNative小红书分享

## Getting started

`$ yarn add react-native-xhs`

### Mostly automatic installation
```
ios:
cd ios && pod install

//1.restorationHandler
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable
                             restorableObjects))restorationHandler {
  
  
  if([XHSApi handleOpenUniversalLink:userActivity]) {
        return YES;
    }
    
//2.handleOpenURL
    
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
  
  if([XHSApi handleOpenURL:url]) {
         return YES;
  }

// info.plist中添加URL Types中加入xiaohongshu




android:
在android/setting.gradle中添加
include ':libsXhs'
project(':libsXhs').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-xhs/android/libsXhs')
```

## Usage
```
import XHS from 'react-native-xhs';

// 初始化
XHS.init('key', 'iOS link地址');

//分享视频
XHS.shareVideo(
              data.title, //标题
              data.content, //内容
              data.picture, //视频封面
              data.video, //视频
              v => {
                console.log('v:::', v);
                if (v === 'success') {
                  adShareSuccess();
                }
              },
            );
            
   //分享图片。暂时只支持分享一张
    XHS.shareImage(
              data.title, //标题
              data.content, //内容
              data.picture, //图片
              v => {
                console.log('v:::', v);
                if (v === 'success') {
                  adShareSuccess();
                }
              },
            );       
            
             //分享多张图片。暂时只支持分享一张
    XHS.shareImages(
              data.title, //标题
              data.content, //内容
              [data.picture1,data.picture2] //图片
              v => {
                console.log('v:::', v);
                if (v === 'success') {
                  adShareSuccess();
                }
              },
            );        

```
