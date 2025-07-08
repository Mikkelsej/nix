import os
import subprocess
import time
import pyautogui
# from datetime import datetime


# Path to check
path = r"C:\Users\mikke\OneDrive - Aarhus universitet\Midlertidige filer"
files = os.listdir(path)

# right_time = False
# current_time = datetime.now().strftime("%H:%M:%S")
# current_hour = datetime.now().hour
# if current_hour >= 17 or current_hour <= 7:  
#    right_time = True

if len(files) > 0:
    input("There are files in the folder. Press Enter to continue.")
    path2 = r"C:\Users\mikke\OneDrive - Aarhus universitet\My Vault"
    pyautogui.hotkey('ctrl', 'win', 'd')     # Create a new desktop

    subprocess.run(["explorer", path2])  # Open the second folder
    time.sleep(1)
    pyautogui.hotkey('win', 'left')     # Resize window to the left
    subprocess.run(["explorer", path])   # Open the target folder
    time.sleep(1)
    pyautogui.hotkey('win', 'right')    # Resize window to the right
    pyautogui.hotkey('alt', 'tab')      # Switch to the first window
