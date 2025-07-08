import os

path = "C:/Users/mikke/OneDrive - Aarhus Universitet/Privat/Private - Obsidian/Self Improvement/Videos/Videos/"
videos = os.listdir(path)

# MD files are in the Superfolder to path
md_files = os.listdir(path + "../")

# Check that for each video there is a corresponding MD file
# Remember to remove the mp4 extension
# If there isnt a MD file for that video, create one
# Have to first line be the title of the video in the format ![[video.mp4]]
for video in videos:
    if video[:-4] + ".md" not in md_files:
        with open(path + "../" + video[:-4] + ".md", "w", encoding="utf-8") as file:
            file.write("![[{}]]".format(video))
            file.write("\n\n")
            file.write("# Notes")
            file.write("\n\n")
        print("Created file for {}".format(video[:-4]))

md_files = os.listdir(path + "../")
if len(videos) >= len(md_files)+1:
    input("There are more videos than MD files. Press enter to continue.")
