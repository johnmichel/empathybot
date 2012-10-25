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
    body {
      background: #d3d6d9;
      color: #636c75;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      padidng: 10px 50px 0px;
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
    p {
      border-bottom: 1px solid #eee;
      margin: 6px 0 0 0;
      padding-bottom: 5px;
    }
    p:last-child {
      border: 0;
    }
  </style>
  </head>
  <body>
    <h1>#{name} Help</h1>
    <div class="commands">
      #{commands}
    </div>
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
    cmds = robot.helpCommands()
    emit = "<p>#{cmds.join '</p><p>'}</p>"

    emit = emit.replace /hubot/ig, "<b>#{robot.name}</b>"

    res.setHeader 'content-type', 'text/html'
    res.end helpContents robot.name, emit
