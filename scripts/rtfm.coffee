# Description:
#   Link to useful reference material on the Intarwebs
#
# Commands:
#   !css <search term>
#   !html <search term>
#   !js <search term>
#   !dom <search term>
#   !jquery <search term>
#   !php <search term>
#   !python <search term>
#
# Notes:
#   PLEASE ADD TO THIS.

sources =
  css: 'http://dochub.io/#css/',
  html: 'http://dochub.io/#html/',
  js: 'http://dochub.io/#javascript/',
  dom: 'http://dochub.io/#dom/',
  jquery: 'http://dochub.io/#jquery/',
  php: 'http://dochub.io/#php/',
  python: 'http://dochub.io/#python/'

module.exports = (robot) ->
  for key in sources
    query = sources[key] + key

    hearPattern = new RegExp('(!' + key + ')(.*)?', 'i')
    robot.hear hearPattern, (msg) ->
      msg.send query

    respondPattern = new RegExp('(' + key + ')(.*)?', 'i')
    robot.respond respondPattern, (msg) ->
      msg.send query
