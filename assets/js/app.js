// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"
const YTPlayer = require('yt-player')

let Hooks = {}
Hooks.MusicHook = {
  mounted() {
    let music_id = this.el.getAttribute('music_id')
    const player = new YTPlayer('#player')
    player.load(music_id, true)
    player.setVolume(100)
    player.on('playing', () => {
      console.log(player.getDuration()) // => 351.521
    })
    player.on('ended', () => {
        console.log('Fetch next track')
    })
    player.play()
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
liveSocket.connect()

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"


//<iframe width="560" height="315" src="https://www.youtube.com/embed/<%= @music_id %>?enablejsapi=1&rel=0&playsinline=1&autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> %>
  // 2. This code loads the IFrame Player API code asynchronously.

