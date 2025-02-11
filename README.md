# An example of HCPP Rendering

HCPP is a new platform view strategy that is only available on new (API 34+) Android devices running Impeller. It must be enabled via an opt in Android manifest flag:

```
<meta-data android:name="io.flutter.embedding.android.EnableSurfaceControl" android:value="true" />
```


Then, when instantiating the Android view use an AndroidViewLink instead of an Android view and use the initHybridAndroidView helper method.

```
return PlatformViewLink(
    viewType: viewType,
    surfaceFactory: (BuildContext context, PlatformViewController controller) {
    return AndroidViewSurface(
        controller: controller as AndroidViewController,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
    );
    },
    onCreatePlatformView: (PlatformViewCreationParams params) {
    return PlatformViewsService.initHybridAndroidView(
        id: params.id,
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParamsCodec: const StandardMessageCodec(),
        )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
);
```

Additionally, the API `HybridAndroidViewController.checkIfSupported()` can be used to query at runtime if this API is supported.

