#Importing required Modules to make it work

import jarvis_brain as jb
import jarvis_respond as jr
import jarvis_learns as jl
import random

if __name__ == "__main__":
    while True:
        jb.jarvis_speak(random.choice(jb.startup))
        voice = jb.record_audio()   
        jr.respond(voice)

