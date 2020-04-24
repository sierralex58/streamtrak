# Stream to icecast with ffmpeg
# Alexandre Masson/16.4.20
#
# you should find DShow device name by:
#   ffmpeg.exe -list_devices true -f dshow -i dummy

# Input device on macOS
# setup a default device at System Preferences > Sound > Input
input="avfoundation"

# [VIDEO:AUDIO]
device=":0.0"

# Stereo needs 2 channels ;-)
channels=2

#host
url="djlex.ch:8000/video.ts"

#username
username=***REMOVED***

#password
password=***REMOVED***


#--------------------------------------------------------------------------------

# List all MAC OS devices
$FFMPEG_HOME/ffmpeg -f $input -list_devices true -i ""

#$FFMPEG_HOME/ffmpeg -f $input -list_formats all -i ""

echo "---------------------------------------------------------------------------"

while true
do


#$FFMPEG_HOME/ffmpeg -video_size 640x480 -framerate 30 -f $input -i $device -f webm -r 25 -s 1280x800 -cluster_size_limit 2M -cluster_time_limit 5100 -content_type video/webm -c:v libvpx -b:v 1M  -threads 4 icecast://$username:$password@$url
$FFMPEG_HOME/ffmpeg -f $input -i $device \
  -f mpegts -s 320x420 -content_type video/m2ts \
  -c:a aac -b:a 240K \
  -vcodec libx264 -b:v 2.5M  \
    icecast://$username:$password@$url

  exit

$FFMPEG_HOME/ffmpeg -i ./DJI_0359_neu.mp4 \
  -f webm -cluster_size_limit 2M -cluster_time_limit 5100 -content_type video/webm \
  -vf scale=1280:-1 -r 30 -ac 2 \
  -acodec libopus -b:a 64K \
  -vcodec libvpx -b:v 2.5M -crf 30 -g 150 -deadline realtime -threads 8 \
    icecast://$username:$password@$url

  exit

  $FFMPEG_HOME/ffmpeg -i ./DJI_0359_neu.mp4 \
  -f mpeg -cluster_size_limit 2M -cluster_time_limit 5100 -content_type video/mpeg \
  -vf scale=1280:-1 -r 30 -ac 2 \
  -acodec libopus -b:a 64K \
  -vcodec libvpx -b:v 2.5M -crf 30 -g 150 -deadline realtime -threads 8 \
    icecast://$username:$password@$url

  exit

$FFMPEG_HOME/ffmpeg \
  -video_size 640x480 -framerate 30 -f $input -i $device \
  -f webm -cluster_size_limit 2M -cluster_time_limit 5100 -content_type video/webm \
  -c:a libvorbis -b:a 96K \
  -c:v libvpx -b:v 1.5M -crf 30 -g 150 -deadline good -threads 8 \
    icecast://$username:$password@$url

exit

$FFMPEG_HOME/ffmpeg -f $input -i $device \
        -acodec libopus -b:a 64k \
        -vcodec libvpx -b:v 500K -crf 25 -content_type video/webm \
        -loop 365 \
    icecast://$username:$password@$url

exit

$FFMPEG_HOME/ffmpeg -f $input \
    -i $device \
  -f webm -cluster_size_limit 2M -cluster_time_limit 5100 -content_type video/webm \
  -vf scale=1280:-1 -r 30 -ac 2 \
  -acodec libopus -b:a 96K \
  -vcodec libvpx -b:v 2.5M -crf 30 -g 150 -deadline realtime -threads 8 \
    icecast://$username:$password@$url

 exit

$FFMPEG_HOME/ffmpeg \
    -f -video_size 640x480 -framerate 30 \
    -f $input \
    -i $device \
    -f webm -r 30 -s 1280x800 -content_type video/webm \
    -filter:a "volume=6dB" \
    -c:a libopus -b:a 96K \
    -c:v libvpx -b:v 1.5M -crf 30 -g 150 -deadline good -threads 4 \
	  -ac $channels \
    icecast://$username:$password@$url
  sleep 1
done
