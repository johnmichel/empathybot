# Description:
#   (In)famous EL quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   empathy quote - displays a random quote
#
# Author:
#   ccheselske

quotes = [
  "Lorem ipsum - Craig",
  "Dolor sit amet - Lee"
]

module.exports = (robot) ->
  robot.respond /quote/i, (msg) ->
    msg.send msg.random quotes
