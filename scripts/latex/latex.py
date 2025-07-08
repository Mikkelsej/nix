import os
import shutil
import subprocess
import time
import pyautogui
import sys
import pygetwindow as gw

# Get the filename from the command line argument
tex_name = sys.argv[1]

base_dir = r"C:\Users\mikke\OneDrive - Aarhus universitet\Midlertidige filer\Latex"  # Path to the base directory
packages_file = r"C:\Users\mikke\OneDrive - Aarhus universitet\Latex-Skabeloner\packages.tex"  # Path to packages.tex
frontpage_file = r"C:\Users\mikke\OneDrive - Aarhus universitet\Latex-Skabeloner\frontpage.tex"  # Path to frontpage.tex

tex_folder = os.path.join(base_dir, tex_name)

# Check if the folder already exists
i = 1
while os.path.exists(tex_folder):
    tex_folder += f"_{i}"
    i += 1

# Create the new folder
os.makedirs(tex_folder)

# Path to the new LaTeX file
tex_file_path = os.path.join(tex_folder, tex_name + ".tex")

# Path to the copied packages file
new_packages_file = os.path.join(tex_folder, "packages.tex")

# Path to the copied frontpage file
new_frontpage_file = os.path.join(tex_folder, "frontpage.tex")

# Copy packages.tex to the new folder
shutil.copy(packages_file, new_packages_file)

# Copy and update frontpage.tex
with open(frontpage_file, "r", encoding="utf-8") as f:
    frontpage_content = f.read()

# Replace 'TEMP' with the filename
frontpage_content = frontpage_content.replace("TEMP", tex_name)

# Write the updated frontpage.tex to the new folder
with open(new_frontpage_file, "w", encoding="utf-8") as f:
    f.write(frontpage_content)

# Create and write to the LaTeX file
with open(tex_file_path, "w", encoding="utf-8") as tex_file:
    tex_file.write(r"\documentclass{article}" + "\n")
    tex_file.write(r"\input{packages.tex}" + "\n")
    tex_file.write(r"\begin{document}" + "\n")
    tex_file.write(r"\input{frontpage.tex}" + "\n\n")
    tex_file.write(r"\end{document}" + "\n")

# Open the folder in Visual Studio Code (asynchronously)
subprocess.Popen(f'code -n "{tex_folder}"', shell=True, cwd=tex_folder)
time.sleep(0.5)
subprocess.Popen(f'code -r -g "{tex_file_path}:5"', shell=True, cwd=tex_folder)

# Wait for VSCode to open (adjust time.sleep to ensure it's fully loaded)
time.sleep(2)  # Adjust this based on how long it takes for VSCode to load

# Ensure the window is maximized
window = gw.getWindowsWithTitle("Visual Studio Code")[0]
window.maximize()

# Optionally, trigger the hotkey after opening VSCode
time.sleep(0.1)
pyautogui.FAILSAFE = False
pyautogui.hotkey("ctrl", "alt", "v",)
pyautogui.hotkey("ctrl", "b") 
time.sleep(10)

# Exit the Python script, completing the process
subprocess.Popen("exit", shell=True)
sys.exit()