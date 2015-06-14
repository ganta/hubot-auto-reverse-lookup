# Description:
#   Reverse DNS lookups automatically.
#
# Configuration:
#   None
#
# Commands:
#   <IPv4 Address> - Reverse DNS lookups automatically for given address
#
# Author:
#   Hideki IGARASHI <hideki.develop@gmail.com>

dns = require 'dns'

module.exports = (robot) ->

  robot.hear /((?:(?:25[0-5]|2[0-4]\d|1?\d{1,2})\.){3}(?:25[0-5]|2[0-4]\d|1?\d{1,2}))/, (res) ->
    ipv4addr = res.match[1]

    dns.reverse ipv4addr, (err, hostname) ->
      if err
        res.send "Cannot resolve #{ipv4addr}: #{err}"
        return

      res.send "#{ipv4addr} -> #{hostname}"
