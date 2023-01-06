// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
import "./user_socket.js"
// Establish Phoenix Socket and LiveView configuration.
import {Socket, Presence} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})
let socket = new Socket("/socket", {params: {token: window.userToken}})
// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.delayedShow(200))
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

window.addEventListener(`phx:spin`, (e) => {
  let el = document.getElementById(e.detail.id)
  if(el) {
    liveSocket.execJS(el, el.getAttribute("data-spin"))
  }
})

let channel = socket.channel("room:lobby", {name: window.location.search.split("=")[1]})
let presence = new Presence(channel)

function renderOnlineUsers(presence) {
  let response = ""
  presence.list((id, {metas: [first, ...rest]}) => {
    let count = rest.length + 1
    response += `|${id}| `
  })
  document.querySelector("#currentusers").innerHTML = response
}
// connect if there are any LiveViews on the page
liveSocket.connect()
socket.connect()
presence.onSync(() => renderOnlineUsers(presence))
channel.join()
// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
window.socket = socket
