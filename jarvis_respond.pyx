#This module responds to the user input
import jarvis_brain as jb
import jarvis_learns as jl
import mysql.connector as mc
import webbrowser
import urllib.request

def respond(voice_data):
    conn = mc.connect(host='localhost', user='root', password='', database='jarvis')
    total_words = 0
    voice_data2 = voice_data.lower()
    db = conn.cursor()
    db.execute("SELECT * FROM `brain` WHERE 1")
    myresult = db.fetchall()
    user_words = voice_data2.split()
    x = 0
    for i in myresult:
        if i is not None:
            c = 0
            for j in range(0, len(user_words)):
                for k in range(0, len(i[1].split())):
                    try:
                        if i[1].split()[k] == user_words[j]:
                            c += 1
                    except Exception as e:
                        continue 
            if (c/(len(i[1].split())))*100 >= 60.0:
                x = 1
                jb.jarvis_speak(i[2])
                if 'search' in i[2]:
                    url = "https://google.com/search?q=" + i[1]
                    webbrowser.get().open(url)
                    jb.jarvis_speak("Here is what I have found for " + i[1])
                break
    if x == 0:
        jb.jarvis_speak("This is new! Shall I learn it or not?")
        voice = jb.record_audio()
        voice = voice.lower()
        if "yes" in voice:
            jl.learn(voice_data2)
        else:
            jb.jarvis_speak("I think I should not!")
        
            
    
            