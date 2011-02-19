
{apiXY} = require 'tafa-misc-util'


module.exports = (app) ->
  
  s = app.storage = {
    misc: 'redis'
    file_chunks: 'kvr'
  }
  
  app.get '/', (req, res, next) ->
    res.render 'index'
  
  app.get '/api/v0.1/foo.js', apiXY, (req, res, next) ->
    s.misc.incr 'numCalls', (e, r) ->
      res.api {
        foo: 'bar'
        num_calls: r
      }

