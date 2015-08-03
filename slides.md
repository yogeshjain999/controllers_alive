# Controller's Alive
||
# Intro ???
||
![office](/assets/work.jpg)
||
# streaming
*/ˈstriːmɪŋ/*
*a continuous flow of data or instructions*
||
# types of streaming
- Server Sent Events
- WebSockets
||
![SSE vs WebSocket](/assets/fight.png)
||
# ???
- uni-directional or bi-directional
- full duplex
- implementation
- automatic re-connection and event-id
||
![node.js](/assets/node.png)
![tornado](/assets/tornado.png)
![jetty](/assets/jetty.png)
##### .
##### .
##### .
##### and more
||
# ???
![rails](/assets/rails.png)
||
![tenderlove](/assets/instagram.png)
||
#### ``` include ActionController::Live ```
||
#### ``` response.stream.write ```
#### ``` response.stream.close ```
||
# *<blockquote>this is not a HTTP streaming of Rails</blockquote>*
||
#### ``` render stream: true ```
||
# *<blockquote>Rails uses Server Sent Events over WebSockets</blockquote>*
||
#### ``` var source = new EventSource('/stream') ```
#### ``` source.addEventListener(event, function(){}) ```
||
# *all set, but which server to use ??*
||
# expectations
- it should be either multi-processed or multi-threaded
- it should not buffer the response
||
![puma](/assets/puma.png)
![thin](/assets/thin.gif)
![passenger](/assets/passenger.png)
![unicorn](/assets/unicorn.png)
||
# *<blockquote>great power comes with little limitations too...</blockquote>*
- every action in controller have live streaming object
- lookout for deadlocks
- closing the connection
- might get trouble on Heroku
||
# workarounds
- faye/faye
- igrigorik/em-websocket
||
# *<blockquote>an example is better than thousand words...</blockquote>*
||
# **```self```**
||
<video id="player" class="video-js vjs-default-skin" src="/player" controls preload="none" width="inherit" height="inherit" data-setup='{ "children": { "controlBar": false } }'></video>
||
# **thank you**
||
