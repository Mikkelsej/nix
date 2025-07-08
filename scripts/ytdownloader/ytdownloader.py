import yt_dlp

# Replace with your YouTube video URL
video_url = input("Enter the YouTube video URL: ").strip()

# Specify output directory
output_directory = r"C:\Users\mikke\OneDrive - Aarhus universitet\Midlertidige filer"

# Configure yt-dlp options
ydl_opts = {
    'format': 'bv+ba',  # Best video + best audio
    'merge_output_format': 'mp4',  # Ensure final output is MP4
    'outtmpl': f'{output_directory}/%(title)s.%(ext)s',  # Output filename
    'verbose': False  # Show detailed logs
}

try:
    # Download and merge video/audio
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        print(f"Downloading video from: {video_url}")
        ydl.download([video_url])
        print(f"Download complete! File saved to: {output_directory}")

except Exception as e:
    print(f"An error occurred: {e}")
