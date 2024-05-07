# Note
This is a recoverd repository from my old account @neosophaux. It has not been touched in years
so I am not sure if this works still or not.

# ppause
Very simple android native library that will pause the app process when the library is loaded.

I developed this while analyzing some heavily obfuscated android malware that takes advantage of the static block/initializer of the app's `Application` class to load some of it's native shared libraries. In java, the static block/initializer is executed when the class is loaded and a class is only loaded when it needs to be(either by being referenced or by being manually loaded). In android, the `Application` class is [the first of your classes to be loaded](https://developer.android.com/reference/android/app/Application) so any code that gets placed in this class' static block/initializer would be the very first code to be executed.

Annoyingly, I just couldn't attach GDB before the libraries had already been loaded and executed because it all happens way too fast. I couldn't rely on using `adb shell am -D <activity>` because the loading of the native libraries occurs in the static block/initializer of the app's `Application` class, which as i had explained above, is loaded and executed before any `Activity` is. That's when I came up with the idea to simply pause the app before anything else get's executed by loading my library first in the static block/initializer of the app's `Application` class. It sure helped me and so I hope it helps someone out there too, no matter how simple this is. :)
