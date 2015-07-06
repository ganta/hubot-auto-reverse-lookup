# Description:
#   Reverse DNS lookups automatically.
#
# Commands:
#   <IPv4 Address> - Reverse DNS lookups automatically for given address
#
# Author:
#   Hideki IGARASHI <hideki.develop@gmail.com>

dns = require 'dns'
ip = require 'ip'

includeNetwork = (subnet, address) ->
  longAddress = ip.toLong address
  ip.toLong(subnet.firstAddress) - 1 <= longAddress && longAddress <= ip.toLong(subnet.lastAddress) + 1

#
# RFC 1122: Current network (only valid as source address)
#
isCurrentNetwork = (address) ->
  includeNetwork ip.cidrSubnet('0.0.0.0/8'), address

#
# RFC 1918: Private address
#
isPrivateNetwork = (address) ->
  includeNetwork(ip.cidrSubnet('10.0.0.0/8'),     address) ||
  includeNetwork(ip.cidrSubnet('172.16.0.0/12'),  address) ||
  includeNetwork(ip.cidrSubnet('192.168.0.0/16'), address)

#
# RFC 6598: ISP Shared Address
#
isISPSharedAddress = (address) ->
  includeNetwork ip.cidrSubnet('100.64.0.0/10'), address

#
# RFC 1122: Local host address
#
isLocalHostAddress = (address) ->
  includeNetwork ip.cidrSubnet('127.0.0.0/8'), address

#
# RFC 3927: Link local address (for APIPA)
#
isLinkLocalAddress = (address) ->
  includeNetwork ip.cidrSubnet('169.254.0.0/16'), address

#
# RFC 5736: IETF Protocol Assignments
#
isIETFProtocolAssignmentsAddress = (address) ->
  includeNetwork ip.cidrSubnet('192.0.0.0/24'), address

isReservedAddress = (address) ->
  checkFunctions = [
    isCurrentNetwork
    isPrivateNetwork
    isISPSharedAddress
    isLocalHostAddress
    isLinkLocalAddress
    isIETFProtocolAssignmentsAddress
  ]

  for checker in checkFunctions
    if checker(address)
      return true


module.exports = (robot) ->

  robot.hear /((?:(?:25[0-5]|2[0-4]\d|1?\d{1,2})\.){3}(?:25[0-5]|2[0-4]\d|1?\d{1,2}))/, (res) ->
    ipv4addr = res.match[1]

    if isReservedAddress ipv4addr
      return

    dns.reverse ipv4addr, (err, hostname) ->
      if err
        res.send "#{ipv4addr} cannot be resolved: #{err}"
        return

      res.send "#{ipv4addr} -> #{hostname}"
