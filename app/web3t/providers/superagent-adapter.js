// Generated by LiveScript 1.6.0
(function(){
  var fetch, tor, stringify, jsonParse, jsonStringify, asCallback, formEncoded, getBody, makeBody, getType, makeCrossApi, makeTorApi, makeApi, post, get, put, cb;
  fetch = require('cross-fetch');
  tor = require('tor-request');
  stringify = require('qs').stringify;
  /*
  var tr = require('tor-request');
  tr.request('https://api.ipify.org', function (err, res, body) {
    if (!err && res.statusCode == 200) {
      console.log("Your public (through Tor) IP is: " + body);
    }
  });
  */
  jsonParse = function(text, cb){
    var err;
    try {
      return cb(null, JSON.parse(text));
    } catch (e$) {
      err = e$;
      return cb(err);
    }
  };
  jsonStringify = function(model, cb){
    var err;
    try {
      return cb(null, JSON.stringify(model));
    } catch (e$) {
      err = e$;
      return cb(err);
    }
  };
  asCallback = function(p, cb){
    p['catch'](function(err){
      return cb(err);
    });
    return p.then(function(data){
      return cb(null, data);
    });
  };
  formEncoded = function(data, cb){
    var res;
    res = stringify(data);
    return cb(null, res);
  };
  getBody = function(headers, data, cb){
    if (headers["Content-Type"] === "application/json") {
      return jsonStringify(data, cb);
    }
    if (headers["Content-Type"] === "application/x-www-form-urlencoded") {
      return formEncoded(data, cb);
    }
    return cb("header " + headers['Content-Type'] + " is not supported");
  };
  makeBody = function(method, headers, data, cb){
    if (method !== 'POST' && method !== 'PUT') {
      return cb(null);
    }
    return getBody(headers, data, function(err, body){
      if (err != null) {
        return cb(err);
      }
      return cb(null, {
        method: method,
        body: body,
        headers: headers
      });
    });
  };
  getType = function(type){
    switch (false) {
    case type !== "application/json":
      return "application/json";
    case type !== "json":
      return "application/json";
    case type !== "form":
      return "application/x-www-form-urlencoded";
    default:
      return type;
    }
  };
  makeCrossApi = function(method){
    return function(url, data){
      var $, headers;
      $ = {};
      headers = {
        "Content-Type": "application/json"
      };
      $.type = function(type){
        return headers["Content-Type"] = getType(type);
      };
      $.timeout = function(timeout){
        $._timeout = timeout;
        return $;
      };
      $.set = function(header, value){
        headers[header] = value;
        return $;
      };
      $.end = function(cb){
        var realData;
        realData = data != null
          ? data
          : {};
        return makeBody(method, headers, realData, function(err, body){
          var p;
          if (err != null) {
            return cb(err);
          }
          p = fetch(url, body);
          return asCallback(p, function(err, data){
            if (err != null) {
              return cb(err);
            }
            if (data == null) {
              return cb("expected data");
            }
            return asCallback(data.text(), function(err, text){
              if (err != null) {
                return cb(err);
              }
              return jsonParse(text, function(err, body){
                cb(null, {
                  body: body,
                  text: text
                });
                return $;
              });
            });
          });
        });
      };
      return $;
    };
  };
  window.torrequest = tor.request;
  makeTorApi = function(method){
    return function(url, data){
      var $, headers;
      $ = {};
      headers = {
        "Content-Type": "application/json"
      };
      $.type = function(type){
        return headers["Content-Type"] = getType(type);
      };
      $.timeout = function(timeout){
        $._timeout = timeout;
        return $;
      };
      $.set = function(header, value){
        headers[header] = value;
        return $;
      };
      $.end = function(cb){
        var realData;
        realData = data != null
          ? data
          : {};
        return makeBody(method, headers, realData, function(err, body){
          if (err != null) {
            return cb(err);
          }
          return tor.request(url, body, function(err, res, text){
            return jsonParse(text, function(err, body){
              cb(null, {
                body: body,
                text: text
              });
              return $;
            });
          });
        });
      };
      return $;
    };
  };
  makeApi = (function(){
    switch (false) {
    case !((typeof window != 'undefined' && window !== null ? window.location.href.indexOf('tor') : void 8) > -1):
      return makeTorApi;
    default:
      return makeCrossApi;
    }
  }());
  console.log('tor', typeof window != 'undefined' && window !== null ? window.location.href.indexOf('tor') : void 8);
  post = makeApi('POST');
  get = makeApi('GET');
  put = makeApi('PUT');
  module.exports = {
    get: get,
    post: post,
    put: put
  };
  cb = console.log;
}).call(this);
