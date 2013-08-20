# Description:
#   Illusions
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   illusion - Teach them about magic
#
# Notes:
#   Based on atmos's `bees` script
# 
# Author:
#   johnmichel

module.exports = (robot) ->
  robot.hear /\b(magic|illusion|trick)\b/i, (message) ->
    message.reply "No, they're illusions http://f.cl.ly/items/2W3u3F1g0a290G3C1f0p/gob.gif"
