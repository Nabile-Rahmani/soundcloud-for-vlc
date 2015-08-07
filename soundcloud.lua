-- SoundCloud for VLC.

--[[

The MIT License (MIT)

Copyright (c) 2015 Nabile Rahmani

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]

local json = require("dkjson")

function probe()
    return vlc.access:match("http[s]?") and string.match(vlc.path:match("([^/]+)"), "soundcloud.com")
end

function parse()
    local response = json.decode(vlc.stream(vlc.access .. "://api.soundcloud.com/resolve?url=" .. vlc.access .. "://" .. vlc.path .. "&_status_code_map[302]=200&_status_format=json&client_id=YOUR_CLIENT_ID"):readline())
    local data = json.decode(vlc.stream(response.location):readline())
    local url = data.downloadable and data.download_url or data.stream_url

    return { { path = url .. "?client_id=YOUR_CLIENT_ID", name = data.user.username .. " - " .. data.title, title = data.title, artist = data.user.username, genre = data.genre, description = data.description, date = data.created_at, arturl = data.artwork_url } }
end
