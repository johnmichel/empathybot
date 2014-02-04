# A basic mdn lookup
#
# js <mdn-tag> - Searches MDN using tags. Example: js addEventListener
https = require 'https'

# The mdn host
mdnHost = 'developer.mozilla.org'

# Extracts the first link from a page
extractFirstLinkFromPage = (page) ->
  match = /<a href="([^"]+)".+<br\/>/.exec page
  match[1] if match

# Builds an absolute link
buildAbsoluteLink = (linkPart) ->
  "https://#{mdnHost}#{linkPart}"

# Performs an HTTP request to look a term using the tags page
lookup = (term, cb) ->
  callback = (response) ->
    str = ''
    response.on 'data', (chunk) ->
      str += chunk
    response.on 'end', ->
      cb str

  options =
    host: mdnHost,
    path: "/en-US/docs/tag/#{term}"

  console.log "Http request with options: #{options.path}"
  https.request(options, callback).end()

# Transforms the term from a full message
extractTerm = (msg) ->
  msg

# Extracts a human readable message from an HTML page
extractDefinitionFromPage = (page) ->
  link = extractFirstLinkFromPage page
  buildAbsoluteLink extractFirstLinkFromPage page if link

# Returns a message for when the term is not found
notFoundMessage = (term) ->
  "Could not find term: #{term}"

# Defines the term
define = (term, cb) ->
  lookup term, (page) ->
    info = extractDefinitionFromPage page
    if info
      cb info
    else
      cb notFoundMessage term

# Searchs for a term using MDN tags and returns the link of the result if availableu
mdnMe = (msg, cb) ->
  console.log "Extracting term from message #{msg}"
  term = extractTerm msg
  console.log "Looking up #{term}"
  if term
    define term, cb
  else
    cb notFoundMessage term

module.exports = (robot) ->
  robot.respond /js +(\w+)/i, (msg) ->
    console.log "Full message: #{msg}"
    mdnMe msg.match[1], (info) ->
      msg.send info

