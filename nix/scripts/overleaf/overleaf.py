import os
import shutil
import sys
import subprocess
import time

# Get the filename from the command line argument
tex_name = sys.argv[1]

base_dir = r"C:\Users\mikke\OneDrive - Aarhus universitet\Midlertidige filer"  # Path to the base directory
packages_file = r"C:\Users\mikke\OneDrive - Aarhus universitet\Latex-Skabeloner\packages.tex"  # Path to packages.tex
frontpage_file = r"C:\Users\mikke\OneDrive - Aarhus universitet\Latex-Skabeloner\frontpage.tex"  # Path to frontpage.tex

tex_folder = os.path.join(base_dir, tex_name)

# Ensure unique folder name
i = 1
while os.path.exists(tex_folder):
    tex_folder = os.path.join(base_dir, f"{tex_name}_{i}")
    i += 1

# Create the new folder
os.makedirs(tex_folder)

# Define file paths
tex_file_path = os.path.join(tex_folder, tex_name + ".tex")
new_packages_file = os.path.join(tex_folder, "packages.tex")
new_frontpage_file = os.path.join(tex_folder, "frontpage.tex")

# Copy packages.tex
shutil.copy(packages_file, new_packages_file)

# Copy and update frontpage.tex
with open(frontpage_file, "r", encoding="utf-8") as f:
    frontpage_content = f.read()

# Replace placeholder with filename
frontpage_content = frontpage_content.replace("TEMP", tex_name)

# Save updated frontpage.tex
with open(new_frontpage_file, "w", encoding="utf-8") as f:
    f.write(frontpage_content)

# Create and write the LaTeX file
with open(tex_file_path, "w", encoding="utf-8") as tex_file:
    tex_file.write(r"\documentclass{article}" + "\n")
    tex_file.write(r"\input{packages.tex}" + "\n")
    tex_file.write(r"\begin{document}" + "\n")
    tex_file.write(r"\input{frontpage.tex}" + "\n\n")
    tex_file.write(r"\end{document}" + "\n")

# Create a ZIP file
zip_path = tex_folder + ".zip"
shutil.make_archive(tex_folder, 'zip', tex_folder)

# Open the ZIP file in File Explorer
subprocess.Popen(f'explorer /select,"{zip_path}"', shell=True)

print(f"Project created and zipped at: {zip_path}")
