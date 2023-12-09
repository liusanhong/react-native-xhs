// XhsModule.java

package com.rn.xhs;

import android.net.Uri;
import android.webkit.URLUtil;

import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.xingin.xhssharesdk.callback.XhsShareRegisterCallback;
import com.xingin.xhssharesdk.core.XhsShareSdk;
import com.xingin.xhssharesdk.model.config.XhsShareGlobalConfig;
import com.xingin.xhssharesdk.model.sharedata.XhsImageInfo;
import com.xingin.xhssharesdk.model.sharedata.XhsImageResourceBean;
import com.xingin.xhssharesdk.model.sharedata.XhsNote;

import java.io.File;
import java.lang.reflect.Array;
import java.net.URI;
import java.util.Arrays;

public class XhsModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public XhsModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Xhs";
    }

    @ReactMethod
    public void sampleMethod(String stringArgument, int numberArgument, Callback callback) {
        // TODO: Implement some actually useful functionality
        callback.invoke("Received numberArgument: " + numberArgument + " stringArgument: " + stringArgument);
    }

    @ReactMethod
    public void register(String appkey, Callback callback) {
        XhsShareGlobalConfig config = new XhsShareGlobalConfig();
        config.setEnableLog(BuildConfig.DEBUG);
        config.setClearCacheWhenShareComplete(true);
        XhsShareSdk.registerApp(reactContext, appkey, config, new XhsShareRegisterCallback() {
            @Override
            public void onSuccess() {
                callback.invoke("success");
            }

            @Override
            public void onError(int i, String s, @Nullable Exception e) {
                callback.invoke("error:" + e.getMessage());

            }
        });
    }

    @ReactMethod
    public void shareImage(String title, String content, String imageUrl, Callback callback) {
        XhsNote xhsNote = new XhsNote();
        xhsNote.setTitle(title);
        xhsNote.setContent(content);
        xhsNote.setImageInfo(new XhsImageInfo(Arrays.asList(
                new XhsImageResourceBean(new File(imageUrl))))
        );

        String sessionId = XhsShareSdk.shareNote(reactContext.getCurrentActivity(), xhsNote);
    }
}
