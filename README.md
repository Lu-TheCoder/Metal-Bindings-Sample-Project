# Metal-Bindings-Sample-Project
This is my initial attempt to create C Metal-Bindings to use Metal purely in C..


## Issues
- Memory Leaks!
  
For some reason we leaking memory and we can't seem to free the resources as enabling "ARC" doesnt do much in a C environment and manually freeing the objects, seem like not doing much either to reduce the memory leaks on each Frame update in the game loop.

- When you go in full screen (The memory leaks gets worse and jumps to 20GB+ of memory usage)

## Suggest you watch my youtube video on this where this issue is highlighted

https://youtu.be/SlqsGsiclLs?si=m3n3UZaUH1Q4VQbD

# Help is Appreciated
Any help to fix the memory leaks will be appreciated!

# Before Running the App
Note that the app leaks memory the moment you open it and every frame the memory used by the app increases too, So I advice you Have the **Activity Monitor** app opened and set to the **"Memory"** tab to track memory usage on your system.

