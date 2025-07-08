import yt_dlp

# Replace with your YouTube video URL
video_url = input("Enter the YouTube video URL: ").strip()

# Specify output directory
output_directory = r"C:\Users\mikke\OneDrive - Aarhus universitet\Musik"

# Configure yt-dlp options for audio-only download
ydl_opts = {
    'format': 'bestaudio/best',  # Download best audio
    'outtmpl': f'{output_directory}/%(title)s.%(ext)s',  # Output filename
    'postprocessors': [{
        'key': 'FFmpegExtractAudio',
        'preferredcodec': 'm4a',  # Change to 'mp3' if you prefer MP3 format
        'preferredquality': '192',  # Adjust bitrate as needed
    }],
    'verbose': False  # Show detailed logs
}

try:
    # Download and extract audio
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        print(f"Downloading audio from: {video_url}")
        ydl.download([video_url])
        print(f"Download complete! File saved to: {output_directory}")

except Exception as e:
    print(f"An error occurred: {e}")
