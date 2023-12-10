// main index.js

import {NativeModules, Platform} from 'react-native';

const {Xhs} = NativeModules;

export default Xhs;

export function initAMapSearch(key: string, universalLink?: string) {
    if (Platform.OS === "android") {
        Xhs.register(key, (res: any) => {
            console.log('initAMapSearch result:', res)
        });
    } else {
        Xhs.register(key, universalLink, (res: any) => {
            console.log('initAMapSearch result:', res)
        });
    }

}

export function shareImage(title: string, content: string, imageUrl: string) {
    Xhs.shareImage(title, content, imageUrl);
}

export function shareVideo(title: string, content: string, imageUrl: string, videoUrl: string) {
    Xhs.shareVideo(title, content, imageUrl, videoUrl);
}
