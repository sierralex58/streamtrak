# Stream to icecast with ffmpeg
# Alexandre Masson/16.4.20
#
# you should find DShow device name by:
#   ffmpeg.exe -list_devices true -f dshow -i dummy
input="dshow"

# Input device on macOS
# setup a default device at System Preferences > Sound > Input
input="avfoundation"

# [VIDEO:AUDIO]
device=":0"

# Stereo needs 2 channels ;-)
channels=2

#host
url="djlex.ch:8000/stream"

#username
username=***REMOVED***

#password
password=***REMOVED***

#--------------------------------------------------------------------------------

# List all MAC OS devices
$FFMPEG_HOME/ffmpeg -f $input -list_devices true -i ""

echo "---------------------------------------------------------------------------"
# loop forever. increase volume by 2 dB, stream-quality 2, mp3 converter
while true
do
$FFMPEG_HOME/ffmpeg \
    -f $input \
    -i $device \
    -filter:a "volume=2dB" \
    -codec:a libmp3lame \
    -q:a 2 \
    -f mp3 \
    -content_type audio/mpeg \
	-ac $channels \
    icecast://$username:$password@$url
  sleep 1
done

