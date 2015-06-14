# hubot-auto-reverse-lookup
[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage Status][coveralls-image]][coveralls-url]

Reverse DNS lookups automatically.

See [`src/auto-reverse-lookup.coffee`](src/auto-reverse-lookup.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-auto-reverse-lookup --save`

Then add **hubot-auto-reverse-lookup** to your `external-scripts.json`:

```json
["hubot-auto-reverse-lookup"]
```

## Sample Interaction

```
user1>> hubot hello
hubot>> hello!
```

[npm-url]: https://npmjs.org/package/hubot-auto-reverse-lookup
[npm-image]: http://img.shields.io/npm/v/hubot-auto-reverse-lookup.svg?style=flat
[travis-url]: https://travis-ci.org/Hideki IGARASHI/hubot-auto-reverse-lookup
[travis-image]: http://img.shields.io/travis/Hideki IGARASHI/hubot-auto-reverse-lookup/master.svg?style=flat
[daviddm-url]: https://david-dm.org/Hideki IGARASHI/hubot-auto-reverse-lookup.svg?theme=shields.io
[daviddm-image]: http://img.shields.io/david/Hideki IGARASHI/hubot-auto-reverse-lookup.svg?style=flat
[coveralls-url]: https://coveralls.io/r/Hideki IGARASHI/hubot-auto-reverse-lookup
[coveralls-image]: http://img.shields.io/coveralls/Hideki IGARASHI/hubot-auto-reverse-lookup/master.svg?style=flat
