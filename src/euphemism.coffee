# Description:
#   Have a little fun with euphemisms
#
# Dependencies:
#   "cheerio": "x"
#
# Commands:
#   hubot euphemism me - Goes to the Euphemism Generator and picks up a fresh euphemism.
#
# Author:
#   mattroyer
#
cheerio = require("cheerio")

module.exports = (robot) ->
  robot.respond /(euphemism|euph)( me)?/i, (msg) ->
    robot.http('http://toykeeper.net/programs/mad/euphemisms')
      .get() (err, res, body) ->
        $ = cheerio.load(body)
        mine = $('blockquote').first().text().trim()
        msg.send mine
