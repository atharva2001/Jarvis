#Jarvis Learns that is it put the user said string to db and its answer too.
import jarvis_brain as jb
import jarvis_respond as jr
import mysql.connector as mc

def learn(voice_data):
    conn = mc.connect(host='localhost', user='root', password='', database='jarvis')
    jb.jarvis_speak("What Shall I do For this, Type in!")
    print(voice_data)
    ans = input("Type Here : ")
    db = conn.cursor()
    db.execute("INSERT INTO `brain`(`question`, `answer`) VALUES ('"+voice_data+"', '"+ans+"')")
    conn.commit()