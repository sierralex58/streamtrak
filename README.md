# streamtrak (traktor s4 to icecast)
Stream audio to icecast directly from Traktor S4, using ffmpeg mp3-encoding (or which ever you want).

I found it a little painful, that traktor only uses ogg/vorbis codec to stream to icecast. With ffmpeg you can stream mp3, which can be played on every webbrowser, without any player or extension (html5 I belive).

Tested on Traktor S4 MKIII. Prerequisites:
- Define channel C for live input
- Connect chinch from master output to input c on the backside of the S4
- DO NOT press the EXT-button next to the channels gain knob
- Connect mic to the D channel and configre for live input
- press shift-ext to enable mic preamp
- create config.ini for icecast, url, username, password
- check index of avfoundation (see output of this command) and change to traktors e.g. :1
- start StreamFromS4
- enjoy

Audio-only works pretty well, while I still have not manged to make the video work.


