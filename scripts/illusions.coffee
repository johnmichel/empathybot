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
  robot.respond /\b(magic|illusion)\b/i, (message) ->
    message.reply "No, they're illusions http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/Gob.gif"
