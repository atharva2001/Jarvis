#This Module records and makes Jarvis speak it contains greetings for
import speech_recognition as sr
import playsound
import os
import random
from gtts import gTTS
import os.path


r = sr.Recognizer()
choices = [
        "It is certain.", "It is decidedly so.", "Without a doubt.",
        "Yes - definitely.", "You may rely on it.", "As I see it, yes.",
        "Most likely.", "Outlook good.", "Yes.", "Signs point to yes.",
        "Reply hazy, try again.", "Ask again later.",
        "Better not tell you now.", "Cannot predict now.",
        "Concentrate and ask again.", "Don't count on it.",
        "My reply is no.", "My sources say no.", "Outlook not so good.",
        "Very doubtful."
    ]

startup = [
        "Hey there!", "Hola Amigo.", "Welcome back.", "Where have you been?",
        "So long!", "Say something."
    ]

record = [
        "I am here to help you.", "This is just a start.", "I am all ears.",
        "I am Listening", "I am your Jinn.", "Keep going boss."
    ]

    

def jarvis_speak(audio_string):
    tts = gTTS(text=audio_string, lang='en', tld='co.in', slow=False)
    r = random.randint(1, 10000000)
    audio_file = "Sound/audio-" + str(r) + ".mp3"
    tts.save(audio_file)
    playsound.playsound(audio_file)
    print(audio_string)
    os.remove(audio_file)

def record_audio(ask=False):
    with sr.Microphone() as source:
        if ask:
            jarvis_speak(ask)
        r.adjust_for_ambient_noise(source, duration=1)
        audio = r.listen(source)
        voice_data = " "
        try:
            voice_data = r.recognize_google(audio)
            print(voice_data)

        except sr.UnknownValueError:
            pass
            #jarvis_speak(random.choice(choices))
            
        except sr.RequestError as e:
            jarvis_speak(random.choice(choices))

        voice_data2 = voice_data.lower()
        return voice_data2




