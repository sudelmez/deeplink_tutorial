deeplink.android:
	adb shell am start -a android.intent.action.VIEW \
    -c android.intent.category.BROWSABLE \
    -d "yb://yesilbag.app/profile"

deeplink.ios:
    xcrun simctl openurl booted yb://yesilbag.app/