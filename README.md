# hubot-auto-reverse-lookup

Reverse DNS lookups automatically.

See [`src/auto-reverse-lookup.coffee`](src/auto-reverse-lookup.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install --save https://github.com/ganta/hubot-auto-reverse-lookup/tarball/v1.0.1`

Then add **hubot-auto-reverse-lookup** to your `external-scripts.json`:

```json
["hubot-auto-reverse-lookup"]
```

## Sample Interaction

```
user1>> Configure your network settings to use the IP addresses 8.8.8.8 as your DNS servers.
hubot>> 8.8.8.8 -> google-public-dns-a.google.com
```
