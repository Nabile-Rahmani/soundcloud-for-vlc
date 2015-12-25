# SoundCloud for VLC #
* * *
SoundCloud for VLC is a playlist plugin for VLC that parses SoundCloud URLs.

The plugin will automatically select the highest audio quality for playback.

## Installation instructions ##

To install the plugin, [download soundcloud.lua](https://bitbucket.org/Nabile/soundcloud-for-vlc/raw/master/soundcloud.lua) and place it into `%VLC install dir%\lua\playlist`.

## Usage ##

* Open a VLC instance.
* Paste or drag and drop a SoundCloud URL.

## WARNING ##

It seems like SoundCloud fixed their dummy client ID. You may need to sign up with your account, ask for an API key and replace all instances of `YOUR_CLIENT_ID` in the code with yours.

## Credits ##

Thanks to scandinavian_ for the following StackOverflow answer describing how to fetch SoundCloud track information: https://stackoverflow.com/questions/17892702/how-has-soundcloud-hidden-the-url-of-streaming-audio/17892881#17892881.
