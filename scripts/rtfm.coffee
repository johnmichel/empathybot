# Description:
#   Link to common reference material on the Intarwebs
#
# Commands:
#   !js
#   empathy js
#   empathy javascript
#   !css
#   empathy css
#   !html
#   empathy html
#
# Notes:
#   PLEASE ADD TO THIS.

js = 'MDN Javascript Reference | https://developer.mozilla.org/en-US/docs/JavaScript/Reference'
css = 'MDN CSS Reference | https://developer.mozilla.org/en-US/docs/CSS/CSS_Reference'
html = 'WHATWG HTML5 Spec | http://developers.whatwg.org'

module.exports = (robot) ->
  robot.hear /!js/i, (msg) ->
    msg.send js

  robot.respond /(ja[w|v]ascript(s)?|js)/i, (msg) ->
    msg.send js

  robot.hear /!css/i, (msg) ->
    msg.send css

  robot.respond /css/i, (msg) ->
    msg.send css

  robot.hear /!html/i, (msg) ->
    msg.send html

  robot.respond /html/i, (msg) ->
    msg.send html

