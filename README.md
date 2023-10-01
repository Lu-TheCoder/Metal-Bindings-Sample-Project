# Metal-Bindings-Sample-Project
This is my initial attempt to create C Metal-Bindings to use Metal purely in C..


## Issues
- Memory Leaks!
  
For some reason we leaking memory and we can't seem to free the resources as enabling "ARC" doesnt do much in a C environment and manually freeing the objects, seem like not doing much either to reduce the memory leaks on each Frame update in the game loop.

## Suggest you watch my youtube video on this where this issue is highlighted

https://youtu.be/SlqsGsiclLs?si=m3n3UZaUH1Q4VQbD
  
