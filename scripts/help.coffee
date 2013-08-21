# Description:
#   Generates help commands for Hubot.
#
# Commands:
#   hubot help - Displays all of the help commands that Hubot knows about.
#   hubot help <query> - Displays all help commands that match <query>.
#
# URLS:
#   /
#
# Notes:
#   These commands are grabbed from comment blocks at the top of each file.

helpContents = (name, commands) ->

  """
<html>
  <head>
  <title>#{name} Help</title>
  <style type="text/css">
    /* https://raw.github.com/necolas/normalize.css/77982e20d82421b4303a5eee4afa224ea371e978/normalize.css */
    article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block;}audio,canvas,video{display:inline-block;}audio:not([controls]){display:none;height:0;}[hidden],template{display:none;}html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;}body{margin:0;}a{background:transparent;}a:focus{outline:thin dotted;}a:active,a:hover{outline:0;}h1{font-size:2em;margin:0.67em 0;}abbr[title]{border-bottom:1px dotted;}b,strong{font-weight:bold;}dfn{font-style:italic;}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0;}mark{background:#ff0;color:#000;}code,kbd,pre,samp{font-family:monospace,serif;font-size:1em;}pre{white-space:pre-wrap;}q{quotes:"\201C" "\201D" "\2018" "\2019";}small{font-size:80%;}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline;}sup{top:-0.5em;}sub{bottom:-0.25em;}img{border:0;}svg:not(:root){overflow:hidden;}figure{margin:0;}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em;}legend{border:0;padding:0;}button,input,select,textarea{font-family:inherit;font-size:100%;margin:0;}button,input{line-height:normal;}button,select{text-transform:none;}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}button[disabled],html input[disabled]{cursor:default;}input[type="checkbox"],input[type="radio"]{box-sizing:border-box;padding:0;}input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box;}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none;}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0;}textarea{overflow:auto;vertical-align:top;}table{border-collapse:collapse;border-spacing:0;}
    body {
      background: #d3d6d9;
      color: #636c75;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      padding: 10px 50px 0px;
      text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
    }
    h1 {
      color: #f1863b;
      margin: 8px 0;
      padding: 0;
    }
    .commands {
      font-size: 13px;
    }
    ul {
      -webkit-margin-before: 0;
      -webkit-padding-start: 0;
      list-style: none;
      margin: 6px 0 0 0;
      padding-bottom: 5px;
    }
    li {
      margin: 6px 0 0;      
    }
    li:hover {
      -webkit-transition: background .5s ease-out;
      background: #eee;
    }
  </style>
  </head>
  <body>
    <h1>#{name} Help</h1>
    <ul class="commands">
      #{commands}
    </ul>
    <script>(function(G,o,O,g,l){G.GoogleAnalyticsObject=O;G[O]||(G[O]=function(){(G[O].q=G[O].q||[]).push(arguments)});G[O].l=+new Date;g=o.createElement('script'),l=o.scripts[0];g.src='//www.google-analytics.com/analytics.js';l.parentNode.insertBefore(g,l)}(this,document,'ga'));ga('create','UA-36161240-2', 'empathybot.herokuapp.com');ga('send','pageview')</script>
  </body>
</html>
  """

module.exports = (robot) ->
  robot.respond /help\s*(.*)?$/i, (msg) ->
    
    # cmds = robot.helpCommands()
    #
    # if msg.match[1]
    #   cmds = cmds.filter (cmd) ->
    #     cmd.match new RegExp(msg.match[1], 'i')

    emit = "please visit http://empathybot.herokuapp.com/ for a list of valid commands"

    # unless robot.name.toLowerCase() is 'hubot'
    #   emit = emit.replace /hubot/ig, robot.name

    msg.send emit

  robot.router.get '/', (req, res) ->
    # fixing <user> getting gobbled up by browsers
    # via https://github.com/github/hubot/commit/91d75738708a1236b47c3876a40a89f221a5d522#L0R70
    cmds = robot.helpCommands().map (cmd) ->
      cmd.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;')
    
    emit = "<li>#{cmds.join '</li><li>'}</li>"

    emit = emit.replace /hubot/ig, "<b>#{robot.name}</b>"

    res.setHeader 'content-type', 'text/html'
    res.end helpContents robot.name, emit
