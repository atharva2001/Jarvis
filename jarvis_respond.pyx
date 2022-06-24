#This module responds to the user input
import jarvis_brain as jb
import webbrowser
import urllib.request
from GoogleNews import GoogleNews
import playsound
import os
from wikipedia import *
import jarvis_brain as jb
import random

def respond(voice_data):
    if 'name' in voice_data:
        jb.jarvis_speak("My name is Jarvis")

    elif 'f***' in voice_data:
        jb.jarvis_speak("As you wish!")
        exit()

    elif 'headlines' in voice_data:
        googlenews = GoogleNews(period='1d')
        googlenews.search('INDIA')
        result = googlenews.result()
        print(result)
        count = 0
        for x in result:
            if count != 2:
                jarvis_speak(x['date'])
                jarvis_speak(x['desc'])
                count += 1

    # if 'remember' in voice_data:
    #     jarvis_speak("What is your good name?. Please type in your name!")
    #     name = input("\n Your name goes here")
    #     email = (input('Enter your email'))
    #     bday = (input('Enter your birthday in format [dd/mm]'))
    #     p1 = data._Data(name, email, bday)
    #     name, email, bday = p1._Data__names()

    #     databs = db._dbs
    #     results, bdays = databs.select(name, email, bday)
    #     if results == 1:
    #         jarvis_speak("I know you, " + name + "!")

    #         reminder(name, bdays)

    #     else:
    #         jarvis_speak("Looks like you new here!")
    #         databs.insert(name, email, bday)
    #         jarvis_speak("Nice name " + name + ", I have remembered you!")
    #         pyautogui.alert("Inserted Successfully!")


    elif 'time' in voice_data:
        jb.jarvis_speak(ctime())

    elif 'give information' in voice_data:
        jb.jarvis_speak(wikipedia.summary(voice_data, sentences=2))

    elif 'your detail' in voice_data:
        jb.jarvis_speak("First up My CPU details")
        a = psutil.cpu_count(logical=False)
        jb.jarvis_speak("Physical Cores are ")
        jb.jarvis_speak(str(a))
        b = psutil.cpu_count(logical=True)
        jb.jarvis_speak("Total Cores are ")
        jb.jarvis_speak(str(b))

        jb.jarvis_speak(f"Maximum Frequency is {psutil.cpu_freq().max:.2f}Mega Hertz")
        jb.jarvis_speak(f"Minimum Frequency is {psutil.cpu_freq().min:.2f}Mega Hertz")

        jb.jarvis_speak("Now my Manufacturer details")
        c = wmi.WMI()
        my_sys = c.Win32_ComputerSystem()[0]
        jb.jarvis_speak(f"Manufacturer is {my_sys.Manufacturer}")
        jb.jarvis_speak(f"Model is {my_sys.Model}")
        jb.jarvis_speak(f"Name is {my_sys.Name}")
        jb.jarvis_speak(f"Number of Processors are {my_sys.NumberOfProcessors}")
        jb.jarvis_speak(f"System type is {my_sys.SystemType}")
        jb.jarvis_speak(f"System Family is  {my_sys.SystemFamily}")

    elif 'shutdown' in voice_data:
        jb.jarvis_speak("Shutting down in 15 seconds")
        os.system("shutdown /s /t 15")
        exit()

    elif 'search' in voice_data:
        search = jb.record_audio("What are you looking for?")
        url = "https://google.com/search?q=" + search
        webbrowser.get().open(url)
        jb.jarvis_speak("Here is what I have found for " + search)
    
    elif 'find location' in voice_data:
        location = jb.record_audio("Which location are you looking for")
        url = "https://google.nl/maps/place/" + location + "/&amp;"
        webbrowser.get().open(url)
        jb.jarvis_speak("Here is the location of " + location)

    elif 'exit' in voice_data:
        jb.jarvis_speak("Thank you")
        exit()
    elif 'wait' in voice_data:
        while True:
            voice2 = jb.record_audio()
            voice = voice2.lower()
            try:

                if "jarvis" in voice:
                    jb.jarvis_speak("Alright then")
                    break

            except Exception:
                if "jarvis" in voice:
                    jb.jarvis_speak("Alright then")
                    break
                else:
                    respond("wait")
    else:
        jb.jarvis_speak(random.choice(jb.choices))
    
            