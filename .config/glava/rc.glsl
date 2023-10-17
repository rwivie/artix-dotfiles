#request mod bars

#request setfloating  false
#request setdecorated false
#request setfocused   false
#request setmaximized false

#request setopacity "none"

#request setmirror false

/* OpenGL context and GLSL shader versions, do not change unless
   you *absolutely* know what you are doing. */
#request setversion 3 3
#request setshaderversion 330

#request settitle "GLava"
#request setgeometry 0 0 1920 1080
#request setbg 2e3440

#request setxwintype "desktop"

// #request addxwinstate "sticky"
// #request addxwinstate "skip_taskbar"
// #request addxwinstate "skip_pager"
// #request addxwinstate "above"
// #request addxwinstate "pinned"

#request setclickthrough true
#request setfullscreencheck true

#request setsource "auto"

#request setswap 1
#request setinterpolate true
#request setframerate 60

#request setprintframes false

/* The following settings (@22050 Hz) produce the listed rates: 
   
   Sample    UPS                  Description
   - 2048 -> 43.0  (low accuracy, cheap), use with < 60 FPS
   - 1024 -> 86.1  (high accuracy, expensive), use with >= 60 FPS
   -  512 -> 172.3 (extreme accuracy, very expensive), use only
                   for graphing accurate spectrum data with
                   custom modules. */
#request setsamplesize 1024
#request setbufsize 4096

#request setsamplerate 22050
