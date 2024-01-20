<!DOCTYPE html>
<html class="
">
  <head>
    <meta name="wechat-enable-text-zoom-em" content="true">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="color-scheme" content="light dark">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover">
<link rel="shortcut icon" type="image/x-icon" href="//res.wx.qq.com/a/wx_fed/assets/res/NTI4MWU5.ico" reportloaderror>
<link rel="mask-icon" href="//res.wx.qq.com/a/wx_fed/assets/res/MjliNWVm.svg" color="#4C4C4C" reportloaderror>
<link rel="apple-touch-icon-precomposed" href="//res.wx.qq.com/a/wx_fed/assets/res/OTE0YTAw.png" reportloaderror>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="referrer" content="origin-when-cross-origin">
<meta name="referrer" content="strict-origin-when-cross-origin">
<script  nonce="1415253946" reportloaderror>try{document.getElementsByTagName('html').item(0).style.webkitTextSizeAdjust=JSON.parse(window.__wxWebEnv.getEnv()).fontScale+'%'}catch(e){}</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>
  window.logs = { pagetime: {} };
  window.logs.pagetime['html_begin'] = (+new Date());
  window.LANG = "zh_CN";
</script>

    <script type="text/javascript" nonce="1415253946" reportloaderror>
  
  
  var WX_BJ_REPORT = window.WX_BJ_REPORT || {};
  (function(_) {
    if (_.BadJs) {
      return;
    }
   
    var BADJS_WIN_ERR = 'BadjsWindowError';
    var extend = function(source, destination) {
      for (var property in destination) {
        source[property] = destination[property]
      }
      return source
    }
    
    _.BadJs = {
      uin: 0,
      mid: "",
      view: "wap",
      _cache: {},
      _info: {},
      _hookCallback: null,
      ignorePath: true,
      throw: function(e, extData) {
        this.onError(e, extData);
        throw e;
      },
     
     
      onError: function(e, extData) {
        try {
         
          if (e.BADJS_EXCUTED == true) {
            return;
          }
          e.BADJS_EXCUTED = true;
          var data = errToData(e);
          data.uin = this.uin;
          data.mid = this.mid;
          data.view = this.view;
          data.cmdb_module = 'mmbizwap';
         
          if (!!extData) {
            data = extend(data, extData);
          }
         
          if (data.cid) {
            data.key = "[" + data.cid + "]:" + data.key;
          }
          
          if (data._info) {
            if (Object.prototype.toString.call(data._info) == "[object Object]") {
              data.msg += " || info:" + JSON.stringify(data._info);
            } else if (Object.prototype.toString.call(data._info) == "[object String]") {
              data.msg += " || info:" + data._info;
            } else {
              data.msg += " || info:" + data._info;
            }
          }
          if (typeof this._hookCallback == "function") {
            if (this._hookCallback(data) === false) {
              return
            }
          }
          this._send(data);
          return _.BadJs;
        } catch (e) {
          console.error(e);
        }
      },
      winErr: function(event) {
        if (event.error && event.error.BADJS_EXCUTED) {
          return;
        }
        if (event.type === 'unhandledrejection') {
          _.BadJs.onError(createError(event.type, event.reason, "", "", "", event.reason));
        }else{
          _.BadJs.onError(createError(BADJS_WIN_ERR, event.message, event.filename, event.lineno, event.colno, event.error));
        }
      },
      init: function(uin, mid, view) {
        this.uin = uin || this.uin;
        this.mid = mid || this.mid;
        this.view = view || this.view;
        return _.BadJs;
      },
     
      hook: function(fn) {
        this._hookCallback = fn;
        return _.BadJs;
      },
      _send: function(data) {
       
        if (!data.mid) {
          if (typeof window.PAGE_MID !== 'undefined' && window.PAGE_MID) {
            data.mid = window.PAGE_MID;
          } else {
            return;
          }
        }
        if (!data.uin) {
          data.uin = window.user_uin || 0;
        }
       
        var flag = [data.mid, data.name, data.key].join("|");
        if (this._cache && this._cache[flag]) {
          return
        } else {
          this._cache && (this._cache[flag] = true);
          this._xhr(data);
        }
        return _.BadJs;
      },
      _xhr: function(data) {
       
        var xmlobj;
        if (window.ActiveXObject) {
          try {
            xmlobj = new ActiveXObject("Msxml2.XMLHTTP");
          } catch (e) {
            try {
              xmlobj = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (E) {
              xmlobj = false;
            }
          }
        } else if (window.XMLHttpRequest) {
          xmlobj = new XMLHttpRequest();
        }
        var param = "";
        for (var key in data) {
          if (key && data[key]) {
            param += [key, "=", encodeURIComponent(data[key]), "&"].join("");
          }
        }
        if (xmlobj && typeof xmlobj.open == "function") {
          xmlobj.open("POST", "https://badjs.weixinbridge.com/report", true);
          xmlobj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
          xmlobj.onreadystatechange = function(status) {};
          xmlobj.send(param.slice(0, -1));
        } else {
          var img = new Image();
          img.src = "https://badjs.weixinbridge.com/report?" + param;
        }
      },
     
      report: function(name, key, data) {
        this.onError(createError(name, key), data);
        return this;
      },
     
      mark: function(info) {
        this._info = extend(this._info, info);
      },
      nocache: function() {
        this._cache = false;
        return _.BadJs;
      }
    }
    function createError(name, msg, url, line, col, error) {
      return {
        name: name || "",
        message: msg || "",
        file: url || "",
        line: line || "",
        col: col || "",
        stack: (error && error.stack) || "",
      }
    }
   
    
    function errToData(e) {
      var _stack = parseStack(e);
      return {
        name: e.name,
        key: e.message,
        msg: e.message,
        stack: _stack.info,
        file: _stack.file,
        line: _stack.line,
        col: _stack.col,
        client_version: "",
        _info: e._info
      }
    }
    function parseStack(e) {
      e._info = e._info || "";
      var stack = e.stack || "";
      var _stack = {
        info: stack,
        file: e.file || "",
        line: e.line || "",
        col: e.col || "",
      };
      if (_stack.file == "") {
       
        var stackArr = stack.split(/\bat\b/);
        if (stackArr && stackArr[1]) {
          var match = /(https?:\/\/[^\n]+)\:(\d+)\:(\d+)/.exec(stackArr[1]);
          if (match) {
           
            if (match[1] && match[1] != _stack.file) {
              _stack.file && (e._info += " [file: " + _stack.file + " ]");
              _stack.file = match[1];
            }
            if (match[2] && match[2] != _stack.line) {
              _stack.line && (e._info += " [line: " + _stack.line + " ]");
              _stack.line = match[2];
            }
            if (match[3] && match[3] != _stack.col) {
              _stack.col && (e._info += " [col: " + _stack.col + " ]");
              _stack.col = match[3];
            }
          }
        }
      }
     
      if (_stack && _stack.file && _stack.file.length > 0) {
        _stack.info = _stack.info.replace(new RegExp(_stack.file.split("?")[0], "gi"), "__FILE__")
      }
     
      if (_.BadJs.ignorePath) {
        _stack.info = _stack.info.replace(/http(s)?\:[^:\n]*\//ig, "").replace(/\n/gi, "");
      }
      return _stack;
    }
   
    window.addEventListener && window.addEventListener('error', _.BadJs.winErr);
    window.addEventListener && window.addEventListener('unhandledrejection', _.BadJs.winErr);
    return _.BadJs;
  })(WX_BJ_REPORT);
  window.WX_BJ_REPORT = WX_BJ_REPORT;
  
  function __moonf__() {
    if (window.__moonhasinit) return;
    window.__moonhasinit = true;
    window.__moonclientlog = [];
    if (typeof JSON != "object") {
      window.JSON = {
        stringify: function() { return ""; },
        parse: function() { return {}; }
      };
    }
    var moon_init = function() {
      
      (function() {
        var inWx = (/MicroMessenger/i).test(navigator.userAgent);
        var inMp = (/MPAPP/i).test(navigator.userAgent);
        var _idkey = 121261;
        var _startKey;
        var _limit;
        var _badjsId;
        var _reportOpt;
        var _extInfo;
        var MOON_AJAX_NETWORK_OFFSET = 4;
        window.__initCatch = function(opt) {
          _idkey = opt.idkey;
          _startKey = opt.startKey || 0;
          _limit = opt.limit;
          _badjsId = opt.badjsId;
          _reportOpt = opt.reportOpt || "";
          _extInfo = opt.extInfo || {};
          _extInfo.rate = _extInfo.rate || 0.5;
        }
       
        window.__moon_report = function(array, rate_opt) {
          var isAcrossOrigin = false;
          var href = '';
          try {
            href = top.location.href;
          } catch (e) {
            isAcrossOrigin = true;
          }
          var rate = 0.5;
          if (!!_extInfo && !!_extInfo.rate) {
            rate = _extInfo.rate;
          }
          if (!!rate_opt && (typeof rate_opt == 'number')) {
            rate = rate_opt;
          }
          if (
            (!(/mp\.weixin\.qq\.com/).test(location.href) && !(/payapp\.weixin\.qq\.com/).test(location.href)) ||
            Math.random() > rate ||
            !(inWx || inMp) ||
            (top != window && !isAcrossOrigin && !(/mp\.weixin\.qq\.com/).test(href))
          ) {
           
          }
          if (isObject(array))
            array = [array];
          if (!isArray(array) || _idkey == '')
            return;
          var data = "";
          var log = [];
          var key = [];
          var val = [];
          var idkey = [];
         
          if (typeof _limit != "number") {
            _limit = Infinity;
          }
          for (var i = 0; i < array.length; i++) {
            var item = array[i] || {};
            if (item.offset > _limit) continue;
            if (typeof item.offset != "number") continue;
            if (item.offset == MOON_AJAX_NETWORK_OFFSET && !!_extInfo && !!_extInfo.network_rate && Math.random() >= _extInfo.network_rate) {
              continue;
            }
           
            var k = _limit == Infinity ? _startKey : (_startKey + item.offset);
            log[i] = (("[moon]" + _idkey + "_" + k + ";") + item.log + ";" + getErrorMessage(item.e || {})) || "";
            key[i] = k;
            val[i] = 1;
          }
          for (var j = 0; j < key.length; j++) {
            idkey[j] = _idkey + "_" + key[j] + "_" + val[j];
            data = data + "&log" + j + "=" + log[j];
          }
          if (idkey.length > 0) {
           
            sendReport("POST", location.protocol + '//mp.weixin.qq.com/mp/jsmonitor?', "idkey=" + idkey.join(";") + "&r=" + Math.random() + "&lc=" + log.length + data);
           
           
            var rate = 1;
            if (_extInfo && _extInfo.badjs_rate) {
              rate = _extInfo.badjs_rate;
            }
            if (Math.random() < rate) {
              data = data.replace(/uin\:(.)*\|biz\:(.)*\|mid\:(.)*\|idx\:(.)*\|sn\:(.)*\|/, '');
              if(!!_badjsId){
                var _img = new Image();
                var _src = 'https://badjs.weixinbridge.com/badjs?id=' + _badjsId + '&level=4&from=' + encodeURIComponent(location.host) + '&msg=' + encodeURIComponent(data);
                _img.src = _src.slice(0, 1024);
              }
             
              if (typeof WX_BJ_REPORT != "undefined" && WX_BJ_REPORT.BadJs) {
                for (var i = 0; i < array.length; i++) {
                  var item = array[i] || {};
                  if (item.e) {
                    WX_BJ_REPORT.BadJs.onError(item.e,{_info:item.log});
                  } else {
                    var name = /[^:;]*/.exec(item.log)[0];
                    WX_BJ_REPORT.BadJs.report(name, item.log, { mid: "mmbizwap:Monitor" });
                  }
                }
              }
            } else {
             
              for (var i = 0; i < array.length; i++) {
                var item = array[i] || {};
                if (item.e) {
                  item.e.BADJS_EXCUTED = true;
                }
              }
            }
          }
        }
        function isArray(obj) {
          return Object.prototype.toString.call(obj) === '[object Array]';
        }
        function isObject(obj) {
          return Object.prototype.toString.call(obj) === '[object Object]';
        }
        function getErrorMessage(e) {
          var stack = e.stack + ' ' + e.toString() || "";
          try {
           
            if (!window.testenv_reshost) {
              stack = stack.replace(/http(s)?:\/\/res\.wx\.qq\.com/g, "");
            } else {
              var host = 'http(s)?://' + window.testenv_reshost;
              var reg = new RegExp(host, 'g');
              stack = stack.replace(reg, "");
            }
           
            var reg = /\/([^.]+)\/js\/(\S+?)\.js(\,|:)?/g;
            while (reg.test(stack)) {
             
              stack = stack.replace(reg, function(a, b, c, d, e, f) {
                return c + d
              });
            }
          } catch (e) {
            stack = e.stack ? e.stack : ""
          }
          var ret = [];
          for (o in _reportOpt) {
            if (_reportOpt.hasOwnProperty(o)) {
              ret.push(o + ":" + _reportOpt[o]);
            }
          }
          ret.push("STK:" + stack.replace(/\n/g, ""));
          return ret.join("|");
        }
        function sendReport(type, url, data) {
          if (!/^mp\.weixin\.qq\.com$/.test(location.hostname)) {
            var tmp = [];
            data = data.replace(location.href, (location.origin || "") + (location.pathname || "")).replace("#wechat_redirect", "").replace("#rd", "").split("&");
            for (var i = 0, il = data.length; i < il; i++) {
              var a = data[i].split("=");
              if (!!a[0] && !!a[1]) {
                tmp.push(a[0] + "=" + encodeURIComponent(a[1]));
              }
            }
            var _img = new window.Image();
            _img.src = (url + tmp.join("&")).substr(0, 1024);
            return;
          }
          var xmlobj;
          if (window.ActiveXObject) {
            try {
              xmlobj = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
              try {
                xmlobj = new ActiveXObject("Microsoft.XMLHTTP");
              } catch (E) {
                xmlobj = false;
              }
            }
          } else if (window.XMLHttpRequest) {
            xmlobj = new XMLHttpRequest();
          }
          if (!xmlobj) return;
         
          xmlobj.open(type, url, true);
          xmlobj.setRequestHeader("cache-control", "no-cache");
          xmlobj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
          xmlobj.setRequestHeader("X-Requested-With", "XMLHttpRequest");
          xmlobj.send(data);
        }

      })();
     
    };
    moon_init();
   
    (!!window.__moon_initcallback) && (window.__moon_initcallback());
  }
 
 
 
 
  __moonf__();
  
  if (!!window.addEventListener){
    window.addEventListener("load",function(){
      var MOON_SCRIPT_ERROR_KEY_OFFSET = 1;
      var ns = document.querySelectorAll("[reportloaderror]");
      for(var ni=0,nl=ns.length;ni<nl;ni++)
        ns[ni].onerror=function(ev){
          window.__moon_report([{ offset: MOON_SCRIPT_ERROR_KEY_OFFSET, log: "load_script_error:" + ev.target.src, e: new Error('LoadResError') }], 1);
          window.WX_BJ_REPORT.BadJs.report("load_script_error", ev.target.src, { mid: "mmbizwap:Monitor" });
        };
    });
  }
  </script>
   
    

  
  <meta name="description" content="Fixed effects." />
  <meta name="author" content="胜风" />

  
  <meta property="og:title" content="固定效应: 目前看到解释的最清楚的帖子, 救命！" />
  <meta property="og:url" content="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448105671&amp;idx=1&amp;sn=576f76eacf5b7b5e5d6363bcf724dd35&amp;chksm=b322fde9845574ff438ab0b44c98ef59f428bab28dd9fd9dacb4d220053dd8025d07defe9668#rd" />
  <meta property="og:image" content="https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6aaVIYOglm663vuWGms49uCXryia8dKluBQAr4TiaDLHibunzpaic7Z68ZSA/0?wx_fmt=jpeg" />
  <meta property="og:description" content="Fixed effects." />
  <meta property="og:site_name" content="微信公众平台" />
  <meta property="og:type" content="article" />
  <meta property="og:article:author" content="胜风" />

  
  <meta property="twitter:card" content="summary" />
  <meta property="twitter:image" content="https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6aaVIYOglm663vuWGms49uCXryia8dKluBQAr4TiaDLHibunzpaic7Z68ZSA/0?wx_fmt=jpeg" />
  <meta property="twitter:title" content="固定效应: 目前看到解释的最清楚的帖子, 救命！" />
  <meta property="twitter:creator" content="胜风" />
  <meta property="twitter:site" content="微信公众平台" />
  <meta property="twitter:description" content="Fixed effects." />


    <title></title>
    <script  nonce="1415253946" reportloaderror>
    (() => {
     
      const ua = navigator.userAgent;
      const noMobile = !(/(iPhone|iPad|iPod|iOS)/i.test(ua) || /Windows\sPhone/i.test(ua) || /(Android)/i.test(ua));
      setTimeout(() => {
        noMobile && document.title === '' && (document.title = '微信公众平台');
      }, 1000);
    })();
    </script>
    

<script h5only type="text/javascript" nonce="1415253946" reportloaderror>(function(e,t){"object"===typeof exports&&"object"===typeof module?module.exports=t():"function"===typeof define&&define.amd?define([],t):"object"===typeof exports?exports["weEmoji"]=t():e["weEmoji"]=t()})("undefined"!==typeof self?self:this,(function(){return function(e){var t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={i:r,l:!1,exports:{}};return e[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}return n.m=e,n.c=t,n.d=function(e,t,r){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},n.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(r,o,function(t){return e[t]}.bind(null,o));return r},n.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s="fb15")}({"00ee":function(e,t,n){var r=n("b622"),o=r("toStringTag"),i={};i[o]="z",e.exports="[object z]"===String(i)},"0366":function(e,t,n){var r=n("1c0b");e.exports=function(e,t,n){if(r(e),void 0===t)return e;switch(n){case 0:return function(){return e.call(t)};case 1:return function(n){return e.call(t,n)};case 2:return function(n,r){return e.call(t,n,r)};case 3:return function(n,r,o){return e.call(t,n,r,o)}}return function(){return e.apply(t,arguments)}}},"057f":function(e,t,n){var r=n("fc6a"),o=n("241c").f,i={}.toString,s="object"==typeof window&&window&&Object.getOwnPropertyNames?Object.getOwnPropertyNames(window):[],a=function(e){try{return o(e)}catch(t){return s.slice()}};e.exports.f=function(e){return s&&"[object Window]"==i.call(e)?a(e):o(r(e))}},"06cf":function(e,t,n){var r=n("83ab"),o=n("d1e7"),i=n("5c6c"),s=n("fc6a"),a=n("c04e"),c=n("5135"),u=n("0cfb"),p=Object.getOwnPropertyDescriptor;t.f=r?p:function(e,t){if(e=s(e),t=a(t,!0),u)try{return p(e,t)}catch(n){}if(c(e,t))return i(!o.f.call(e,t),e[t])}},"07ac":function(e,t,n){var r=n("23e7"),o=n("6f53").values;r({target:"Object",stat:!0},{values:function(e){return o(e)}})},"0cb2":function(e,t,n){var r=n("7b0b"),o=Math.floor,i="".replace,s=/\$([$&'`]|\d{1,2}|<[^>]*>)/g,a=/\$([$&'`]|\d{1,2})/g;e.exports=function(e,t,n,c,u,p){var f=n+e.length,l=c.length,h=a;return void 0!==u&&(u=r(u),h=s),i.call(p,h,(function(r,i){var s;switch(i.charAt(0)){case"$":return"$";case"&":return e;case"`":return t.slice(0,n);case"'":return t.slice(f);case"<":s=u[i.slice(1,-1)];break;default:var a=+i;if(0===a)return r;if(a>l){var p=o(a/10);return 0===p?r:p<=l?void 0===c[p-1]?i.charAt(1):c[p-1]+i.charAt(1):r}s=c[a-1]}return void 0===s?"":s}))}},"0cfb":function(e,t,n){var r=n("83ab"),o=n("d039"),i=n("cc12");e.exports=!r&&!o((function(){return 7!=Object.defineProperty(i("div"),"a",{get:function(){return 7}}).a}))},"13d5":function(e,t,n){"use strict";var r=n("23e7"),o=n("d58f").left,i=n("a640"),s=n("2d00"),a=n("605d"),c=i("reduce"),u=!a&&s>79&&s<83;r({target:"Array",proto:!0,forced:!c||u},{reduce:function(e){return o(this,e,arguments.length,arguments.length>1?arguments[1]:void 0)}})},"14c3":function(e,t,n){var r=n("c6b6"),o=n("9263");e.exports=function(e,t){var n=e.exec;if("function"===typeof n){var i=n.call(e,t);if("object"!==typeof i)throw TypeError("RegExp exec method returned something other than an Object or null");return i}if("RegExp"!==r(e))throw TypeError("RegExp#exec called on incompatible receiver");return o.call(e,t)}},"159b":function(e,t,n){var r=n("da84"),o=n("fdbc"),i=n("17c2"),s=n("9112");for(var a in o){var c=r[a],u=c&&c.prototype;if(u&&u.forEach!==i)try{s(u,"forEach",i)}catch(p){u.forEach=i}}},"17c2":function(e,t,n){"use strict";var r=n("b727").forEach,o=n("a640"),i=o("forEach");e.exports=i?[].forEach:function(e){return r(this,e,arguments.length>1?arguments[1]:void 0)}},"1be4":function(e,t,n){var r=n("d066");e.exports=r("document","documentElement")},"1c0b":function(e,t){e.exports=function(e){if("function"!=typeof e)throw TypeError(String(e)+" is not a function");return e}},"1c7e":function(e,t,n){var r=n("b622"),o=r("iterator"),i=!1;try{var s=0,a={next:function(){return{done:!!s++}},return:function(){i=!0}};a[o]=function(){return this},Array.from(a,(function(){throw 2}))}catch(c){}e.exports=function(e,t){if(!t&&!i)return!1;var n=!1;try{var r={};r[o]=function(){return{next:function(){return{done:n=!0}}}},e(r)}catch(c){}return n}},"1d80":function(e,t){e.exports=function(e){if(void 0==e)throw TypeError("Can't call method on "+e);return e}},"1dde":function(e,t,n){var r=n("d039"),o=n("b622"),i=n("2d00"),s=o("species");e.exports=function(e){return i>=51||!r((function(){var t=[],n=t.constructor={};return n[s]=function(){return{foo:1}},1!==t[e](Boolean).foo}))}},"23cb":function(e,t,n){var r=n("a691"),o=Math.max,i=Math.min;e.exports=function(e,t){var n=r(e);return n<0?o(n+t,0):i(n,t)}},"23e7":function(e,t,n){var r=n("da84"),o=n("06cf").f,i=n("9112"),s=n("6eeb"),a=n("ce4e"),c=n("e893"),u=n("94ca");e.exports=function(e,t){var n,p,f,l,h,d,y=e.target,x=e.global,m=e.stat;if(p=x?r:m?r[y]||a(y,{}):(r[y]||{}).prototype,p)for(f in t){if(h=t[f],e.noTargetGet?(d=o(p,f),l=d&&d.value):l=p[f],n=u(x?f:y+(m?".":"#")+f,e.forced),!n&&void 0!==l){if(typeof h===typeof l)continue;c(h,l)}(e.sham||l&&l.sham)&&i(h,"sham",!0),s(p,f,h,e)}}},"241c":function(e,t,n){var r=n("ca84"),o=n("7839"),i=o.concat("length","prototype");t.f=Object.getOwnPropertyNames||function(e){return r(e,i)}},"25f0":function(e,t,n){"use strict";var r=n("6eeb"),o=n("825a"),i=n("d039"),s=n("ad6d"),a="toString",c=RegExp.prototype,u=c[a],p=i((function(){return"/a/b"!=u.call({source:"a",flags:"b"})})),f=u.name!=a;(p||f)&&r(RegExp.prototype,a,(function(){var e=o(this),t=String(e.source),n=e.flags,r=String(void 0===n&&e instanceof RegExp&&!("flags"in c)?s.call(e):n);return"/"+t+"/"+r}),{unsafe:!0})},2626:function(e,t,n){"use strict";var r=n("d066"),o=n("9bf2"),i=n("b622"),s=n("83ab"),a=i("species");e.exports=function(e){var t=r(e),n=o.f;s&&t&&!t[a]&&n(t,a,{configurable:!0,get:function(){return this}})}},"2a62":function(e,t,n){var r=n("825a");e.exports=function(e){var t=e["return"];if(void 0!==t)return r(t.call(e)).value}},"2d00":function(e,t,n){var r,o,i=n("da84"),s=n("342f"),a=i.process,c=a&&a.versions,u=c&&c.v8;u?(r=u.split("."),o=r[0]+r[1]):s&&(r=s.match(/Edge\/(\d+)/),(!r||r[1]>=74)&&(r=s.match(/Chrome\/(\d+)/),r&&(o=r[1]))),e.exports=o&&+o},"342f":function(e,t,n){var r=n("d066");e.exports=r("navigator","userAgent")||""},"35a1":function(e,t,n){var r=n("f5df"),o=n("3f8c"),i=n("b622"),s=i("iterator");e.exports=function(e){if(void 0!=e)return e[s]||e["@@iterator"]||o[r(e)]}},"37e8":function(e,t,n){var r=n("83ab"),o=n("9bf2"),i=n("825a"),s=n("df75");e.exports=r?Object.defineProperties:function(e,t){i(e);var n,r=s(t),a=r.length,c=0;while(a>c)o.f(e,n=r[c++],t[n]);return e}},"3bbe":function(e,t,n){var r=n("861d");e.exports=function(e){if(!r(e)&&null!==e)throw TypeError("Can't set "+String(e)+" as a prototype");return e}},"3ca3":function(e,t,n){"use strict";var r=n("6547").charAt,o=n("69f3"),i=n("7dd0"),s="String Iterator",a=o.set,c=o.getterFor(s);i(String,"String",(function(e){a(this,{type:s,string:String(e),index:0})}),(function(){var e,t=c(this),n=t.string,o=t.index;return o>=n.length?{value:void 0,done:!0}:(e=r(n,o),t.index+=e.length,{value:e,done:!1})}))},"3f8c":function(e,t){e.exports={}},"428f":function(e,t,n){var r=n("da84");e.exports=r},"44ad":function(e,t,n){var r=n("d039"),o=n("c6b6"),i="".split;e.exports=r((function(){return!Object("z").propertyIsEnumerable(0)}))?function(e){return"String"==o(e)?i.call(e,""):Object(e)}:Object},"44d2":function(e,t,n){var r=n("b622"),o=n("7c73"),i=n("9bf2"),s=r("unscopables"),a=Array.prototype;void 0==a[s]&&i.f(a,s,{configurable:!0,value:o(null)}),e.exports=function(e){a[s][e]=!0}},"44e7":function(e,t,n){var r=n("861d"),o=n("c6b6"),i=n("b622"),s=i("match");e.exports=function(e){var t;return r(e)&&(void 0!==(t=e[s])?!!t:"RegExp"==o(e))}},4930:function(e,t,n){var r=n("605d"),o=n("2d00"),i=n("d039");e.exports=!!Object.getOwnPropertySymbols&&!i((function(){return!Symbol.sham&&(r?38===o:o>37&&o<41)}))},"498a":function(e,t,n){"use strict";var r=n("23e7"),o=n("58a8").trim,i=n("c8d2");r({target:"String",proto:!0,forced:i("trim")},{trim:function(){return o(this)}})},"4d63":function(e,t,n){var r=n("83ab"),o=n("da84"),i=n("94ca"),s=n("7156"),a=n("9bf2").f,c=n("241c").f,u=n("44e7"),p=n("ad6d"),f=n("9f7f"),l=n("6eeb"),h=n("d039"),d=n("69f3").set,y=n("2626"),x=n("b622"),m=x("match"),g=o.RegExp,w=g.prototype,_=/a/g,v=/a/g,b=new g(_)!==_,E=f.UNSUPPORTED_Y,j=r&&i("RegExp",!b||E||h((function(){return v[m]=!1,g(_)!=_||g(v)==v||"/a/i"!=g(_,"i")})));if(j){var k=function(e,t){var n,r=this instanceof k,o=u(e),i=void 0===t;if(!r&&o&&e.constructor===k&&i)return e;b?o&&!i&&(e=e.source):e instanceof k&&(i&&(t=p.call(e)),e=e.source),E&&(n=!!t&&t.indexOf("y")>-1,n&&(t=t.replace(/y/g,"")));var a=s(b?new g(e,t):g(e,t),r?this:w,k);return E&&n&&d(a,{sticky:n}),a},S=function(e){e in k||a(k,e,{configurable:!0,get:function(){return g[e]},set:function(t){g[e]=t}})},O=c(g),P=0;while(O.length>P)S(O[P++]);w.constructor=k,k.prototype=w,l(o,"RegExp",k)}y("RegExp")},"4d64":function(e,t,n){var r=n("fc6a"),o=n("50c4"),i=n("23cb"),s=function(e){return function(t,n,s){var a,c=r(t),u=o(c.length),p=i(s,u);if(e&&n!=n){while(u>p)if(a=c[p++],a!=a)return!0}else for(;u>p;p++)if((e||p in c)&&c[p]===n)return e||p||0;return!e&&-1}};e.exports={includes:s(!0),indexOf:s(!1)}},"4de4":function(e,t,n){"use strict";var r=n("23e7"),o=n("b727").filter,i=n("1dde"),s=i("filter");r({target:"Array",proto:!0,forced:!s},{filter:function(e){return o(this,e,arguments.length>1?arguments[1]:void 0)}})},"4df4":function(e,t,n){"use strict";var r=n("0366"),o=n("7b0b"),i=n("9bdd"),s=n("e95a"),a=n("50c4"),c=n("8418"),u=n("35a1");e.exports=function(e){var t,n,p,f,l,h,d=o(e),y="function"==typeof this?this:Array,x=arguments.length,m=x>1?arguments[1]:void 0,g=void 0!==m,w=u(d),_=0;if(g&&(m=r(m,x>2?arguments[2]:void 0,2)),void 0==w||y==Array&&s(w))for(t=a(d.length),n=new y(t);t>_;_++)h=g?m(d[_],_):d[_],c(n,_,h);else for(f=w.call(d),l=f.next,n=new y;!(p=l.call(f)).done;_++)h=g?i(f,m,[p.value,_],!0):p.value,c(n,_,h);return n.length=_,n}},"50c4":function(e,t,n){var r=n("a691"),o=Math.min;e.exports=function(e){return e>0?o(r(e),9007199254740991):0}},5135:function(e,t){var n={}.hasOwnProperty;e.exports=function(e,t){return n.call(e,t)}},5319:function(e,t,n){"use strict";var r=n("d784"),o=n("825a"),i=n("50c4"),s=n("a691"),a=n("1d80"),c=n("8aa5"),u=n("0cb2"),p=n("14c3"),f=Math.max,l=Math.min,h=function(e){return void 0===e?e:String(e)};r("replace",2,(function(e,t,n,r){var d=r.REGEXP_REPLACE_SUBSTITUTES_UNDEFINED_CAPTURE,y=r.REPLACE_KEEPS_$0,x=d?"$":"$0";return[function(n,r){var o=a(this),i=void 0==n?void 0:n[e];return void 0!==i?i.call(n,o,r):t.call(String(o),n,r)},function(e,r){if(!d&&y||"string"===typeof r&&-1===r.indexOf(x)){var a=n(t,e,this,r);if(a.done)return a.value}var m=o(e),g=String(this),w="function"===typeof r;w||(r=String(r));var _=m.global;if(_){var v=m.unicode;m.lastIndex=0}var b=[];while(1){var E=p(m,g);if(null===E)break;if(b.push(E),!_)break;var j=String(E[0]);""===j&&(m.lastIndex=c(g,i(m.lastIndex),v))}for(var k="",S=0,O=0;O<b.length;O++){E=b[O];for(var P=String(E[0]),T=f(l(s(E.index),g.length),0),D=[],q=1;q<E.length;q++)D.push(h(E[q]));var A=E.groups;if(w){var R=[P].concat(D,T,g);void 0!==A&&R.push(A);var C=String(r.apply(void 0,R))}else C=u(P,g,T,D,A,r);T>=S&&(k+=g.slice(S,T)+C,S=T+P.length)}return k+g.slice(S)}]}))},5692:function(e,t,n){var r=n("c430"),o=n("c6cd");(e.exports=function(e,t){return o[e]||(o[e]=void 0!==t?t:{})})("versions",[]).push({version:"3.9.1",mode:r?"pure":"global",copyright:"© 2021 Denis Pushkarev (zloirock.ru)"})},"56ef":function(e,t,n){var r=n("d066"),o=n("241c"),i=n("7418"),s=n("825a");e.exports=r("Reflect","ownKeys")||function(e){var t=o.f(s(e)),n=i.f;return n?t.concat(n(e)):t}},5899:function(e,t){e.exports="\t\n\v\f\r                　\u2028\u2029\ufeff"},"58a8":function(e,t,n){var r=n("1d80"),o=n("5899"),i="["+o+"]",s=RegExp("^"+i+i+"*"),a=RegExp(i+i+"*$"),c=function(e){return function(t){var n=String(r(t));return 1&e&&(n=n.replace(s,"")),2&e&&(n=n.replace(a,"")),n}};e.exports={start:c(1),end:c(2),trim:c(3)}},"5c6c":function(e,t){e.exports=function(e,t){return{enumerable:!(1&e),configurable:!(2&e),writable:!(4&e),value:t}}},"5e96":function(e){e.exports=JSON.parse('{"a":"https://res.wx.qq.com/mpres/zh_CN/htmledition/comm_htmledition/images/pic/common/pic_blank.gif"}')},"605d":function(e,t,n){var r=n("c6b6"),o=n("da84");e.exports="process"==r(o.process)},6547:function(e,t,n){var r=n("a691"),o=n("1d80"),i=function(e){return function(t,n){var i,s,a=String(o(t)),c=r(n),u=a.length;return c<0||c>=u?e?"":void 0:(i=a.charCodeAt(c),i<55296||i>56319||c+1===u||(s=a.charCodeAt(c+1))<56320||s>57343?e?a.charAt(c):i:e?a.slice(c,c+2):s-56320+(i-55296<<10)+65536)}};e.exports={codeAt:i(!1),charAt:i(!0)}},"65f0":function(e,t,n){var r=n("861d"),o=n("e8b5"),i=n("b622"),s=i("species");e.exports=function(e,t){var n;return o(e)&&(n=e.constructor,"function"!=typeof n||n!==Array&&!o(n.prototype)?r(n)&&(n=n[s],null===n&&(n=void 0)):n=void 0),new(void 0===n?Array:n)(0===t?0:t)}},"69f3":function(e,t,n){var r,o,i,s=n("7f9a"),a=n("da84"),c=n("861d"),u=n("9112"),p=n("5135"),f=n("c6cd"),l=n("f772"),h=n("d012"),d=a.WeakMap,y=function(e){return i(e)?o(e):r(e,{})},x=function(e){return function(t){var n;if(!c(t)||(n=o(t)).type!==e)throw TypeError("Incompatible receiver, "+e+" required");return n}};if(s){var m=f.state||(f.state=new d),g=m.get,w=m.has,_=m.set;r=function(e,t){return t.facade=e,_.call(m,e,t),t},o=function(e){return g.call(m,e)||{}},i=function(e){return w.call(m,e)}}else{var v=l("state");h[v]=!0,r=function(e,t){return t.facade=e,u(e,v,t),t},o=function(e){return p(e,v)?e[v]:{}},i=function(e){return p(e,v)}}e.exports={set:r,get:o,has:i,enforce:y,getterFor:x}},"6eeb":function(e,t,n){var r=n("da84"),o=n("9112"),i=n("5135"),s=n("ce4e"),a=n("8925"),c=n("69f3"),u=c.get,p=c.enforce,f=String(String).split("String");(e.exports=function(e,t,n,a){var c,u=!!a&&!!a.unsafe,l=!!a&&!!a.enumerable,h=!!a&&!!a.noTargetGet;"function"==typeof n&&("string"!=typeof t||i(n,"name")||o(n,"name",t),c=p(n),c.source||(c.source=f.join("string"==typeof t?t:""))),e!==r?(u?!h&&e[t]&&(l=!0):delete e[t],l?e[t]=n:o(e,t,n)):l?e[t]=n:s(t,n)})(Function.prototype,"toString",(function(){return"function"==typeof this&&u(this).source||a(this)}))},"6f53":function(e,t,n){var r=n("83ab"),o=n("df75"),i=n("fc6a"),s=n("d1e7").f,a=function(e){return function(t){var n,a=i(t),c=o(a),u=c.length,p=0,f=[];while(u>p)n=c[p++],r&&!s.call(a,n)||f.push(e?[n,a[n]]:a[n]);return f}};e.exports={entries:a(!0),values:a(!1)}},7156:function(e,t,n){var r=n("861d"),o=n("d2bb");e.exports=function(e,t,n){var i,s;return o&&"function"==typeof(i=t.constructor)&&i!==n&&r(s=i.prototype)&&s!==n.prototype&&o(e,s),e}},7418:function(e,t){t.f=Object.getOwnPropertySymbols},"746f":function(e,t,n){var r=n("428f"),o=n("5135"),i=n("e538"),s=n("9bf2").f;e.exports=function(e){var t=r.Symbol||(r.Symbol={});o(t,e)||s(t,e,{value:i.f(e)})}},7839:function(e,t){e.exports=["constructor","hasOwnProperty","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","valueOf"]},"7b0b":function(e,t,n){var r=n("1d80");e.exports=function(e){return Object(r(e))}},"7c73":function(e,t,n){var r,o=n("825a"),i=n("37e8"),s=n("7839"),a=n("d012"),c=n("1be4"),u=n("cc12"),p=n("f772"),f=">",l="<",h="prototype",d="script",y=p("IE_PROTO"),x=function(){},m=function(e){return l+d+f+e+l+"/"+d+f},g=function(e){e.write(m("")),e.close();var t=e.parentWindow.Object;return e=null,t},w=function(){var e,t=u("iframe"),n="java"+d+":";return t.style.display="none",c.appendChild(t),t.src=String(n),e=t.contentWindow.document,e.open(),e.write(m("document.F=Object")),e.close(),e.F},_=function(){try{r=document.domain&&new ActiveXObject("htmlfile")}catch(t){}_=r?g(r):w();var e=s.length;while(e--)delete _[h][s[e]];return _()};a[y]=!0,e.exports=Object.create||function(e,t){var n;return null!==e?(x[h]=o(e),n=new x,x[h]=null,n[y]=e):n=_(),void 0===t?n:i(n,t)}},"7db0":function(e,t,n){"use strict";var r=n("23e7"),o=n("b727").find,i=n("44d2"),s="find",a=!0;s in[]&&Array(1)[s]((function(){a=!1})),r({target:"Array",proto:!0,forced:a},{find:function(e){return o(this,e,arguments.length>1?arguments[1]:void 0)}}),i(s)},"7dd0":function(e,t,n){"use strict";var r=n("23e7"),o=n("9ed3"),i=n("e163"),s=n("d2bb"),a=n("d44e"),c=n("9112"),u=n("6eeb"),p=n("b622"),f=n("c430"),l=n("3f8c"),h=n("ae93"),d=h.IteratorPrototype,y=h.BUGGY_SAFARI_ITERATORS,x=p("iterator"),m="keys",g="values",w="entries",_=function(){return this};e.exports=function(e,t,n,p,h,v,b){o(n,t,p);var E,j,k,S=function(e){if(e===h&&q)return q;if(!y&&e in T)return T[e];switch(e){case m:return function(){return new n(this,e)};case g:return function(){return new n(this,e)};case w:return function(){return new n(this,e)}}return function(){return new n(this)}},O=t+" Iterator",P=!1,T=e.prototype,D=T[x]||T["@@iterator"]||h&&T[h],q=!y&&D||S(h),A="Array"==t&&T.entries||D;if(A&&(E=i(A.call(new e)),d!==Object.prototype&&E.next&&(f||i(E)===d||(s?s(E,d):"function"!=typeof E[x]&&c(E,x,_)),a(E,O,!0,!0),f&&(l[O]=_))),h==g&&D&&D.name!==g&&(P=!0,q=function(){return D.call(this)}),f&&!b||T[x]===q||c(T,x,q),l[t]=q,h)if(j={values:S(g),keys:v?q:S(m),entries:S(w)},b)for(k in j)(y||P||!(k in T))&&u(T,k,j[k]);else r({target:t,proto:!0,forced:y||P},j);return j}},"7f9a":function(e,t,n){var r=n("da84"),o=n("8925"),i=r.WeakMap;e.exports="function"===typeof i&&/native code/.test(o(i))},"825a":function(e,t,n){var r=n("861d");e.exports=function(e){if(!r(e))throw TypeError(String(e)+" is not an object");return e}},"83ab":function(e,t,n){var r=n("d039");e.exports=!r((function(){return 7!=Object.defineProperty({},1,{get:function(){return 7}})[1]}))},8418:function(e,t,n){"use strict";var r=n("c04e"),o=n("9bf2"),i=n("5c6c");e.exports=function(e,t,n){var s=r(t);s in e?o.f(e,s,i(0,n)):e[s]=n}},"861d":function(e,t){e.exports=function(e){return"object"===typeof e?null!==e:"function"===typeof e}},8875:function(e,t,n){var r,o,i;(function(n,s){o=[],r=s,i="function"===typeof r?r.apply(t,o):r,void 0===i||(e.exports=i)})("undefined"!==typeof self&&self,(function(){function e(){var t=Object.getOwnPropertyDescriptor(document,"currentScript");if(!t&&"currentScript"in document&&document.currentScript)return document.currentScript;if(t&&t.get!==e&&document.currentScript)return document.currentScript;try{throw new Error}catch(h){var n,r,o,i=/.*at [^(]*\((.*):(.+):(.+)\)$/gi,s=/@([^@]*):(\d+):(\d+)\s*$/gi,a=i.exec(h.stack)||s.exec(h.stack),c=a&&a[1]||!1,u=a&&a[2]||!1,p=document.location.href.replace(document.location.hash,""),f=document.getElementsByTagName("script");c===p&&(n=document.documentElement.outerHTML,r=new RegExp("(?:[^\\n]+?\\n){0,"+(u-2)+"}[^<]*<script>([\\d\\D]*?)<\\/script>[\\d\\D]*","i"),o=n.replace(r,"$1").trim());for(var l=0;l<f.length;l++){if("interactive"===f[l].readyState)return f[l];if(f[l].src===c)return f[l];if(c===p&&f[l].innerHTML&&f[l].innerHTML.trim()===o)return f[l]}return null}}return e}))},8925:function(e,t,n){var r=n("c6cd"),o=Function.toString;"function"!=typeof r.inspectSource&&(r.inspectSource=function(e){return o.call(e)}),e.exports=r.inspectSource},"8aa5":function(e,t,n){"use strict";var r=n("6547").charAt;e.exports=function(e,t,n){return t+(n?r(e,t).length:1)}},"8c94":function(e){e.exports=JSON.parse('[{"key":"/::)","old":"/微笑","cn":"[微笑]","tw":"[微笑]","en":"[Smile]","th":"[ยิ้ม]","path":"./assets/Expression/Expression_1@2x.png","style":"we-emoji__Smile"},{"key":"/::~","old":"/撇嘴","cn":"[撇嘴]","tw":"[撇嘴]","en":"[Grimace]","th":"[หน้าบูด]","path":"./assets/Expression/Expression_2@2x.png","style":"we-emoji__Grimace"},{"key":"/::B","old":"/色","cn":"[色]","tw":"[色]","en":"[Drool]","th":"[น้ำลายไหล]","path":"./assets/Expression/Expression_3@2x.png","style":"we-emoji__Drool"},{"key":"/::|","old":"/发呆","cn":"[发呆]","tw":"[發呆]","en":"[Scowl]","th":"[หน้าบึ้ง]","path":"./assets/Expression/Expression_4@2x.png","style":"we-emoji__Scowl"},{"key":"/:8-)","old":"/得意","cn":"[得意]","tw":"[得意]","en":"[CoolGuy]","th":"[สบาย]","path":"./assets/Expression/Expression_5@2x.png","style":"we-emoji__CoolGuy"},{"key":"/::<","old":"/流泪","cn":"[流泪]","tw":"[流淚]","en":"[Sob]","th":"[ร้องไห้โฮ]","path":"./assets/Expression/Expression_6@2x.png","style":"we-emoji__Sob"},{"key":"/::$","old":"/害羞","cn":"[害羞]","tw":"[害羞]","en":"[Shy]","th":"[อาย]","path":"./assets/Expression/Expression_7@2x.png","style":"we-emoji__Shy"},{"key":"/::X","old":"/闭嘴","cn":"[闭嘴]","tw":"[閉嘴]","en":"[Silent]","th":"[ห้ามพูด]","path":"./assets/Expression/Expression_8@2x.png","style":"we-emoji__Silent"},{"key":"/::Z","old":"/睡","cn":"[睡]","tw":"[睡]","en":"[Sleep]","th":"[หลับ]","path":"./assets/Expression/Expression_9@2x.png","style":"we-emoji__Sleep"},{"key":"/::\'(","old":"/大哭","cn":"[大哭]","tw":"[大哭]","en":"[Cry]","th":"[ร้องไห้]","path":"./assets/Expression/Expression_10@2x.png","style":"we-emoji__Cry"},{"key":"/::-|","old":"/尴尬","cn":"[尴尬]","tw":"[尷尬]","en":"[Awkward]","th":"[ลำบากใจ]","path":"./assets/Expression/Expression_11@2x.png","style":"we-emoji__Awkward"},{"key":"/::@","old":"/发怒","cn":"[发怒]","tw":"[發怒]","en":"[Angry]","th":"[โกรธสุด]","path":"./assets/Expression/Expression_12@2x.png","style":"we-emoji__Angry"},{"key":"/::P","old":"/调皮","qq":"[吐舌]","cn":"[调皮]","tw":"[調皮]","en":"[Tongue]","th":"[ขยิบตา]","emoji":"😝","path":"./assets/Expression/Expression_13@2x.png","style":"we-emoji__Tongue"},{"key":"/::D","old":"/呲牙","cn":"[呲牙]","tw":"[呲牙]","en":"[Grin]","th":"[ยิ้มกว้าง]","path":"./assets/Expression/Expression_14@2x.png","style":"we-emoji__Grin"},{"key":"/::O","old":"/惊讶","cn":"[惊讶]","tw":"[驚訝]","en":"[Surprise]","th":"[ประหลาดใจ]","path":"./assets/Expression/Expression_15@2x.png","style":"we-emoji__Surprise"},{"key":"/::(","old":"/难过","cn":"[难过]","tw":"[難過]","en":"[Frown]","th":"[เสียใจ]","path":"./assets/Expression/Expression_16@2x.png","style":"we-emoji__Frown"},{"key":"/::+","old":"/酷","cn":"[酷]","tw":"[酷]","en":"[Ruthless]","th":"[เจ๋ง]","path":"./assets/Expression/Expression_17@2x.png","style":"we-emoji__Ruthless"},{"key":"/:--b","old":"/冷汗","cn":"[囧]","tw":"[囧]","en":"[Blush]","th":"[Blush]","path":"./assets/Expression/Expression_18@2x.png","style":"we-emoji__Blush"},{"key":"/::Q","old":"/抓狂","cn":"[抓狂]","tw":"[抓狂]","en":"[Scream]","th":"[กรีดร้อง]","path":"./assets/Expression/Expression_19@2x.png","style":"we-emoji__Scream"},{"key":"/::T","old":"/吐","cn":"[吐]","tw":"[吐]","en":"[Puke]","th":"[อาเจียน]","path":"./assets/Expression/Expression_20@2x.png","style":"we-emoji__Puke"},{"key":"/:,@P","old":"/偷笑","cn":"[偷笑]","tw":"[偷笑]","en":"[Chuckle]","th":"[หัวเราะหึๆ]","path":"./assets/Expression/Expression_21@2x.png","style":"we-emoji__Chuckle"},{"key":"/:,@-D","old":"/可爱","cn":"[愉快]","tw":"[愉快]","en":"[Joyful]","th":"[พอใจ]","path":"./assets/Expression/Expression_22@2x.png","style":"we-emoji__Joyful"},{"key":"/::d","old":"/白眼","cn":"[白眼]","tw":"[白眼]","en":"[Slight]","th":"[สงสัย]","path":"./assets/Expression/Expression_23@2x.png","style":"we-emoji__Slight"},{"key":"/:,@o","old":"/傲慢","cn":"[傲慢]","tw":"[傲慢]","en":"[Smug]","th":"[หยิ่ง]","path":"./assets/Expression/Expression_24@2x.png","style":"we-emoji__Smug"},{"key":"/::g","old":"/饥饿","cn":"[饥饿]","tw":"[饑餓]","en":"[Hungry]","th":"[หิว]","path":"./assets/Expression/Expression_25@2x.png","style":"we-emoji__Hungry"},{"key":"/:|-)","old":"/困","cn":"[困]","tw":"[累]","en":"[Drowsy]","th":"[ง่วงนอน]","path":"./assets/Expression/Expression_26@2x.png","style":"we-emoji__Drowsy"},{"key":"/::!","old":"/惊恐","cn":"[惊恐]","tw":"[驚恐]","en":"[Panic]","th":"[ตกใจกลัว]","path":"./assets/Expression/Expression_27@2x.png","style":"we-emoji__Panic"},{"key":"/::L","old":"/流汗","cn":"[流汗]","tw":"[流汗]","en":"[Sweat]","th":"[เหงื่อตก]","path":"./assets/Expression/Expression_28@2x.png","style":"we-emoji__Sweat"},{"key":"/::>","old":"/憨笑","cn":"[憨笑]","tw":"[大笑]","en":"[Laugh]","th":"[หัวเราะ]","path":"./assets/Expression/Expression_29@2x.png","style":"we-emoji__Laugh"},{"key":"/::,@","old":"/大兵","cn":"[悠闲]","tw":"[悠閑]","en":"[Commando]","th":"[ทหาร]","path":"./assets/Expression/Expression_30@2x.png","style":"we-emoji__Commando"},{"key":"/:,@f","old":"/奋斗","cn":"[奋斗]","tw":"[奮鬥]","en":"[Determined]","th":"[มุ่งมั่น]","path":"./assets/Expression/Expression_31@2x.png","style":"we-emoji__Determined"},{"key":"/::-S","old":"/咒骂","cn":"[咒骂]","tw":"[咒罵]","en":"[Scold]","th":"[ด่าว่าา]","path":"./assets/Expression/Expression_32@2x.png","style":"we-emoji__Scold"},{"key":"/:?","old":"/疑问","cn":"[疑问]","tw":"[疑問]","en":"[Shocked]","th":"[สับสน]","path":"./assets/Expression/Expression_33@2x.png","style":"we-emoji__Shocked"},{"key":"/:,@x","old":"/嘘","cn":"[嘘]","tw":"[噓]","en":"[Shhh]","th":"[จุ๊ๆ]","path":"./assets/Expression/Expression_34@2x.png","style":"we-emoji__Shhh"},{"key":"/:,@@","old":"/晕","cn":"[晕]","tw":"[暈]","en":"[Dizzy]","th":"[เวียนหัว]","path":"./assets/Expression/Expression_35@2x.png","style":"we-emoji__Dizzy"},{"key":"/::8","old":"/折磨","cn":"[疯了]","tw":"[瘋了]","en":"[Tormented]","th":"[ท้อแท้]","path":"./assets/Expression/Expression_36@2x.png","style":"we-emoji__Tormented"},{"key":"/:,@!","old":"/衰","cn":"[衰]","tw":"[衰]","en":"[Toasted]","th":"[ชั่วร้าย]","path":"./assets/Expression/Expression_37@2x.png","style":"we-emoji__Toasted"},{"key":"/:!!!","old":"/骷髅","cn":"[骷髅]","tw":"[骷髏頭]","en":"[Skull]","th":"[หัวกะโหลก]","path":"./assets/Expression/Expression_38@2x.png","style":"we-emoji__Skull"},{"key":"/:xx","old":"/敲打","cn":"[敲打]","tw":"[敲打]","en":"[Hammer]","th":"[ค้อนทุบ]","path":"./assets/Expression/Expression_39@2x.png","style":"we-emoji__Hammer"},{"key":"/:bye","old":"/再见","cn":"[再见]","tw":"[再見]","en":"[Wave]","th":"[บายๆ]","path":"./assets/Expression/Expression_40@2x.png","style":"we-emoji__Wave"},{"key":"/:wipe","old":"/擦汗","cn":"[擦汗]","tw":"[擦汗]","en":"[Speechless]","th":"[เช็ดเหงื่อ]","path":"./assets/Expression/Expression_41@2x.png","style":"we-emoji__Speechless"},{"key":"/:dig","old":"/抠鼻","cn":"[抠鼻]","tw":"[摳鼻]","en":"[NosePick]","th":"[แคะจมูก]","path":"./assets/Expression/Expression_42@2x.png","style":"we-emoji__NosePick"},{"key":"/:handclap","old":"/鼓掌","cn":"[鼓掌]","tw":"[鼓掌]","en":"[Clap]","th":"[ตบมือ]","path":"./assets/Expression/Expression_43@2x.png","style":"we-emoji__Clap"},{"key":"/:&-(","old":"/糗大了","cn":"[糗大了]","tw":"[羞辱]","en":"[Shame]","th":"[อับอาย]","path":"./assets/Expression/Expression_44@2x.png","style":"we-emoji__Shame"},{"key":"/:B-)","old":"/坏笑","cn":"[坏笑]","tw":"[壞笑]","en":"[Trick]","th":"[กลโกง]","path":"./assets/Expression/Expression_45@2x.png","style":"we-emoji__Trick"},{"key":"/:<@","old":"/左哼哼","cn":"[左哼哼]","tw":"[左哼哼]","en":"[Bah！L]","th":"[เชิดซ้าย]","path":"./assets/Expression/Expression_46@2x.png","style":"we-emoji__BahL"},{"key":"/:@>","old":"/右哼哼","cn":"[右哼哼]","tw":"[右哼哼]","en":"[Bah！R]","th":"[เชิดขวา]","path":"./assets/Expression/Expression_47@2x.png","style":"we-emoji__BahR"},{"key":"/::-O","old":"/哈欠","cn":"[哈欠]","tw":"[哈欠]","en":"[Yawn]","th":"[หาว]","path":"./assets/Expression/Expression_48@2x.png","style":"we-emoji__Yawn"},{"key":"/:>-|","old":"/鄙视","cn":"[鄙视]","tw":"[鄙視]","en":"[Pooh-pooh]","th":"[ดูถูก]","path":"./assets/Expression/Expression_49@2x.png","style":"we-emoji__Pooh-pooh"},{"key":"/:P-(","old":"/委屈","cn":"[委屈]","tw":"[委屈]","en":"[Shrunken]","th":"[ข้องใจ]","path":"./assets/Expression/Expression_50@2x.png","style":"we-emoji__Shrunken"},{"key":"/::\'|","old":"/快哭了","cn":"[快哭了]","tw":"[快哭了]","en":"[TearingUp]","th":"[เกือบร้องไห้]","path":"./assets/Expression/Expression_51@2x.png","style":"we-emoji__TearingUp"},{"key":"/:X-)","old":"/阴险","cn":"[阴险]","tw":"[陰險]","en":"[Sly]","th":"[ขี้โกง]","path":"./assets/Expression/Expression_52@2x.png","style":"we-emoji__Sly"},{"key":"/::*","old":"/亲亲","cn":"[亲亲]","tw":"[親親]","en":"[Kiss]","th":"[จุ๊บ]","path":"./assets/Expression/Expression_53@2x.png","style":"we-emoji__Kiss"},{"key":"/:@x","old":"/吓","cn":"[吓]","tw":"[嚇]","en":"[Wrath]","th":"[ห๊า]","path":"./assets/Expression/Expression_54@2x.png","style":"we-emoji__Wrath"},{"key":"/:8*","old":"/可怜","cn":"[可怜]","tw":"[可憐]","en":"[Whimper]","th":"[น่าสงสาร]","path":"./assets/Expression/Expression_55@2x.png","style":"we-emoji__Whimper"},{"key":"/:pd","old":"/菜刀","cn":"[菜刀]","tw":"[菜刀]","en":"[Cleaver]","th":"[มีด]","path":"./assets/Expression/Expression_56@2x.png","style":"we-emoji__Cleaver"},{"key":"/:<W>","old":"/西瓜","cn":"[西瓜]","tw":"[西瓜]","en":"[Watermelon]","th":"[แตงโม]","path":"./assets/Expression/Expression_57@2x.png","style":"we-emoji__Watermelon"},{"key":"/:beer","old":"/啤酒","cn":"[啤酒]","tw":"[啤酒]","en":"[Beer]","th":"[เบียร์]","path":"./assets/Expression/Expression_58@2x.png","style":"we-emoji__Beer"},{"key":"/:basketb","old":"/篮球","cn":"[篮球]","tw":"[籃球]","en":"[Basketball]","th":"[บาสเกตบอล]","path":"./assets/Expression/Expression_59@2x.png","style":"we-emoji__Basketball"},{"key":"/:oo","old":"/乒乓","cn":"[乒乓]","tw":"[乒乓]","en":"[PingPong]","th":"[ปิงปอง]","path":"./assets/Expression/Expression_60@2x.png","style":"we-emoji__PingPong"},{"key":"/:coffee","old":"/咖啡","cn":"[咖啡]","tw":"[咖啡]","en":"[Coffee]","th":"[กาแฟ]","path":"./assets/Expression/Expression_61@2x.png","style":"we-emoji__Coffee"},{"key":"/:eat","old":"/饭","cn":"[饭]","tw":"[飯]","en":"[Rice]","th":"[ข้าว]","path":"./assets/Expression/Expression_62@2x.png","style":"we-emoji__Rice"},{"key":"/:pig","old":"/猪头","cn":"[猪头]","tw":"[豬頭]","en":"[Pig]","th":"[หมู]","path":"./assets/Expression/Expression_63@2x.png","style":"we-emoji__Pig"},{"key":"/:rose","old":"/玫瑰","cn":"[玫瑰]","tw":"[玫瑰]","en":"[Rose]","th":"[กุหลาบ]","path":"./assets/Expression/Expression_64@2x.png","style":"we-emoji__Rose"},{"key":"/:fade","old":"/凋谢","cn":"[凋谢]","tw":"[枯萎]","en":"[Wilt]","th":"[ร่วงโรย]","path":"./assets/Expression/Expression_65@2x.png","style":"we-emoji__Wilt"},{"key":"/:showlove","old":"/示爱","cn":"[嘴唇]","tw":"[嘴唇]","en":"[Lips]","th":"[ริมฝีปาก]","path":"./assets/Expression/Expression_66@2x.png","style":"we-emoji__Lips"},{"key":"/:heart","old":"/爱心","cn":"[爱心]","tw":"[愛心]","en":"[Heart]","th":"[หัวใจ]","path":"./assets/Expression/Expression_67@2x.png","style":"we-emoji__Heart"},{"key":"/:break","old":"/心碎","cn":"[心碎]","tw":"[心碎]","en":"[BrokenHeart]","th":"[ใจสลาย]","path":"./assets/Expression/Expression_68@2x.png","style":"we-emoji__BrokenHeart"},{"key":"/:cake","old":"/蛋糕","cn":"[蛋糕]","tw":"[蛋糕]","en":"[Cake]","th":"[เค้ก]","path":"./assets/Expression/Expression_69@2x.png","style":"we-emoji__Cake"},{"key":"/:li","old":"/闪电","cn":"[闪电]","tw":"[閃電]","en":"[Lightning]","th":"[ฟ้าผ่า]","path":"./assets/Expression/Expression_70@2x.png","style":"we-emoji__Lightning"},{"key":"/:bome","old":"/炸弹","cn":"[炸弹]","tw":"[炸彈]","en":"[Bomb]","th":"[ระเบิด]","path":"./assets/Expression/Expression_71@2x.png","style":"we-emoji__Bomb"},{"key":"/:kn","old":"/刀","cn":"[刀]","tw":"[刀]","en":"[Dagger]","th":"[ดาบ]","path":"./assets/Expression/Expression_72@2x.png","style":"we-emoji__Dagger"},{"key":"/:footb","old":"/足球","cn":"[足球]","tw":"[足球]","en":"[Soccer]","th":"[ฟุตบอล]","path":"./assets/Expression/Expression_73@2x.png","style":"we-emoji__Soccer"},{"key":"/:ladybug","old":"/瓢虫","cn":"[瓢虫]","tw":"[甲蟲]","en":"[Ladybug]","th":"[เต่าทอง]","path":"./assets/Expression/Expression_74@2x.png","style":"we-emoji__Ladybug"},{"key":"/:shit","old":"/便便","cn":"[便便]","tw":"[便便]","en":"[Poop]","th":"[อุจจาระ]","path":"./assets/Expression/Expression_75@2x.png","style":"we-emoji__Poop"},{"key":"/:moon","old":"/月亮","cn":"[月亮]","tw":"[月亮]","en":"[Moon]","th":"[พระจันทร์]","path":"./assets/Expression/Expression_76@2x.png","style":"we-emoji__Moon"},{"key":"/:sun","old":"/太阳","cn":"[太阳]","tw":"[太陽]","en":"[Sun]","th":"[พระอาทิตย์]","path":"./assets/Expression/Expression_77@2x.png","style":"we-emoji__Sun"},{"key":"/:gift","old":"/礼物","cn":"[礼物]","tw":"[禮物]","en":"[礼物]","th":"[Gift]","emoji":"🎁","path":"./assets/Expression/Expression_78@2x.png","style":"we-emoji__Gift"},{"key":"/:hug","old":"/拥抱","cn":"[拥抱]","tw":"[擁抱]","en":"[Hug]","th":"[กอด]","path":"./assets/Expression/Expression_79@2x.png","style":"we-emoji__Hug"},{"key":"/:strong","old":"/强","cn":"[强]","tw":"[強]","en":"[ThumbsUp]","th":"[ยอดเยี่ยม]","path":"./assets/Expression/Expression_80@2x.png","style":"we-emoji__ThumbsUp"},{"key":"/:weak","old":"/弱","cn":"[弱]","tw":"[弱]","en":"[ThumbsDown]","th":"[ยอดแย่]","path":"./assets/Expression/Expression_81@2x.png","style":"we-emoji__ThumbsDown"},{"key":"/:share","old":"/握手","cn":"[握手]","tw":"[握手]","en":"[Shake]","th":"[จับมือ]","path":"./assets/Expression/Expression_82@2x.png","style":"we-emoji__Shake"},{"key":"/:v","old":"/胜利","cn":"[胜利]","tw":"[勝利]","en":"[Peace]","th":"[สู้ตาย]","path":"./assets/Expression/Expression_83@2x.png","style":"we-emoji__Peace"},{"key":"/:@)","old":"/抱拳","cn":"[抱拳]","tw":"[抱拳]","en":"[Fight]","th":"[คารวะ]","path":"./assets/Expression/Expression_84@2x.png","style":"we-emoji__Fight"},{"key":"/:jj","old":"/勾引","cn":"[勾引]","tw":"[勾引]","en":"[Beckon]","th":"[เข้ามา]","path":"./assets/Expression/Expression_85@2x.png","style":"we-emoji__Beckon"},{"key":"/:@@","old":"/拳头","cn":"[拳头]","tw":"[拳頭]","en":"[Fist]","th":"[กำหมัด]","path":"./assets/Expression/Expression_86@2x.png","style":"we-emoji__Fist"},{"key":"/:bad","old":"/差劲","cn":"[差劲]","tw":"[差勁]","en":"[Pinky]","th":"[ดีกัน]","path":"./assets/Expression/Expression_87@2x.png","style":"we-emoji__Pinky"},{"key":"/:lvu","old":"/爱你","cn":"[爱你]","tw":"[愛你]","en":"[RockOn]","th":"[ฉันรักคุณ]","path":"./assets/Expression/Expression_88@2x.png","style":"we-emoji__RockOn"},{"key":"/:no","old":"/NO","cn":"[NO]","tw":"[NO]","en":"[Nuh-uh]","th":"[ไม่]","path":"./assets/Expression/Expression_89@2x.png","style":"we-emoji__Nuh-uh"},{"key":"/:ok","old":"/OK","cn":"[OK]","tw":"[OK]","en":"[OK]","th":"[ตกลง]","path":"./assets/Expression/Expression_90@2x.png","style":"we-emoji__OK"},{"key":"/:love","old":"/爱情","cn":"[爱情]","tw":"[愛情]","en":"[InLove]","th":"[รักกัน]","path":"./assets/Expression/Expression_91@2x.png","style":"we-emoji__InLove"},{"key":"/:<L>","old":"/飞吻","cn":"[飞吻]","tw":"[飛吻]","en":"[Blowkiss]","th":"[มีรัก]","path":"./assets/Expression/Expression_92@2x.png","style":"we-emoji__Blowkiss"},{"key":"/:jump","old":"/跳跳","cn":"[跳跳]","tw":"[跳跳]","en":"[Waddle]","th":"[กระโดด]","path":"./assets/Expression/Expression_93@2x.png","style":"we-emoji__Waddle"},{"key":"/:shake","old":"/发抖","cn":"[发抖]","tw":"[發抖]","en":"[Tremble]","th":"[เขย่า]","path":"./assets/Expression/Expression_94@2x.png","style":"we-emoji__Tremble"},{"key":"/:<O>","old":"/怄火","cn":"[怄火]","tw":"[噴火]","en":"[Aaagh!]","th":"[อ้ากส์!]","path":"./assets/Expression/Expression_95@2x.png","style":"we-emoji__Aaagh"},{"key":"/:circle","old":"/转圈","cn":"[转圈]","tw":"[轉圈]","en":"[Twirl]","th":"[หมุนตัว]","path":"./assets/Expression/Expression_96@2x.png","style":"we-emoji__Twirl"},{"key":"/:kotow","old":"/磕头","cn":"[磕头]","tw":"[磕頭]","en":"[Kotow]","th":"[คำนับ]","path":"./assets/Expression/Expression_97@2x.png","style":"we-emoji__Kotow"},{"key":"/:turn","old":"/回头","cn":"[回头]","tw":"[回頭]","en":"[Dramatic]","th":"[เหลียวหลัง]","path":"./assets/Expression/Expression_98@2x.png","style":"we-emoji__Dramatic"},{"key":"/:skip","old":"/跳绳","cn":"[跳绳]","tw":"[跳繩]","en":"[JumpRope]","th":"[กระโดด]","path":"./assets/Expression/Expression_99@2x.png","style":"we-emoji__JumpRope"},{"key":"/:oY","old":"/挥手","cn":"[投降]","tw":"[投降]","en":"[Surrender]","th":"[ยอมแพ้]","path":"./assets/Expression/Expression_100@2x.png","style":"we-emoji__Surrender"},{"key":"/:#-0","old":"/激动","cn":"[激动]","tw":"[激動]","en":"[Hooray]","th":"[ไชโย]","path":"./assets/Expression/Expression_101@2x.png","style":"we-emoji__Hooray"},{"key":"/:hiphot","old":"/街舞","cn":"[乱舞]","tw":"[亂舞]","en":"[Meditate]","th":"[เย้เย้]","path":"./assets/Expression/Expression_102@2x.png","style":"we-emoji__Meditate"},{"key":"/:kiss","old":"/献吻","cn":"[献吻]","tw":"[獻吻]","en":"[Smooch]","th":"[จูบ]","path":"./assets/Expression/Expression_103@2x.png","style":"we-emoji__Smooch"},{"key":"/:<&","old":"/左太极","cn":"[左太极]","tw":"[左太極]","en":"[TaiChi L]","th":"[หญิงต่อสู้]","path":"./assets/Expression/Expression_104@2x.png","style":"we-emoji__TaiChiL"},{"key":"/:&\\"","old":"/右太极","cn":"[右太极]","tw":"[右太極]","en":"[TaiChi R]","th":"[ชายต่อสู้]","path":"./assets/Expression/Expression_105@2x.png","style":"we-emoji__TaiChiR"},{"key":"[Smirk]","cn":"[奸笑]","qq":"[奸笑]","en":"[Smirk]","tw":"[奸笑]","th":"[Smirk]","path":"./assets/newemoji/2_02.png","style":"we-emoji__Smirk"},{"key":"[Hey]","cn":"[嘿哈]","qq":"[嘿哈]","en":"[Hey]","tw":"[吼嘿]","th":"[Hey]","path":"./assets/newemoji/2_04.png","style":"we-emoji__Hey"},{"key":"[Facepalm]","cn":"[捂脸]","qq":"[捂脸]","en":"[Facepalm]","tw":"[掩面]","th":"[Facepalm]","path":"./assets/newemoji/2_05.png","style":"we-emoji__Facepalm"},{"key":"[Smart]","cn":"[机智]","qq":"[机智]","en":"[Smart]","tw":"[機智]","th":"[Smart]","path":"./assets/newemoji/2_06.png","style":"we-emoji__Smart"},{"key":"[Tea]","cn":"[茶]","qq":"[茶]","en":"[Tea]","tw":"[茶]","th":"[Tea]","path":"./assets/newemoji/2_07.png","style":"we-emoji__Tea"},{"key":"[Packet]","cn":"[红包]","qq":"[红包]","en":"[Packet]","tw":"[Packet]","th":"[Packet]","path":"./assets/newemoji/2_09.png","style":"we-emoji__Packet"},{"key":"[Candle]","cn":"[蜡烛]","qq":"[蜡烛]","en":"[Candle]","tw":"[蠟燭]","th":"[Candle]","path":"./assets/newemoji/2_10.png","style":"we-emoji__Candle"},{"key":"[Yeah!]","cn":"[耶]","qq":"[耶]","en":"[Yeah!]","tw":"[歐耶]","th":"[Yeah!]","path":"./assets/newemoji/2_11.png","style":"we-emoji__Yeah"},{"key":"[Concerned]","cn":"[皱眉]","qq":"[皱眉]","en":"[Concerned]","tw":"[皺眉]","th":"[Concerned]","path":"./assets/newemoji/2_12.png","style":"we-emoji__Concerned"},{"key":"[Salute]","cn":"[抱拳]","qq":"[抱拳]","en":"[Salute]","tw":"[抱拳]","th":"[Salute]","path":"./assets/newemoji/smiley_83b.png","style":"we-emoji__Salute"},{"key":"[Chick]","cn":"[鸡]","qq":"[鸡]","en":"[Chick]","tw":"[小雞]","th":"[Chick]","path":"./assets/newemoji/2_14.png","style":"we-emoji__Chick"},{"key":"[Blessing]","cn":"[福]","qq":"[福]","en":"[Blessing]","tw":"[福]","th":"[Blessing]","path":"./assets/newemoji/2_15.png","style":"we-emoji__Blessing"},{"key":"[Bye]","cn":"[再见]","qq":"[再见]","en":"[Bye]","tw":"[再見]","th":"[Bye]","path":"./assets/newemoji/smiley_39b.png","style":"we-emoji__Bye"},{"key":"[Rich]","cn":"[發]","qq":"[發]","en":"[Rich]","tw":"[發]","th":"[Rich]","path":"./assets/newemoji/2_16.png","style":"we-emoji__Rich"},{"key":"[Pup]","cn":"[小狗]","qq":"[小狗]","en":"[Pup]","tw":"[小狗]","th":"[Pup]","path":"./assets/newemoji/2_17.png","style":"we-emoji__Pup"},{"key":"[Onlooker]","cn":"[吃瓜]","qq":"[吃瓜]","en":"[Onlooker]","tw":"[吃西瓜]","th":"[Onlooker]","path":"./assets/newemoji/Watermelon.png","style":"we-emoji__Onlooker"},{"key":"[GoForIt]","cn":"[加油]","qq":"[加油]","en":"[GoForIt]","tw":"[加油]","th":"[GoForIt]","path":"./assets/newemoji/Addoil.png","style":"we-emoji__GoForIt"},{"key":"[Sweats]","cn":"[汗]","qq":"[汗]","en":"[Sweats]","tw":"[汗]","th":"[Sweats]","path":"./assets/newemoji/Sweat.png","style":"we-emoji__Sweats"},{"key":"[OMG]","cn":"[天啊]","qq":"[天啊]","en":"[OMG]","tw":"[天啊]","th":"[OMG]","path":"./assets/newemoji/Shocked.png","style":"we-emoji__OMG"},{"key":"[Emm]","cn":"[Emm]","qq":"[Emm]","en":"[Emm]","tw":"[一言難盡]","th":"[Emm]","path":"./assets/newemoji/Cold.png","style":"we-emoji__Emm"},{"key":"[Respect]","cn":"[社会社会]","qq":"[社会社会]","en":"[Respect]","tw":"[失敬失敬]","th":"[Respect]","path":"./assets/newemoji/Social.png","style":"we-emoji__Respect"},{"key":"[Doge]","cn":"[旺柴]","qq":"[旺柴]","en":"[Doge]","tw":"[旺柴]","th":"[Doge]","path":"./assets/newemoji/Yellowdog.png","style":"we-emoji__Doge"},{"key":"[NoProb]","cn":"[好的]","qq":"[好的]","en":"[NoProb]","tw":"[好的]","th":"[NoProb]","path":"./assets/newemoji/NoProb.png","style":"we-emoji__NoProb"},{"key":"[MyBad]","cn":"[打脸]","qq":"[打脸]","en":"[MyBad]","tw":"[打臉]","th":"[MyBad]","path":"./assets/newemoji/Slap.png","style":"we-emoji__MyBad"},{"key":"[Wow]","cn":"[哇]","qq":"[哇]","en":"[Wow]","tw":"[哇]","th":"[Wow]","path":"./assets/newemoji/Wow.png","style":"we-emoji__Wow"},{"key":"[KeepFighting]","cn":"[加油加油]","qq":"[加油加油]","en":"[KeepFighting]","tw":"[加油！]","th":"[KeepFighting]","path":"./assets/newemoji/KeepFighting.png","style":"we-emoji__KeepFighting"},{"key":"[Boring]","cn":"[翻白眼]","qq":"[翻白眼]","en":"[Boring]","tw":"[翻白眼]","th":"[Boring]","path":"./assets/newemoji/Boring.png","style":"we-emoji__Boring"},{"key":"[666]","cn":"[666]","qq":"[666]","en":"[Awesome]","tw":"[666]","th":"[Awesome]","path":"./assets/newemoji/666.png","style":"we-emoji__Awesome"},{"key":"[LetMeSee]","cn":"[让我看看]","qq":"[让我看看]","en":"[LetMeSee]","tw":"[讓我看看]","th":"[LetMeSee]","path":"./assets/newemoji/LetMeSee.png","style":"we-emoji__LetMeSee"},{"key":"[Sigh]","cn":"[叹气]","qq":"[叹气]","en":"[Sigh]","tw":"[嘆息]","th":"[Sigh]","path":"./assets/newemoji/Sigh.png","style":"we-emoji__Sigh"},{"key":"[Hurt]","cn":"[苦涩]","qq":"[苦涩]","en":"[Hurt]","tw":"[難受]","th":"[Hurt]","path":"./assets/newemoji/Hurt.png","style":"we-emoji__Hurt"},{"key":"[Broken]","cn":"[裂开]","qq":"[裂开]","en":"[Broken]","tw":"[崩潰]","th":"[Broken]","path":"./assets/newemoji/Broken.png","style":"we-emoji__Broken"},{"key":"[Flushed]","cn":"[脸红]","qq":"[脸红]","en":"[Flushed]","tw":"[臉紅]","th":"[Flushed]","emoji":"😳","path":"./assets/newemoji/Flushed.png","style":"we-emoji__Flushed"},{"key":"[Happy]","cn":"[笑脸]","qq":"[笑脸]","en":"[Happy]","tw":"[笑臉]","th":"[Happy]","emoji":"😄","path":"./assets/newemoji/Happy.png","style":"we-emoji__Happy"},{"key":"[Lol]","cn":"[破涕为笑]","qq":"[破涕为笑]","en":"[Lol]","tw":"[破涕為笑]","th":"[Lol]","emoji":"😂","path":"./assets/newemoji/Lol.png","style":"we-emoji__Lol"},{"key":"[Fireworks]","cn":"[烟花]","qq":"[烟花]","en":"[Fireworks]","tw":"[煙花]","th":"[Fireworks]","path":"./assets/newemoji/Fireworks.png","style":"we-emoji__Fireworks"},{"key":"[Firecracker]","cn":"[爆竹]","qq":"[爆竹]","en":"[Firecracker]","tw":"[爆竹]","th":"[Firecracker]","path":"./assets/newemoji/Firecracker.png","style":"we-emoji__Firecracker"},{"key":"[Party]","cn":"[庆祝]","qq":"[庆祝]","en":"[Party]","tw":"[慶祝]","th":"[Party]","emoji":"🎉","path":"./assets/newemoji/Party.png","style":"we-emoji__Party"},{"key":"[Terror]","cn":"[恐惧]","qq":"[恐惧]","en":"[Terror]","tw":"[恐懼]","th":"[Terror]","emoji":"😱","path":"./assets/newemoji/Terror.png","style":"we-emoji__Terror"},{"key":"[Duh]","cn":"[无语]","qq":"[无语]","en":"[Duh]","tw":"[無語]","th":"[Duh]","emoji":"😒","path":"./assets/newemoji/Duh.png","style":"we-emoji__Duh"},{"key":"[LetDown]","cn":"[失望]","qq":"[失望]","en":"[Let Down]","tw":"[失望]","th":"[Let Down]","emoji":"😔","path":"./assets/newemoji/LetDown.png","style":"we-emoji__LetDown"},{"key":"[Sick]","cn":"[生病]","qq":"[生病]","en":"[Sick]","tw":"[生病]","th":"[Sick]","emoji":"😷","path":"./assets/newemoji/Sick.png","style":"we-emoji__Sick"},{"key":"[Worship]","cn":"[合十]","qq":"[合十]","en":"[Worship]","tw":"[合十]","th":"[Worship]","emoji":"🙏","path":"./assets/newemoji/Worship.png","style":"we-emoji__Worship"}]')},"90e3":function(e,t){var n=0,r=Math.random();e.exports=function(e){return"Symbol("+String(void 0===e?"":e)+")_"+(++n+r).toString(36)}},9112:function(e,t,n){var r=n("83ab"),o=n("9bf2"),i=n("5c6c");e.exports=r?function(e,t,n){return o.f(e,t,i(1,n))}:function(e,t,n){return e[t]=n,e}},9263:function(e,t,n){"use strict";var r=n("ad6d"),o=n("9f7f"),i=RegExp.prototype.exec,s=String.prototype.replace,a=i,c=function(){var e=/a/,t=/b*/g;return i.call(e,"a"),i.call(t,"a"),0!==e.lastIndex||0!==t.lastIndex}(),u=o.UNSUPPORTED_Y||o.BROKEN_CARET,p=void 0!==/()??/.exec("")[1],f=c||p||u;f&&(a=function(e){var t,n,o,a,f=this,l=u&&f.sticky,h=r.call(f),d=f.source,y=0,x=e;return l&&(h=h.replace("y",""),-1===h.indexOf("g")&&(h+="g"),x=String(e).slice(f.lastIndex),f.lastIndex>0&&(!f.multiline||f.multiline&&"\n"!==e[f.lastIndex-1])&&(d="(?: "+d+")",x=" "+x,y++),n=new RegExp("^(?:"+d+")",h)),p&&(n=new RegExp("^"+d+"$(?!\\s)",h)),c&&(t=f.lastIndex),o=i.call(l?n:f,x),l?o?(o.input=o.input.slice(y),o[0]=o[0].slice(y),o.index=f.lastIndex,f.lastIndex+=o[0].length):f.lastIndex=0:c&&o&&(f.lastIndex=f.global?o.index+o[0].length:t),p&&o&&o.length>1&&s.call(o[0],n,(function(){for(a=1;a<arguments.length-2;a++)void 0===arguments[a]&&(o[a]=void 0)})),o}),e.exports=a},"94ca":function(e,t,n){var r=n("d039"),o=/#|\.prototype\./,i=function(e,t){var n=a[s(e)];return n==u||n!=c&&("function"==typeof t?r(t):!!t)},s=i.normalize=function(e){return String(e).replace(o,".").toLowerCase()},a=i.data={},c=i.NATIVE="N",u=i.POLYFILL="P";e.exports=i},9523:function(e,t){function n(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}e.exports=n,e.exports["default"]=e.exports,e.exports.__esModule=!0},"99af":function(e,t,n){"use strict";var r=n("23e7"),o=n("d039"),i=n("e8b5"),s=n("861d"),a=n("7b0b"),c=n("50c4"),u=n("8418"),p=n("65f0"),f=n("1dde"),l=n("b622"),h=n("2d00"),d=l("isConcatSpreadable"),y=9007199254740991,x="Maximum allowed index exceeded",m=h>=51||!o((function(){var e=[];return e[d]=!1,e.concat()[0]!==e})),g=f("concat"),w=function(e){if(!s(e))return!1;var t=e[d];return void 0!==t?!!t:i(e)},_=!m||!g;r({target:"Array",proto:!0,forced:_},{concat:function(e){var t,n,r,o,i,s=a(this),f=p(s,0),l=0;for(t=-1,r=arguments.length;t<r;t++)if(i=-1===t?s:arguments[t],w(i)){if(o=c(i.length),l+o>y)throw TypeError(x);for(n=0;n<o;n++,l++)n in i&&u(f,l,i[n])}else{if(l>=y)throw TypeError(x);u(f,l++,i)}return f.length=l,f}})},"9bdd":function(e,t,n){var r=n("825a"),o=n("2a62");e.exports=function(e,t,n,i){try{return i?t(r(n)[0],n[1]):t(n)}catch(s){throw o(e),s}}},"9bf2":function(e,t,n){var r=n("83ab"),o=n("0cfb"),i=n("825a"),s=n("c04e"),a=Object.defineProperty;t.f=r?a:function(e,t,n){if(i(e),t=s(t,!0),i(n),o)try{return a(e,t,n)}catch(r){}if("get"in n||"set"in n)throw TypeError("Accessors not supported");return"value"in n&&(e[t]=n.value),e}},"9ed3":function(e,t,n){"use strict";var r=n("ae93").IteratorPrototype,o=n("7c73"),i=n("5c6c"),s=n("d44e"),a=n("3f8c"),c=function(){return this};e.exports=function(e,t,n){var u=t+" Iterator";return e.prototype=o(r,{next:i(1,n)}),s(e,u,!1,!0),a[u]=c,e}},"9f7f":function(e,t,n){"use strict";var r=n("d039");function o(e,t){return RegExp(e,t)}t.UNSUPPORTED_Y=r((function(){var e=o("a","y");return e.lastIndex=2,null!=e.exec("abcd")})),t.BROKEN_CARET=r((function(){var e=o("^r","gy");return e.lastIndex=2,null!=e.exec("str")}))},a15b:function(e,t,n){"use strict";var r=n("23e7"),o=n("44ad"),i=n("fc6a"),s=n("a640"),a=[].join,c=o!=Object,u=s("join",",");r({target:"Array",proto:!0,forced:c||!u},{join:function(e){return a.call(i(this),void 0===e?",":e)}})},a4d3:function(e,t,n){"use strict";var r=n("23e7"),o=n("da84"),i=n("d066"),s=n("c430"),a=n("83ab"),c=n("4930"),u=n("fdbf"),p=n("d039"),f=n("5135"),l=n("e8b5"),h=n("861d"),d=n("825a"),y=n("7b0b"),x=n("fc6a"),m=n("c04e"),g=n("5c6c"),w=n("7c73"),_=n("df75"),v=n("241c"),b=n("057f"),E=n("7418"),j=n("06cf"),k=n("9bf2"),S=n("d1e7"),O=n("9112"),P=n("6eeb"),T=n("5692"),D=n("f772"),q=n("d012"),A=n("90e3"),R=n("b622"),C=n("e538"),L=n("746f"),I=n("d44e"),M=n("69f3"),N=n("b727").forEach,F=D("hidden"),B="Symbol",$="prototype",H=R("toPrimitive"),G=M.set,W=M.getterFor(B),U=Object[$],K=o.Symbol,Y=i("JSON","stringify"),V=j.f,J=k.f,X=b.f,z=S.f,Q=T("symbols"),Z=T("op-symbols"),ee=T("string-to-symbol-registry"),te=T("symbol-to-string-registry"),ne=T("wks"),re=o.QObject,oe=!re||!re[$]||!re[$].findChild,ie=a&&p((function(){return 7!=w(J({},"a",{get:function(){return J(this,"a",{value:7}).a}})).a}))?function(e,t,n){var r=V(U,t);r&&delete U[t],J(e,t,n),r&&e!==U&&J(U,t,r)}:J,se=function(e,t){var n=Q[e]=w(K[$]);return G(n,{type:B,tag:e,description:t}),a||(n.description=t),n},ae=u?function(e){return"symbol"==typeof e}:function(e){return Object(e)instanceof K},ce=function(e,t,n){e===U&&ce(Z,t,n),d(e);var r=m(t,!0);return d(n),f(Q,r)?(n.enumerable?(f(e,F)&&e[F][r]&&(e[F][r]=!1),n=w(n,{enumerable:g(0,!1)})):(f(e,F)||J(e,F,g(1,{})),e[F][r]=!0),ie(e,r,n)):J(e,r,n)},ue=function(e,t){d(e);var n=x(t),r=_(n).concat(de(n));return N(r,(function(t){a&&!fe.call(n,t)||ce(e,t,n[t])})),e},pe=function(e,t){return void 0===t?w(e):ue(w(e),t)},fe=function(e){var t=m(e,!0),n=z.call(this,t);return!(this===U&&f(Q,t)&&!f(Z,t))&&(!(n||!f(this,t)||!f(Q,t)||f(this,F)&&this[F][t])||n)},le=function(e,t){var n=x(e),r=m(t,!0);if(n!==U||!f(Q,r)||f(Z,r)){var o=V(n,r);return!o||!f(Q,r)||f(n,F)&&n[F][r]||(o.enumerable=!0),o}},he=function(e){var t=X(x(e)),n=[];return N(t,(function(e){f(Q,e)||f(q,e)||n.push(e)})),n},de=function(e){var t=e===U,n=X(t?Z:x(e)),r=[];return N(n,(function(e){!f(Q,e)||t&&!f(U,e)||r.push(Q[e])})),r};if(c||(K=function(){if(this instanceof K)throw TypeError("Symbol is not a constructor");var e=arguments.length&&void 0!==arguments[0]?String(arguments[0]):void 0,t=A(e),n=function(e){this===U&&n.call(Z,e),f(this,F)&&f(this[F],t)&&(this[F][t]=!1),ie(this,t,g(1,e))};return a&&oe&&ie(U,t,{configurable:!0,set:n}),se(t,e)},P(K[$],"toString",(function(){return W(this).tag})),P(K,"withoutSetter",(function(e){return se(A(e),e)})),S.f=fe,k.f=ce,j.f=le,v.f=b.f=he,E.f=de,C.f=function(e){return se(R(e),e)},a&&(J(K[$],"description",{configurable:!0,get:function(){return W(this).description}}),s||P(U,"propertyIsEnumerable",fe,{unsafe:!0}))),r({global:!0,wrap:!0,forced:!c,sham:!c},{Symbol:K}),N(_(ne),(function(e){L(e)})),r({target:B,stat:!0,forced:!c},{for:function(e){var t=String(e);if(f(ee,t))return ee[t];var n=K(t);return ee[t]=n,te[n]=t,n},keyFor:function(e){if(!ae(e))throw TypeError(e+" is not a symbol");if(f(te,e))return te[e]},useSetter:function(){oe=!0},useSimple:function(){oe=!1}}),r({target:"Object",stat:!0,forced:!c,sham:!a},{create:pe,defineProperty:ce,defineProperties:ue,getOwnPropertyDescriptor:le}),r({target:"Object",stat:!0,forced:!c},{getOwnPropertyNames:he,getOwnPropertySymbols:de}),r({target:"Object",stat:!0,forced:p((function(){E.f(1)}))},{getOwnPropertySymbols:function(e){return E.f(y(e))}}),Y){var ye=!c||p((function(){var e=K();return"[null]"!=Y([e])||"{}"!=Y({a:e})||"{}"!=Y(Object(e))}));r({target:"JSON",stat:!0,forced:ye},{stringify:function(e,t,n){var r,o=[e],i=1;while(arguments.length>i)o.push(arguments[i++]);if(r=t,(h(t)||void 0!==e)&&!ae(e))return l(t)||(t=function(e,t){if("function"==typeof r&&(t=r.call(this,e,t)),!ae(t))return t}),o[1]=t,Y.apply(null,o)}})}K[$][H]||O(K[$],H,K[$].valueOf),I(K,B),q[F]=!0},a630:function(e,t,n){var r=n("23e7"),o=n("4df4"),i=n("1c7e"),s=!i((function(e){Array.from(e)}));r({target:"Array",stat:!0,forced:s},{from:o})},a640:function(e,t,n){"use strict";var r=n("d039");e.exports=function(e,t){var n=[][e];return!!n&&r((function(){n.call(null,t||function(){throw 1},1)}))}},a691:function(e,t){var n=Math.ceil,r=Math.floor;e.exports=function(e){return isNaN(e=+e)?0:(e>0?r:n)(e)}},a9e3:function(e,t,n){"use strict";var r=n("83ab"),o=n("da84"),i=n("94ca"),s=n("6eeb"),a=n("5135"),c=n("c6b6"),u=n("7156"),p=n("c04e"),f=n("d039"),l=n("7c73"),h=n("241c").f,d=n("06cf").f,y=n("9bf2").f,x=n("58a8").trim,m="Number",g=o[m],w=g.prototype,_=c(l(w))==m,v=function(e){var t,n,r,o,i,s,a,c,u=p(e,!1);if("string"==typeof u&&u.length>2)if(u=x(u),t=u.charCodeAt(0),43===t||45===t){if(n=u.charCodeAt(2),88===n||120===n)return NaN}else if(48===t){switch(u.charCodeAt(1)){case 66:case 98:r=2,o=49;break;case 79:case 111:r=8,o=55;break;default:return+u}for(i=u.slice(2),s=i.length,a=0;a<s;a++)if(c=i.charCodeAt(a),c<48||c>o)return NaN;return parseInt(i,r)}return+u};if(i(m,!g(" 0o1")||!g("0b1")||g("+0x1"))){for(var b,E=function(e){var t=arguments.length<1?0:e,n=this;return n instanceof E&&(_?f((function(){w.valueOf.call(n)})):c(n)!=m)?u(new g(v(t)),n,E):v(t)},j=r?h(g):"MAX_VALUE,MIN_VALUE,NaN,NEGATIVE_INFINITY,POSITIVE_INFINITY,EPSILON,isFinite,isInteger,isNaN,isSafeInteger,MAX_SAFE_INTEGER,MIN_SAFE_INTEGER,parseFloat,parseInt,isInteger,fromString,range".split(","),k=0;j.length>k;k++)a(g,b=j[k])&&!a(E,b)&&y(E,b,d(g,b));E.prototype=w,w.constructor=E,s(o,m,E)}},ac1f:function(e,t,n){"use strict";var r=n("23e7"),o=n("9263");r({target:"RegExp",proto:!0,forced:/./.exec!==o},{exec:o})},ad6d:function(e,t,n){"use strict";var r=n("825a");e.exports=function(){var e=r(this),t="";return e.global&&(t+="g"),e.ignoreCase&&(t+="i"),e.multiline&&(t+="m"),e.dotAll&&(t+="s"),e.unicode&&(t+="u"),e.sticky&&(t+="y"),t}},ae93:function(e,t,n){"use strict";var r,o,i,s=n("d039"),a=n("e163"),c=n("9112"),u=n("5135"),p=n("b622"),f=n("c430"),l=p("iterator"),h=!1,d=function(){return this};[].keys&&(i=[].keys(),"next"in i?(o=a(a(i)),o!==Object.prototype&&(r=o)):h=!0);var y=void 0==r||s((function(){var e={};return r[l].call(e)!==e}));y&&(r={}),f&&!y||u(r,l)||c(r,l,d),e.exports={IteratorPrototype:r,BUGGY_SAFARI_ITERATORS:h}},b041:function(e,t,n){"use strict";var r=n("00ee"),o=n("f5df");e.exports=r?{}.toString:function(){return"[object "+o(this)+"]"}},b0c0:function(e,t,n){var r=n("83ab"),o=n("9bf2").f,i=Function.prototype,s=i.toString,a=/^\s*function ([^ (]*)/,c="name";r&&!(c in i)&&o(i,c,{configurable:!0,get:function(){try{return s.call(this).match(a)[1]}catch(e){return""}}})},b622:function(e,t,n){var r=n("da84"),o=n("5692"),i=n("5135"),s=n("90e3"),a=n("4930"),c=n("fdbf"),u=o("wks"),p=r.Symbol,f=c?p:p&&p.withoutSetter||s;e.exports=function(e){return i(u,e)&&(a||"string"==typeof u[e])||(a&&i(p,e)?u[e]=p[e]:u[e]=f("Symbol."+e)),u[e]}},b64b:function(e,t,n){var r=n("23e7"),o=n("7b0b"),i=n("df75"),s=n("d039"),a=s((function(){i(1)}));r({target:"Object",stat:!0,forced:a},{keys:function(e){return i(o(e))}})},b727:function(e,t,n){var r=n("0366"),o=n("44ad"),i=n("7b0b"),s=n("50c4"),a=n("65f0"),c=[].push,u=function(e){var t=1==e,n=2==e,u=3==e,p=4==e,f=6==e,l=7==e,h=5==e||f;return function(d,y,x,m){for(var g,w,_=i(d),v=o(_),b=r(y,x,3),E=s(v.length),j=0,k=m||a,S=t?k(d,E):n||l?k(d,0):void 0;E>j;j++)if((h||j in v)&&(g=v[j],w=b(g,j,_),e))if(t)S[j]=w;else if(w)switch(e){case 3:return!0;case 5:return g;case 6:return j;case 2:c.call(S,g)}else switch(e){case 4:return!1;case 7:c.call(S,g)}return f?-1:u||p?p:S}};e.exports={forEach:u(0),map:u(1),filter:u(2),some:u(3),every:u(4),find:u(5),findIndex:u(6),filterOut:u(7)}},c04e:function(e,t,n){var r=n("861d");e.exports=function(e,t){if(!r(e))return e;var n,o;if(t&&"function"==typeof(n=e.toString)&&!r(o=n.call(e)))return o;if("function"==typeof(n=e.valueOf)&&!r(o=n.call(e)))return o;if(!t&&"function"==typeof(n=e.toString)&&!r(o=n.call(e)))return o;throw TypeError("Can't convert object to primitive value")}},c1fd:function(e){e.exports=JSON.parse('["/::)","/::~","/::B","/::|","/:8-)","/::<","/::$","/::X","/::Z","/::\'(","/::-|","/::@","/::P","/::D","/::O","/::(","[Blush]","/::Q","/::T","/:,@P","/:,@-D","/::d","/:,@o","/:|-)","/::!","/::>","/::,@","/::-S","/:?","/:,@x","/:,@@","/:,@!","/:!!!","/:xx","[Bye]","/:wipe","/:dig","/:handclap","/:B-)","/:@>","/:>-|","/:P-(","/::\'|","/:X-)","/::*","/:8*","[Happy]","[Sick]","[Flushed]","[Lol]","[Terror]","[LetDown]","[Duh]","[Hey]","[Facepalm]","[Smirk]","[Smart]","[Concerned]","[Yeah!]","[Onlooker]","[GoForIt]","[Sweats]","[OMG]","[Emm]","[Respect]","[Doge]","[NoProb]","[MyBad]","[Wow]","[Boring]","[666]","[LetMeSee]","[Sigh]","[Hurt]","[Broken]","/:showlove","/:heart","/:break","/:hug","/:strong","/:weak","/:share","/:v","[Salute]","/:jj","/:@@","/:ok","[Worship]","/:beer","/:coffee","/:cake","/:rose","/:fade","/:pd","/:bome","/:shit","/:moon","/:sun","[Party]","[Gift]","[Packet]","[Rich]","[Blessing]","[Fireworks]","[Firecracker]","/:pig","/:jump","/:shake","/:circle"]')},c430:function(e,t){e.exports=!1},c6b6:function(e,t){var n={}.toString;e.exports=function(e){return n.call(e).slice(8,-1)}},c6cd:function(e,t,n){var r=n("da84"),o=n("ce4e"),i="__core-js_shared__",s=r[i]||o(i,{});e.exports=s},c8ba:function(e,t){var n;n=function(){return this}();try{n=n||new Function("return this")()}catch(r){"object"===typeof window&&(n=window)}e.exports=n},c8d2:function(e,t,n){var r=n("d039"),o=n("5899"),i="​᠎";e.exports=function(e){return r((function(){return!!o[e]()||i[e]()!=i||o[e].name!==e}))}},ca84:function(e,t,n){var r=n("5135"),o=n("fc6a"),i=n("4d64").indexOf,s=n("d012");e.exports=function(e,t){var n,a=o(e),c=0,u=[];for(n in a)!r(s,n)&&r(a,n)&&u.push(n);while(t.length>c)r(a,n=t[c++])&&(~i(u,n)||u.push(n));return u}},cc12:function(e,t,n){var r=n("da84"),o=n("861d"),i=r.document,s=o(i)&&o(i.createElement);e.exports=function(e){return s?i.createElement(e):{}}},ce4e:function(e,t,n){var r=n("da84"),o=n("9112");e.exports=function(e,t){try{o(r,e,t)}catch(n){r[e]=t}return t}},d012:function(e,t){e.exports={}},d039:function(e,t){e.exports=function(e){try{return!!e()}catch(t){return!0}}},d066:function(e,t,n){var r=n("428f"),o=n("da84"),i=function(e){return"function"==typeof e?e:void 0};e.exports=function(e,t){return arguments.length<2?i(r[e])||i(o[e]):r[e]&&r[e][t]||o[e]&&o[e][t]}},d1e7:function(e,t,n){"use strict";var r={}.propertyIsEnumerable,o=Object.getOwnPropertyDescriptor,i=o&&!r.call({1:2},1);t.f=i?function(e){var t=o(this,e);return!!t&&t.enumerable}:r},d28b:function(e,t,n){var r=n("746f");r("iterator")},d2bb:function(e,t,n){var r=n("825a"),o=n("3bbe");e.exports=Object.setPrototypeOf||("__proto__"in{}?function(){var e,t=!1,n={};try{e=Object.getOwnPropertyDescriptor(Object.prototype,"__proto__").set,e.call(n,[]),t=n instanceof Array}catch(i){}return function(n,i){return r(n),o(i),t?e.call(n,i):n.__proto__=i,n}}():void 0)},d3b7:function(e,t,n){var r=n("00ee"),o=n("6eeb"),i=n("b041");r||o(Object.prototype,"toString",i,{unsafe:!0})},d44e:function(e,t,n){var r=n("9bf2").f,o=n("5135"),i=n("b622"),s=i("toStringTag");e.exports=function(e,t,n){e&&!o(e=n?e:e.prototype,s)&&r(e,s,{configurable:!0,value:t})}},d58f:function(e,t,n){var r=n("1c0b"),o=n("7b0b"),i=n("44ad"),s=n("50c4"),a=function(e){return function(t,n,a,c){r(n);var u=o(t),p=i(u),f=s(u.length),l=e?f-1:0,h=e?-1:1;if(a<2)while(1){if(l in p){c=p[l],l+=h;break}if(l+=h,e?l<0:f<=l)throw TypeError("Reduce of empty array with no initial value")}for(;e?l>=0:f>l;l+=h)l in p&&(c=n(c,p[l],l,u));return c}};e.exports={left:a(!1),right:a(!0)}},d784:function(e,t,n){"use strict";n("ac1f");var r=n("6eeb"),o=n("d039"),i=n("b622"),s=n("9263"),a=n("9112"),c=i("species"),u=!o((function(){var e=/./;return e.exec=function(){var e=[];return e.groups={a:"7"},e},"7"!=="".replace(e,"$<a>")})),p=function(){return"$0"==="a".replace(/./,"$0")}(),f=i("replace"),l=function(){return!!/./[f]&&""===/./[f]("a","$0")}(),h=!o((function(){var e=/(?:)/,t=e.exec;e.exec=function(){return t.apply(this,arguments)};var n="ab".split(e);return 2!==n.length||"a"!==n[0]||"b"!==n[1]}));e.exports=function(e,t,n,f){var d=i(e),y=!o((function(){var t={};return t[d]=function(){return 7},7!=""[e](t)})),x=y&&!o((function(){var t=!1,n=/a/;return"split"===e&&(n={},n.constructor={},n.constructor[c]=function(){return n},n.flags="",n[d]=/./[d]),n.exec=function(){return t=!0,null},n[d](""),!t}));if(!y||!x||"replace"===e&&(!u||!p||l)||"split"===e&&!h){var m=/./[d],g=n(d,""[e],(function(e,t,n,r,o){return t.exec===s?y&&!o?{done:!0,value:m.call(t,n,r)}:{done:!0,value:e.call(n,t,r)}:{done:!1}}),{REPLACE_KEEPS_$0:p,REGEXP_REPLACE_SUBSTITUTES_UNDEFINED_CAPTURE:l}),w=g[0],_=g[1];r(String.prototype,e,w),r(RegExp.prototype,d,2==t?function(e,t){return _.call(e,this,t)}:function(e){return _.call(e,this)})}f&&a(RegExp.prototype[d],"sham",!0)}},d81d:function(e,t,n){"use strict";var r=n("23e7"),o=n("b727").map,i=n("1dde"),s=i("map");r({target:"Array",proto:!0,forced:!s},{map:function(e){return o(this,e,arguments.length>1?arguments[1]:void 0)}})},da84:function(e,t,n){(function(t){var n=function(e){return e&&e.Math==Math&&e};e.exports=n("object"==typeof globalThis&&globalThis)||n("object"==typeof window&&window)||n("object"==typeof self&&self)||n("object"==typeof t&&t)||function(){return this}()||Function("return this")()}).call(this,n("c8ba"))},dbb4:function(e,t,n){var r=n("23e7"),o=n("83ab"),i=n("56ef"),s=n("fc6a"),a=n("06cf"),c=n("8418");r({target:"Object",stat:!0,sham:!o},{getOwnPropertyDescriptors:function(e){var t,n,r=s(e),o=a.f,u=i(r),p={},f=0;while(u.length>f)n=o(r,t=u[f++]),void 0!==n&&c(p,t,n);return p}})},ddb0:function(e,t,n){var r=n("da84"),o=n("fdbc"),i=n("e260"),s=n("9112"),a=n("b622"),c=a("iterator"),u=a("toStringTag"),p=i.values;for(var f in o){var l=r[f],h=l&&l.prototype;if(h){if(h[c]!==p)try{s(h,c,p)}catch(y){h[c]=p}if(h[u]||s(h,u,f),o[f])for(var d in i)if(h[d]!==i[d])try{s(h,d,i[d])}catch(y){h[d]=i[d]}}}},ded3:function(e,t,n){n("b64b"),n("a4d3"),n("4de4"),n("e439"),n("159b"),n("dbb4");var r=n("9523");function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}e.exports=i,e.exports["default"]=e.exports,e.exports.__esModule=!0},df75:function(e,t,n){var r=n("ca84"),o=n("7839");e.exports=Object.keys||function(e){return r(e,o)}},e01a:function(e,t,n){"use strict";var r=n("23e7"),o=n("83ab"),i=n("da84"),s=n("5135"),a=n("861d"),c=n("9bf2").f,u=n("e893"),p=i.Symbol;if(o&&"function"==typeof p&&(!("description"in p.prototype)||void 0!==p().description)){var f={},l=function(){var e=arguments.length<1||void 0===arguments[0]?void 0:String(arguments[0]),t=this instanceof l?new p(e):void 0===e?p():p(e);return""===e&&(f[t]=!0),t};u(l,p);var h=l.prototype=p.prototype;h.constructor=l;var d=h.toString,y="Symbol(test)"==String(p("test")),x=/^Symbol\((.*)\)[^)]+$/;c(h,"description",{configurable:!0,get:function(){var e=a(this)?this.valueOf():this,t=d.call(e);if(s(f,e))return"";var n=y?t.slice(7,-1):t.replace(x,"$1");return""===n?void 0:n}}),r({global:!0,forced:!0},{Symbol:l})}},e163:function(e,t,n){var r=n("5135"),o=n("7b0b"),i=n("f772"),s=n("e177"),a=i("IE_PROTO"),c=Object.prototype;e.exports=s?Object.getPrototypeOf:function(e){return e=o(e),r(e,a)?e[a]:"function"==typeof e.constructor&&e instanceof e.constructor?e.constructor.prototype:e instanceof Object?c:null}},e177:function(e,t,n){var r=n("d039");e.exports=!r((function(){function e(){}return e.prototype.constructor=null,Object.getPrototypeOf(new e)!==e.prototype}))},e260:function(e,t,n){"use strict";var r=n("fc6a"),o=n("44d2"),i=n("3f8c"),s=n("69f3"),a=n("7dd0"),c="Array Iterator",u=s.set,p=s.getterFor(c);e.exports=a(Array,"Array",(function(e,t){u(this,{type:c,target:r(e),index:0,kind:t})}),(function(){var e=p(this),t=e.target,n=e.kind,r=e.index++;return!t||r>=t.length?(e.target=void 0,{value:void 0,done:!0}):"keys"==n?{value:r,done:!1}:"values"==n?{value:t[r],done:!1}:{value:[r,t[r]],done:!1}}),"values"),i.Arguments=i.Array,o("keys"),o("values"),o("entries")},e439:function(e,t,n){var r=n("23e7"),o=n("d039"),i=n("fc6a"),s=n("06cf").f,a=n("83ab"),c=o((function(){s(1)})),u=!a||c;r({target:"Object",stat:!0,forced:u,sham:!a},{getOwnPropertyDescriptor:function(e,t){return s(i(e),t)}})},e538:function(e,t,n){var r=n("b622");t.f=r},e893:function(e,t,n){var r=n("5135"),o=n("56ef"),i=n("06cf"),s=n("9bf2");e.exports=function(e,t){for(var n=o(t),a=s.f,c=i.f,u=0;u<n.length;u++){var p=n[u];r(e,p)||a(e,p,c(t,p))}}},e8b5:function(e,t,n){var r=n("c6b6");e.exports=Array.isArray||function(e){return"Array"==r(e)}},e95a:function(e,t,n){var r=n("b622"),o=n("3f8c"),i=r("iterator"),s=Array.prototype;e.exports=function(e){return void 0!==e&&(o.Array===e||s[i]===e)}},f5df:function(e,t,n){var r=n("00ee"),o=n("c6b6"),i=n("b622"),s=i("toStringTag"),a="Arguments"==o(function(){return arguments}()),c=function(e,t){try{return e[t]}catch(n){}};e.exports=r?o:function(e){var t,n,r;return void 0===e?"Undefined":null===e?"Null":"string"==typeof(n=c(t=Object(e),s))?n:a?o(t):"Object"==(r=o(t))&&"function"==typeof t.callee?"Arguments":r}},f601:function(e,t,n){var r=n("ded3").default;n("d81d"),n("13d5");var o=n("8c94"),i=n("c1fd"),s=["key","old","cn","qq","en","tw","th","emoji"],a=o.map((function(e){return r({},e)})),c=a.reduce((function(e,t,n){var o=r({},e);return s.forEach((function(e){t[e]&&!o[t[e]]&&(o[t[e]]={index:n})})),o}),{}),u=i.map((function(e){return a[c[e].index]}));t.EmojiData=a,t.EmojiPanelData=u,t.EmojiDataMap=c,e.exports={EmojiData:a,EmojiPanelData:u,EmojiDataMap:c}},f772:function(e,t,n){var r=n("5692"),o=n("90e3"),i=r("keys");e.exports=function(e){return i[e]||(i[e]=o(e))}},f84d:function(e,t,n){},fb15:function(e,t,n){"use strict";if(n.r(t),n.d(t,"Icon",(function(){return g})),n.d(t,"Parser",(function(){return L})),n.d(t,"install",(function(){return W})),n.d(t,"decode",(function(){return R})),n.d(t,"split",(function(){return A})),n.d(t,"EmojiData",(function(){return f["EmojiData"]})),n.d(t,"EmojiDataMap",(function(){return f["EmojiDataMap"]})),n.d(t,"EmojiPanelData",(function(){return f["EmojiPanelData"]})),n.d(t,"Panel",(function(){return H})),"undefined"!==typeof window){var r=window.document.currentScript,o=n("8875");r=o(),"currentScript"in document||Object.defineProperty(document,"currentScript",{get:o});var i=r&&r.src.match(/(.+\/)[^/]+\.js(\?.*)?$/);i&&(n.p=i[1])}n("b64b"),n("a4d3"),n("4de4"),n("e439"),n("159b"),n("dbb4");function s(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){s(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}n("07ac"),n("b0c0");var u=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("img",{staticClass:"we-emoji",class:e.className,attrs:{src:e.picBlank,alt:e.alt}})},p=[],f=(n("5319"),n("ac1f"),n("498a"),n("7db0"),n("f601")),l=n("5e96"),h={name:"EmojiIcon",props:{name:{type:String},text:{type:String}},data:function(){return{picBlank:l["a"]}},beforeCreate:function(){var e=this.$options.propsData,t=e.name,n=e.text;t||n||console.error("emoji-icon error: Prop name or text required. Props receive:",JSON.stringify(this.$options.propsData))},computed:{emojiObj:function(){var e=this.text,t=this.name;if(e&&f["EmojiDataMap"][e]&&f["EmojiData"][f["EmojiDataMap"][e].index])return f["EmojiData"][f["EmojiDataMap"][e].index];if(t){var n=t.toLowerCase(),r=function(e){return e&&e.toLowerCase().replace(/\W+/g," ").trim().replace(/\s/g,"-")},o=f["EmojiData"].find((function(e){return r(e.en)===n}));if(o)return o}return(t||e)&&console.error("emoji-icon error: Illegal prop name or text. Props receive:",JSON.stringify(this.$options.propsData)),{}},className:function(){return this.emojiObj.style},alt:function(){return this.text}}},d=h;function y(e,t,n,r,o,i,s,a){var c,u="function"===typeof e?e.options:e;if(t&&(u.render=t,u.staticRenderFns=n,u._compiled=!0),r&&(u.functional=!0),i&&(u._scopeId="data-v-"+i),s?(c=function(e){e=e||this.$vnode&&this.$vnode.ssrContext||this.parent&&this.parent.$vnode&&this.parent.$vnode.ssrContext,e||"undefined"===typeof __VUE_SSR_CONTEXT__||(e=__VUE_SSR_CONTEXT__),o&&o.call(this,e),e&&e._registeredComponents&&e._registeredComponents.add(s)},u._ssrRegister=c):o&&(c=a?function(){o.call(this,(u.functional?this.parent:this).$root.$options.shadowRoot)}:o),c)if(u.functional){u._injectStyles=c;var p=u.render;u.render=function(e,t){return c.call(t),p(e,t)}}else{var f=u.beforeCreate;u.beforeCreate=f?[].concat(f,c):[c]}return{exports:e,options:u}}var x=y(d,u,p,!1,null,null,null),m=x.exports;m.install=function(e){e.component(m.name,m)};var g=m;function w(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,r=new Array(t);n<t;n++)r[n]=e[n];return r}function _(e){if(Array.isArray(e))return w(e)}n("e01a"),n("d3b7"),n("d28b"),n("3ca3"),n("e260"),n("ddb0"),n("a630");function v(e){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(e))return Array.from(e)}n("fb6a");function b(e,t){if(e){if("string"===typeof e)return w(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);return"Object"===n&&e.constructor&&(n=e.constructor.name),"Map"===n||"Set"===n?Array.from(e):"Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)?w(e,t):void 0}}function E(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function j(e){return _(e)||v(e)||b(e)||E()}n("d81d"),n("13d5"),n("99af"),n("4d63"),n("25f0"),n("a15b");var k=function(e){var t=e.className,n=e.text;return'<img src="'.concat(l["a"],'" class="we-emoji ').concat(t,'" alt="').concat(n,'">')};function S(e){return!(!f["EmojiDataMap"][e]||!f["EmojiData"][f["EmojiDataMap"][e].index])}function O(e,t,n){var r,o=new RegExp(t,"g");while(r=o.exec(e))for(var i=r,s=i[0],a=i.index,c=n.length;c<=s.length;++c){var u=s.slice(0,c);if(S(u))return{0:u,index:a}}return null}function P(e){var t,n=new RegExp(/\[[^[\]]+\]/,"g");while(t=n.exec(e))if(S(t[0]))return t;return null}function T(e){var t=/(\ud83c[\udf00-\udfff])|(\ud83d[\udc00-\ude4f\ude80-\udeff])|[\u2600-\u2B55]/;return P(e)||O(e,/\/([\u4e00-\u9fa5\w]{1,4})/,"/")||O(e,/\/(:[^/]{1,8})/,"/:")||O(e,t,"")}function D(e){return e}function q(e){if(!e)return[];var t=T(e);if(t){var n=t[0],r=t.index,o=e.slice(0,r),i=e.slice(r+n.length),s=S(n)?{text:n,data:f["EmojiData"][f["EmojiDataMap"][n].index]}:n,a=[].concat(j(q(o)),[s],j(q(i)));return a.some((function(e){return e.text}))?a:[a.join("")]}return[e]}var A=function(e,t){var n=D(e,t);return q(n)},R=function(e,t){return e?A(e,t).map((function(e){return e.text?k({text:e.text,className:e.data.style}):e})).join(""):e},C={name:"EmojiParser",props:{tag:{type:String,default:"span"}},methods:{replace:function(e){var t=this,n=this.$createElement;return e&&e.length?e.map((function(e){var r=e.text;if(!r){var o=function(e){return e&&e.reduce((function(e,t){return Array.isArray(t)?[].concat(j(e),j(t)):[].concat(j(e),[t])}),[])};return c(c({},e),{},{children:o(t.replace(e.children))})}return A(r).map((function(e){return e.text?n(g,{attrs:{text:e.text}}):t._v(e)}))})):e}},render:function(e){return e(this.tag,this.replace(this.$slots.default))},install:function(e){e.component(C.name,C)}},L=C,I=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"emotion_panel"},[n("ul",{staticClass:"emotions",attrs:{slot:"content"},slot:"content"},e._l(e.edata,(function(t,r){return n("li",{key:t.key,staticClass:"emotions_item",on:{click:function(t){return e.select(r)}}},[n("emoji-icon",{attrs:{text:t.cn}})],1)})),0)])},M=[],N=(n("a9e3"),{name:"EmojiPanel",props:{emojiPanelWidth:{type:Number,default:300},emojiPanelHeight:{type:Number,default:300}},data:function(){return{edata:f["EmojiPanelData"]}},methods:{select:function(e){this.$emit("select",this.edata[e])}}}),F=N,B=y(F,I,M,!1,null,null,null),$=B.exports;$.install=function(e){e.component($.name,$)};var H=$,G=(n("f84d"),{Icon:g,Parser:L,Panel:H}),W=function e(t){e.installed||(e.installed=!0,Object.values(G).forEach((function(e){t.component(e.name,e)})))},U=c(c({},G),{},{install:W,decode:R,split:A,EmojiData:f["EmojiData"],EmojiDataMap:f["EmojiDataMap"],EmojiPanelData:f["EmojiPanelData"]});"undefined"!==typeof window&&window.Vue&&W(window.Vue);var K=U;t["default"]=K},fb6a:function(e,t,n){"use strict";var r=n("23e7"),o=n("861d"),i=n("e8b5"),s=n("23cb"),a=n("50c4"),c=n("fc6a"),u=n("8418"),p=n("b622"),f=n("1dde"),l=f("slice"),h=p("species"),d=[].slice,y=Math.max;r({target:"Array",proto:!0,forced:!l},{slice:function(e,t){var n,r,p,f=c(this),l=a(f.length),x=s(e,l),m=s(void 0===t?l:t,l);if(i(f)&&(n=f.constructor,"function"!=typeof n||n!==Array&&!i(n.prototype)?o(n)&&(n=n[h],null===n&&(n=void 0)):n=void 0,n===Array||void 0===n))return d.call(f,x,m);for(r=new(void 0===n?Array:n)(y(m-x,0)),p=0;x<m;x++,p++)x in f&&u(r,p,f[x]);return r.length=p,r}})},fc6a:function(e,t,n){var r=n("44ad"),o=n("1d80");e.exports=function(e){return r(o(e))}},fdbc:function(e,t){e.exports={CSSRuleList:0,CSSStyleDeclaration:0,CSSValueList:0,ClientRectList:0,DOMRectList:0,DOMStringList:0,DOMTokenList:1,DataTransferItemList:0,FileList:0,HTMLAllCollection:0,HTMLCollection:0,HTMLFormElement:0,HTMLSelectElement:0,MediaList:0,MimeTypeArray:0,NamedNodeMap:0,NodeList:1,PaintRequestList:0,Plugin:0,PluginArray:0,SVGLengthList:0,SVGNumberList:0,SVGPathSegList:0,SVGPointList:0,SVGStringList:0,SVGTransformList:0,SourceBufferList:0,StyleSheetList:0,TextTrackCueList:0,TextTrackList:0,TouchList:0}},fdbf:function(e,t,n){var r=n("4930");e.exports=r&&!Symbol.sham&&"symbol"==typeof Symbol.iterator}})["default"]}));</script><script h5only type="text/javascript" nonce="1415253946" reportloaderror>!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define("Darkmode",[],t):"object"==typeof exports?exports.Darkmode=t():e.Darkmode=t()}(window,(function(){return function(e){var t={};function r(n){if(t[n])return t[n].exports;var a=t[n]={i:n,l:!1,exports:{}};return e[n].call(a.exports,a,a.exports,r),a.l=!0,a.exports}return r.m=e,r.c=t,r.d=function(e,t,n){r.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},r.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},r.t=function(e,t){if(1&t&&(e=r(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var a in e)r.d(n,a,function(t){return e[t]}.bind(null,a));return n},r.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return r.d(t,"a",t),t},r.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},r.p="",r(r.s=9)}([function(e,t,r){"use strict";var n=r(3),a=r(6),o=[].slice,i=["keyword","gray","hex"],l={};Object.keys(a).forEach((function(e){l[o.call(a[e].labels).sort().join("")]=e}));var s={};function u(e,t){if(!(this instanceof u))return new u(e,t);if(t&&t in i&&(t=null),t&&!(t in a))throw new Error("Unknown model: "+t);var r,c;if(null==e)this.model="rgb",this.color=[0,0,0],this.valpha=1;else if(e instanceof u)this.model=e.model,this.color=e.color.slice(),this.valpha=e.valpha;else if("string"==typeof e){var h=n.get(e);if(null===h)throw new Error("Unable to parse color from string: "+e);this.model=h.model,c=a[this.model].channels,this.color=h.value.slice(0,c),this.valpha="number"==typeof h.value[c]?h.value[c]:1}else if(e.length){this.model=t||"rgb",c=a[this.model].channels;var f=o.call(e,0,c);this.color=d(f,c),this.valpha="number"==typeof e[c]?e[c]:1}else if("number"==typeof e)e&=16777215,this.model="rgb",this.color=[e>>16&255,e>>8&255,255&e],this.valpha=1;else{this.valpha=1;var g=Object.keys(e);"alpha"in e&&(g.splice(g.indexOf("alpha"),1),this.valpha="number"==typeof e.alpha?e.alpha:0);var b=g.sort().join("");if(!(b in l))throw new Error("Unable to parse color from object: "+JSON.stringify(e));this.model=l[b];var p=a[this.model].labels,y=[];for(r=0;r<p.length;r++)y.push(e[p[r]]);this.color=d(y)}if(s[this.model])for(c=a[this.model].channels,r=0;r<c;r++){var m=s[this.model][r];m&&(this.color[r]=m(this.color[r]))}this.valpha=Math.max(0,Math.min(1,this.valpha)),Object.freeze&&Object.freeze(this)}function c(e,t,r){return(e=Array.isArray(e)?e:[e]).forEach((function(e){(s[e]||(s[e]=[]))[t]=r})),e=e[0],function(n){var a;return arguments.length?(r&&(n=r(n)),(a=this[e]()).color[t]=n,a):(a=this[e]().color[t],r&&(a=r(a)),a)}}function h(e){return function(t){return Math.max(0,Math.min(e,t))}}function f(e){return Array.isArray(e)?e:[e]}function d(e,t){for(var r=0;r<t;r++)"number"!=typeof e[r]&&(e[r]=0);return e}u.prototype={toString:function(){return this.string()},toJSON:function(){return this[this.model]()},string:function(e){var t=this.model in n.to?this:this.rgb(),r=1===(t=t.round("number"==typeof e?e:1)).valpha?t.color:t.color.concat(this.valpha);return n.to[t.model](r)},percentString:function(e){var t=this.rgb().round("number"==typeof e?e:1),r=1===t.valpha?t.color:t.color.concat(this.valpha);return n.to.rgb.percent(r)},array:function(){return 1===this.valpha?this.color.slice():this.color.concat(this.valpha)},object:function(){for(var e={},t=a[this.model].channels,r=a[this.model].labels,n=0;n<t;n++)e[r[n]]=this.color[n];return 1!==this.valpha&&(e.alpha=this.valpha),e},unitArray:function(){var e=this.rgb().color;return e[0]/=255,e[1]/=255,e[2]/=255,1!==this.valpha&&e.push(this.valpha),e},unitObject:function(){var e=this.rgb().object();return e.r/=255,e.g/=255,e.b/=255,1!==this.valpha&&(e.alpha=this.valpha),e},round:function(e){return e=Math.max(e||0,0),new u(this.color.map(function(e){return function(t){return function(e,t){return Number(e.toFixed(t))}(t,e)}}(e)).concat(this.valpha),this.model)},alpha:function(e){return arguments.length?new u(this.color.concat(Math.max(0,Math.min(1,e))),this.model):this.valpha},red:c("rgb",0,h(255)),green:c("rgb",1,h(255)),blue:c("rgb",2,h(255)),hue:c(["hsl","hsv","hsl","hwb","hcg"],0,(function(e){return(e%360+360)%360})),saturationl:c("hsl",1,h(100)),lightness:c("hsl",2,h(100)),saturationv:c("hsv",1,h(100)),value:c("hsv",2,h(100)),chroma:c("hcg",1,h(100)),gray:c("hcg",2,h(100)),white:c("hwb",1,h(100)),wblack:c("hwb",2,h(100)),cyan:c("cmyk",0,h(100)),magenta:c("cmyk",1,h(100)),yellow:c("cmyk",2,h(100)),black:c("cmyk",3,h(100)),x:c("xyz",0,h(100)),y:c("xyz",1,h(100)),z:c("xyz",2,h(100)),l:c("lab",0,h(100)),a:c("lab",1),b:c("lab",2),keyword:function(e){return arguments.length?new u(e):a[this.model].keyword(this.color)},hex:function(e){return arguments.length?new u(e):n.to.hex(this.rgb().round().color)},rgbNumber:function(){var e=this.rgb().color;return(255&e[0])<<16|(255&e[1])<<8|255&e[2]},luminosity:function(){for(var e=this.rgb().color,t=[],r=0;r<e.length;r++){var n=e[r]/255;t[r]=n<=.03928?n/12.92:Math.pow((n+.055)/1.055,2.4)}return.2126*t[0]+.7152*t[1]+.0722*t[2]},contrast:function(e){var t=this.luminosity(),r=e.luminosity();return t>r?(t+.05)/(r+.05):(r+.05)/(t+.05)},level:function(e){var t=this.contrast(e);return t>=7.1?"AAA":t>=4.5?"AA":""},isDark:function(){var e=this.rgb().color;return(299*e[0]+587*e[1]+114*e[2])/1e3<128},isLight:function(){return!this.isDark()},negate:function(){for(var e=this.rgb(),t=0;t<3;t++)e.color[t]=255-e.color[t];return e},lighten:function(e){var t=this.hsl();return t.color[2]+=t.color[2]*e,t},darken:function(e){var t=this.hsl();return t.color[2]-=t.color[2]*e,t},saturate:function(e){var t=this.hsl();return t.color[1]+=t.color[1]*e,t},desaturate:function(e){var t=this.hsl();return t.color[1]-=t.color[1]*e,t},whiten:function(e){var t=this.hwb();return t.color[1]+=t.color[1]*e,t},blacken:function(e){var t=this.hwb();return t.color[2]+=t.color[2]*e,t},grayscale:function(){var e=this.rgb().color,t=.3*e[0]+.59*e[1]+.11*e[2];return u.rgb(t,t,t)},fade:function(e){return this.alpha(this.valpha-this.valpha*e)},opaquer:function(e){return this.alpha(this.valpha+this.valpha*e)},rotate:function(e){var t=this.hsl(),r=t.color[0];return r=(r=(r+e)%360)<0?360+r:r,t.color[0]=r,t},mix:function(e,t){if(!e||!e.rgb)throw new Error('Argument to "mix" was not a Color instance, but rather an instance of '+typeof e);var r=e.rgb(),n=this.rgb(),a=void 0===t?.5:t,o=2*a-1,i=r.alpha()-n.alpha(),l=((o*i==-1?o:(o+i)/(1+o*i))+1)/2,s=1-l;return u.rgb(l*r.red()+s*n.red(),l*r.green()+s*n.green(),l*r.blue()+s*n.blue(),r.alpha()*a+n.alpha()*(1-a))}},Object.keys(a).forEach((function(e){if(-1===i.indexOf(e)){var t=a[e].channels;u.prototype[e]=function(){if(this.model===e)return new u(this);if(arguments.length)return new u(arguments,e);var r="number"==typeof arguments[t]?t:this.valpha;return new u(f(a[this.model][e].raw(this.color)).concat(r),e)},u[e]=function(r){return"number"==typeof r&&(r=d(o.call(arguments),t)),new u(r,e)}}})),e.exports=u},function(e,t,r){"use strict";e.exports={aliceblue:[240,248,255],antiquewhite:[250,235,215],aqua:[0,255,255],aquamarine:[127,255,212],azure:[240,255,255],beige:[245,245,220],bisque:[255,228,196],black:[0,0,0],blanchedalmond:[255,235,205],blue:[0,0,255],blueviolet:[138,43,226],brown:[165,42,42],burlywood:[222,184,135],cadetblue:[95,158,160],chartreuse:[127,255,0],chocolate:[210,105,30],coral:[255,127,80],cornflowerblue:[100,149,237],cornsilk:[255,248,220],crimson:[220,20,60],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgoldenrod:[184,134,11],darkgray:[169,169,169],darkgreen:[0,100,0],darkgrey:[169,169,169],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkseagreen:[143,188,143],darkslateblue:[72,61,139],darkslategray:[47,79,79],darkslategrey:[47,79,79],darkturquoise:[0,206,209],darkviolet:[148,0,211],deeppink:[255,20,147],deepskyblue:[0,191,255],dimgray:[105,105,105],dimgrey:[105,105,105],dodgerblue:[30,144,255],firebrick:[178,34,34],floralwhite:[255,250,240],forestgreen:[34,139,34],fuchsia:[255,0,255],gainsboro:[220,220,220],ghostwhite:[248,248,255],gold:[255,215,0],goldenrod:[218,165,32],gray:[128,128,128],green:[0,128,0],greenyellow:[173,255,47],grey:[128,128,128],honeydew:[240,255,240],hotpink:[255,105,180],indianred:[205,92,92],indigo:[75,0,130],ivory:[255,255,240],khaki:[240,230,140],lavender:[230,230,250],lavenderblush:[255,240,245],lawngreen:[124,252,0],lemonchiffon:[255,250,205],lightblue:[173,216,230],lightcoral:[240,128,128],lightcyan:[224,255,255],lightgoldenrodyellow:[250,250,210],lightgray:[211,211,211],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightsalmon:[255,160,122],lightseagreen:[32,178,170],lightskyblue:[135,206,250],lightslategray:[119,136,153],lightslategrey:[119,136,153],lightsteelblue:[176,196,222],lightyellow:[255,255,224],lime:[0,255,0],limegreen:[50,205,50],linen:[250,240,230],magenta:[255,0,255],maroon:[128,0,0],mediumaquamarine:[102,205,170],mediumblue:[0,0,205],mediumorchid:[186,85,211],mediumpurple:[147,112,219],mediumseagreen:[60,179,113],mediumslateblue:[123,104,238],mediumspringgreen:[0,250,154],mediumturquoise:[72,209,204],mediumvioletred:[199,21,133],midnightblue:[25,25,112],mintcream:[245,255,250],mistyrose:[255,228,225],moccasin:[255,228,181],navajowhite:[255,222,173],navy:[0,0,128],oldlace:[253,245,230],olive:[128,128,0],olivedrab:[107,142,35],orange:[255,165,0],orangered:[255,69,0],orchid:[218,112,214],palegoldenrod:[238,232,170],palegreen:[152,251,152],paleturquoise:[175,238,238],palevioletred:[219,112,147],papayawhip:[255,239,213],peachpuff:[255,218,185],peru:[205,133,63],pink:[255,192,203],plum:[221,160,221],powderblue:[176,224,230],purple:[128,0,128],rebeccapurple:[102,51,153],red:[255,0,0],rosybrown:[188,143,143],royalblue:[65,105,225],saddlebrown:[139,69,19],salmon:[250,128,114],sandybrown:[244,164,96],seagreen:[46,139,87],seashell:[255,245,238],sienna:[160,82,45],silver:[192,192,192],skyblue:[135,206,235],slateblue:[106,90,205],slategray:[112,128,144],slategrey:[112,128,144],snow:[255,250,250],springgreen:[0,255,127],steelblue:[70,130,180],tan:[210,180,140],teal:[0,128,128],thistle:[216,191,216],tomato:[255,99,71],turquoise:[64,224,208],violet:[238,130,238],wheat:[245,222,179],white:[255,255,255],whitesmoke:[245,245,245],yellow:[255,255,0],yellowgreen:[154,205,50]}},function(e,t,r){var n=r(7),a={};for(var o in n)n.hasOwnProperty(o)&&(a[n[o]]=o);var i=e.exports={rgb:{channels:3,labels:"rgb"},hsl:{channels:3,labels:"hsl"},hsv:{channels:3,labels:"hsv"},hwb:{channels:3,labels:"hwb"},cmyk:{channels:4,labels:"cmyk"},xyz:{channels:3,labels:"xyz"},lab:{channels:3,labels:"lab"},lch:{channels:3,labels:"lch"},hex:{channels:1,labels:["hex"]},keyword:{channels:1,labels:["keyword"]},ansi16:{channels:1,labels:["ansi16"]},ansi256:{channels:1,labels:["ansi256"]},hcg:{channels:3,labels:["h","c","g"]},apple:{channels:3,labels:["r16","g16","b16"]},gray:{channels:1,labels:["gray"]}};for(var l in i)if(i.hasOwnProperty(l)){if(!("channels"in i[l]))throw new Error("missing channels property: "+l);if(!("labels"in i[l]))throw new Error("missing channel labels property: "+l);if(i[l].labels.length!==i[l].channels)throw new Error("channel and label counts mismatch: "+l);var s=i[l].channels,u=i[l].labels;delete i[l].channels,delete i[l].labels,Object.defineProperty(i[l],"channels",{value:s}),Object.defineProperty(i[l],"labels",{value:u})}i.rgb.hsl=function(e){var t,r,n=e[0]/255,a=e[1]/255,o=e[2]/255,i=Math.min(n,a,o),l=Math.max(n,a,o),s=l-i;return l===i?t=0:n===l?t=(a-o)/s:a===l?t=2+(o-n)/s:o===l&&(t=4+(n-a)/s),(t=Math.min(60*t,360))<0&&(t+=360),r=(i+l)/2,[t,100*(l===i?0:r<=.5?s/(l+i):s/(2-l-i)),100*r]},i.rgb.hsv=function(e){var t,r,n,a,o,i=e[0]/255,l=e[1]/255,s=e[2]/255,u=Math.max(i,l,s),c=u-Math.min(i,l,s),h=function(e){return(u-e)/6/c+.5};return 0===c?a=o=0:(o=c/u,t=h(i),r=h(l),n=h(s),i===u?a=n-r:l===u?a=1/3+t-n:s===u&&(a=2/3+r-t),a<0?a+=1:a>1&&(a-=1)),[360*a,100*o,100*u]},i.rgb.hwb=function(e){var t=e[0],r=e[1],n=e[2];return[i.rgb.hsl(e)[0],100*(1/255*Math.min(t,Math.min(r,n))),100*(n=1-1/255*Math.max(t,Math.max(r,n)))]},i.rgb.cmyk=function(e){var t,r=e[0]/255,n=e[1]/255,a=e[2]/255;return[100*((1-r-(t=Math.min(1-r,1-n,1-a)))/(1-t)||0),100*((1-n-t)/(1-t)||0),100*((1-a-t)/(1-t)||0),100*t]},i.rgb.keyword=function(e){var t=a[e];if(t)return t;var r,o,i,l=1/0;for(var s in n)if(n.hasOwnProperty(s)){var u=n[s],c=(o=e,i=u,Math.pow(o[0]-i[0],2)+Math.pow(o[1]-i[1],2)+Math.pow(o[2]-i[2],2));c<l&&(l=c,r=s)}return r},i.keyword.rgb=function(e){return n[e]},i.rgb.xyz=function(e){var t=e[0]/255,r=e[1]/255,n=e[2]/255;return[100*(.4124*(t=t>.04045?Math.pow((t+.055)/1.055,2.4):t/12.92)+.3576*(r=r>.04045?Math.pow((r+.055)/1.055,2.4):r/12.92)+.1805*(n=n>.04045?Math.pow((n+.055)/1.055,2.4):n/12.92)),100*(.2126*t+.7152*r+.0722*n),100*(.0193*t+.1192*r+.9505*n)]},i.rgb.lab=function(e){var t=i.rgb.xyz(e),r=t[0],n=t[1],a=t[2];return n/=100,a/=108.883,r=(r/=95.047)>.008856?Math.pow(r,1/3):7.787*r+16/116,[116*(n=n>.008856?Math.pow(n,1/3):7.787*n+16/116)-16,500*(r-n),200*(n-(a=a>.008856?Math.pow(a,1/3):7.787*a+16/116))]},i.hsl.rgb=function(e){var t,r,n,a,o,i=e[0]/360,l=e[1]/100,s=e[2]/100;if(0===l)return[o=255*s,o,o];t=2*s-(r=s<.5?s*(1+l):s+l-s*l),a=[0,0,0];for(var u=0;u<3;u++)(n=i+1/3*-(u-1))<0&&n++,n>1&&n--,o=6*n<1?t+6*(r-t)*n:2*n<1?r:3*n<2?t+(r-t)*(2/3-n)*6:t,a[u]=255*o;return a},i.hsl.hsv=function(e){var t=e[0],r=e[1]/100,n=e[2]/100,a=r,o=Math.max(n,.01);return r*=(n*=2)<=1?n:2-n,a*=o<=1?o:2-o,[t,100*(0===n?2*a/(o+a):2*r/(n+r)),100*((n+r)/2)]},i.hsv.rgb=function(e){var t=e[0]/60,r=e[1]/100,n=e[2]/100,a=Math.floor(t)%6,o=t-Math.floor(t),i=255*n*(1-r),l=255*n*(1-r*o),s=255*n*(1-r*(1-o));switch(n*=255,a){case 0:return[n,s,i];case 1:return[l,n,i];case 2:return[i,n,s];case 3:return[i,l,n];case 4:return[s,i,n];case 5:return[n,i,l]}},i.hsv.hsl=function(e){var t,r,n,a=e[0],o=e[1]/100,i=e[2]/100,l=Math.max(i,.01);return n=(2-o)*i,r=o*l,[a,100*(r=(r/=(t=(2-o)*l)<=1?t:2-t)||0),100*(n/=2)]},i.hwb.rgb=function(e){var t,r,n,a,o,i,l,s=e[0]/360,u=e[1]/100,c=e[2]/100,h=u+c;switch(h>1&&(u/=h,c/=h),n=6*s-(t=Math.floor(6*s)),0!=(1&t)&&(n=1-n),a=u+n*((r=1-c)-u),t){default:case 6:case 0:o=r,i=a,l=u;break;case 1:o=a,i=r,l=u;break;case 2:o=u,i=r,l=a;break;case 3:o=u,i=a,l=r;break;case 4:o=a,i=u,l=r;break;case 5:o=r,i=u,l=a}return[255*o,255*i,255*l]},i.cmyk.rgb=function(e){var t=e[0]/100,r=e[1]/100,n=e[2]/100,a=e[3]/100;return[255*(1-Math.min(1,t*(1-a)+a)),255*(1-Math.min(1,r*(1-a)+a)),255*(1-Math.min(1,n*(1-a)+a))]},i.xyz.rgb=function(e){var t,r,n,a=e[0]/100,o=e[1]/100,i=e[2]/100;return r=-.9689*a+1.8758*o+.0415*i,n=.0557*a+-.204*o+1.057*i,t=(t=3.2406*a+-1.5372*o+-.4986*i)>.0031308?1.055*Math.pow(t,1/2.4)-.055:12.92*t,r=r>.0031308?1.055*Math.pow(r,1/2.4)-.055:12.92*r,n=n>.0031308?1.055*Math.pow(n,1/2.4)-.055:12.92*n,[255*(t=Math.min(Math.max(0,t),1)),255*(r=Math.min(Math.max(0,r),1)),255*(n=Math.min(Math.max(0,n),1))]},i.xyz.lab=function(e){var t=e[0],r=e[1],n=e[2];return r/=100,n/=108.883,t=(t/=95.047)>.008856?Math.pow(t,1/3):7.787*t+16/116,[116*(r=r>.008856?Math.pow(r,1/3):7.787*r+16/116)-16,500*(t-r),200*(r-(n=n>.008856?Math.pow(n,1/3):7.787*n+16/116))]},i.lab.xyz=function(e){var t,r,n,a=e[0];t=e[1]/500+(r=(a+16)/116),n=r-e[2]/200;var o=Math.pow(r,3),i=Math.pow(t,3),l=Math.pow(n,3);return r=o>.008856?o:(r-16/116)/7.787,t=i>.008856?i:(t-16/116)/7.787,n=l>.008856?l:(n-16/116)/7.787,[t*=95.047,r*=100,n*=108.883]},i.lab.lch=function(e){var t,r=e[0],n=e[1],a=e[2];return(t=360*Math.atan2(a,n)/2/Math.PI)<0&&(t+=360),[r,Math.sqrt(n*n+a*a),t]},i.lch.lab=function(e){var t,r=e[0],n=e[1];return t=e[2]/360*2*Math.PI,[r,n*Math.cos(t),n*Math.sin(t)]},i.rgb.ansi16=function(e){var t=e[0],r=e[1],n=e[2],a=1 in arguments?arguments[1]:i.rgb.hsv(e)[2];if(0===(a=Math.round(a/50)))return 30;var o=30+(Math.round(n/255)<<2|Math.round(r/255)<<1|Math.round(t/255));return 2===a&&(o+=60),o},i.hsv.ansi16=function(e){return i.rgb.ansi16(i.hsv.rgb(e),e[2])},i.rgb.ansi256=function(e){var t=e[0],r=e[1],n=e[2];return t===r&&r===n?t<8?16:t>248?231:Math.round((t-8)/247*24)+232:16+36*Math.round(t/255*5)+6*Math.round(r/255*5)+Math.round(n/255*5)},i.ansi16.rgb=function(e){var t=e%10;if(0===t||7===t)return e>50&&(t+=3.5),[t=t/10.5*255,t,t];var r=.5*(1+~~(e>50));return[(1&t)*r*255,(t>>1&1)*r*255,(t>>2&1)*r*255]},i.ansi256.rgb=function(e){if(e>=232){var t=10*(e-232)+8;return[t,t,t]}var r;return e-=16,[Math.floor(e/36)/5*255,Math.floor((r=e%36)/6)/5*255,r%6/5*255]},i.rgb.hex=function(e){var t=(((255&Math.round(e[0]))<<16)+((255&Math.round(e[1]))<<8)+(255&Math.round(e[2]))).toString(16).toUpperCase();return"000000".substring(t.length)+t},i.hex.rgb=function(e){var t=e.toString(16).match(/[a-f0-9]{6}|[a-f0-9]{3}/i);if(!t)return[0,0,0];var r=t[0];3===t[0].length&&(r=r.split("").map((function(e){return e+e})).join(""));var n=parseInt(r,16);return[n>>16&255,n>>8&255,255&n]},i.rgb.hcg=function(e){var t,r=e[0]/255,n=e[1]/255,a=e[2]/255,o=Math.max(Math.max(r,n),a),i=Math.min(Math.min(r,n),a),l=o-i;return t=l<=0?0:o===r?(n-a)/l%6:o===n?2+(a-r)/l:4+(r-n)/l+4,t/=6,[360*(t%=1),100*l,100*(l<1?i/(1-l):0)]},i.hsl.hcg=function(e){var t=e[1]/100,r=e[2]/100,n=1,a=0;return(n=r<.5?2*t*r:2*t*(1-r))<1&&(a=(r-.5*n)/(1-n)),[e[0],100*n,100*a]},i.hsv.hcg=function(e){var t=e[1]/100,r=e[2]/100,n=t*r,a=0;return n<1&&(a=(r-n)/(1-n)),[e[0],100*n,100*a]},i.hcg.rgb=function(e){var t=e[0]/360,r=e[1]/100,n=e[2]/100;if(0===r)return[255*n,255*n,255*n];var a,o=[0,0,0],i=t%1*6,l=i%1,s=1-l;switch(Math.floor(i)){case 0:o[0]=1,o[1]=l,o[2]=0;break;case 1:o[0]=s,o[1]=1,o[2]=0;break;case 2:o[0]=0,o[1]=1,o[2]=l;break;case 3:o[0]=0,o[1]=s,o[2]=1;break;case 4:o[0]=l,o[1]=0,o[2]=1;break;default:o[0]=1,o[1]=0,o[2]=s}return a=(1-r)*n,[255*(r*o[0]+a),255*(r*o[1]+a),255*(r*o[2]+a)]},i.hcg.hsv=function(e){var t=e[1]/100,r=t+e[2]/100*(1-t),n=0;return r>0&&(n=t/r),[e[0],100*n,100*r]},i.hcg.hsl=function(e){var t=e[1]/100,r=e[2]/100*(1-t)+.5*t,n=0;return r>0&&r<.5?n=t/(2*r):r>=.5&&r<1&&(n=t/(2*(1-r))),[e[0],100*n,100*r]},i.hcg.hwb=function(e){var t=e[1]/100,r=t+e[2]/100*(1-t);return[e[0],100*(r-t),100*(1-r)]},i.hwb.hcg=function(e){var t=e[1]/100,r=1-e[2]/100,n=r-t,a=0;return n<1&&(a=(r-n)/(1-n)),[e[0],100*n,100*a]},i.apple.rgb=function(e){return[e[0]/65535*255,e[1]/65535*255,e[2]/65535*255]},i.rgb.apple=function(e){return[e[0]/255*65535,e[1]/255*65535,e[2]/255*65535]},i.gray.rgb=function(e){return[e[0]/100*255,e[0]/100*255,e[0]/100*255]},i.gray.hsl=i.gray.hsv=function(e){return[0,0,e[0]]},i.gray.hwb=function(e){return[0,100,e[0]]},i.gray.cmyk=function(e){return[0,0,0,e[0]]},i.gray.lab=function(e){return[e[0],0,0]},i.gray.hex=function(e){var t=255&Math.round(e[0]/100*255),r=((t<<16)+(t<<8)+t).toString(16).toUpperCase();return"000000".substring(r.length)+r},i.rgb.gray=function(e){return[(e[0]+e[1]+e[2])/3/255*100]}},function(e,t,r){var n=r(1),a=r(4),o=Object.hasOwnProperty,i={};for(var l in n)o.call(n,l)&&(i[n[l]]=l);var s=e.exports={to:{},get:{}};function u(e,t,r){return Math.min(Math.max(t,e),r)}function c(e){var t=Math.round(e).toString(16).toUpperCase();return t.length<2?"0"+t:t}s.get=function(e){var t,r;switch(e.substring(0,3).toLowerCase()){case"hsl":t=s.get.hsl(e),r="hsl";break;case"hwb":t=s.get.hwb(e),r="hwb";break;default:t=s.get.rgb(e),r="rgb"}return t?{model:r,value:t}:null},s.get.rgb=function(e){if(!e)return null;var t,r,a,i=[0,0,0,1];if(t=e.match(/^#([a-f0-9]{6})([a-f0-9]{2})?$/i)){for(a=t[2],t=t[1],r=0;r<3;r++){var l=2*r;i[r]=parseInt(t.slice(l,l+2),16)}a&&(i[3]=parseInt(a,16)/255)}else if(t=e.match(/^#([a-f0-9]{3,4})$/i)){for(a=(t=t[1])[3],r=0;r<3;r++)i[r]=parseInt(t[r]+t[r],16);a&&(i[3]=parseInt(a+a,16)/255)}else if(t=e.match(/^rgba?\(\s*([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/)){for(r=0;r<3;r++)i[r]=parseInt(t[r+1],0);t[4]&&(t[5]?i[3]=.01*parseFloat(t[4]):i[3]=parseFloat(t[4]))}else{if(!(t=e.match(/^rgba?\(\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/)))return(t=e.match(/^(\w+)$/))?"transparent"===t[1]?[0,0,0,0]:o.call(n,t[1])?((i=n[t[1]])[3]=1,i):null:null;for(r=0;r<3;r++)i[r]=Math.round(2.55*parseFloat(t[r+1]));t[4]&&(t[5]?i[3]=.01*parseFloat(t[4]):i[3]=parseFloat(t[4]))}for(r=0;r<3;r++)i[r]=u(i[r],0,255);return i[3]=u(i[3],0,1),i},s.get.hsl=function(e){if(!e)return null;var t=e.match(/^hsla?\(\s*([+-]?(?:\d{0,3}\.)?\d+)(?:deg)?\s*,?\s*([+-]?[\d\.]+)%\s*,?\s*([+-]?[\d\.]+)%\s*(?:[,|\/]\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/);if(t){var r=parseFloat(t[4]);return[(parseFloat(t[1])%360+360)%360,u(parseFloat(t[2]),0,100),u(parseFloat(t[3]),0,100),u(isNaN(r)?1:r,0,1)]}return null},s.get.hwb=function(e){if(!e)return null;var t=e.match(/^hwb\(\s*([+-]?\d{0,3}(?:\.\d+)?)(?:deg)?\s*,\s*([+-]?[\d\.]+)%\s*,\s*([+-]?[\d\.]+)%\s*(?:,\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/);if(t){var r=parseFloat(t[4]);return[(parseFloat(t[1])%360+360)%360,u(parseFloat(t[2]),0,100),u(parseFloat(t[3]),0,100),u(isNaN(r)?1:r,0,1)]}return null},s.to.hex=function(){var e=a(arguments);return"#"+c(e[0])+c(e[1])+c(e[2])+(e[3]<1?c(Math.round(255*e[3])):"")},s.to.rgb=function(){var e=a(arguments);return e.length<4||1===e[3]?"rgb("+Math.round(e[0])+", "+Math.round(e[1])+", "+Math.round(e[2])+")":"rgba("+Math.round(e[0])+", "+Math.round(e[1])+", "+Math.round(e[2])+", "+e[3]+")"},s.to.rgb.percent=function(){var e=a(arguments),t=Math.round(e[0]/255*100),r=Math.round(e[1]/255*100),n=Math.round(e[2]/255*100);return e.length<4||1===e[3]?"rgb("+t+"%, "+r+"%, "+n+"%)":"rgba("+t+"%, "+r+"%, "+n+"%, "+e[3]+")"},s.to.hsl=function(){var e=a(arguments);return e.length<4||1===e[3]?"hsl("+e[0]+", "+e[1]+"%, "+e[2]+"%)":"hsla("+e[0]+", "+e[1]+"%, "+e[2]+"%, "+e[3]+")"},s.to.hwb=function(){var e=a(arguments),t="";return e.length>=4&&1!==e[3]&&(t=", "+e[3]),"hwb("+e[0]+", "+e[1]+"%, "+e[2]+"%"+t+")"},s.to.keyword=function(e){return i[e.slice(0,3)]}},function(e,t,r){"use strict";var n=r(5),a=Array.prototype.concat,o=Array.prototype.slice,i=e.exports=function(e){for(var t=[],r=0,i=e.length;r<i;r++){var l=e[r];n(l)?t=a.call(t,o.call(l)):t.push(l)}return t};i.wrap=function(e){return function(){return e(i(arguments))}}},function(e,t){e.exports=function(e){return!(!e||"string"==typeof e)&&(e instanceof Array||Array.isArray(e)||e.length>=0&&(e.splice instanceof Function||Object.getOwnPropertyDescriptor(e,e.length-1)&&"String"!==e.constructor.name))}},function(e,t,r){var n=r(2),a=r(8),o={};Object.keys(n).forEach((function(e){o[e]={},Object.defineProperty(o[e],"channels",{value:n[e].channels}),Object.defineProperty(o[e],"labels",{value:n[e].labels});var t=a(e);Object.keys(t).forEach((function(r){var n=t[r];o[e][r]=function(e){var t=function(t){if(null==t)return t;arguments.length>1&&(t=Array.prototype.slice.call(arguments));var r=e(t);if("object"==typeof r)for(var n=r.length,a=0;a<n;a++)r[a]=Math.round(r[a]);return r};return"conversion"in e&&(t.conversion=e.conversion),t}(n),o[e][r].raw=function(e){var t=function(t){return null==t?t:(arguments.length>1&&(t=Array.prototype.slice.call(arguments)),e(t))};return"conversion"in e&&(t.conversion=e.conversion),t}(n)}))})),e.exports=o},function(e,t,r){"use strict";e.exports={aliceblue:[240,248,255],antiquewhite:[250,235,215],aqua:[0,255,255],aquamarine:[127,255,212],azure:[240,255,255],beige:[245,245,220],bisque:[255,228,196],black:[0,0,0],blanchedalmond:[255,235,205],blue:[0,0,255],blueviolet:[138,43,226],brown:[165,42,42],burlywood:[222,184,135],cadetblue:[95,158,160],chartreuse:[127,255,0],chocolate:[210,105,30],coral:[255,127,80],cornflowerblue:[100,149,237],cornsilk:[255,248,220],crimson:[220,20,60],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgoldenrod:[184,134,11],darkgray:[169,169,169],darkgreen:[0,100,0],darkgrey:[169,169,169],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkseagreen:[143,188,143],darkslateblue:[72,61,139],darkslategray:[47,79,79],darkslategrey:[47,79,79],darkturquoise:[0,206,209],darkviolet:[148,0,211],deeppink:[255,20,147],deepskyblue:[0,191,255],dimgray:[105,105,105],dimgrey:[105,105,105],dodgerblue:[30,144,255],firebrick:[178,34,34],floralwhite:[255,250,240],forestgreen:[34,139,34],fuchsia:[255,0,255],gainsboro:[220,220,220],ghostwhite:[248,248,255],gold:[255,215,0],goldenrod:[218,165,32],gray:[128,128,128],green:[0,128,0],greenyellow:[173,255,47],grey:[128,128,128],honeydew:[240,255,240],hotpink:[255,105,180],indianred:[205,92,92],indigo:[75,0,130],ivory:[255,255,240],khaki:[240,230,140],lavender:[230,230,250],lavenderblush:[255,240,245],lawngreen:[124,252,0],lemonchiffon:[255,250,205],lightblue:[173,216,230],lightcoral:[240,128,128],lightcyan:[224,255,255],lightgoldenrodyellow:[250,250,210],lightgray:[211,211,211],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightsalmon:[255,160,122],lightseagreen:[32,178,170],lightskyblue:[135,206,250],lightslategray:[119,136,153],lightslategrey:[119,136,153],lightsteelblue:[176,196,222],lightyellow:[255,255,224],lime:[0,255,0],limegreen:[50,205,50],linen:[250,240,230],magenta:[255,0,255],maroon:[128,0,0],mediumaquamarine:[102,205,170],mediumblue:[0,0,205],mediumorchid:[186,85,211],mediumpurple:[147,112,219],mediumseagreen:[60,179,113],mediumslateblue:[123,104,238],mediumspringgreen:[0,250,154],mediumturquoise:[72,209,204],mediumvioletred:[199,21,133],midnightblue:[25,25,112],mintcream:[245,255,250],mistyrose:[255,228,225],moccasin:[255,228,181],navajowhite:[255,222,173],navy:[0,0,128],oldlace:[253,245,230],olive:[128,128,0],olivedrab:[107,142,35],orange:[255,165,0],orangered:[255,69,0],orchid:[218,112,214],palegoldenrod:[238,232,170],palegreen:[152,251,152],paleturquoise:[175,238,238],palevioletred:[219,112,147],papayawhip:[255,239,213],peachpuff:[255,218,185],peru:[205,133,63],pink:[255,192,203],plum:[221,160,221],powderblue:[176,224,230],purple:[128,0,128],rebeccapurple:[102,51,153],red:[255,0,0],rosybrown:[188,143,143],royalblue:[65,105,225],saddlebrown:[139,69,19],salmon:[250,128,114],sandybrown:[244,164,96],seagreen:[46,139,87],seashell:[255,245,238],sienna:[160,82,45],silver:[192,192,192],skyblue:[135,206,235],slateblue:[106,90,205],slategray:[112,128,144],slategrey:[112,128,144],snow:[255,250,250],springgreen:[0,255,127],steelblue:[70,130,180],tan:[210,180,140],teal:[0,128,128],thistle:[216,191,216],tomato:[255,99,71],turquoise:[64,224,208],violet:[238,130,238],wheat:[245,222,179],white:[255,255,255],whitesmoke:[245,245,245],yellow:[255,255,0],yellowgreen:[154,205,50]}},function(e,t,r){var n=r(2);function a(e){var t=function(){for(var e={},t=Object.keys(n),r=t.length,a=0;a<r;a++)e[t[a]]={distance:-1,parent:null};return e}(),r=[e];for(t[e].distance=0;r.length;)for(var a=r.pop(),o=Object.keys(n[a]),i=o.length,l=0;l<i;l++){var s=o[l],u=t[s];-1===u.distance&&(u.distance=t[a].distance+1,u.parent=a,r.unshift(s))}return t}function o(e,t){return function(r){return t(e(r))}}function i(e,t){for(var r=[t[e].parent,e],a=n[t[e].parent][e],i=t[e].parent;t[i].parent;)r.unshift(t[i].parent),a=o(n[t[i].parent][i],a),i=t[i].parent;return a.conversion=r,a}e.exports=function(e){for(var t=a(e),r={},n=Object.keys(t),o=n.length,l=0;l<o;l++){var s=n[l];null!==t[s].parent&&(r[s]=i(s,t))}return r}},function(e,t,r){"use strict";r.r(t),r.d(t,"run",(function(){return ve})),r.d(t,"init",(function(){return ke})),r.d(t,"convertBg",(function(){return we})),r.d(t,"extend",(function(){return xe})),r.d(t,"updateStyle",(function(){return Me}));var n="(prefers-color-scheme: dark)",a="data_color_scheme_dark",o="".concat(1*new Date).concat(Math.round(10*Math.random())),i="data-darkmode-color-".concat(o),l="data-darkmode-bgcolor-".concat(o),s="data-darkmode-original-color-".concat(o),u="data-darkmode-original-bgcolor-".concat(o),c="data-darkmode-bgimage-".concat(o),h=window.getInnerHeight&&window.getInnerHeight()||window.innerHeight||document.documentElement.clientHeight,f=["TABLE","TR","TD","TH"],d=/ !important$/,g={hasInit:!1,begin:null,showFirstPage:null,error:null,mode:"",whitelist:{tagName:["MPCPS","IFRAME"]},needJudgeFirstPage:!0,delayBgJudge:!1,container:null,cssSelectorsPrefix:"",defaultLightTextColor:"#191919",defaultLightBgColor:"#fff",defaultDarkTextColor:"#a3a3a3",defaultDarkBgColor:"#191919",set:function(e,t,r){var n=t[r];switch(e){case"boolean":"boolean"==typeof n&&(this[r]=n);break;case"string":"string"==typeof n&&""!==n&&(this[r]=n);break;case"function":"function"==typeof n&&(this[r]=n);break;case"dom":n instanceof HTMLElement&&(this[r]=n)}}};function b(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function p(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function y(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function m(e,t,r){return t&&y(e.prototype,t),r&&y(e,r),Object.defineProperty(e,"prototype",{writable:!1}),e}var v=[],k=[],w=function(){function e(){p(this,e)}return m(e,[{key:"loopTimes",get:function(){return ce.loopTimes}},{key:"isDarkmode",get:function(){return be.isDarkmode}},{key:"addCss",value:function(e,t){var r=!(arguments.length>2&&void 0!==arguments[2])||arguments[2];(r?v:k).push(de.genCss(e,t.map((function(e){var t=e.key,r=e.value;return de.genCssKV(t,r)})).join("")))}}]),e}(),x=function(){function e(){p(this,e),b(this,"_plugins",[]),b(this,"length",0),b(this,"loopTimes",0),b(this,"firstPageStyle",""),b(this,"otherPageStyle",""),b(this,"firstPageStyleNoMQ",""),b(this,"otherPageStyleNoMQ","")}return m(e,[{key:"extend",value:function(e){this._plugins.push(new(e(w))),this.length++}},{key:"emit",value:function(e){for(var t=arguments.length,r=new Array(t>1?t-1:0),n=1;n<t;n++)r[n-1]=arguments[n];this._plugins.forEach((function(t){"function"==typeof t[e]&&t[e].apply(t,r)}))}},{key:"addCss",value:function(e){e?(this.firstPageStyle+=v.join(""),this.firstPageStyleNoMQ+=k.join("")):(this.otherPageStyle+=v.join(""),this.otherPageStyleNoMQ+=k.join(""))}},{key:"resetCss",value:function(){v=[],k=[]}}]),e}();function M(e){return(M="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}function _(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function C(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}var j=function(){function e(t){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),C(this,"_queue",[]),C(this,"_idx",0),this._prefix=t}var t,r,n;return t=e,(r=[{key:"push",value:function(e){var t="".concat(this._prefix).concat(this._idx++);e.classList.add(t),this._queue.push({el:e,className:t,updated:!g.delayBgJudge})}},{key:"forEach",value:function(e){var t=[];for(this._queue.forEach((function(r,n){r.updated&&(t.unshift(n),M(e)&&e(r.el))}));t.length;)this._queue.splice(t.shift(),1)}},{key:"update",value:function(e){this._queue.forEach((function(t){t.updated||Array.prototype.some.call(e,(function(e){return!(1!==e.nodeType||!e.classList.contains(t.className)||(t.el=e,t.updated=!0,0))}))}))}}])&&_(t.prototype,r),n&&_(t,n),Object.defineProperty(t,"prototype",{writable:!1}),e}();function S(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function P(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}var O=function(){function e(t){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),P(this,"_stack",[]),P(this,"_idx",0),this._prefix=t,this.classNameReg=new RegExp("".concat(this._prefix,"\\d+"))}var t,r,n;return t=e,(r=[{key:"push",value:function(e,t){var r="".concat(this._prefix).concat(this._idx++);e.classList.add(r),this._stack.unshift({el:e,className:r,cssKV:t,updated:!g.delayBgJudge})}},{key:"contains",value:function(e,t){var r=e.getBoundingClientRect(),n=[];for(this._stack.forEach((function(e,t){if(e.updated){e.rect||(e.rect=e.el.getBoundingClientRect());var a=e.rect;r.top>=a.bottom||r.bottom<=a.top||r.left>=a.right||r.right<=a.left||n.unshift(t)}}));n.length;){var a=this._stack.splice(n.shift(),1)[0];"function"==typeof t&&t(a)}}},{key:"update",value:function(e){this._stack.forEach((function(t){t.updated||Array.prototype.some.call(e,(function(e){return!(1!==e.nodeType||!e.classList.contains(t.className)||(t.el=e,t.updated=!0,0))}))}))}}])&&S(t.prototype,r),n&&S(t,n),Object.defineProperty(t,"prototype",{writable:!1}),e}();function B(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==r)return;var n,a,o=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(o.push(n.value),!t||o.length!==t);i=!0);}catch(e){l=!0,a=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw a}}return o}(e,t)||function(e,t){if(!e)return;if("string"==typeof e)return A(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);"Object"===r&&e.constructor&&(r=e.constructor.name);if("Map"===r||"Set"===r)return Array.from(e);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return A(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function A(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}function N(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function E(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}var T=function(){function e(){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),E(this,"_firstPageStyle",""),E(this,"_otherPageStyle",""),E(this,"isFinish",!1)}var t,r,o;return t=e,(r=[{key:"genCssKV",value:function(e,t){return"".concat(e,": ").concat(t," !important;")}},{key:"genCss",value:function(e,t){return"".concat("dark"===g.mode?"html.".concat(a," "):"").concat(g.cssSelectorsPrefix&&"".concat(g.cssSelectorsPrefix," "),".").concat(e,"{").concat(t,"}")}},{key:"addCss",value:function(e){var t=arguments.length>1&&void 0!==arguments[1]&&arguments[1];this[t?"_firstPageStyle":"_otherPageStyle"]+=e,ce.addCss(t)}},{key:"writeStyle",value:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];!e&&be.isDarkmode&&(this.isFinish=!0);var t=(be.isDarkmode?[{target:this,key:["_firstPageStyle","_otherPageStyle"],needMediaQuery:!0}]:[]).concat([{target:ce,key:["firstPageStyle","otherPageStyle"],needMediaQuery:!0},{target:ce,key:["firstPageStyleNoMQ","otherPageStyleNoMQ"],needMediaQuery:!1}]).map((function(t){var r=t.target,a=B(t.key,2),o=a[0],i=a[1],l=t.needMediaQuery,s="";e?s=o:(r[i]=r[o]+r[i],r[o]="",s=i);var u=r[s];return u?(r[s]="","dark"!==g.mode&&l?"@media ".concat(n," {").concat(u,"}"):u):""})).join("");t&&document.head.insertAdjacentHTML("beforeend",'<style type="text/css">'.concat(t,"</style>"))}}])&&N(t.prototype,r),o&&N(t,o),Object.defineProperty(t,"prototype",{writable:!1}),e}();function F(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function D(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function L(e){return function(e){if(Array.isArray(e))return I(e)}(e)||function(e){if("undefined"!=typeof Symbol&&null!=e[Symbol.iterator]||null!=e["@@iterator"])return Array.from(e)}(e)||function(e,t){if(!e)return;if("string"==typeof e)return I(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);"Object"===r&&e.constructor&&(r=e.constructor.name);if("Map"===r||"Set"===r)return Array.from(e);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return I(e,t)}(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function I(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}function q(e){var t;return(t=[e]).concat.apply(t,L(e.querySelectorAll("*")))}var $={"ue-table-interlace-color-single":"#fcfcfc","ue-table-interlace-color-double":"#f7faff"};var V=function(){function e(){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),D(this,"_nodes",[]),D(this,"_firstPageNodes",[]),D(this,"_delayNodes",[]),D(this,"showFirstPage",!1)}var t,r,n;return t=e,(r=[{key:"length",get:function(){return this._nodes.length}},{key:"set",value:function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[];this._nodes=e}},{key:"get",value:function(){var e=[];return this._nodes.length?(e=this._nodes,be.isDarkmode&&(this._nodes=[])):this._delayNodes.length?(e=this._delayNodes,this._delayNodes=[]):g.container&&(e=g.container.querySelectorAll("*")),e}},{key:"delay",value:function(){var e=this;Array.prototype.forEach.call(this._nodes,(function(t){return e._delayNodes.push(t)})),this._nodes=[]}},{key:"hasDelay",value:function(){return this._delayNodes.length>0}},{key:"addFirstPageNode",value:function(e){this._firstPageNodes.push(e)}},{key:"showFirstPageNodes",value:function(){this._firstPageNodes.forEach((function(e){return!e.style.visibility&&(e.style.visibility="visible")})),this.showFirstPage=!0}},{key:"emptyFirstPageNodes",value:function(){this._firstPageNodes=[]}}])&&F(t.prototype,r),n&&F(t,n),Object.defineProperty(t,"prototype",{writable:!1}),e}(),z=r(0),K=r.n(z),J=r(1),R=r.n(J);function U(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==r)return;var n,a,o=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(o.push(n.value),!t||o.length!==t);i=!0);}catch(e){l=!0,a=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw a}}return o}(e,t)||Q(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function H(e){return function(e){if(Array.isArray(e))return G(e)}(e)||function(e){if("undefined"!=typeof Symbol&&null!=e[Symbol.iterator]||null!=e["@@iterator"])return Array.from(e)}(e)||Q(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function Q(e,t){if(e){if("string"==typeof e)return G(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?G(e,t):void 0}}function G(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}function W(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function X(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}R.a.windowtext=[0,0,0],R.a.transparent=[255,255,255,0];var Y=/<\$#_SEMICOLON_#\$>/g,Z=new RegExp("".concat("js_darkmode__","\\d+")),ee=new RegExp(Object.keys(R.a).map((function(e){return"\\b".concat(e,"\\b")})).join("|"),"ig"),te=/\brgba?\([^)]+\)/i,re=/\brgba?\([^)]+\)/gi,ne=function(e){return e.replace(d,"")},ae=function(e,t){return ne(e).replace(ee,(function(e){if(!t&&"transparent"===e)return e;var r=R.a[e.toLowerCase()];return"".concat(r.length>3?"rgba":"rgb","(").concat(r.toString(),")")}))},oe=function(e){if(!e||e.length<1)return"";if(1===e.length)return e[0];for(var t=e.shift(),r=e.shift();r;){var n=K()(r);t=K()(t).mix(n,n.alpha()),r=e.shift()}return t},ie=function(e){var t=ae(e);return te.test(t)?t:""},le=function(e){return(299*e[0]+587*e[1]+114*e[2])/1e3},se=function(e,t){var r=e/le(t),n=Math.min(255,t[0]*r),a=Math.min(255,t[1]*r),o=Math.min(255,t[2]*r);return 0===a||255===n||255===o?a=(1e3*e-299*n-114*o)/587:0===n?n=(1e3*e-587*a-114*o)/299:0!==o&&255!==a||(o=(1e3*e-299*n-587*a)/114),K.a.rgb(n,a,o)},ue=function(){function e(){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),X(this,"_idx",0),X(this,"_defaultDarkTextColorRgb",K()(g.defaultDarkTextColor).rgb().array()),X(this,"_defaultDarkBgColorRgb",K()(g.defaultDarkBgColor).rgb().array()),X(this,"_defaultDarkBgColorHSL",K()(g.defaultDarkBgColor).hsl().array()),X(this,"_defaultDarkTextColorBrightness",le(this._defaultDarkTextColorRgb)),X(this,"_defaultDarkBgColorBrightness",le(this._defaultDarkBgColorRgb)),X(this,"_defaultDarkBgColorHslBrightness",this._defaultDarkBgColorHSL[2]),X(this,"_maxLimitOffsetBrightness",this._defaultDarkTextColorBrightness-this._defaultDarkBgColorBrightness),X(this,"isDarkmode",!1)}var t,r,n;return t=e,(r=[{key:"_adjustTextBrightness",value:function(e,t){var r=t.rgb().array(),n=t.alpha(),a=le(r)*n+this._defaultDarkBgColorBrightness*(1-n),o=e.rgb().array(),i=e.hsl().array(),l=e.alpha(),s=le(o),u=Math.abs(a-s);if(s>=250)return e;if(u>this._maxLimitOffsetBrightness&&a<=this._defaultDarkBgColorBrightness+2)return se(this._maxLimitOffsetBrightness+a,o).alpha(l);if(u>=65)return e;if(a>=100){if(i[2]>50){i[2]=90-i[2];var c=K.a.hsl.apply(K.a,H(i)).alpha(l);return this._adjustTextBrightness(c,t)}return se(Math.min(this._maxLimitOffsetBrightness,a-65),o).alpha(l)}if(i[2]<=40){i[2]=90-i[2];var h=K.a.hsl.apply(K.a,H(i)).alpha(l);return this._adjustTextBrightness(h,t)}return se(Math.min(this._maxLimitOffsetBrightness,a+65),o).alpha(l)}},{key:"_adjustBackgroundBrightness",value:function(e){var t=e.rgb().array(),r=e.hsl().array(),n=e.alpha(),a=le(t),o=e;return 0===r[1]&&r[2]>40||a>250?o=K.a.hsl(0,0,Math.min(100,100+this._defaultDarkBgColorHslBrightness-r[2])):a>190?o=se(190,t).alpha(n):r[2]<22&&(r[2]=22,o=K.a.hsl.apply(K.a,H(r))),o.alpha(n).rgb()}},{key:"_adjustBrightness",value:function(e,t,r,n){var a,o=e.alpha(),s="";if(r.isBgColor){if(t[c]&&o>=.05&&delete t[c],a=this._adjustBackgroundBrightness(e),!r.hasInlineColor){var u=t[i]||g.defaultLightTextColor,h=a||e,f=this._adjustBrightness(K()(u),t,{isTextColor:!0,parentElementBgColorStr:h},n);f.newColor?s+=de.genCssKV("color",f.newColor):s+=de.genCssKV("color",u)}}else if(r.isTextColor||r.isBorderColor){var d=r.parentElementBgColorStr||r.isTextColor&&t[l]||g.defaultDarkBgColor,b=K()(d);t[c]||(a=this._adjustTextBrightness(e,b),ce.emit("afterConvertTextColor".concat(n?"ByUpdateStyle":""),t,{fontColor:a,bgColor:b}))}else r.isTextShadow&&(t[c]||(a=this._adjustBackgroundBrightness(e)));return{newColor:a&&e.toString()!==a.toString()&&a.alpha(o).rgb(),extStyle:s}}},{key:"_try",value:function(e){try{return e()}catch(e){console.log("An error occurred when running the dark mode conversion algorithm\n",e),"function"==typeof g.error&&g.error(e)}}},{key:"convert",value:function(e,t,r){var n=this;ce.resetCss(),ce.emit("beforeConvertNode".concat(r?"ByUpdateStyle":""),e);var a,o,h="",b="";if(this.isDarkmode||r){var p=e.nodeName;if(g.whitelist.tagName.indexOf(p)>-1)return"";var y=e.style;t||(t=(y.cssText&&y.cssText.replace(/("[^;]*);([^;]*")|('[^;]*);([^;]*')/g,"$1$3".concat("<$#_SEMICOLON_#$>","$2$4")).split(";")||[]).map((function(e){var t=e.indexOf(":");return[e.slice(0,t).toLowerCase(),e.slice(t+1).replace(Y,";")].map((function(e){return(e||"").replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,"")}))})));var m,v,k=!1,w=!1,x=!1;t=t.filter((function(e){var t=U(e,2),r=t[0],n=t[1];return"color"===r?k=!0:/background/i.test(r)&&(w=!0,"background-position"===r?m=n:"background-size"===r&&(v=n)),(/background/i.test(r)||/^(-webkit-)?border-image/.test(r))&&/url\([^)]*\)/i.test(n)&&(x=!0),["-webkit-border-image","border-image","color","background-color","background-image","background","border","border-top","border-right","border-bottom","border-left","border-color","border-top-color","border-right-color","border-bottom-color","border-left-color","-webkit-text-fill-color","-webkit-text-stroke","-webkit-text-stroke-color","text-shadow"].indexOf(r)>-1})).sort((function(e,t){var r=U(e,1)[0],n=U(t,1)[0];return"color"===r||"background-image"===r&&"background-color"===n||0===n.indexOf("-webkit-text")?1:-1})),f.indexOf(p)>-1&&!w&&this._try((function(){var r=function(e){var t=null;return Array.prototype.some.call(e.classList,(function(e){return!!$[e]&&(t=$[e],!0)})),t}(e);r||(r=e.getAttribute("bgcolor")),r&&(t.unshift(["background-color",K()(r).toString()]),w=!0)})),"FONT"!==p||k||this._try((function(){var r=e.getAttribute("color");r&&(t.push(["color",K()(r).toString()]),k=!0)}));var M="",_="",C=0;t.some((function(e,t){var r=U(e,2),a=r[0],o=r[1];return n._try((function(){if(0!==a.indexOf("-webkit-text"))return C=t,!0;switch(a){case"-webkit-text-fill-color":M=ie(o);break;case"-webkit-text-stroke":var e=o.split(" ");2===e.length&&(_=ie(e[1]));break;case"-webkit-text-stroke-color":_=ie(o)}return!1}))})),M&&(k?t[t.length-1]=["-webkit-text-fill-color",M]:(t.push(["-webkit-text-fill-color",M]),k=!0)),C&&(t.splice(0,C),_&&t.unshift(["-webkit-text-stroke-color",_]));var j="",S="";if(r&&e.className&&"string"==typeof e.className){var P=e.className.match(Z);P&&(j=P[0]),(P=e.className.match(fe.classNameReg))&&(S=P[0])}var O="";t.forEach((function(t){var a=U(t,2),o=a[0],h=a[1];return n._try((function(){var t,a=h,f=!1,p=/^background/.test(o),M="text-shadow"===o,_=["-webkit-text-stroke-color","color","-webkit-text-fill-color"].indexOf(o),C=/^border/.test(o),j=/gradient/.test(h),P=[],B="";if(h=ae(h,j),te.test(h)){if(j){for(var A=re.exec(h);A;)P.push(A[0]),A=re.exec(h);t=oe(P)}var N=0;h=h.replace(re,(function(a){j&&(a=t,f=!0);var o=K()(a);if(o.alpha()>=.05){var h=n._adjustBrightness(o,e,{isBgColor:p,isTextShadow:M,isTextColor:_>-1,isBorderColor:C,hasInlineColor:k},r),d=!x&&h.newColor;if(B+=h.extStyle,p||_>0){var b=p?l:i,y=p?u:s,m=d?d.toString():a;0===N&&q(e).forEach((function(e){var t=e[y]||g.defaultLightBgColor;e[b]=m,e[y]=t.split("|").concat(a).join("|"),p&&K()(m).alpha()>=.05&&e[c]&&delete e[c]}))}return d&&(f=!0),N+=1,d||a}return a})).replace(/\s?!\s?important/gi,"")}if(B&&(O+=B),!(e instanceof SVGElement)){var E=/^background/.test(o),T=/^(-webkit-)?border-image/.test(o);if((E||T)&&/url\([^)]*\)/i.test(h)){f=!0;var F=oe((e[u]||g.defaultLightBgColor).split("|"));if(h=h.replace(/^(.*?)url\(([^)]*)\)(.*)$/i,(function(t){var r=t,n="",a="",i="";return e[c]||q(e).forEach((function(e){e[c]=!0})),E?(r="linear-gradient(".concat("rgba(0,0,0,0.2)",", ").concat("rgba(0,0,0,0.2)","),").concat(t),i=de.genCssKV(o,"".concat(r,",linear-gradient(").concat(F,", ").concat(F,")")),m&&(n="top left,".concat(m),O+=de.genCssKV("background-position","".concat(n)),i+=de.genCssKV("background-position","".concat(n,",top left"))),v&&(a="100%,".concat(v),O+=de.genCssKV("background-size","".concat(a)),i+=de.genCssKV("background-size","".concat(a,",100%"))),S?b+=de.genCss(S,i):fe.push(e,i)):w||(i=de.genCssKV("background-image","linear-gradient(".concat("rgba(0,0,0,0.2)",", ").concat("rgba(0,0,0,0.2)","),linear-gradient(").concat(F,", ").concat(F,")")),S?b+=de.genCss(S,i):fe.push(e,i)),r})),!k){var D=oe((e[s]||g.defaultLightTextColor).split("|"));O+=de.genCssKV("color",D),q(e).forEach((function(e){e[i]=D}))}}}f&&(!r&&d.test(a)&&(y[o]=ne(a)),j?S?b+=de.genCss(S,de.genCssKV(o,h)):fe.push(e,de.genCssKV(o,h)):O+=de.genCssKV(o,h))}))})),O&&(e.setAttribute("data-style",y.cssText),j||(j="".concat("js_darkmode__").concat(this._idx++),e.classList.add(j)),h+=O?de.genCss(j,O):""),h+=b,!r&&(a=e,o="",Array.prototype.forEach.call(a.childNodes,(function(e){3===e.nodeType&&(o+=e.nodeValue.replace(/\s/g,""))})),o.length>0)&&(g.delayBgJudge?he.push(e):fe.contains(e,(function(e){h+=de.genCss(e.className,e.cssKV)})))}return ce.emit("afterConvertNode".concat(r?"ByUpdateStyle":""),e),h}}])&&W(t.prototype,r),n&&W(t,n),Object.defineProperty(t,"prototype",{writable:!1}),e}(),ce=new x,he=new j("".concat("js_darkmode__","text__")),fe=new O("".concat("js_darkmode__","bg__")),de=new T,ge=new V,be=new ue,pe=new RegExp("".concat("js_darkmode__","[^ ]+"),"g"),ye=null,me=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{type:"dom"};if(t.force&&(de.isFinish=!1),!de.isFinish)try{be.isDarkmode=g.mode?"dark"===g.mode:e.matches,"dom"===t.type?(be.isDarkmode&&"function"==typeof g.begin&&g.begin(ge.hasDelay()),Array.prototype.forEach.call(ge.get(),(function(e){if(be.isDarkmode&&e.className&&"string"==typeof e.className&&(e.className=e.className.replace(pe,"")),be.isDarkmode||ce.length)if(g.needJudgeFirstPage){var t=e.getBoundingClientRect(),r=t.top,n=t.bottom;r<=0&&n<=0?de.addCss(be.convert(e)):r>0&&r<h||n>0&&n<h?(ge.addFirstPageNode(e),de.addCss(be.convert(e),!0)):(g.needJudgeFirstPage=!1,de.writeStyle(!0),ge.showFirstPageNodes(),"function"==typeof g.showFirstPage&&g.showFirstPage(),de.addCss(be.convert(e)))}else de.addCss(be.convert(e))})),ce.loopTimes++):"bg"===t.type&&be.isDarkmode&&he.forEach((function(e){return fe.contains(e,(function(e){de.addCss(de.genCss(e.className,e.cssKV))}))})),(g.needJudgeFirstPage||!g.needJudgeFirstPage&&!ge.showFirstPage)&&"function"==typeof g.showFirstPage&&g.showFirstPage(),de.writeStyle(),ge.emptyFirstPageNodes(),be.isDarkmode||(g.needJudgeFirstPage=!1,g.delayBgJudge=!1,null===g.container&&"dom"===t.type&&ge.length&&ge.delay())}catch(e){console.log("An error occurred when running the dark mode conversion algorithm\n",e),"function"==typeof g.error&&g.error(e)}};function ve(e,t){ke(t),ge.set(e),me(ye,{force:!0,type:"dom"})}function ke(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};if(!g.hasInit){g.hasInit=!0;var t=g.whitelist.tagName;e.whitelist&&e.whitelist.tagName instanceof Array&&e.whitelist.tagName.forEach((function(e){e=e.toUpperCase(),-1===t.indexOf(e)&&t.push(e)})),["dark","light"].indexOf(e.mode)>-1&&(g.set("string",e,"mode"),"dark"===e.mode&&document.getElementsByTagName("html")[0].classList.add(a)),g.set("function",e,"begin"),g.set("function",e,"showFirstPage"),g.set("function",e,"error"),g.set("boolean",e,"needJudgeFirstPage"),g.set("boolean",e,"delayBgJudge"),g.set("dom",e,"container"),g.set("string",e,"cssSelectorsPrefix"),g.set("string",e,"defaultLightTextColor"),g.set("string",e,"defaultLightBgColor"),g.set("string",e,"defaultDarkTextColor"),g.set("string",e,"defaultDarkBgColor"),!g.mode&&null===ye&&window.matchMedia&&(ye=window.matchMedia(n)).addListener(me)}}function we(e){ge.set(e),null!==g.container&&(fe.update(e),he.update(e)),me(ye,{force:!0,type:"bg"})}function xe(e){e.forEach((function(e){return ce.extend(e)}))}function Me(e,t){de.isFinish&&(de.addCss(be.convert(e,t?Object.keys(t).map((function(e){return[e,t[e]]})):void 0,!0),!1),de.writeStyle())}}])}));</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>(function () {
  'use strict';

  var MutationObserver = window.WebKitMutationObserver || window.MutationObserver || window.MozMutationObserver;
  var isHttp = location.href.indexOf('http://') === 0;
  var isDangerSrc = function isDangerSrc(src) {
    if (src) {
      var host = src.match(/http(?:s)?:\/\/([^\/]+?)(\/|$)/);
      if (host && !/qq\.com(\:8080)?$/.test(host[1]) && !/weishi\.com$/.test(host[1])) {
        return true;
      }
    }
    return false;
  };
  if (location.href.indexOf('safe=0') === -1 && isHttp && typeof MutationObserver === 'function' && location.host === 'mp.weixin.qq.com') {
    window.__observer_data = {
      count: 0,
      exec_time: 0,
      list: []
    };
    window.__observer = new MutationObserver(function (mutations) {
      window.__observer_data.count++;
      var begin = new Date(),
        deleteNodes = [];
      mutations.forEach(function (mutation) {
        var nodes = mutation.addedNodes;
        for (var i = 0; i < nodes.length; i++) {
          var node = nodes[i];
          if (node.tagName === 'SCRIPT') {
            var scriptSrc = node.src;
            if (isDangerSrc(scriptSrc)) {
              window.__observer_data.list.push(scriptSrc);
              deleteNodes.push(node);
            }
            if (!scriptSrc && window.__nonce_str && node.getAttribute('nonce') != window.__nonce_str) {
              window.__observer_data.list.push('inlinescript_without_nonce');
              deleteNodes.push(node);
            }
          }
        }
      });
      for (var i = 0; i < deleteNodes.length; i++) {
        var node = deleteNodes[i];
        node.parentNode && node.parentNode.removeChild(node);
      }
      window.__observer_data.exec_time += new Date() - begin;
    });
    window.__observer.observe(document, {
      subtree: true,
      childList: true
    });
  }
  function init() {
    if (location.href.indexOf('safe=0') === -1 && Math.random() < 0.01 && isHttp && HTMLScriptElement.prototype.__lookupSetter__ && typeof Object.defineProperty !== 'undefined') {
      window.__danger_src = {
        xmlhttprequest: [],
        script_src: [],
        script_setAttribute: []
      };
      var t = '$' + Math.random();
      var s = 'Setter__';
      HTMLScriptElement.prototype.__old_method_script_src = HTMLScriptElement.prototype['__lookup' + s]('src');
      HTMLScriptElement.prototype['__define' + s]('src', function (url) {
        if (url && isDangerSrc(url)) {
          window.__danger_src.script_src.push(url);
        }
        this.__old_method_script_src(url);
      });
      var nativeSetAttribute = '__setAttribute' + t;
      Object.defineProperty(Element.prototype, nativeSetAttribute, {
        value: Element.prototype.setAttribute,
        enumerable: false
      });
      Element.prototype.setAttribute = function (name, url) {
        if (this.tagName === 'SCRIPT' && name === 'src' && isDangerSrc(url)) {
          window.__danger_src.script_setAttribute.push(url);
        }
        this[nativeSetAttribute](name, url);
      };
    }
  }

  
  init();

})();</script>

    
<script type="module" nonce="1415253946" reportloaderror>import.meta.url;import("_").catch(()=>1);async function* g(){};window.__vite_is_modern_browser=true;</script>
<script type="module" nonce="1415253946" reportloaderror>!function(){if(window.__vite_is_modern_browser)return;console.warn("vite: loading legacy chunks, syntax error above and the same error below should be ignored");var e=document.getElementById("vite-legacy-polyfill"),n=document.createElement("script");n.src=e.src,n.onload=function(){System.import(document.getElementById('vite-legacy-entry').getAttribute('data-src'))},document.body.appendChild(n)}();</script>
<script type="module" crossorigin src="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/appmsg.lrjzl8l613259496.js" nonce="1415253946" reportloaderror></script>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/modulepreload-polyfill.lrjzl8l64abee2a4.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/vue.runtime.esm.lrjzl8l67cbeb265.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/_plugin-vue2_normalizer.lrjzl8l6fc2fb13f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/event.lrjzl8l682acd1b6.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/class.lrjzl8l632861355.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/core.lrjzl8l6633d1da5.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/device.lrjzl8l65ebf7685.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/comm_report.lrjzl8l63dc1a3ca.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/storage.lrjzl8l6595374ad.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/comm_utils.lrjzl8l689333dc8.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/i18n.lrjzl8l62e3f9c7c.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/page_utils.lrjzl8l63eb24f31.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/page_cls_ctrl.lrjzl8l6bbe1df6f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/wxgspeedsdk.lrjzl8l6180611fe.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/pay_report_utils.lrjzl8l6b359e101.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/appmsgext.lrjzl8l6b6efefef.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/page_utils.lrjzl8l6968f639d.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/tmpl.lrjzl8l6b6faf396.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/topbar.lrjzl8l67f6ff7c6.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/base64.lrjzl8l618dbe4cd.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/index.lrjzl8l6221a74f6.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/advance.lrjzl8l6918bc40b.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/body_first_observer.lrjzl8l655cb6e3e.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/get_page_read_pos.lrjzl8l6911ed9d5.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/set_article_read.lrjzl8l6a1652eae.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/stream_hide_useless.lrjzl8l6e7a65152.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/underline_action.lrjzl8l6d5f94995.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/render_utils.lrjzl8l6373276d5.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/wxwork_hidden.lrjzl8l6efa153e6.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/ext_loading.lrjzl8l65c08a031.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/outer_link.lrjzl8l6d612eaca.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/dom.lrjzl8l6c37e669f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/review_image.lrjzl8l62b522351.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/index.lrjzl8l62af67608.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/moment.lrjzl8l607db360f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/img_onload_handler.lrjzl8l6ce139fc0.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/like_and_share.lrjzl8l6bdb5787f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/voice_component.lrjzl8l6879e6e29.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/interaction.lrjzl8l6ad36f1bf.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/background_color.lrjzl8l65dd5e477.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/article_bottom_bar.lrjzl8l605a06c69.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/pre_loading.lrjzl8l6807b610a.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/get_word_cnt.lrjzl8l61a70c97b.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/bind_element.lrjzl8l61e4c871e.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/set_custom_ele.lrjzl8l6f9e0beb6.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/modal.lrjzl8l6d01ea73f.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/intersection-observer.lrjzl8l6e16580c9.js" reportloaderror>
<link rel="modulepreload" crossorigin href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/range_close.lrjzl8l6999db38f.js" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/index.lrjzl8l6ac997180.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/wxwork_hidden.lrjzl8l621eff342.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/like_and_share.lrjzl8l6e3b0c442.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/interaction.lrjzl8l6ce432c86.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/article_bottom_bar.lrjzl8l6b8eab279.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/qqmail_tpl_vite_entry.lrjzl8l6afde46fd.css" reportloaderror>
<link rel="stylesheet" href="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/tencent_portfolio_light.lrjzl8l63fd36d4a.css" reportloaderror>

    <style>
      .cooldown_tips {
        margin: 30px auto;
        margin-top: 0;
        display: flex;
        align-items: center;
        padding: 10px;
        font-size: 14px;
        background-color: #f6f7f9;
        border-radius: 6px;
      }   
      .cooldown_tips_icon {
        display: block;
        width: 18px;
        height: 18px;
        margin-right: 8px;
      }
    </style>
  </head>

  <body  id="activity-detail" class="zh_CN wx_wap_page 

                                            wx_wap_desktop_fontsize_2    mm_appmsg
 comment_feature
 discuss_tab appmsg_skin_default appmsg_style_default ">
    
<script type="text/javascript" nonce="1415253946" reportloaderror>
  var biz = "" || "MjM5OTMwODM1Mw==";
  var sn = "" || "576f76eacf5b7b5e5d6363bcf724dd35" || "";
  var mid = "" || "2448105671" || "";
  var idx = "" || "1" || "";
  window.__allowLoadResFromMp = true;
 
</script>

<script  nonce="1415253946" reportloaderror>
var page_begintime = (+new Date());
var is_rumor = "";
var norumor = "";
if (!!(is_rumor * 1) && !(norumor*1) && !!biz && !!mid) {
  if (!document.referrer || document.referrer.indexOf("mp.weixin.qq.com/mp/rumor") == -1){
    location.href = "http://mp.weixin.qq.com/mp/rumor?action=info&__biz=" + biz + "&mid=" + mid + "&idx=" + idx + "&sn=" + sn + "#wechat_redirect";
  }
}
</script>


    <link rel="dns-prefetch" href="//res.wx.qq.com" reportloaderror>
<link rel="dns-prefetch" href="//mmbiz.qpic.cn" reportloaderror>
<link rel="dns-prefetch" href="//mpcdn.qpic.cn" reportloaderror>
<link rel="dns-prefetch" href="//mpcdn.weixin.qq.com" reportloaderror>
<link rel="dns-prefetch" href="//file.daihuo.qq.com" reportloaderror>
<link rel="dns-prefetch" href="//wxa.wxs.qq.com" reportloaderror>
<link rel="shortcut icon" type="image/x-icon" href="//res.wx.qq.com/a/wx_fed/assets/res/NTI4MWU5.ico" reportloaderror>
<link rel="mask-icon" href="//res.wx.qq.com/a/wx_fed/assets/res/MjliNWVm.svg" color="#4C4C4C" reportloaderror>
<link rel="apple-touch-icon-precomposed" href="//res.wx.qq.com/a/wx_fed/assets/res/OTE0YTAw.png" reportloaderror>
<script type="text/javascript" nonce="1415253946" reportloaderror>
String.prototype.html = function (encode) {
  var replace = ["&#39;", "'", "&quot;", '"', "&nbsp;", " ", "&gt;", ">", "&lt;", "<", "&yen;", "¥", "&amp;", "&"];
 
 
 
 
 
  
  var replaceReverse = ["&", "&amp;", "¥", "&yen;", "<", "&lt;", ">", "&gt;", " ", "&nbsp;", '"', "&quot;", "'", "&#39;"];
  var target;
  if (encode) {
    target = replaceReverse;
  } else {
    target = replace;
  }
  for (var i = 0, str = this; i < target.length; i += 2) {
    str = str.replace(new RegExp(target[i], 'g'), target[i + 1]);
  }
  return str;
};

window.isInWeixinApp = function () {
  return /MicroMessenger/.test(navigator.userAgent);
};

window.getQueryFromURL = function (url) {
  url = url || 'http://qq.com/s?a=b#rd';
  var tmp = url.split('?'),
    query = (tmp[1] || "").split('#')[0].split('&'),
    params = {};
  for (var i = 0; i < query.length; i++) {
    var arg = query[i].split('=');
    params[arg[0]] = arg[1];
  }
  if (params['pass_ticket']) {
    params['pass_ticket'] = encodeURIComponent(params['pass_ticket'].html(false).html(false).replace(/\s/g, "+"));
  }
  return params;
};


(function () {
  var params = getQueryFromURL(location.href);
  window.uin = params['uin'] || "" || '';
  window.key = params['key'] || "" || '';
  window.wxtoken = params['wxtoken'] || '';
  window.pass_ticket = params['pass_ticket'] || '';
  window.appmsg_token = "" || "";

  var ua = navigator.userAgent;
  if (ua.match(/Mac\sOS\sX\s(\d+[\.|_]\d+)/) || ua.match(/Windows(\s+\w+)?\s+?(\d+\.\d+)/) || ua.match(/Linux\s/)) {
    document.body.classList.add('pages_skin_pc');
  }
  if (/MPAPP\/([\d\.]+)/i.test(ua)) {
    document.body.classList.add('pages_skin_mpapp');
  }
  if (params['uninteractive']) {
    document.body.classList.add('pages_skin_browser_underline');
  }
})();
</script>
    
<script type="text/javascript" nonce="1415253946" reportloaderror>window.PAGE_MID="mmbizwap:appmsg/newindex.html"</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>
  var write_sceen_time = (+new Date());
  var preview = "" * 1 || 0;
  var can_use_wecoin = '1' * 1;
  var wecoin_tips = '0' * 1;
  
  var wecoin_amount = '0' * 1;
  var preview_percent = '0' * 1;
</script>

<div id="js_article" style="position:relative;" class="rich_media">
  
  
  
  <div id="js_top_ad_area" class="top_banner"></div>
  
  <div id="js_base_container" class="rich_media_inner">
    
    
    <div id="page-content"  class="rich_media_area_primary">
      <div class="rich_media_area_primary_inner">
        
        
        
                
        

        <div id="img-content" class="rich_media_wrp">
          
          <h1 class="rich_media_title " id="activity-name">
            
固定效应: 目前看到解释的最清楚的帖子, 救命！
          </h1>
          <div id="meta_content" class="rich_media_meta_list">
                                                                  <span class="rich_media_meta rich_media_meta_text">
                                      胜风
                                  </span>
                                      
                        <span class="rich_media_meta rich_media_meta_nickname" id="profileBt">
              <a href="javascript:void(0);" class="wx_tap_link js_wx_tap_highlight weui-wa-hotarea" id="js_name">
                计量经济圈              </a>
              <div id="js_profile_qrcode" aria-hidden="true" class="profile_container" style="display:none;">
                <div class="profile_inner">
                  <strong class="profile_nickname">计量经济圈</strong>
                  <img class="profile_avatar" id="js_profile_qrcode_img" src="" alt="">

                  <p class="profile_meta">
                  <label class="profile_meta_label">微信号</label>
                  <span class="profile_meta_value">econometrics666</span>
                  </p>

                  <p class="profile_meta">
                  <label class="profile_meta_label">功能介绍</label>
                  <span class="profile_meta_value">凡是搞计量经济的，都关注这个号了。</span>
                  </p>
                </div>
                <span class="profile_arrow_wrp" id="js_profile_arrow_wrp">
                  <i class="profile_arrow arrow_out"></i>
                  <i class="profile_arrow arrow_in"></i>
                </span>
              </div>
            </span>
            <span id="meta_content_hide_info">
              <em id="publish_time" class="rich_media_meta rich_media_meta_text"></em>
              <em id="js_ip_wording_wrp" class="rich_media_meta rich_media_meta_text" role="option" aria-labelledby="js_a11y_op_ip_wording js_ip_wording" style="display: none;"><span id="js_a11y_op_ip_wording" aria-hidden="true">发表于</span><span aria-hidden="true" id="js_ip_wording" ></span></em>
                          </span>
          </div>

          
          
          
            
              
              
            
              
              
                
              
            
          

          
          

          
                                        

          
                    

          
                              
                                        
                    
                    
          
          
          
          
          
                                                  <div class="rich_media_content js_underline_content
          old_list_style             autoTypeSetting24psection
            "
            id="js_content" style="visibility: hidden;"><p style="margin-bottom: 0em;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;visibility: visible;overflow-wrap: break-word !important;"><img class="rich_pages wxw-img" data-copyright="0" data-ratio="0.1984375" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTdOW9K96RLq5kPKJm2iaKPs0pWd3h20bSaUKfl5e5XsV8dhTcbuCqRnZ9YEXwXeQ9JfQZvPeNrehtA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1" data-type="jpeg" data-w="640" style="outline: 0px;max-width: 670px;box-sizing: border-box;overflow-wrap: break-word;background-color: rgb(238, 237, 235);border-width: 1px;border-style: solid;border-color: rgb(238, 237, 235);background-size: 22px;background-position: center center;background-repeat: no-repeat;letter-spacing: 0.544px;text-align: justify;display: initial;visibility: visible !important;width: 640px !important;" width="640"  /></p><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;visibility: visible;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;color: rgb(255, 76, 0);font-size: 15px;letter-spacing: 0.5px;visibility: visible;">凡是搞计量经济的，都关注这个号了</span><br style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;"  /></section><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;visibility: visible;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;color: rgb(0, 82, 255);font-size: 14px;letter-spacing: 0.5px;visibility: visible;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;">稿件：</strong></span><span style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;color: rgb(0, 82, 255);font-size: 15px;letter-spacing: 0.5px;visibility: visible;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;">econometrics666@126.com</strong></span></section><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);visibility: visible;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;letter-spacing: 0.5px;font-size: 12px;color: rgb(0, 0, 0);visibility: visible;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;">所有计量经济圈方法论</span></strong></span></strong></span></strong></span></strong></span></strong></span></strong><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;">丛的code程序</span></strong></span></strong></span></strong></span></strong></span></strong></span></strong><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;">, 宏微观</span></strong></span></strong></span></strong><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;">数据库和各种软</span></strong></span></strong></span></strong></span></strong></span></strong></span></strong><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word;visibility: visible;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(62, 62, 62);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(51, 51, 51);visibility: visible;box-sizing: border-box !important;overflow-wrap: break-word !important;">件都放在社群里.欢迎到计量经济圈社群交流访问.</span></strong></span></strong></span></strong></span></strong></span></strong></span></strong></span></section><section style="text-align: center;margin-bottom: 0px;"><img class="rich_pages wxw-img js_insertlocalimg" data-ratio="0.525" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6apPetFjqibibibtFwWwAicYFUaicWLPn1bFqRhFDtCq4ibE7NR6B5n0ppHWSQ/640?wx_fmt=jpeg" data-type="jpeg" data-w="1200" style="width: 502px;height: 264px;"  /></section><p style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0px 8px 0.8em;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">计量社群里在讨论固定效应相关问题时，一位群友分享了一则题为《固定效应》的帖子。看罢，群友们认为这是讲解最清楚易懂的干货帖，值得阅读。</span></p><p style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px 0px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">基于此，遂将其分享给各位中青年学者参考，来源附在文后。</span></p><blockquote cid="n194" mdtype="blockquote" style="box-sizing: border-box;margin-top: 0.8em;margin-bottom: 0.8em;border-left-width: 4px;border-left-color: rgb(223, 226, 229);padding-top: 0px;padding-right: 15px;padding-left: 15px;color: rgb(119, 119, 119);font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: start;white-space: normal;"><section style="box-sizing: border-box;orphans: 4;white-space: pre-wrap;line-height: normal;text-align: justify;"><span style="font-size: 14px;box-sizing: border-box;">关于固定效应，参看：1.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448102744&amp;idx=1&amp;sn=8a85a58e097a19aeb571b249e0795a3d&amp;chksm=b322c87684554160db5dda57bdabe79d7476851b8740a5ebf5c712f351573d1417021e9c101a&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">交互项! 交互项! 固定效应回归模型中的交互项！</span></a>2.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448101867&amp;idx=1&amp;sn=1707dd30c0d9c19e131156d4ea099e3b&amp;chksm=b322ccc5845545d39ae59e4205f8aea5c323a0d59ed12464a721885487a74289b5519c714545&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">在Stata中如何做2SLS, DID, DEA, SFA, 面板PSM, 二值选择, 固定效应和时间序列？</span></a>3.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448100667&amp;idx=1&amp;sn=18b990db0b35a738b84234831c296331&amp;chksm=b322d01584555903f66de3ed521b46e0ed02a9fe86ead1d7f3cb71bef17c6e17cf0065c67f2c&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">一定要控制时间固定效应吗？</span></a>4.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448097741&amp;idx=1&amp;sn=6793c4f6fa63feda73dbd68b1af9d383&amp;chksm=b322dce3845555f568e3cacbd0fabb3035ead6ebfe78bc2a13a08c3d0e11445f46749fcfcf8a&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">公司和个体固定效应总是更好吗? 关于固定效应使用和解释的最全指南！</span></a>5.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448097681&amp;idx=1&amp;sn=1085ecc5a9b50a3c3b5ffa8f024ad791&amp;chksm=b322dcbf845555a966dd344f55682e56ba281b9390207b43b188de8d735a78c2553bff8d31ba&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">使用固定效应FE时良好做法对应的检查清单</span></a>，6.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448090682&amp;idx=1&amp;sn=545262ddb6bcba50c2bea4b5a122a322&amp;chksm=b3233b148454b202bfce8805fcc85d477540236b777eadca2be94aba263c3748c6af15e5683d&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">双向固定效应多期DID最新进展和代码汇总, 关于控制变量和固定效应选取的讨论</span></a>，7.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448076009&amp;idx=1&amp;sn=d9a154b8ea3bbcef3c3a1b5c81f1b0f5&amp;chksm=b32371c78454f8d10cd8633fb0830cc856e8c1b185d1f66c759a3c7eb0bf4656efd06b628c8d&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">快速估计带有高维固定效应的泊松模型, 这计算速度真快, 真实用！</span></a>8.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448073111&amp;idx=1&amp;sn=7bc2c8e113bd87555cdcc620b68b8b62&amp;chksm=b3237cb98454f5af1cb4f4c421ddfdd1b47d0c9b2584a0724e5e7ac5a9213a3c86027a8789e0&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">不能直接控制某个固定效应时, 我们能尽量做些什么呢？</span></a>9.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448069726&amp;idx=1&amp;sn=d1b4c2ce7bde240a6195515a533cb084&amp;chksm=b32349708454c066cb0c798a78c2101146a5010b283f434aa8e4c1377c5be66a8bddcf488fed&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">时间固定效应和时间趋势项的区别, 可以同时加？</span></a>10.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448061249&amp;idx=1&amp;sn=0e2f99c7ec55b6bdc2ddae357d21dcfd&amp;chksm=b323ae6f845427797c4fd9f95b3ed8255780b9afdc913d2eb8e56d9a67a16276abe21dc7c1f9&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">省份/行业固定效应与年份固定效应的交乘项固定效应</span></a>，11.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448073009&amp;idx=1&amp;sn=ba32211fad8623ba3211bd7cdbcf3a6d&amp;chksm=b3237c1f8454f5098f441f89684921d6c4f7fd3bff4683c9c0a544b26c251fa135e1e48cdc07&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">截面DID, 各种固定效应, 安慰剂检验, 置换检验, 其他外部冲击的处理</span></a>，12.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448059508&amp;idx=1&amp;sn=e7543a0354e32902c11ab545a30f8b68&amp;chksm=b323b15a8454384c3bcaac6f0ee59154c77acfa23c27e288e654bb267403243d941828661534&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">广义合成控制法gsynth, 基于交互固定效应的因果推断</span></a>，13.<a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448105381&amp;idx=1&amp;sn=da7740d2fcaad72156461ed4fe2d9130&amp;chksm=b322c28b84554b9d6920ce5094d6c8b246e2f6b4973100516a69f69d23d1354d644dd1877068&amp;scene=21#wechat_redirect" style="box-sizing: border-box;cursor: pointer;color: rgb(65, 131, 196);-webkit-user-drag: none;" data-linktype="2"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">固定效应模型+测量误差=有问题, 如何解决这问题呢？</span></a></span></section></blockquote><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;color: rgb(34, 34, 34);font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;margin-top: 0px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><img class="rich_pages wxw-img" data-galleryid="" data-ratio="0.046801872074883" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTcdtWkBjWAQrpzPRquUTM7HOhWonrnuIia5k73dnghuPBj9AuicBGRcNz0gVLfbRrW0aFq6t0Dy93Cg/640?wx_fmt=png&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1" data-type="png" data-w="641" style="outline: 0px;box-sizing: border-box !important;overflow-wrap: break-word !important;width: 641px !important;visibility: visible !important;"  /></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">1.固定效应是什么？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">首先，固定效应是一种控制变量，可以影响解释变量，也可以影响被解释变量。其次，固定效应是有固定不变特征的影响因素（控制变量），包括可观测的和不可观测的。最后，固定效应有两个维度，一个是空间，一个是时间。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">数据：首先是一个固定效应就是一个控制变量或者是一种综合的影响因素（包括了很多控制变量（产生的效果）），其次根据独一无二的固定不变的特征来分组，再次每组组内的取值相同，最后产生对组内个体同质性的影响。固定效应有几个类型：个体固定效应、时间固定效应、省份固定效应、行业固定效应以及交叉固定效应等等，这是因为根据独一无二的固定不变的特征来分组造成的，比如个体固定效应就是每个个体不随时间变化的独特特征对被解释变量的影响，省份固定效应就是每个省份不随时间变化的独特特征对被解释变量的影响，不同的分组可以形成不同的固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">模型：Yit=bXit+di+uit ，个体固定效应就是di，类似于每个个体有一个单独的截距项，或者类似于常数项但是不同组有不同的取值，组内取值相同。或者Yit=bXit+求和diDi+uit，个体固定效应di就是虚拟变量Di的系数。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">图形：每个组分别画图，放在一个图内，不同的组有不同的截距项，但是所有组有相同的斜率。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">2.为什么要引入固定效应？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">因为固定效应是一种控制变量，控制变量的目的就是防止遗漏变量带来的内生性问题，遗漏变量会影响解释变量，也会影响被解释变量，导致解释变量的估计系数不准确或者不纯，所以要多增加控制变量。控制变量一般有可观测的随时间变化的变量、有可观测的不随时间变化的变量，有不可观测不随时间变化的变量等等，固定效应主要控制不可观测不随时间变化的变量，比如个体固定效应，两个公司A和B绩效有大的不同，那么其背后有很多原因，比如公司文化、所处省份、所处行业等等，公司文化难衡量且不随时间变化，所以可以用个体固定效应来控制。当然也不一定是不随时间变化，比如年份固定效应就是衡量每个年份不随个体变化的影响因素，每年都有独特的特征，如宏观经济波动导致企业A在不同年份的绩效不一样。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">3.举例</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">个体固定效应：个体固定效应就是个体层面不随时间变化的影响因素，每个个体都独特的个体特征，其目的是为了控制个体层面独一无二的不随时间变化的特征，比如企业A之所以绩效比企业B好，其中就有企业文化在起作用，若是想要控制，就需要加入个体固定效应。写成模型就是Yit=b*Xit+di+uit，这里的di就是个体固定效应，每个个体都有独特的部分，每个个体都不一样，不随时间变化。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">时间固定效应：时间固定效应就是时间层面不随个体变化的影响因素，每个年份都有独特的年份特征，其目的是为了控制时间层面独一无二的不随个体变化的特征，比如每年的宏观经济。写成模型就是Yit=b*Xit+Tt+uit，这里的Tt就是年份固定效应，每个年份都有独特的部分，每个年份都不一样，不随个体变化。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">一个具体的例子：我们想要研究税法改革与企业绩效之间的关系，企业1在A省2014年后发生了税法改革，企业2在B省一直都没有税法改革。我们如果仅仅看税法改革后企业1的绩效大于企业2的绩效，就说税法改革是有效的，显然不合理，其忽略了影响企业绩效的其他因素。比如企业1和企业2本身都有独特的个体固定特征，导致企业1本身就绩效高，这时候就需要控制个体固定效应，将原本就有的每个企业的特色或者两企业之间的差异给估计出来控制住，这样才能进一步比较，这就是个体固定效应。又比如在2014年宏观经济因素发生了变化，但是与税法改革无关，导致企业1和企业2绩效都提升，那么还需要剥离宏观经济的影响，这时候就需要控制年份固定效应，将每年的特色给控制住。所以，2014年后A企业平均绩效=税改+2014年后宏观经济+A个体本身特色，2014年后B企业平均绩效=2014年后宏观经济+B个体本身特色，那么若想知道2014年后两个企业绩效的差距是否来自于税改，那么就需要控制住年份固定效应和个体固定效应。另外，前面企业个体固定效应是控制了企业本身独特的不随时间变化的特征，比如企业的文化、企业所在的省份和行业等等，企业所属的省份和行业也是影响企业绩效的关键因素，企业A和B之间绩效的不同也可能是因为省份的独特的不随时间变化的特征和行业的独特的不随时间变化的特征，按理说也应该一起控制，即省份固定效应和行业固定效应。那么到底要不要控制？等讲完固定效应的估计方法再说。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">4.怎么估计固定效应？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">介绍两种方法：一种是虚拟变量法，另一种是组内离差法。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">假设模型是Yit=b*Xit+di+uit，i是个体如企业，t是年份，这里的di就是个体固定效应——企业独一无二的不随时间变化的影响解释变量和被解释变量的因素。可以说，我们要么就把di个体固定效应给估计出来，要么就把di个体固定效应给去掉后再估计。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">4.1虚拟变量法——直接估计出来</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">个体固定效应是每个企业独一无二的不随时间变化的影响因素，那么可以放入虚拟变量来估计，在没有常数项时，一个企业就放入一个虚拟变量，如果个体是i，那么虚拟变量Di=1，如果是其他个体，那么虚拟变量Di=0。通过估计出虚拟变量的系数，就可以得到个体固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">一个特点：当每个个体都有一个虚拟变量的时候，个体层面可以观测的不随时间变化的虚拟变量，如性别变量，就会与个体固定效应虚拟变量共线性，这时候性别变量会omitted被剔除，个体固定效应实际上是可以观测和不可观测的不随时间变化的影响因素。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">代码：4个企业个体</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">tab id，gen（id_dum）/根据id生成虚拟变量</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">reg y x id_dum1-id_dum4,noconstant</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">4.2组内离差法——先剔除后估计</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">我们知道每个个体都有不随时间变化的个体固定效应，一个个体有很多时间维度，就形成一个组，解释变量、被解释变量和控制变量对时间求均值，形成一个组内均值，但是个体固定效应由于不随时间变化，还是等于个体固定效应，那么变量的每个值都减去自己的组均值，就形成一个新变量，这时候新变量里就没有个体固定效应了。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">原来模型：Yit=bXit+di+uit，每组求均值后：Yi=bXi+di+ui，相减后：Yit-Yi=b（Xit-Xi）+uit-ui。直接用ols就可以估计出来b。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">一个特点：不仅去除了个体固定效应（不可观测的不随时间变化的变量），也去除了可观测的不随时间变化的变量，如性别变量，假设有两个个体，有3个年份，个体1是男，个体2是女，男取值为1，女取值为0，那么个体1求均值后为1，个体2求均值后为0，那么个体1的取值减去均值都变成了0，个体2的取值减去均值都变成了0，此时性别虚拟变量全部都成了0，不存在个体内变化信息，无法估计。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">代码：</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">egen m_y=mean(y),by(id) /按id生成变量y均值</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">egen m_x=mean(x),by(id) /按id生成变量x均值</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">gen winthin_y=y-m_y /对y进行去均值转换</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">gen within_x=x-m_x/.....</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">gen winthin_y within_x,noconstant</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">以上是手动原理，以下是自动</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">xtset id year</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">xtreg y x，fe</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">5.一些关于固定效应的问题</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">一种是固定效应之间的关系，另一种是固定效应与控制变量之间的关系。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">5.1有了个体固定效应还需不需要控制省份固定效应和行业固定效应？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">看企业是否在年份变化里变动省份和行业。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">重新假设一个数据，企业1和企业2在A省，企业3和企业4在B省，放入企业固定效应就是放入4个虚拟变量，放入省份固定效应就是放入1个虚拟变量，企业1和企业2的虚拟变量就可以表出省份虚拟变量，或者企业3和企业4的虚拟变量就可以表出省份虚拟变量，那么在放入回归的时候，省份虚拟变量会被(omitted)掉。或者按照组内离差的方法，要对每个个体变量（解释变量、被解释变量和控制变量）先根据个体取求均值，然后每个个体变量减去均值，然后跑回归。那么省份虚拟变量在取均值的时候还是等于一般的取值，所以一减就全是零了，不存在个体内变化信息，无法估计。那么什么时候可以同时放入省份和企业固定效应？企业虚拟变量表出不了省份虚拟变量的时候，也就是此时省份固定效应无法被代替了，此时个体变量减去组内均值还是存在的，可以回归。比如企业1在2015年之前在A省，2015年之后在B省，这时候企业1的虚拟变量就没办法表出，控制的个体固定效应是个体不随时间变化的，省份变化了，所以就没控制。可以加入省份固定效应，因为之前个体固定效应所控制的省份固定效应不是真实的，或者就没控制省份固定效应，因为省份固定效应的控制需要整个省份整个年份的企业，但是由于企业的变化导致省份内企业数量的变化。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">5.2固定效应与控制变量之间的关系是什么？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">其实无论个体固定效应、时间固定效应、省份、行业、省份-行业、省份-年份等等，都是将个体分成不同的组，固定效应就是要控制每个组内独一无二且固定不变的特征，当加入时间维度，就不一定是不随时间变化了，它变成了在那一个分组内固定不变，比如省份-年份的话，控制了浙江省2012年的独特的固定特征对。那么当加入个体固定效应时，个体层面的虚拟变量就会被剔除。当加入行业-年份固定效应时，行业层面随时间变化的控制变量就会被剔除。当加入省份-年份固定效应时，省份层面随时间变化的控制变量就会被剔除，如果你的核心解释变量是省份层面的，那么就不能加入省份-年份固定效应，因为解释变量会被剔除。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">5.3交互固定效应如何设定？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">两个变量交互，比如行业和年份，文献中的表示方法一般是行业-年份或者行业×年份。基本来说有两种方法：第一种方法先生成交乘变量，其实就是两个变量的进一步分组，比如行业与时间交互，有3个行业和10个年份，交互后就进一步分成30个组，同一个行业同一个年份的企业分成一组！也可以这么理解，将企业分到3个行业里面，一个行业又再按年份分成10组，那么就是30组。但是也不一定就是3*3=9,比如有三个行业和三个城市，先将企业分成3个城市，第一个城市有3个行业，但是第二个和第三个城市只有1个行业，且相同，那么所有的企业一共只能分成5组。那么代码是这样的：egen year_industry=group(year industry)，其次在reghdfe的absorb中写成absorb(year_industry)；第二种方法就是直接在reghdfe的absorb中写成absorb(year#industry)。其实本质上来说就是分组或者变换维度，形成一个新的类别变量或者维度，而且是更加细化的维度，那么最普遍的做法就是先形成一个新的变量即egen的做法，然后就把他当成普通的变量进行回归，如果要固定就固定，如果要聚类就聚类。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">5.4省份-年份固定效应与省份和年份固定效应之间的关系是什么？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">其实，省份-年份就是用省份和年份一起来分组的，无论企业变动与否，都能完全分组，那么省份-年份可以以表出省份，也可以表出年份，所以控制了省份-年份就不用控制省份和年份了。在stata中，放入省份-年份虚拟变量后再放入年份虚拟变量会被剔除，放入省份虚拟变量也会被剔除。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">一句话总结固定效应：有固定不变特征的控制变量，其目的是为了控制每个分组内独一无二的固定不变的特征。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">6.控制几个固定效应？</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">控制变量有两个维度，一个是时间，另一个是空间，空间又分省份、行业和企业个体。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">在个体层面，分为随时间变化的控制变量和不随时间变化的控制变量，随时间变化的控制变量可以用可观测的控制变量来衡量，不随时间变化的控制变量可以用个体固定效应来衡量。那么个体层面控制变量=个体可观测控制变量+个体固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">在省份层面，分随时间变化的控制变量和不随时间变化的控制变量，随时间变化的控制变量可以用可观测的控制变量来衡量，不随时间变化的控制变量可以用省份固定效应来衡量。那么省份层面控制变量=省份可观测控制变量+省份固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">在行业层面，分随时间变化的控制变量和不随时间变化的控制变量，随时间变化的控制变量可以用可观测的控制变量来衡量，不随时间变化的控制变量可以用行业固定效应来衡量。那么行业层面控制变量=行业可观测控制变量+行业固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">在时间层面，如果想要控制不随个体变化、不随省份变化、不随行业变化的控制变量，可以时间固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">那么第一种加入控制变量的方式就是：个体层面控制变量+省份层面控制变量+行业层面控制变量+时间层面控制变量=个体可观测控制变量+省份可观测控制变量+行业可观测控制变量+个体固定效应+省份固定效应+行业固定效应+时间固定效应。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">如果省份可观测控制变量不太够，那么可以换成省份-年份固定效应，此时第二种加入控制变量的方式就是：个体可观测控制变量+行业可观测控制变量+个体固定效应+行业固定效应+省份-年份固定效应。此时如果解释变量是省份层面的，那么不能加入省份-年份固定效应，因为解释变量会被剔除。</span></section><section style="box-sizing: border-box;line-height: inherit;orphans: 4;margin: 0.8em 8px;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: justify;"><span md-inline="plain" style="box-sizing: border-box;">如果行业可观测控制变量不太够，那么可以换成行业-年份固定效应，此时第三种加入控制变量的方式就是：个体可观测控制变量+省份可观测控制变量+个体固定效应+省份固定效应+行业-年份固定效应。此时如果解释变量是行业层面的，那么不能加入行业-年份固定效应，因为解释变量会被剔除。</span></section><blockquote cid="n170" mdtype="blockquote" style="box-sizing: border-box;margin-top: 0.8em;margin-bottom: 0.8em;border-left-width: 4px;border-left-color: rgb(223, 226, 229);padding-top: 0px;padding-right: 15px;padding-left: 15px;color: rgb(119, 119, 119);font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;text-align: start;white-space: normal;"><section style="box-sizing: border-box;orphans: 4;white-space: pre-wrap;text-align: justify;line-height: normal;"><strong><span style="font-size: 14px;"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;">Source:</span></span></strong><span style="font-size: 14px;"><span md-inline="plain" style="font-size: 14px;box-sizing: border-box;"> </span><span md-inline="url" spellcheck="false" style="font-size: 14px;box-sizing: border-box;word-break: break-all;">https://zhuanlan.zhihu.com/p/476735732?utm_medium=social&amp;utm_oi=1134048306945794048，作者：胜风。</span></span></section></blockquote><hr style="border-style: solid;border-width: 1px 0 0;border-color: rgba(0,0,0,0.1);-webkit-transform-origin: 0 0;-webkit-transform: scale(1, 0.5);transform-origin: 0 0;transform: scale(1, 0.5);"  /><p style="margin-bottom: 0px;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;background-color: rgb(255, 255, 255);orphans: 4;white-space: pre-wrap;font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-size: 16px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box;font-size: 14px;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">1.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448057864&amp;idx=1&amp;sn=5f7059308a1dd4e522e46fca2ea541c5&amp;chksm=b323bb2684543230b5ae496bf5ca5809704981c4579d8326afdec847eb142a11be5a2b9b6958&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">用"因果关系图"来进行因果推断的新技能</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">2.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071492&amp;idx=2&amp;sn=688ef84b9693ff1436e103faf4ae1f12&amp;chksm=b323466a8454cf7c0059d2314d953e67363c946e7c823a1b7e1b207fdf2bea1db5cf03bdf4a3&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">因果推断专题：因果图</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">3.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071810&amp;idx=2&amp;sn=97ea0116d994db98955cada9b3f64b59&amp;chksm=b32341ac8454c8ba5741d580357f5d97cf95d33aca2ade1c49d64a8063d38a3c017807d2145d&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">因果推断专题：有向无环图DAG</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">4.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448066160&amp;idx=1&amp;sn=1e7ccd59f59710e292708de35599788d&amp;chksm=b3235b5e8454d248eff76c238d88cad41cb22a3534b7aaa94bf9d1860df6c8a8eec80faad019&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">confounder与collider啥区别? 混淆 vs 对撞</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">5.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448073308&amp;idx=1&amp;sn=e9b55781c289a0861e017275da0710df&amp;chksm=b3237f728454f664de864cb11c952356b0cbd68674fb9e9a446fa7352a595ae8e4aea7bf62b1&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">三张图秒懂, 混淆, 中介, 调节, 对撞, 暴露, 结果和协变量的复杂关系</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">6.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071672&amp;idx=1&amp;sn=f133025c818d31c26194e75ff030e148&amp;chksm=b32346d68454cfc0411c9eb0bdf7b807f5b60b23110d0570a1fb9083054e8427a079994a9e55&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">中介效应检验流程, 示意图公布, 不再畏惧中介分析</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">7.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448066326&amp;idx=1&amp;sn=b3cbe75cea8138dd1912594f889cac25&amp;chksm=b3235a388454d32ec73ee020240c975bda3327f248e7dec88945e135bddc1f49af87cec9401d&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">图灵奖得主Pearl的因果推断新科学，Book of Why?</span></a><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">8.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448073618&amp;idx=1&amp;sn=ed5a8cb592b272c329c26cbb70610f6c&amp;chksm=b3237ebc8454f7aadd1e81f65e74d4017b426f690cc4bf014127f1fec867d5cd95672eb9cb5c&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">前沿: nature刊掀起DAG热, 不掌握就遭淘汰无疑！因果关系研究的图形工具!</span></a><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">9.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448072890&amp;idx=1&amp;sn=609888cab1ba4fdb10490730fb49fbc6&amp;chksm=b3237d948454f4826ee5d17d8dee4013817aaa9c95b10a3ae234f9c10c775b27ca20252478e8&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">前沿: 卫星数据在实证研究中的应用, 用其开展因果推断的好处！</span></a><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">10.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448072834&amp;idx=1&amp;sn=bf1577e6e58d31b1281ee000347bc10e&amp;chksm=b3237dac8454f4ba25fdc6f82cd3c4250b658fb6e095093d6b1497911725aad36cf4d6484588&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">7大因果推断大法精选实证论文, 可用于中国本土博士课堂教学！</span></a><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">11.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448072749&amp;idx=1&amp;sn=dbc8d22f14f26d96e627e174a41c7b23&amp;chksm=b3237d038454f415b715518981d16242b174e4800fddf4e718bcacfa6e6b7f5ffc98d47e52da&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">随机分配是什么, 为什么重要, 对因果关系影响几何？</span></a><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">12.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448072508&amp;idx=1&amp;sn=5561ac08bceed8da2f2ee034e4973e91&amp;chksm=b32342128454cb0465bf96975bf5c880fedb226bc3bce8ce7e1c8e6c67f0c0f8cdf97005949a&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">应用计量经济学现状: 因果推断与政策评估最全综述</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">13.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071022&amp;idx=1&amp;sn=c6a753f90e2073ede9719a425a68c5f1&amp;chksm=b32344408454cd56f1a187a8300ce20436835427c3628d59bb8a473c5da37473057d20c5cf2d&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">疫情期计量课程免费开放！面板数据, 因果推断, 时间序列分析与Stata应用</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">14.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448070574&amp;idx=1&amp;sn=643a00b526c9799be06e6b1995411ed8&amp;chksm=b3234a808454c396d3beac57a79e7a0b7ce5edf1b0b2c454f66528d6af7e1cd885e1ad89a651&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">Python做因果推断的方法示例, 解读与code</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">15.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071094&amp;idx=1&amp;sn=49d05bb86862fd130d0d3bd380c9e03b&amp;chksm=b32344988454cd8e69d955be3c3482ee722bfeb8fa0cee34e1afdda6dd552d2125c07744731a&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">内生转换模型vs内生处理模型vs样本选择模型vs工具变量2SLS</span></a>，<strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">16.</strong><a spellcheck="false" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448064990&amp;idx=1&amp;sn=1fdb451259e486743dc29424a4b1cebc&amp;chksm=b3235cf08454d5e6d85a247c4a614de17cae795143157a55ad202a5c293d467265485d0c8f4b&amp;scene=21#wechat_redirect" data-linktype="2" style="outline: 0px;color: rgb(65, 131, 196);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box;-webkit-user-drag: none;overflow-wrap: break-word !important;"><span md-inline="plain" style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;">不用IV, 基于异方差识别方法解决内生性, 赐一篇文献</span></a>等等。</span></p><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);line-height: normal;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">下面这些短链接文章属于合集，可以收藏起来阅读，不然以后都找不到了。</span><br style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"  /></section><section style="margin-bottom: 0px;outline: 0px;max-width: 100%;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;overflow-wrap: break-word !important;"><section powered-by="xiumi.us" style="outline: 0px;max-width: 100%;box-sizing: border-box;font-size: 18px;overflow-wrap: break-word !important;"><section style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><section style="margin-top: 10px;margin-bottom: 10px;outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;"><section style="outline: 0px;max-width: 100%;box-sizing: border-box;width: 670px;text-align: center;overflow-wrap: break-word !important;"><section style="margin-right: 3px;margin-left: 3px;padding-right: 6px;padding-left: 6px;outline: 0px;max-width: 100%;box-sizing: border-box;display: inline-block;vertical-align: top;border-radius: 3px 3px 0px 0px;color: rgb(255, 255, 255);font-size: 14px;background-color: rgb(38, 38, 38);overflow-wrap: break-word !important;"><p style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box;line-height: 22.4px;overflow-wrap: break-word !important;">4年，计量经济圈近1500篇不重类计量文章，</strong></strong></span></p><p style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;text-decoration: underline;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">可直接在公众号菜单栏搜索任何计量相关问题</strong></span><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">,<br style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"  /></strong></span></p><p style="outline: 0px;max-width: 100%;box-sizing: border-box;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">Econometrics Circle</strong></span></p></section></section><section style="margin-top: -2px;outline: 0px;max-width: 100%;box-sizing: border-box;width: 670px;font-size: 0px;overflow-wrap: break-word !important;"><section style="margin-top: -2px;outline: 0px;max-width: 100%;box-sizing: border-box;display: inline-block;vertical-align: top;width: 6px;height: 6px;border-radius: 50%;background-color: rgb(38, 38, 38);overflow-wrap: break-word !important;"><br style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"  /></section><section style="margin-right: -6px;margin-left: -6px;outline: 0px;max-width: 100%;box-sizing: border-box;display: inline-block;vertical-align: top;width: 670px;border-bottom: 2px solid rgb(38, 38, 38);overflow-wrap: break-word !important;"><br style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"  /></section><section style="margin-top: -2px;outline: 0px;max-width: 100%;box-sizing: border-box;display: inline-block;vertical-align: top;width: 6px;height: 6px;border-radius: 50%;background-color: rgb(38, 38, 38);overflow-wrap: break-word !important;"><br style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"  /></section></section><section style="margin-top: -2px;margin-bottom: 5px;outline: 0px;max-width: 100%;box-sizing: border-box;min-height: 1em;width: 670px;font-size: 0px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 0, 0);box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">数据系列</strong></span><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">：</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448060009&amp;idx=1&amp;sn=d0e09b9da56adc839d0bf2829f74a798&amp;chksm=b323b34784543a51705b584f9678b9d92f6bc4f8ccf3dcca3ef0d0fc08f04aadb97a33bb0d26&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">空间矩阵</span></strong></span></a><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</strong><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448059634&amp;idx=1&amp;sn=5312d3cc381834b62c1eb67e9a8a1f6d&amp;chksm=b323b1dc845438cafe045495c652c9817d6e6985b7af9063e4d197ad242cab9e42dfa4e9288f&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: rgb(0, 122, 170);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">工企</span></strong></span><strong style="outline: 0px;max-width: 100%;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">数据</span></strong></a><strong style="outline: 0px;max-width: 100%;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448058119&amp;idx=1&amp;sn=79d1e1f0e35a367a76eb0576e49bb963&amp;chksm=b323ba298454333fd4599a881dc19cd7fdba35965e9d05bd7a260a92cba3841bc3953e1d0543&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">PM2.5</span></strong></span></a><strong style="outline: 0px;max-width: 100%;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448059310&amp;idx=1&amp;sn=38f7b997958eb22a33144f9d8a8f6b47&amp;chksm=b323b68084543f966982777e972d698f35d3b9b5de7f314f5ab386839b5933d57c795da6f5c9&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">市场化指数</span></strong></span></a><strong style="outline: 0px;max-width: 100%;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448058145&amp;idx=1&amp;sn=fce08fd7873a13f0bab2c08a9f85fa1b&amp;chksm=b323ba0f84543319d1b1c823b7ca718eedf8632ce637dd57a4a77ced784dfde6310583c1de81&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">CO2数据</span></strong></span></a><strong style="outline: 0px;max-width: 100%;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;&nbsp;</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448063102&amp;idx=1&amp;sn=33651bd4acc42c6ee1d62056f90c0a8f&amp;chksm=b323a75084542e46c3cdcb7a56da6ff84b2f42727df77863cb2d643f3c3d17d3508ea08ce3e9&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">夜间灯光</span></strong></span></a><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;<strong style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">|&nbsp;</span></strong></span></strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448065433&amp;idx=1&amp;sn=a9462690887c158c88a3cac56d2b29fd&amp;chksm=b3235eb78454d7a1a5d116f42eb1a94e068cde86e58acfbe5e9cb120c1ccaf01d2d2b305fcaa&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">官员方言</span></strong></span></a><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;<strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span></strong><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062811&amp;idx=1&amp;sn=202fc87eb6f342e5dcb8f2158dfc6ceb&amp;chksm=b323a47584542d63fbcb79ab702d51b229d35132a9e91c0f85f1a4fff86aa8841dba21aa45b2&amp;token=1841432546&amp;lang=zh_CN&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">微观数据</span></strong></span></a><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;</strong><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">| 内部数据</span></strong></span></section><section style="margin-top: -2px;margin-bottom: 5px;outline: 0px;max-width: 100%;box-sizing: border-box;min-height: 1em;width: 670px;font-size: 0px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 0, 0);box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">计量系列</strong></span><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">：</strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062566&amp;idx=1&amp;sn=f44f630371c71e3b4c224764a9119544&amp;chksm=b323a54884542c5eaa72494b8d1ad0cc4996b8a334e6ae56c37b3cb2ec4e0ad9d3d785a4cfcb&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">匹配方法</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062564&amp;idx=1&amp;sn=9c8ec12753691fbb5a8a24a218f98dfd&amp;chksm=b323a54a84542c5c4e2b34cbd7311b68af477618ee8e7318389073ea66a18dc4b2aa509bd798&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">内生性</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448063055&amp;idx=1&amp;sn=41edd00addaafde5455df840a721d57b&amp;chksm=b323a76184542e778798ee766e32ab09ea91262fe2513c3ed8299ed74320156112413c5a6b63&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">工具变量</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448061904&amp;idx=1&amp;sn=2faa0b5c7f589123357936914bc00653&amp;chksm=b323a8fe845421e8406084be49bba42993578da2d931572b830e9c8c72fb66e0a7148dc040ad&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">DID</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062552&amp;idx=1&amp;sn=d06aeea68eb98c108b6788316262d839&amp;chksm=b323a57684542c6028d9810b33bc24fb4092931bfa5dfb2c2f3a4f9dc30371a689d144d4e240&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">面板数据</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448058131&amp;idx=1&amp;sn=775cff0263536feabfdfae383d22c365&amp;chksm=b323ba3d8454332b2551fda4b21e47ee00b68a2e6aee4a542a26194e07d517034189839f15c1&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">常用TOOL</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448064821&amp;idx=1&amp;sn=f5041659920ee9f0cf1222af629acde8&amp;chksm=b3235c1b8454d50d2adb6e82cb1c6780be2d9bb5a108cc2a7876fd92e9148df97538143ad2f6&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">中介调节</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448065022&amp;idx=1&amp;sn=1e33ca30af79f4c1034f12695c33ceab&amp;chksm=b3235cd08454d5c6076fbd6b178da41a24065146d904ad1942a44045e181c00d8dc2ca0a2302&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">时间序列</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448065475&amp;idx=1&amp;sn=2a59d1f706edf1246dfb55b66b9afe77&amp;chksm=b3235eed8454d7fbdcc21ecd6597aa15890cafacf66462c71fe4050601748f54e30805c5778e&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">RDD断点</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448057440&amp;idx=1&amp;sn=225b8679d4aedc559a83d298e6d652f1&amp;chksm=b323b94e84543058ce552c4265a7d677aa90c8ed249f05145d60135e248a691ea19a617a24a3&amp;scene=21#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">合成控制</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a target="_blank" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448069237&amp;idx=1&amp;sn=bf640bf9c102ce2ec4510947e712df6a&amp;chksm=b3234f5b8454c64db969ca3b0b810ba7440930c485b68a8d1da0c775bb539d4c2d5f9a828e53&amp;scene=21#wechat_redirect" textvalue="200篇合辑" data-itemshowtype="0" tab="innerlink" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">200篇合辑</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a target="_blank" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071920&amp;idx=1&amp;sn=0d1d77a5ef2cb299ccd8490ba90d661d&amp;chksm=b32341de8454c8c8a37c136ce86e29a891619aed862ef413572573dde7619e12ffa095e287a8&amp;scene=21#wechat_redirect" textvalue="因果识别" data-itemshowtype="0" tab="innerlink" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">因果识别</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a target="_blank" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448068171&amp;idx=2&amp;sn=fe032014f4077f8b2e3c0922a79ae84b&amp;chksm=b32353658454da73a9a8d25216f2b55729a0e9028a2b76ebcaa627401e710773824ca116dd65&amp;scene=21#wechat_redirect" textvalue="社会网络" data-itemshowtype="0" tab="innerlink" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">社会网络</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a target="_blank" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448071482&amp;idx=1&amp;sn=10065b277b091029305535520da164f0&amp;chksm=b32346148454cf0200ba64bee439af791a9a466d3e34482365abac9b70d0abbfa7350f2e4751&amp;scene=21#wechat_redirect" textvalue="空间DID" data-itemshowtype="0" tab="innerlink" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">空间DID</span></strong></span></a></section><section style="margin-top: -2px;margin-bottom: 5px;outline: 0px;max-width: 100%;box-sizing: border-box;min-height: 1em;width: 670px;font-size: 0px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 0, 0);box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">数据处理</strong></span><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;font-size: 17px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">：</span></strong><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448065464&amp;idx=1&amp;sn=5d47e75e0572f76d2435b16859cfa4e0&amp;chksm=b3235e968454d780b73d308367b5cf94a9b153878cf9a6d62c6a050e8f9f57b2622ff0e496bd&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">Stata</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448058238&amp;idx=1&amp;sn=827485961988e6e8564e0cdc74802377&amp;chksm=b323ba508454334626f198761497dbaf946e882c5ce2cf906b48b50a0ef287f704bee52ed45e&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">R</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448061325&amp;idx=1&amp;sn=82452e48f4c8d6128fda45b2ec8b7a4e&amp;chksm=b323aea3845427b507ef729c2b6eb6368eaa49e784638f2a35d6bc3155444766efa5d524b3c1&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">Python</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448061020&amp;idx=1&amp;sn=1deed45e15bf85519c6c8ee96ff78651&amp;chksm=b323af7284542664845bec10ddee7aca83db4ac1325c98382ad1020bbd65da8419e9de2e3f57&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">缺失值</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448056970&amp;idx=1&amp;sn=60464a09b72a72da002d33ddc2f98013&amp;chksm=b323bfa4845436b24f87b67bc3a06d46a1da7270e7e7bde6528edc3a5015f69007b923f91a6b&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">CHIP/ CHNS/CHARLS/CFPS/CGSS等</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|</span></strong></span></section><section style="margin-top: -2px;margin-bottom: 5px;outline: 0px;max-width: 100%;box-sizing: border-box;min-height: 1em;width: 670px;font-size: 0px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 0, 0);box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">干货系列</strong></span><strong style="outline: 0px;max-width: 100%;letter-spacing: 0.544px;widows: 1;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);font-size: 14px;box-sizing: border-box !important;overflow-wrap: break-word !important;">：</strong><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448063896&amp;idx=1&amp;sn=3eb5a7ee2ee8b21f8b4ea6dae4730ecf&amp;chksm=b323a0b6845429a02c0968bfd19baa21d1dcfdc2cd0d3dc49148ceb2d57213ec78b43f4d58c0&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">能源环境</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448063909&amp;idx=1&amp;sn=ec58cdbc619804982ddf200975a5d65f&amp;chksm=b323a08b8454299dc902a12085add4d80e07da6105b4484bf94d05e1bce5ea101d765a53cd0a&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">效率研究</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448058317&amp;idx=1&amp;sn=be11b13a539a73d0a15e512f7cb576f7&amp;chksm=b323bae3845433f5bbb0cea353f44febe1acc0f3f3a6397c3a835b702f6577a37030fbccbd79&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">空间计量</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062875&amp;idx=1&amp;sn=b3ac56e734e2ec8f7794359274ace54b&amp;chksm=b323a4b584542da315de07363e8205b18d91b38521394e115325523fa51c50d4c3bb88b9dfce&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;letter-spacing: 0.544px;widows: 1;font-size: 17px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">国际经贸</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448063081&amp;idx=1&amp;sn=3b6c35626a442a2a27b3dc5affb09a10&amp;chksm=b323a74784542e51316dd54f482c4298b76bf33147e91076b842c3fdafefda443997d2d14e3c&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">计量软件</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062538&amp;idx=1&amp;sn=95207383c54fc894387cbe3e3ebe23c9&amp;chksm=b323a56484542c725034c37a7554e60fcbeabfa5a2d9624cb2642e85e13ca4fc8959fdbeab0d&amp;scene=21&amp;token=15317526&amp;lang=zh_CN#wechat_redirect" target="_blank" data-linktype="2" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">商科研究</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448064997&amp;idx=1&amp;sn=023597da1e8f7251eda227fa7db086a5&amp;chksm=b3235ccb8454d5ddc11b2d8acc7e7356119153be4b746b66ed92248179ca7404ecfd6c9bb06c&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">机器学习</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448062524&amp;idx=2&amp;sn=528091780d78c3e1a1a2c27151acaa8e&amp;chksm=b323a51284542c0459af59af8adb02dc0ce63da40ea359c088815eecb8065666c4c504f1e7d0&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">SSCI</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448064927&amp;idx=1&amp;sn=b49de8b7f1176e911f70f928a9aa3da4&amp;chksm=b3235cb18454d5a789e54dcdb3f8cffe23870db008dcedf9f58f452d259b8cf273fa20bc2cb1&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">CSSCI</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><a href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448065664&amp;idx=1&amp;sn=7eb9a12382669bdb5eb25f8bf183a609&amp;chksm=b32359ae8454d0b8b07eecccba5ecfe3b8f29ac38c42d612ebc9ac100a5faf8abebe57326f7c&amp;scene=21#wechat_redirect" target="_blank" data-itemshowtype="0" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">SSCI查询</span></strong></span></a><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;">&nbsp;|&nbsp;</span></strong></span><span style="outline: 0px;max-width: 100%;color: rgb(0, 122, 170);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;letter-spacing: 0.544px;font-size: 17px;widows: 1;box-sizing: border-box !important;overflow-wrap: break-word !important;"><strong style="outline: 0px;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;font-size: 14px;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;"><a target="_blank" href="http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448069775&amp;idx=1&amp;sn=fdec8da35cb54f3515ab1988e7030ebf&amp;chksm=b32349a18454c0b7e9c454ff7bbd02930605f08d3a70d21bd763b95cae7073bac0211c230345&amp;scene=21#wechat_redirect" textvalue="名家经验" data-itemshowtype="0" tab="innerlink" data-linktype="2" hasload="1" wah-hotarea="click" style="outline: 0px;color: var(--weui-LINK);-webkit-tap-highlight-color: rgba(0, 0, 0, 0);cursor: pointer;max-width: 100%;box-sizing: border-box !important;overflow-wrap: break-word !important;">名家经验</a></span></strong></span></section><section style="margin-top: -2px;margin-bottom: 5px;outline: 0px;max-width: 100%;box-sizing: border-box;min-height: 1em;width: 670px;font-size: 0px;line-height: normal;overflow-wrap: break-word !important;"><span style="outline: 0px;max-width: 100%;letter-spacing: 0.5px;widows: 1;font-size: 17px;box-sizing: border-box !important;overflow-wrap: break-word !important;">计量经济圈组织了一个计量社群，有如下特征：</span><span style="outline: 0px;max-width: 100%;widows: 1;font-size: 17px;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;">热情互助最多</span><span style="outline: 0px;max-width: 100%;letter-spacing: 0.5px;widows: 1;font-size: 17px;box-sizing: border-box !important;overflow-wrap: break-word !important;">、</span><span style="outline: 0px;max-width: 100%;widows: 1;font-size: 17px;letter-spacing: 0.544px;box-sizing: border-box !important;overflow-wrap: break-word !important;">前沿趋势最多</span><span style="outline: 0px;max-width: 100%;letter-spacing: 0.5px;widows: 1;font-size: 17px;box-sizing: border-box !important;overflow-wrap: break-word !important;">、社科资料最多、社科数据最多、科研牛人最多、海外名校最多。因此，建议积极进取和有强烈研习激情的中青年学者到社群交流探讨，始终坚信优秀是通过感染优秀而互相成就彼此的。</span></section></section></section></section></section><p style="margin-bottom: 25px;outline: 0px;max-width: 100%;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;background-color: rgb(255, 255, 255);widows: 1;text-align: center;box-sizing: border-box !important;overflow-wrap: break-word !important;"><img class="rich_pages wxw-img" data-copyright="0" data-fileid="300607298" data-ratio="1.1290322580645162" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTenUaN2kM3PHKmG8ujWDsdpSL91icKh5rsJpwBgxCEGJLM2M2klgVkKvoV8N4GYhlSepxPQcDHO5jA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1" data-type="jpeg" data-w="310" style="outline: 0px;border-width: 1px;border-style: solid;border-color: rgb(238, 237, 235);background-color: rgb(238, 237, 235);background-size: 22px;background-position: center center;background-repeat: no-repeat;box-sizing: border-box !important;overflow-wrap: break-word !important;visibility: visible !important;width: 215px !important;" width="215px"  /></p><p style="margin-bottom: 0px;outline: 0px;max-width: 100%;box-sizing: border-box;color: rgb(34, 34, 34);letter-spacing: 0.544px;white-space: normal;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;font-size: 16px;background-color: rgb(255, 255, 255);widows: 1;overflow-wrap: break-word !important;"><img class="rich_pages wxw-img" data-fileid="300607299" data-ratio="0.5659397715472482" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTcQhnM9sWjd7Mplclp4knUKcxoDQ84Y4lOlmSXrUYE94E5aufKuHuncTUPwfqyyiaM6W8ng7tUvU8Q/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1" data-type="jpeg" data-w="963" style="outline: 0px;max-width: 670px;box-sizing: border-box;overflow-wrap: break-word;background-color: rgb(238, 237, 235);border-width: 1px;border-style: solid;border-color: rgb(238, 237, 235);background-size: 22px;background-position: center center;background-repeat: no-repeat;visibility: visible !important;width: 640px !important;" width="auto"  /></p><p style="display: none;"><mp-style-type data-value="3"></mp-style-type></p></div>

          <script type="text/javascript" nonce="1415253946" reportloaderror>
            var first_sceen__time = (+new Date());
            if ("" == 1 && document.getElementById('js_content')) {
              document.getElementById('js_content').addEventListener("selectstart",function(e){ e.preventDefault(); });
            }
          </script>
        </div>
                        <div id="js_tags_preview_toast" class="article-tag__error-tips" style="display: none;">预览时标签不可点</div>
                
        <div id="content_bottom_area" class="rich_media_tool_area"></div>

                
              </div>
    </div>

    <div class="rich_media_area_primary sougou" id="sg_tj" style="display:none"></div>

    
    <div class="rich_media_area_extra">
      <div class="rich_media_area_extra_inner">
        
        <div id="page_bottom_area"></div>
      </div>
    </div>

    
    <div id="js_pc_qr_code" class="qr_code_pc_outer" style="display:none;">
      <div class="qr_code_pc_inner">
        <div class="qr_code_pc">
          <img id="js_pc_qr_code_img" class="qr_code_pc_img">
          <p>微信扫一扫<br>关注该公众号</p>
        </div>
      </div>
    </div>
  </div>
  
  

<div class="wx_stream_article_slide_tip" id="wx_stream_article_slide_tip">
  <div class="wx_stream_article_slide_tip_wrp">
    <span class="wx_stream_article_slide_tip_arrow"></span>
  <span class="wx_stream_article_slide_tip_text">继续滑动看下一个</span>
  </div>
</div>

</div>


<div class="wx_network_msg_wrp" id="js_network_msg_wrp"></div>


  <div class="wx_expand_article" id="wx_expand_article">
  
      <div class="stream_mock_header" id="stream_mock_header">
      <h1 class="rich_media_title">固定效应: 目前看到解释的最清楚的帖子, 救命！</h1>
      <div id="meta_content" class="rich_media_meta_list">
                                                      <span class="rich_media_meta rich_media_meta_text">
                                  胜风
                              </span>
                                      <span class="rich_media_meta rich_media_meta_nickname" id="profileBt">
          <a href="javascript:void(0);" class="wx_tap_link js_wx_tap_highlight weui-wa-hotarea" id="js_name">
            计量经济圈          </a>
        </span>
      </div>
    </div>
    <div class="wx_expand_article_gradient_background" id="wx_expand_background"></div>
  <div class="wx_expand_article_bottom_area" id="wx_expand_bottom">
    
    <div class="wx_expand_article_button_wrap" id="wx_expand_article_placeholder">
              <button class="wx_expand_article_button" id="wx_expand_article_button">轻触阅读原文</button>
          </div>
    <div id="js_stream_bottom_bar" class="stream_bottom_bar_wrp">
      <div id="js_stream_bottom_bar_placeholder" class="bottom_bar_placeholder">
        <div class="wx_follow_context wx_follow_primary wx_follow_smart wx_follow_top wx_follow_bottom">
          <div class="function_mod js_function_mod wx_tap_cell">
            <div class="function_mod_inner js_function_mod_inner">
              <div class="function_bd">
                <div class="wx_follow_media weui-flex weui-flex_align-center">
                  <div class="wx_follow_hd">
                    <span class="wx_follow_avatar">
                                          <img
                        src="http://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTdaZMQCIXNKSjibrvUhaLZFs370KIqsWqa5q3aClicxW4yHTj3acApEac9nZqiaUEGL7e2MS1BSXKibPg/0?wx_fmt=png"
                        alt="" class="wx_follow_avatar_pic"
                      />
                                        </span>
                  </div>
                  <div class="wx_follow_bd weui-flex__item">
                    <div class="wx_follow_info">
                      <div role="link" tabindex="0" aria-labelledby="js_wx_follow_nickname"
                        aria-describedby="js_wx_follow_tips" class="wx_follow_nickname js_wx_tap_highlight wx_tap_link">
                        计量经济圈                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    
        <div class="interaction_bar__wrap" style="opacity: 1;">
          <div class="interaction_bar" style="-webkit-text-size-adjust: 100%;">
                                                          </div>
        </div>
      </div>
      <div id="stream_article_bottom_area"></div>
    </div>
  </div>
  <div id="wx_expand_slidetip" class="wx_expand_article_slide_tip">
    <div class="wx_stream_article_slide_tip">
      <div class="wx_stream_article_slide_tip_wrp">
        <span class="wx_stream_article_slide_tip_arrow"></span>
        <span class="wx_stream_article_slide_tip_text">向上滑动看下一个</span>
      </div>
    </div>
  </div>
</div>



<div class="wx_network_msg_wrp" id="js_network_msg_wrp"></div>


<script type="text/html" id="js_network_msg_load" nonce="1415253946" reportloaderror>
  <div class="weui-loadmore weui-loadmore_default wx_network_msg">
    <span class="weui-primary-loading">
      <i class="weui-primary-loading__dot"></i>
    </span>
  </div>
</script>


<script type="text/html" id="js_network_msg_load_err" nonce="1415253946" reportloaderror>
  <div class="wx_network_msg">因网络连接问题，剩余内容暂无法加载。</div>
</script>


<div id="js_ad_control"></div>


<div class="comment_primary_emotion_panel_wrp" id="js_emotion_panel_pc" style="display: none">
  <div class="comment_primary_emotion_panel">
    <ul class="comment_primary_emotion_list_pc" id="js_emotion_list_pc">
    </ul>
  </div>
</div>


<div class="weui-dialog__wrp" id="js_alert_panel" style="display:none;">
  <div class="weui-mask"></div>
  <div class="weui-dialog">
    <div class="weui-dialog__bd" id="js_alert_content"></div>
    <div class="weui-dialog__ft">
      <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default" id="js_alert_confirm">知道了</a>
    </div>
  </div>
</div>


<script type="text/javascript" nonce="1415253946" reportloaderror>
  window.img_popup = 1;
</script>
<style>.weui-dialog_link{-webkit-transform:translateY(-75%);transform:translateY(-75%)}</style>


<div id="js_pc_weapp_code" class="weui-desktop-popover weui-desktop-popover_pos-up-center weui-desktop-popover_img-text weapp_code_popover" style="display: none;">
  <div class="weui-desktop-popover__inner">
      <div class="weui-desktop-popover__desc">
          <img id="js_pc_weapp_code_img">
          微信扫一扫<br>使用小程序<span id="js_pc_weapp_code_des"></span>
      </div>
  </div>
</div>
<div id="js_minipro_dialog" role="dialog" aria-modal="true" tabindex="0" aria-labelledby="js_minipro_dialog_head" style="display:none;">
  <div class="weui-mask"></div>
  <div class="weui-dialog weui-dialog_link">
      <div class="weui-dialog__hd">
          <strong class="weui-dialog__title" id="js_minipro_dialog_head" tabindex="0"></strong>
      </div>
      <div class="weui-dialog__bd" id="js_minipro_dialog_body"></div>
      
      <div class="weui-dialog__ft">
          <a role="button" id="js_minipro_dialog_cancel" href="javascript:void(0);" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
          <a role="button" id="js_minipro_dialog_ok" href="javascript:void(0);" class="weui-dialog__btn weui-dialog__btn_primary">允许</a>
      </div>
  </div>
</div>
<div id="js_link_dialog" role="dialog" aria-modal="true" tabindex="0" aria-labelledby="js_link_dialog_body" style="display:none;">
  <div class="weui-mask"></div>
  <div class="weui-dialog weui-dialog_link">
    <div class="weui-dialog__hd">
      <strong class="weui-dialog__title" id="js_link_dialog_head" tabindex="0"></strong>
    </div>
    <div class="weui-dialog__bd" id="js_link_dialog_body" tabindex="0"></div>
    
    <div class="weui-dialog__ft">
      <a role="button" id="js_link_dialog_cancel" href="javascript:void(0);" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
      <a role="button" id="js_link_dialog_ok" href="javascript:void(0);" class="weui-dialog__btn weui-dialog__btn_primary">允许</a>
    </div>
  </div>
</div>



    <script type="text/javascript" nonce="1415253946" reportloaderror>
window.logs.pagetime.page_begin = Date.now();

try {
  var adIframeUrl = localStorage.getItem('__WXLS_ad_iframe_url');
  if (window === top) {
    if (adIframeUrl) {
      if (navigator.userAgent.indexOf('iPhone') > -1) {
        var img = new Image();
        img.src = adIframeUrl;
      } else {
        var link = document.createElement('link');
        link.rel = 'prefetch';
        link.href = adIframeUrl;
        document.getElementsByTagName('head')[0].appendChild(link);
      }
    }
  }
} catch (err) {

}
</script>
    

<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_colon">：</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_comma">，</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_period">。</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_space">&nbsp;</span>


<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_type_video">视频</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_type_weapp">小程序</span>


<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_zan_btn_txt">赞</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_zan_btn_tips">，轻点两下取消赞</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_like_btn_txt">在看</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_like_btn_tips">，轻点两下取消在看</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_share_btn_txt">分享</span>
<span aria-hidden="true" class="weui-a11y_ref" style="display:none" id="js_a11y_comment_btn_txt">留言</span>

    <script type="text/javascript" nonce="1415253946" reportloaderror>
(function () {
  var totalCount = 0,
    finishCount = 0;

  function _addVConsole(uri, cb) {
    totalCount++;
    var node = document.createElement('SCRIPT');
    node.type = 'text/javascript';
    node.src = uri;
    node.setAttribute('nonce', '1415253946');
    if (cb) {
      node.onload = cb;
    }
    document.getElementsByTagName('head')[0].appendChild(node);
  }
  if (
    (document.cookie && document.cookie.indexOf('vconsole_open=1') > -1)
    || location.href.indexOf('vconsole=1') > -1
  ) {
    _addVConsole('https://mp.weixin.qq.com/mmbizappmsg/zh_CN/htmledition/js/scripts/vconsole-3.14.6.js', function () {
      var vConsole = new window.VConsole();
    });
  }

})();
</script>
    
    <script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function () {
  'use strict';

  

  

  var __setTitle = function __setTitle(showTitle, dom) {
    var title = showTitle;
    if (showTitle.indexOf('——') > -1) {
      var replaceHtml = '<span style="letter-spacing:normal">——</span>';
      showTitle = showTitle.replace(/——/g, replaceHtml);
    }
    if (dom) {
      dom.innerHTML = dom.innerHTML.replace(title, showTitle);
    }
  };
  if (!window.__second_open__) {
    var title = '固定效应: 目前看到解释的最清楚的帖子, 救命！';
    __setTitle(title, document.getElementById('activity-name'));
    window.__setTitle = __setTitle;
  }

  return __setTitle;

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function () {
  'use strict';

  

  

  var __setPubTime = function __setPubTime(svrTime, oriCreateTime, createTime, dom) {
    var oriTimestamp = oriCreateTime * 1;
    var dateObj = new Date(oriTimestamp * 1000);
    var padStart = function padStart(v) {
      return "0".concat(v).slice(-2);
    };
    var year = dateObj.getFullYear();
    var month = padStart(dateObj.getMonth() + 1);
    var date = padStart(dateObj.getDate());
    var hour = padStart(dateObj.getHours());
    var minute = padStart(dateObj.getMinutes());
    var showDate = year + '-' + month + '-' + date + ' ' + hour + ':' + minute;

    if (dom) {
      dom.innerText = showDate;
    }
  };
  if (!window.__second_open__) {
    var svrDate = '1705737536';
    var oriCreateTime = '1678118421';
    var createTime = '2023-03-07 00:00';
    __setPubTime(svrDate, oriCreateTime, createTime, document.getElementById('publish_time'));
    window.__setPubTime = __setPubTime;
  }

  return __setPubTime;

})();</script>

<script type="text/javascript" nonce="1415253946" reportloaderror>
if (!window.console) window.console = { log: function() {} };
if (typeof getComputedStyle == 'undefined') {
  if (document.body.currentStyle) {
    window.getComputedStyle = function(el) {
      return el.currentStyle;
    }
  } else {
    window.getComputedStyle = {};
  }
}
(function(){
  window.__zoom = 1;

  var ua = navigator.userAgent.toLowerCase();
  var re = new RegExp("msie ([0-9]+[\.0-9]*)");
  var version;
  if (re.exec(ua) != null) {
    version = parseInt(RegExp.$1);
  }
  var isIE = false;
  if (typeof version != 'undefined' && version >= 6 && version <= 9) {
    isIE = true;
  }
  var isAccessibilityKey = 'isMpUserAccessibility';
  var isAccessMode = window.localStorage.getItem(isAccessibilityKey);
  var isCarton = isIE || '0' === '1' || '' === '1' || isAccessMode === '1';
  var bodyWidth = '' * 1;
  if (bodyWidth) {
    var styles = getComputedStyle(document.getElementById('page-content'));
    bodyWidth - parseFloat(styles.paddingLeft) - parseFloat(styles.paddingRight);
  }
  var getMaxWith = function () {
    var container = document.getElementById('img-content');
    var max_width = container.offsetWidth;
    !max_width && bodyWidth && (max_width = bodyWidth);
    var container_padding = 0;
    var container_style = getComputedStyle(container);
    container_padding = parseFloat(container_style.paddingLeft) + parseFloat(container_style.paddingRight);
    max_width -= container_padding;
    if (!max_width) {
      max_width = window.innerWidth - 30;     
    }
    return max_width;
  };
  var getParentWidth = function (dom) {
    var parent_width = 0;
    var parent = dom.parentNode;
    var outerWidth = 0;
    while (true) {
      if (!parent || parent.nodeType != 1) break;
      var parent_style = getComputedStyle(parent);
      if (!parent_style) break;
      parent_width = parent.clientWidth - parseFloat(parent_style.paddingLeft) - parseFloat(parent_style.paddingRight) - outerWidth;
      if (parent_width > 16) break;
      outerWidth += parseFloat(parent_style.paddingLeft) + parseFloat(parent_style.paddingRight) + parseFloat(parent_style.marginLeft) + parseFloat(parent_style.marginRight) + parseFloat(parent_style.borderLeftWidth) + parseFloat(parent_style.borderRightWidth);
      parent = parent.parentNode;
    }
    return parent_width;
  }
  var getOuterW = function (dom) {
    var style = getComputedStyle(dom),
      w = 0;
    if (!!style) {
      w = parseFloat(style.paddingLeft) + parseFloat(style.paddingRight) + parseFloat(style.borderLeftWidth) + parseFloat(style.borderRightWidth);
    }
    return w;
  };
  var getOuterH = function (dom) {
    var style = getComputedStyle(dom),
      h = 0;
    if (!!style) {
      h = parseFloat(style.paddingTop) + parseFloat(style.paddingBottom) + parseFloat(style.borderTopWidth) + parseFloat(style.borderBottomWidth);
    }
    return h;
  };
  var insertAfter = function (dom, afterDom) {
    var _p = afterDom.parentNode;
    if (!_p) {
      return;
    }
    if (_p.lastChild === afterDom) {
      _p.appendChild(dom);
    } else {
      _p.insertBefore(dom, afterDom.nextSibling);
    }
  };
  var getQuery = function (name, url) {
   
    var u = arguments[1] || window.location.search,
      reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"),
      r = u.substr(u.indexOf("\?") + 1).match(reg);
    return r != null ? r[2] : "";
  };

  
  function setImgSize(item, widthNum, widthUnit, ratio, breakParentWidth) {
    setTimeout(function () {
      var img_padding_border = getOuterW(item) || 0;
      var img_padding_border_top_bottom = getOuterH(item) || 0;

     
      if (widthNum > getParentWidth(item) && !breakParentWidth) {
        widthNum = getParentWidth(item);
      }

      var height = (widthNum - img_padding_border) * ratio + img_padding_border_top_bottom;

      if (isCarton) {
        var url = item.getAttribute('data-src');
        item.src = url;

       
        item.style.height = 'auto';
      } else {
       
       
       
       
        widthNum !== 'auto' && (item.style.cssText += ";width: " + widthNum + widthUnit + " !important;");
        widthNum !== 'auto' && (item.style.cssText += ";height: " + height + widthUnit + " !important;");
      }
    }, 10);
  }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 

 
 
 
 
 
 
 
 
 

 
 
 
 
 
 

 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 

 
 
 
 
 
 

 

 
 
 
 
 
 
 
 
 
 
 
 
  window.__videoDefaultRatio = 16 / 9;//默认值是16/9
  window.__getVideoWh = function (dom) {
    var max_width = getMaxWith(),
      width = max_width,
      ratio_ = dom.getAttribute('data-ratio') * 1,//mark16/9
      arr = [4 / 3, 16 / 9],
      ret = arr[0],
      abs = Math.abs(ret - ratio_);
    if (!ratio_) {
      if (dom.getAttribute("data-mpvid")) {
        ratio_ = 16 / 9;
      } else {
        ratio_ = 4 / 3;
      }
    } else {
      for (var j = 1, jl = arr.length; j < jl; j++) {
        var _abs = Math.abs(arr[j] - ratio_);
        if (_abs < abs) {
          abs = _abs;
          ret = arr[j];
        }
      }
      ratio_ = ret;
    }

    var parent_width = getParentWidth(dom) || max_width,
      width = width > parent_width ? parent_width : width,
      outerW = getOuterW(dom) || 0,
      outerH = getOuterH(dom) || 0,
      videoW = width - outerW,
      videoH = videoW / ratio_,
      speedDotH = 12,
      height = videoH + outerH + speedDotH;

    return { w: Math.ceil(width), h: Math.ceil(height), vh: videoH, vw: videoW, ratio: ratio_, sdh: speedDotH };
  };

 
  (function () {
    var iframe = document.getElementsByTagName('iframe');
    for (var i = 0, il = iframe.length; i < il; i++) {
      if (window.__second_open__ && iframe[i].getAttribute('__sec_open_place_holder__')) {
        continue;
      }
      var a = iframe[i];
      var src_ = a.getAttribute('src') || a.getAttribute('data-src') || "";

      
      var vid = getQuery("vid", src_) || a.getAttribute('data-mpvid');
      if (!vid) {
        continue;
      }
      vid = vid.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, "");//清除前后空格
      a.removeAttribute('src');
      a.style.display = "none";
      var obj = window.__getVideoWh(a),
        videoPlaceHolderSpan = document.createElement('span');

      videoPlaceHolderSpan.className = "js_img_placeholder wx_widget_placeholder";
      videoPlaceHolderSpan.setAttribute("data-vid", vid);
      videoPlaceHolderSpan.innerHTML = '<span class="weui-primary-loading"><span class="weui-primary-loading__dot"></span></span>';
      videoPlaceHolderSpan.style.cssText = "width: " + obj.w + "px !important;";

      insertAfter(videoPlaceHolderSpan, a);

      

     
      function ajax(obj) {
        var url = obj.url;
        var xhr = new XMLHttpRequest();

        var data = null;
        if (typeof obj.data == "object") {
          var d = obj.data;
          data = [];
          for (var k in d) {
            if (d.hasOwnProperty(k)) {
              data.push(k + "=" + encodeURIComponent(d[k]));
            }
          }
          data = data.join("&");
        } else {
          data = typeof obj.data == 'string' ? obj.data : null;
        }

        xhr.open('POST', url, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            if (xhr.status >= 200 && xhr.status < 400) {
              obj.success && obj.success(xhr.responseText);
            } else {
              obj.error && obj.error(xhr);
            }
            obj.complete && obj.complete();
            obj.complete = null;
          }
        };
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        xhr.send(data);
      }

      var mid = "2448105671" || "" || "";
      var biz = "MjM5OTMwODM1Mw==" || "";
      var sessionid = "" || "svr_5704f750d60";
      var idx = "1" || "";

      (function sendReq(parentNode, copyIframe, index, vid) {
        ajax({
          url: '/mp/videoplayer?vid=' + vid + '&mid=' + mid + '&idx=' + idx + '&__biz=' + biz + '&sessionid=' + sessionid + '&f=json',
          type: "GET",
          dataType: 'json',
          success: function (json) {
            var ret = JSON.parse(json || '{}');
            var ori = ret.ori_status;
            var hit_biz_headimg = ret.hit_biz_headimg + '/64';
            var hit_nickname = ret.hit_nickname;
            var hit_username = ret.hit_username;
            var sourceBiz = ret.source_encode_biz;

            var selfUserName = "gh_865387a4190a";

            if (ori === 2 && selfUserName !== hit_username) {
              var videoBar = document.createElement('div');
              var videoBarHtml = '<div class="wx-edui-video_source_link js_wx_tap_highlight wx_tap_card" id="' + (hit_username + index) + '" data-hit-username="' + hit_username + '" data-hit-biz="' + sourceBiz + '">';
              videoBarHtml += '<div class="wx-edui-video_source_word">以下视频来源于</div>';
              videoBarHtml += '<div class="wx-edui-video_account_info">';
              videoBarHtml += '<div class="wx-edui-video_account_avatar" id="' + (hit_biz_headimg + index) + '" data-src="' + hit_biz_headimg + '"></div>';
              videoBarHtml += '<div class="wx-edui-video_account_name">' + hit_nickname + '</div>';
              videoBarHtml += '<i class="wx-edui-video_account_arrow"></i>';
              videoBarHtml += '</div>';
              videoBarHtml += '<div class="wx-edui-video_source_link__layer_mask"></div>';
              videoBarHtml += '</div>';
              videoBar.innerHTML = videoBarHtml;
              var spanContainer = document.getElementById('js_mp_video_container_' + index);
              if (spanContainer) {
                spanContainer.parentNode.insertBefore(videoBar, spanContainer);
              } else if (parentNode.contains && parentNode.contains(copyIframe)) {
                parentNode.insertBefore(videoBar, copyIframe);
              } else {
                parentNode.insertBefore(videoBar, parentNode.firstElementChild);
              }
              var avatorEle = document.getElementById(hit_biz_headimg + index);
              var avatorSrc = avatorEle.dataset.src;
              console.log('avatorSrc' + avatorSrc);
              if (ret.hit_biz_headimg) {
                avatorEle.style.backgroundImage = 'url(' + avatorSrc + ')';
              }
            }
          },
          error: function (xhr) {
          }
        });
      })(a.parentNode, a, i, vid);

      a.style.cssText += ";width: " + obj.w + "px !important;";
      a.setAttribute("width", obj.w);
      if (window.__zoom != 1) {
        a.style.display = "block";
        videoPlaceHolderSpan.style.display = "none";
        a.setAttribute("_ratio", obj.ratio);
        a.setAttribute("_vid", vid);
      } else {
        videoPlaceHolderSpan.style.cssText += "height: " + (obj.h - obj.sdh) + "px !important;margin-bottom: " + obj.sdh + "px !important;";
        a.style.cssText += "height: " + obj.h + "px !important;";
        a.setAttribute("height", obj.h);
      }
      a.setAttribute("data-vh", obj.vh);
      a.setAttribute("data-vw", obj.vw);
      if (a.getAttribute("data-mpvid")) {
        a.setAttribute("data-src", location.protocol + "//mp.weixin.qq.com/mp/readtemplate?t=pages/video_player_tmpl&auto=0&vid=" + vid);
      } else {
        a.setAttribute("data-src", location.protocol + "//v.qq.com/iframe/player.html?vid=" + vid + "&width=" + obj.vw + "&height=" + obj.vh + "&auto=0");
      }
    }
  })();

  (function () {
    if (window.__zoom != 1) {
      if (!window.__second_open__) {
        document.getElementById('page-content').style.zoom = window.__zoom;
        var a = document.getElementById('activity-name');
        var b = document.getElementById('meta_content');
        if (!!a) {
          a.style.zoom = 1 / window.__zoom;
        }
        if (!!b) {
          b.style.zoom = 1 / window.__zoom;
        }
      }
      var images = document.getElementsByTagName('img');
      for (var i = 0, il = images.length; i < il; i++) {
        if (window.__second_open__ && images[i].getAttribute('__sec_open_place_holder__')) {
          continue;
        }
        images[i].style.zoom = 1 / window.__zoom;
      }
      var iframe = document.getElementsByTagName('iframe');
      for (var i = 0, il = iframe.length; i < il; i++) {
        if (window.__second_open__ && iframe[i].getAttribute('__sec_open_place_holder__')) {
          continue;
        }
        var a = iframe[i];
        a.style.zoom = 1 / window.__zoom;
        var src_ = a.getAttribute('data-src') || "";
        if (!/^http(s)*\:\/\/v\.qq\.com\/iframe\/(preview|player)\.html\?/.test(src_)
          && !/^http(s)*\:\/\/mp\.weixin\.qq\.com\/mp\/readtemplate\?t=pages\/video_player_tmpl/.test(src_)
        ) {
          continue;
        }
        var ratio = a.getAttribute("_ratio");
        var vid = a.getAttribute("_vid");
        a.removeAttribute("_ratio");
        a.removeAttribute("_vid");
        var vw = a.offsetWidth - (getOuterW(a) || 0);
        var vh = vw / ratio;
        var h = vh + (getOuterH(a) || 0)
        a.style.cssText += "height: " + h + "px !important;"
        a.setAttribute("height", h);
        if (/^http(s)*\:\/\/v\.qq\.com\/iframe\/(preview|player)\.html\?/.test(src_)) {
          a.setAttribute("data-src", location.protocol + "//v.qq.com/iframe/player.html?vid=" + vid + "&width=" + vw + "&height=" + vh + "&auto=0");
        }
        a.style.display = "none";
        var parent = a.parentNode;
        if (!parent) {
          continue;
        }
        for (var j = 0, jl = parent.children.length; j < jl; j++) {
          var child = parent.children[j];
          if (child.className.indexOf("js_img_placeholder") >= 0 && child.getAttribute("data-vid") == vid) {
            child.style.cssText += "height: " + h + "px !important;";
            child.style.display = "";
          }
        }
      }
    }
  })();
})();
</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>(function () {
  'use strict';

  function _typeof(obj) {
    "@babel/helpers - typeof";

    return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
      return typeof obj;
    } : function (obj) {
      return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
    }, _typeof(obj);
  }
  window.__page_cls_ctrl__canRenderSilently = '__page_cls_ctrl__canRenderSilently' in window ? window.__page_cls_ctrl__canRenderSilently : true;
  window.__page_cls_ctrl__forceRenderSilentlyList = '__page_cls_ctrl__forceRenderSilentlyList' in window ? window.__page_cls_ctrl__forceRenderSilentlyList : [];
  window.__page_cls_ctrl__compRenderInfo = '__page_cls_ctrl__compRenderInfo' in window ? window.__page_cls_ctrl__compRenderInfo : {};

  
  var g = {
    defaultContentTpl: '<span class="js_img_placeholder wx_widget_placeholder" style="width:#width# !important;height:#height#px !important;text-indent: 0"><span class="weui-primary-loading"><span class="weui-primary-loading__dot"></span></span>',
    config: [{
      querySelector: 'redpacketcover',
      
      genId: function genId() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return decodeURIComponent(opt.node.getAttribute('data-coveruri') || '');
      },
      
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 0.7854;
      },
      
      calH: function calH() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return this.calW({
          parentWidth: opt.parentWidth
        }) / 0.73346 + 27 + 37;
      },

      replaceContentCssText: '',
      outerContainerLeft: '',
      outerContainerRight: ''
    },
    {
      querySelector: 'mppoi',
      genId: function genId() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.node.getAttribute('data-id') || '';
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 1;
      },
      calH: function calH() {
        return 219;
      },
      replaceContentCssText: '',
      appendContentCssText: 'diplay:block;',
      outerContainerLeft: '',
      outerContainerRight: ''
    },
    {
      querySelector: 'mpsearch',
      genId: function genId() {
        return decodeURIComponent('mp-common-search');
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 1;
      },
      calH: function calH() {
        return 100;
      },
      replaceContentCssText: '',
      appendContentCssText: 'diplay:block;',
      outerContainerLeft: '',
      outerContainerRight: ''
    },
    {
      querySelector: 'mpvideosnap',
      genId: function genId() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        var type = opt.node.getAttribute('data-type') || 'video';
        if (type === 'live') {
          return decodeURIComponent(opt.node.getAttribute('data-noticeid') || '');
        }
        return decodeURIComponent(opt.node.getAttribute('data-id') || '');
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        var type = opt.node.getAttribute('data-type') || 'video';
        var width = opt.node.getAttribute('data-width') || '';
        var height = opt.node.getAttribute('data-height') || '';
        if (type === 'live' || type === 'topic') {
          return opt.parentWidth;
        }
        var ratio = 1;
        ratio = width / height;
        var computedHeight = 0;
        var computedWidth = 0;
        var isHorizontal = false;
        if (ratio === 1 || ratio === 3 / 4) ; else if (ratio === 4 / 3 || ratio === 16 / 9) {
          isHorizontal = true;
        } else if (ratio < 3 / 4) {
          ratio = 3 / 4;
        } else if (ratio > 1 && ratio < 4 / 3) {
          ratio = 1;
        } else if (ratio > 4 / 3) {
          isHorizontal = true;
        } else if (typeof ratio === 'number' && !Object.is(ratio, NaN)) ; else {
          ratio = 1;
        }
        opt.node.setAttribute('data-ratio', ratio);
        opt.node.setAttribute('data-isHorizontal', isHorizontal);
        if (isHorizontal === true) {
          computedWidth = opt.parentWidth;
        } else {
          if (window.innerWidth < 1024) {
            computedWidth = window.innerWidth * 0.65;
          } else {
            computedWidth = opt.parentWidth * 0.65;
          }
        }
        computedHeight = computedWidth / ratio;
        computedHeight = Math.round(computedHeight);
        computedWidth = Math.round(computedWidth);
        opt.node.setAttribute('data-computedWidth', computedWidth);
        opt.node.setAttribute('data-computedHeight', computedHeight);
        return computedWidth;
      },
      calH: function calH() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        var desc = opt.node.getAttribute('data-desc') || '';
        var type = opt.node.getAttribute('data-type') || 'video';
        var computedHeight = opt.node.getAttribute('data-computedHeight') || '';
        switch (type) {
          case 'live':
            return desc ? 152 : 116;
          case 'topic':
            return 201;
          case 'image':
          case 'video':
            return parseFloat(computedHeight);
        }
      },
      getBorderRadius: function getBorderRadius() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        var type = opt.node.getAttribute('data-type') || 'video';
        if (type === 'video') {
          return 4;
        }
        return 8;
      },
      replaceContentCssText: '',
      appendContentCssText: 'display:flex;margin:0px auto;',
      outerContainerLeft: '',
      outerContainerRight: ''
    }, {
      querySelector: 'mp-wxaproduct',
      genId: function genId() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return decodeURIComponent(opt.node.getAttribute('data-wxaproduct-productid') || '');
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 1 || '100%';
      },
      calH: function calH() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        var cardtype = opt.node.getAttribute('data-wxaproduct-cardtype') || '';
        return cardtype === 'mini' ? 124 : 466;
      },
      replaceContentCssText: '',
      outerContainerLeft: '',
      outerContainerRight: ''
    }, {
      querySelector: 'mpprofile',
      genId: function genId(opt) {
        return opt.node.getAttribute('data-id') || '';
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 1;
      },
      calH: function calH() {
        return 143;
      },
      replaceContentCssText: '',
      appendContentCssText: 'diplay:block;',
      outerContainerLeft: '',
      outerContainerRight: ''
    },
    {
      querySelector: 'mp-common-sticker',
      genId: function genId(opt) {
        return opt.node.getAttribute('data-md5') || '';
      },
      calW: function calW() {
        return 120;
      },
      calH: function calH() {
        return 120;
      },
      replaceContentCssText: '',
      appendContentCssText: 'diplay:block;',
      outerContainerLeft: '<div style="display: flex; justify-content: center;">',
      outerContainerRight: '</div>'
    }, {
      querySelector: 'mp-common-product',
      genId: function genId(opt) {
        return opt.node.getAttribute('data-windowproduct') || '';
      },
      calW: function calW() {
        var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
        return opt.parentWidth * 1 || '100%';
      },
      calH: function calH(opt) {
        var customstyle = opt.node.getAttribute('data-customstyle') || '{}';
        if (customstyle) {
          try {
            var _JSON$parse = JSON.parse(customstyle),
              display = _JSON$parse.display,
              height = _JSON$parse.height;
            if (display !== 'none') {
              var customHeight = height.split('px')[0];
              var ratio = opt.parentWidth / 350.0 || 1;
              customHeight = Math.round(customHeight * ratio);
              return customHeight;
            }
            return 0;
          } catch (err) {
            console.error(err);
          }
        }
        return 0;
      },
      replaceContentCssText: '',
      appendContentCssText: 'diplay:block;',
      outerContainerLeft: '<div style="display: flex; margin: 0 auto 24px;">',
      outerContainerRight: '</div>'
    }
    ]
  };

  function preloadingInit() {
    var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
    if (typeof document.querySelectorAll !== 'function') {
      return;
    }
    var g = {
      maxWith: document.getElementById('img-content').getBoundingClientRect().width,
      idAttr: 'data-preloadingid'
    };
    for (var i = 0, il = opt.config.length; i < il; i++) {
      var a = opt.config[i];
      var list = document.querySelectorAll(a.querySelector);
      for (var j = 0, jl = list.length; j < jl; j++) {
        var node = list[j];
        var parentWidth = node.parentNode.getBoundingClientRect().width;
        parentWidth = Math.min(parentWidth, g.maxWith);

        if (node.getAttribute('has-insert-preloading')) {
          continue;
        }
        var nodeW = a.calW({
          parentWidth: parentWidth,
          node: node
        });
        var nodeH = a.calH({
          parentWidth: parentWidth,
          node: node
        });
        var nodeId = a.genId({
          index: j,
          node: node
        });
        var nodeBorderRadius = typeof a.getBorderRadius === 'function' ? a.getBorderRadius({
          index: j,
          node: node
        }) : 8;

        if (typeof nodeW === 'number') {
          nodeW += 'px';
        }
        var imgHtml = opt.defaultContentTpl.replace(/#height#/g, nodeH).replace(/#width#/g, nodeW).replace(/#borderRadius#/g, nodeBorderRadius);
        var tmpNode = document.createElement('div');
        tmpNode.innerHTML = imgHtml;
        if (a.replaceContentCssText) {
          var replaceContentCssText = a.replaceContentCssText.replace(/#height#/g, nodeH).replace(/#width#/g, nodeW);
          tmpNode.firstChild.style.cssText = replaceContentCssText;
        } else if (a.appendContentCssText) {
          tmpNode.firstChild.style.cssText += a.appendContentCssText;
        }
        var html = (a.outerContainerLeft || '') + tmpNode.innerHTML + (a.outerContainerRight || '');
        tmpNode.innerHTML = html;
        tmpNode.firstChild.setAttribute(g.idAttr, nodeId);
        node.parentNode.insertBefore(tmpNode.firstChild, node.nextSibling);
        node.setAttribute('has-insert-preloading', '1');
      }
    }
  }
  function init() {
    preloadingInit(g);
  }

  function decode(str) {
    var replace = ["&#96;", "`", "&#39;", "'", "&quot;", '"', "&nbsp;", " ", "&gt;", ">", "&lt;", "<", "&yen;", "¥", "&amp;", "&"];
    for (var i = 0; i < replace.length; i += 2) {
      str = str.replace(new RegExp(replace[i], 'g'), replace[i + 1]);
    }
    return str;
  }
  function getQuery(url) {
    url = url || 'http://qq.com/s?a=b#rd';
    var tmp = url.split('?'),
      query = (tmp[1] || '').split('#')[0].split('&'),
      params = {};
    for (var i = 0; i < query.length; i++) {
      var eqIndex = query[i].indexOf('=');
      if (eqIndex > -1) {
        var arg = query[i].substring(0, eqIndex);
        params[arg] = query[i].substring(eqIndex + 1);
      }
    }
    if (params['pass_ticket']) {
      params['pass_ticket'] = encodeURIComponent(decode(params['pass_ticket']).replace(/\s/g, '+'));
    }
    return params;
  }

  function insertAfter(dom, afterDom) {
    var _p = afterDom.parentNode;
    if (!_p) {
      return;
    }
    if (_p.lastChild === afterDom) {
      _p.appendChild(dom);
    } else {
      _p.insertBefore(dom, afterDom.nextSibling);
    }
  }

  if (typeof getComputedStyle === 'undefined') {
    if (document.body.currentStyle) {
      window.getComputedStyle = function (el) {
        return el.currentStyle;
      };
    } else {
      window.getComputedStyle = {};
    }
  }
  function getMaxWith() {
    var container = document.getElementById('img-content');
    var max_width = container.offsetWidth;
    var container_padding = 0;
    var container_style = getComputedStyle(container);
    container_padding = parseFloat(container_style.paddingLeft) + parseFloat(container_style.paddingRight);
    max_width -= container_padding;
    if (!max_width) {
      max_width = window.innerWidth - 32;
    }

    return max_width;
  }
  function getParentWidth(dom) {
    var parent_width = 0;
    var parent = dom.parentNode;
    var outerWidth = 0;
    while (true) {
      if (!parent || parent.nodeType !== 1) break;
      var parent_style = getComputedStyle(parent);
      if (!parent_style) break;
      parent_width = parent.clientWidth - parseFloat(parent_style.paddingLeft) - parseFloat(parent_style.paddingRight) - outerWidth;
      if (parent_width > 16) break;
      outerWidth += parseFloat(parent_style.paddingLeft) + parseFloat(parent_style.paddingRight) + parseFloat(parent_style.marginLeft) + parseFloat(parent_style.marginRight) + parseFloat(parent_style.borderLeftWidth) + parseFloat(parent_style.borderRightWidth);
      parent = parent.parentNode;
    }
    if (parent_width < 0) {
      return 0;
    }
    return parent_width;
  }
  function getOuterW(dom) {
    var style = getComputedStyle(dom),
      w = 0;
    if (!!style) {
      w = parseFloat(style.paddingLeft) + parseFloat(style.paddingRight) + parseFloat(style.borderLeftWidth) + parseFloat(style.borderRightWidth);
    }
    return w;
  }
  function getOuterH(dom) {
    var style = getComputedStyle(dom),
      h = 0;
    if (!!style) {
      h = parseFloat(style.paddingTop) + parseFloat(style.paddingBottom) + parseFloat(style.borderTopWidth) + parseFloat(style.borderBottomWidth);
    }
    return h;
  }
  function getVideoWh(dom) {
    var max_width = getMaxWith(),
      width = max_width,
      ratio_ = dom.getAttribute('data-ratio') * 1 || 4 / 3,
      arr = [4 / 3, 16 / 9],
      ret = arr[0],
      abs = Math.abs(ret - ratio_);
    for (var j = 1, jl = arr.length; j < jl; j++) {
      var _abs = Math.abs(arr[j] - ratio_);
      if (_abs < abs) {
        abs = _abs;
        ret = arr[j];
      }
    }
    ratio_ = ret;
    var parent_width = getParentWidth(dom) || max_width,
      rwidth = width > parent_width ? parent_width : width,
      outerW = getOuterW(dom) || 0,
      outerH = getOuterH(dom) || 0,
      videoW = rwidth - outerW,
      videoH = videoW / ratio_,
      speedDotH = 12,
      rheight = videoH + outerH + speedDotH;
    return {
      w: Math.ceil(rwidth),
      h: Math.ceil(rheight),
      vh: videoH,
      vw: videoW,
      ratio: ratio_,
      sdh: speedDotH
    };
  }

  
  function setImgSize(item, widthNum, widthUnit, ratio, breakParentWidth) {
    var imgPaddingBorder = getOuterW(item) || 0;
    var imgPaddingBorderTopBottom = getOuterH(item) || 0;
    if (widthNum > getParentWidth(item) && !breakParentWidth) {
      widthNum = getParentWidth(item);
    }
    var heightNum = (widthNum - imgPaddingBorder) * ratio + imgPaddingBorderTopBottom;
    widthNum !== 'auto' && (item.style.cssText += ";width: ".concat(widthNum).concat(widthUnit, " !important;"));
    widthNum !== 'auto' && (item.style.cssText += ";height: ".concat(heightNum).concat(widthUnit, " !important;"));
  }

  var isAccessibilityKey = 'isMpUserAccessibility';
  var imgPlaceholderClass = 'js_img_placeholder';
  var isAccessMode = window.localStorage.getItem(isAccessibilityKey);
  var imgSizeData;
  var validArr = ',' + [0.875, 1, 1.125, 1.25, 1.375].join(',') + ',';
  var match = window.location.href.match(/winzoom=(\d+(?:\.\d+)?)/);
  if (match && match[1]) {
    var winzoom = parseFloat(match[1]);
    if (validArr.indexOf(',' + winzoom + ',') >= 0) ;
  }
  function getImgSrcMainInfo(src) {
    var pathName = new URL(src).pathname;
    var lastIndex = pathName.lastIndexOf('/');
    return lastIndex > 0 ? pathName.slice(0, lastIndex) : pathName;
  }
  function ajax(obj) {
    var url = obj.url;
    var xhr = new XMLHttpRequest();
    var data = null;
    if (_typeof(obj.data) === 'object') {
      var d = obj.data;
      data = [];
      for (var k in d) {
        if (d.hasOwnProperty(k)) {
          data.push(k + '=' + encodeURIComponent(d[k]));
        }
      }
      data = data.join('&');
    } else {
      data = typeof obj.data === 'string' ? obj.data : null;
    }
    xhr.open('POST', url, true);
    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4) {
        if (xhr.status >= 200 && xhr.status < 400) {
          obj.success && obj.success(xhr.responseText);
        } else {
          obj.error && obj.error(xhr);
        }
        obj.complete && obj.complete();
        obj.complete = null;
      }
    };
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.send(data);
  }
  function setSize(images, videos, data) {
    var noWidth = !document.body.clientWidth || !document.getElementById('img-content') || !document.getElementById('img-content').offsetWidth;
    var _loop = function _loop() {
      if (noWidth) {
        return "break";
      }
      if (window.__second_open__ && videos[vi].getAttribute('__sec_open_place_holder__')) {
        return "continue";
      }
      var a = videos[vi];
      var src_ = a.getAttribute('src') || a.getAttribute('data-src') || '';
      var vid = getQuery(src_).vid || a.getAttribute('data-mpvid');
      if (!vid) {
        return "continue";
      }
      vid = vid.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
      a.removeAttribute('src');
      a.style.display = 'none';
      var obj = getVideoWh(a);
      var videoPlaceHolderSpan = document.createElement('span');
      videoPlaceHolderSpan.className = "".concat(imgPlaceholderClass, " wx_widget_placeholder");
      videoPlaceHolderSpan.setAttribute('data-vid', vid);
      videoPlaceHolderSpan.innerHTML = '<span class="weui-primary-loading"><span class="weui-primary-loading__dot"></span></span>';
      videoPlaceHolderSpan.style.cssText = "width: " + obj.w + "px !important;";
      insertAfter(videoPlaceHolderSpan, a);

      a.style.cssText += ';width: ' + obj.w + 'px !important;';
      a.setAttribute('width', obj.w);
      {
        videoPlaceHolderSpan.style.cssText += 'height: ' + (obj.h - obj.sdh) + 'px !important;margin-bottom: ' + obj.sdh + 'px !important;';
        a.style.cssText += 'height: ' + obj.h + 'px !important;';
        a.setAttribute('height', obj.h);
      }
      a.setAttribute('data-vh', obj.vh);
      a.setAttribute('data-vw', obj.vw);
      a.setAttribute('data-src', 'https://v.qq.com/iframe/player.html?vid=' + vid + '&width=' + obj.vw + '&height=' + obj.vh + '&auto=0');
      a.setAttribute('__sec_open_place_holder__', true);
      a.parentNode;
      var index = vi;
      var mid = window.dataaaa.mid;
      var biz = window.dataaaa.bizuin;
      var idx = window.dataaaa.idx;
      ajax({
        url: "/mp/videoplayer?vid=".concat(vid, "&mid=").concat(mid, "&idx=").concat(idx, "&__biz=").concat(biz, "&f=json"),
        type: 'GET',
        dataType: 'json',
        success: function success() {
          var json = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var ret = JSON.parse(json);
          var ori = ret.ori_status;
          var hitBizHeadimg = ret.hit_biz_headimg + '/64';
          var hitNickname = ret.hit_nickname;
          var hitUsername = ret.hit_username;
          if (ori === 2 && hitUsername !== data.user_name) {
            var videoBar = document.createElement('div');
            videoBar.innerHTML = "<div class=\"wx-edui-video_source_link\" id=\"".concat(hitUsername + index, "\" data-hit-username=\"").concat(hitUsername, "\">") + '<div class="video_source_word">以下视频来源于</div>' + '<div class="wx-edui-video_account_info">' + "<div class=\"wx-edui-video_account_avatar\" id=\"".concat(vid + index, "\" data-src=\"").concat(hitBizHeadimg, "\"></div>") + "<div class=\"wx-edui-video_account_name\">".concat(hitNickname, "</div>") + '<i class="wx-edui-video_account_arrow"></i>' + '</div>' + '</div>' + '<div class="wx-edui-video_source_link__layer_mask"></div>';
            document.querySelectorAll('.video_iframe').forEach(function (item) {
              if (item.getAttribute('data-mpvid') === vid && item.getAttribute('data-hasSource') !== '1') {
                item.setAttribute('data-hasSource', 1);
                item.parentNode.insertBefore(videoBar, item);
              }
            });

            var avatorEle = document.getElementById(vid + index);
            var avatorSrc = avatorEle.dataset.src;
            console.log('avatorSrc' + avatorSrc);
            if (ret.hit_biz_headimg) {
              avatorEle.style.backgroundImage = "url(".concat(avatorSrc, ")");
            }
          }
        },
        error: function error(xhr) {}
      });
    };
    for (var vi = 0, viLen = videos.length; vi < viLen; vi++) {
      var _ret = _loop();
      if (_ret === "break") break;
      if (_ret === "continue") continue;
    }
    var isCarton = data.copyright_info.is_cartoon_copyright * 1 || data.user_info.is_care_mode * 1 || isAccessMode === '1';
    var max_width = getMaxWith();
    if (!imgSizeData) {
      imgSizeData = {};
      data.picture_page_info_list = data.picture_page_info_list || [];
      var noWidthHeightCount = 0;
      var hasWidthHeightCount = 0;
      data.picture_page_info_list.forEach(function (imgData) {
        try {
          var width = Number(imgData.width);
          var height = Number(imgData.height);
          if (width && height) {
            imgSizeData[getImgSrcMainInfo(imgData.cdn_url)] = {
              ratio: height / width,
              width: width
            };
            hasWidthHeightCount++;
          } else {
            noWidthHeightCount++;
          }
        } catch (err) {
          console.error(err);
        }
      });
      if (Math.random() < 0.01 && Number(data.create_timestamp) > 1682352000) {
        hasWidthHeightCount && (new Image().src = "//mp.weixin.qq.com/mp/jsmonitor?idkey=330742_20_".concat(hasWidthHeightCount, "&r=").concat(Math.random()));
        noWidthHeightCount && (new Image().src = "//mp.weixin.qq.com/mp/jsmonitor?idkey=330742_21_".concat(noWidthHeightCount, "&r=").concat(Math.random()));
        if (!data.picture_page_info_list.length) {
          setTimeout(function () {
            noWidthHeightCount = document.querySelectorAll('#js_content img').length;
            noWidthHeightCount && (new Image().src = "//mp.weixin.qq.com/mp/jsmonitor?idkey=330742_21_".concat(noWidthHeightCount, "&r=").concat(Math.random()));
          }, 300);
        }
      }
    }
    for (var im = 0, imLen = images.length; im < imLen; im++) {
      if (window.__second_open__ && images[im].getAttribute('__sec_open_place_holder__')) {
        continue;
      }
      var img = images[im];
      var imgDataSrc = img.getAttribute('data-src');
      var realSrc = img.getAttribute('src');
      if (!imgDataSrc || realSrc) continue;

      var imgStyle = img.getAttribute('style');
      img.setAttribute('data-original-style', imgStyle);
      var width_ = img.dataset.w;
      var imgRatio = 1 * img.dataset.ratio;
      img.setAttribute('data-index', im);
      var width_num = 0;
      var width_unit = 'px';
      try {
        var imgSizeFromBackend = imgSizeData[getImgSrcMainInfo(imgDataSrc)];
        if (imgSizeFromBackend) {
          if (imgSizeFromBackend.ratio) {
            imgRatio = imgSizeFromBackend.ratio;
            img.setAttribute('data-ratio', imgSizeFromBackend.ratio);
          }
          if (imgSizeFromBackend.width) {
            width_ = imgSizeFromBackend.width;
            img.setAttribute('data-w', imgSizeFromBackend.width);
          }
        }
      } catch (err) {
        console.error(err);
      }
      if (imgRatio && imgRatio > 0) {
        if (!isCarton) {
          img.src = "data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E";
          if (noWidth) {
            var fallbackWidth = img.style.width || img.getAttribute('width') || width_;
            var fallbackMaxWidth = 360;

            fallbackWidth = parseFloat(fallbackWidth, 10) > fallbackMaxWidth ? fallbackMaxWidth : fallbackWidth;
            if (fallbackWidth === 'inherit') {
              fallbackWidth = fallbackMaxWidth;
            }
            if (fallbackWidth) {
              img.setAttribute('_width', !isNaN(fallbackWidth * 1) ? fallbackWidth + 'px' : fallbackWidth);
            }
            if (typeof fallbackWidth === 'string' && fallbackWidth.indexOf('%') !== -1) {
              fallbackWidth = parseFloat(fallbackWidth.replace('%', ''), 10) / 100 * fallbackMaxWidth;
            }
            if (fallbackWidth === 'auto') {
              fallbackWidth = width_;
              if (width_ === 'auto' || !width_) {
                fallbackWidth = fallbackMaxWidth;
              } else {
                fallbackWidth = width_;
              }
            }
            var fallbackRes = /^(\d+(?:\.\d+)?)([a-zA-Z%]+)?$/.exec(init_width);
            var fallbackLastWidth = fallbackRes && fallbackRes.length >= 2 ? fallbackRes[1] : 0;
            var fallbackUnit = fallbackRes && fallbackRes.length >= 3 && fallbackRes[2] ? fallbackRes[2] : 'px';
            setImgSize(img, fallbackLastWidth, fallbackUnit, imgRatio, true);
            img.classList.add(imgPlaceholderClass, "wx_img_placeholder");
            continue;
          }
          img.classList.add(imgPlaceholderClass, "wx_img_placeholder");
        }

        var parent_width = getParentWidth(img) || max_width;
        var init_width = img.style.width || img.getAttribute('width') || width_ || parent_width;
        init_width = parseFloat(init_width, 10) > max_width ? max_width : init_width;
        if (init_width === 'inherit') {
          init_width = parent_width;
        }
        if (init_width) {
          img.setAttribute('_width', !isNaN(init_width * 1) ? init_width + 'px' : init_width);
        }
        if (typeof init_width === 'string' && init_width.indexOf('%') !== -1) {
          init_width = parseFloat(init_width.replace('%', ''), 10) / 100 * parent_width;
        }
        if (init_width === 'auto') {
          init_width = width_;
          if (width_ === 'auto' || !width_) {
            init_width = parent_width;
          } else {
            init_width = width_;
          }
        }
        var res = /^(\d+(?:\.\d+)?)([a-zA-Z%]+)?$/.exec(init_width);
        width_num = res && res.length >= 2 ? res[1] : 0;
        width_unit = res && res.length >= 3 && res[2] ? res[2] : 'px';
        var imgWidth = width_num;

        if (isCarton) {
          img.src = imgDataSrc;
          img.style.height = 'auto';
        } else {
          setImgSize(img, imgWidth, width_unit, imgRatio, true);
          setImgSize(img, imgWidth, width_unit, imgRatio, false);
        }
      }
      if (!data.is_h5_render) {
        img.setAttribute('__sec_open_place_holder__', true);
      }
    }
    init();
  }

  var ua = navigator.userAgent;
  /mac\sos/i.test(ua) && !/(iPhone|iPad|iPod|iOS)/i.test(ua) || /windows\snt/i.test(ua);

  var images = document.getElementsByTagName('img');
  var videos = [];

  var user_name = "gh_865387a4190a";
  var isCartoonCopyright = '0';
  var is_care_mode = '';
  var createTimestamp = '1678118421';
  var picturePageInfoList = "[{'cdn_url':'https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTdOW9K96RLq5kPKJm2iaKPs0pWd3h20bSaUKfl5e5XsV8dhTcbuCqRnZ9YEXwXeQ9JfQZvPeNrehtA/640?wx_fmt=jpeg\x26amp;amp;wxfrom=5\x26amp;amp;wx_lazy=1\x26amp;amp;wx_co=1','width':'0','height':'0'},{'cdn_url':'https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6apPetFjqibibibtFwWwAicYFUaicWLPn1bFqRhFDtCq4ibE7NR6B5n0ppHWSQ/640?wx_fmt=jpeg','width':'0','height':'0'},{'cdn_url':'https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTcdtWkBjWAQrpzPRquUTM7HOhWonrnuIia5k73dnghuPBj9AuicBGRcNz0gVLfbRrW0aFq6t0Dy93Cg/640?wx_fmt=png\x26amp;amp;wxfrom=5\x26amp;amp;wx_lazy=1\x26amp;amp;wx_co=1','width':'0','height':'0'},{'cdn_url':'https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTenUaN2kM3PHKmG8ujWDsdpSL91icKh5rsJpwBgxCEGJLM2M2klgVkKvoV8N4GYhlSepxPQcDHO5jA/640?wx_fmt=jpeg\x26amp;amp;wxfrom=5\x26amp;amp;wx_lazy=1\x26amp;amp;wx_co=1','width':'0','height':'0'},{'cdn_url':'https://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTcQhnM9sWjd7Mplclp4knUKcxoDQ84Y4lOlmSXrUYE94E5aufKuHuncTUPwfqyyiaM6W8ng7tUvU8Q/640?wx_fmt=jpeg\x26amp;amp;wxfrom=5\x26amp;amp;wx_lazy=1\x26amp;amp;wx_co=1','width':'0','height':'0'},]";
  picturePageInfoList = picturePageInfoList.includes(',]') ? picturePageInfoList.replace(',]', ']') : picturePageInfoList;
  try {
    picturePageInfoList = JSON.parse(picturePageInfoList.replace(/'/g, '"'));
  } catch (err) {
    picturePageInfoList = [];
    console.error(err);
  }
  var data = {
    is_h5_render: true,
    user_name: user_name,
    copyright_info: {
      is_cartoon_copyright: isCartoonCopyright
    },
    picture_page_info_list: picturePageInfoList,
    create_timestamp: createTimestamp,
    user_info: {
      is_care_mode: is_care_mode
    }
  };
  setSize(images, videos, data);

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>(function () {
    'use strict';
    window.__page_cls_ctrl__canRenderSilently = '__page_cls_ctrl__canRenderSilently' in window ? window.__page_cls_ctrl__canRenderSilently : true;
    window.__page_cls_ctrl__forceRenderSilentlyList = '__page_cls_ctrl__forceRenderSilentlyList' in window ? window.__page_cls_ctrl__forceRenderSilentlyList : [];
    window.__page_cls_ctrl__compRenderInfo = '__page_cls_ctrl__compRenderInfo' in window ? window.__page_cls_ctrl__compRenderInfo : {};

    
    var g = {
      defaultContentTpl: '<span class="js_img_placeholder wx_widget_placeholder" style="width:#width# !important;height:#height#px !important;text-indent: 0"><span class="weui-primary-loading"><span class="weui-primary-loading__dot"></span></span>',
      config: [{
        querySelector: 'redpacketcover',
        
        genId: function genId() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return decodeURIComponent(opt.node.getAttribute('data-coveruri') || '');
        },
        
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 0.7854;
        },
        
        calH: function calH() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return this.calW({
            parentWidth: opt.parentWidth
          }) / 0.73346 + 27 + 37;
        },

        replaceContentCssText: '',
        outerContainerLeft: '',
        outerContainerRight: ''
      },
      {
        querySelector: 'mppoi',
        genId: function genId() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.node.getAttribute('data-id') || '';
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 1;
        },
        calH: function calH() {
          return 219;
        },
        replaceContentCssText: '',
        appendContentCssText: 'diplay:block;',
        outerContainerLeft: '',
        outerContainerRight: ''
      },
      {
        querySelector: 'mpsearch',
        genId: function genId() {
          return decodeURIComponent('mp-common-search');
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 1;
        },
        calH: function calH() {
          return 100;
        },
        replaceContentCssText: '',
        appendContentCssText: 'diplay:block;',
        outerContainerLeft: '',
        outerContainerRight: ''
      },
      {
        querySelector: 'mpvideosnap',
        genId: function genId() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var type = opt.node.getAttribute('data-type') || 'video';
          if (type === 'live') {
            return decodeURIComponent(opt.node.getAttribute('data-noticeid') || '');
          }
          return decodeURIComponent(opt.node.getAttribute('data-id') || '');
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var type = opt.node.getAttribute('data-type') || 'video';
          var width = opt.node.getAttribute('data-width') || '';
          var height = opt.node.getAttribute('data-height') || '';
          if (type === 'live' || type === 'topic') {
            return opt.parentWidth;
          }
          var ratio = 1;
          ratio = width / height;
          var computedHeight = 0;
          var computedWidth = 0;
          var isHorizontal = false;
          if (ratio === 1 || ratio === 3 / 4) ; else if (ratio === 4 / 3 || ratio === 16 / 9) {
            isHorizontal = true;
          } else if (ratio < 3 / 4) {
            ratio = 3 / 4;
          } else if (ratio > 1 && ratio < 4 / 3) {
            ratio = 1;
          } else if (ratio > 4 / 3) {
            isHorizontal = true;
          } else if (typeof ratio === 'number' && !Object.is(ratio, NaN)) ; else {
            ratio = 1;
          }
          opt.node.setAttribute('data-ratio', ratio);
          opt.node.setAttribute('data-isHorizontal', isHorizontal);
          if (isHorizontal === true) {
            computedWidth = opt.parentWidth;
          } else {
            if (window.innerWidth < 1024) {
              computedWidth = window.innerWidth * 0.65;
            } else {
              computedWidth = opt.parentWidth * 0.65;
            }
          }
          computedHeight = computedWidth / ratio;
          computedHeight = Math.round(computedHeight);
          computedWidth = Math.round(computedWidth);
          opt.node.setAttribute('data-computedWidth', computedWidth);
          opt.node.setAttribute('data-computedHeight', computedHeight);
          return computedWidth;
        },
        calH: function calH() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var desc = opt.node.getAttribute('data-desc') || '';
          var type = opt.node.getAttribute('data-type') || 'video';
          var computedHeight = opt.node.getAttribute('data-computedHeight') || '';
          switch (type) {
            case 'live':
              return desc ? 152 : 116;
            case 'topic':
              return 201;
            case 'image':
            case 'video':
              return parseFloat(computedHeight);
          }
        },
        getBorderRadius: function getBorderRadius() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var type = opt.node.getAttribute('data-type') || 'video';
          if (type === 'video') {
            return 4;
          }
          return 8;
        },
        replaceContentCssText: '',
        appendContentCssText: 'display:flex;margin:0px auto;',
        outerContainerLeft: '',
        outerContainerRight: ''
      }, {
        querySelector: 'mp-wxaproduct',
        genId: function genId() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return decodeURIComponent(opt.node.getAttribute('data-wxaproduct-productid') || '');
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 1 || '100%';
        },
        calH: function calH() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          var cardtype = opt.node.getAttribute('data-wxaproduct-cardtype') || '';
          return cardtype === 'mini' ? 124 : 466;
        },
        replaceContentCssText: '',
        outerContainerLeft: '',
        outerContainerRight: ''
      }, {
        querySelector: 'mpprofile',
        genId: function genId(opt) {
          return opt.node.getAttribute('data-id') || '';
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 1;
        },
        calH: function calH() {
          return 143;
        },
        replaceContentCssText: '',
        appendContentCssText: 'diplay:block;',
        outerContainerLeft: '',
        outerContainerRight: ''
      },
      {
        querySelector: 'mp-common-sticker',
        genId: function genId(opt) {
          return opt.node.getAttribute('data-md5') || '';
        },
        calW: function calW() {
          return 120;
        },
        calH: function calH() {
          return 120;
        },
        replaceContentCssText: '',
        appendContentCssText: 'diplay:block;',
        outerContainerLeft: '<div style="display: flex; justify-content: center;">',
        outerContainerRight: '</div>'
      }, {
        querySelector: 'mp-common-product',
        genId: function genId(opt) {
          return opt.node.getAttribute('data-windowproduct') || '';
        },
        calW: function calW() {
          var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
          return opt.parentWidth * 1 || '100%';
        },
        calH: function calH(opt) {
          var customstyle = opt.node.getAttribute('data-customstyle') || '{}';
          if (customstyle) {
            try {
              var _JSON$parse = JSON.parse(customstyle),
                display = _JSON$parse.display,
                height = _JSON$parse.height;
              if (display !== 'none') {
                var customHeight = height.split('px')[0];
                var ratio = opt.parentWidth / 350.0 || 1;
                customHeight = Math.round(customHeight * ratio);
                return customHeight;
              }
              return 0;
            } catch (err) {
              console.error(err);
            }
          }
          return 0;
        },
        replaceContentCssText: '',
        appendContentCssText: 'diplay:block;',
        outerContainerLeft: '<div style="display: flex; margin: 0 auto 24px;">',
        outerContainerRight: '</div>'
      }
      ]
    };

    function preloadingInit() {
      var opt = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      if (typeof document.querySelectorAll !== 'function') {
        return;
      }
      var g = {
        maxWith: document.getElementById('img-content').getBoundingClientRect().width,
        idAttr: 'data-preloadingid'
      };
      for (var i = 0, il = opt.config.length; i < il; i++) {
        var a = opt.config[i];
        var list = document.querySelectorAll(a.querySelector);
        for (var j = 0, jl = list.length; j < jl; j++) {
          var node = list[j];
          var parentWidth = node.parentNode.getBoundingClientRect().width;
          parentWidth = Math.min(parentWidth, g.maxWith);

          if (node.getAttribute('has-insert-preloading')) {
            continue;
          }
          var nodeW = a.calW({
            parentWidth: parentWidth,
            node: node
          });
          var nodeH = a.calH({
            parentWidth: parentWidth,
            node: node
          });
          var nodeId = a.genId({
            index: j,
            node: node
          });
          var nodeBorderRadius = typeof a.getBorderRadius === 'function' ? a.getBorderRadius({
            index: j,
            node: node
          }) : 8;

          if (typeof nodeW === 'number') {
            nodeW += 'px';
          }
          var imgHtml = opt.defaultContentTpl.replace(/#height#/g, nodeH).replace(/#width#/g, nodeW).replace(/#borderRadius#/g, nodeBorderRadius);
          var tmpNode = document.createElement('div');
          tmpNode.innerHTML = imgHtml;
          if (a.replaceContentCssText) {
            var replaceContentCssText = a.replaceContentCssText.replace(/#height#/g, nodeH).replace(/#width#/g, nodeW);
            tmpNode.firstChild.style.cssText = replaceContentCssText;
          } else if (a.appendContentCssText) {
            tmpNode.firstChild.style.cssText += a.appendContentCssText;
          }
          var html = (a.outerContainerLeft || '') + tmpNode.innerHTML + (a.outerContainerRight || '');
          tmpNode.innerHTML = html;
          tmpNode.firstChild.setAttribute(g.idAttr, nodeId);
          node.parentNode.insertBefore(tmpNode.firstChild, node.nextSibling);
          node.setAttribute('has-insert-preloading', '1');
        }
      }
    }
    function init() {
      preloadingInit(g);
    }

    
    init();

})();</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>
function htmlDecode(str) {
  return str
    .replace(/&#39;/g, '\'')
    .replace(/<br\s*(\/)?\s*>/g, '\n')
    .replace(/&nbsp;/g, ' ')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&nbsp;/g, ' ');
}

var use_h5webtransfer = "0" * 1;

var uin = '';
var key = '';
var pass_ticket = '';
var new_appmsg = 1;
var item_show_type = "0";
var real_item_show_type = "0";
var can_see_complaint = "0";
var tid = "";
var aid = "";
var clientversion = "";
var appuin = "MjM5OTMwODM1Mw==" || "";
var voiceid = "";
var create_time = "1678118421" * 1;

var source = "21";
var ascene = "";
var subscene = "";
var sessionid = "" || "svr_5704f750d60";
var abtest_cookie = "";

var finder_biz_enter_id = "" * 1;

var scene = 75;

var itemidx = "";
var appmsg_token = "" || "";
var _copyright_stat = "0";
var _ori_article_type = "";

var is_follow = "";
var nickname = htmlDecode("计量经济圈");
var appmsg_type = "9";
var ct = "1678118421";
var user_name = "gh_865387a4190a";
var fakeid = "";
var version = "";
var is_limit_user = "0";
var cps_article_data = "";
var round_head_img = "http://mmbiz.qpic.cn/mmbiz_png/gPuXCNBzgTdaZMQCIXNKSjibrvUhaLZFs370KIqsWqa5q3aClicxW4yHTj3acApEac9nZqiaUEGL7e2MS1BSXKibPg/0?wx_fmt=png";
var hd_head_img = "http://wx.qlogo.cn/mmhead/Q3auHgzwzM4r3vkDjDrRKQ2RCzJtl9XadUAQibZYCCdtlYiazQGookEA/0" || "";
var ori_head_img_url = "http://wx.qlogo.cn/mmhead/Q3auHgzwzM4r3vkDjDrRKQ2RCzJtl9XadUAQibZYCCdtlYiazQGookEA/132";
var msg_title = '固定效应: 目前看到解释的最清楚的帖子, 救命！'.html(false);
var msg_desc = htmlDecode("Fixed effects.");
var msg_cdn_url = "https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6aaVIYOglm663vuWGms49uCXryia8dKluBQAr4TiaDLHibunzpaic7Z68ZSA/0?wx_fmt=jpeg";
var cdn_url_1_1 = "https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6aYQMvLBELPyYVDWZHWG1ibB2Aybp4EDNmtOGcias2nHXhsUgw6WaqibSqA/0?wx_fmt=jpeg";
var cdn_url_235_1 = "https://mmbiz.qpic.cn/mmbiz_jpg/gPuXCNBzgTdjfQS4TrJSRjLjQ3yiadU6aaVIYOglm663vuWGms49uCXryia8dKluBQAr4TiaDLHibunzpaic7Z68ZSA/0?wx_fmt=jpeg";
var msg_link = "http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448105671&amp;idx=1&amp;sn=576f76eacf5b7b5e5d6363bcf724dd35&amp;chksm=b322fde9845574ff438ab0b44c98ef59f428bab28dd9fd9dacb4d220053dd8025d07defe9668#rd";
var user_uin = "" * 1;
var msg_source_url = 'https://appvwrepkgi6643.h5.xiaoeknow.com/content_page/eyJ0eXBlIjoyLCJyZXNvdXJjZV90eXBlIjo3LCJyZXNvdXJjZV9pZCI6ImRfNjBjZDU1NDQ2MGQ2YV9ZRzZodUwzUTc1MTEiLCJwcm9kdWN0X2lkIjoiY181OWFjYzg3ODk5ZmU1X2pLaDhiR2dNNzI2MiIsImFwcF9pZCI6ImFwcHZXUkVwa2dpNjY0MyIsImV4dHJhX2RhdGEiOjF9';
var img_format = 'jpeg';
var srcid = '';
var req_id = '2015CRX3FxOvbeplRnIGjLJG';
var networkType;
var appmsgid = "" || '' || '2448105671';
var comment_id = "2827386870237102083" || "2827386870237102083" * 1;
var mp_comment_id = "3275211848518156288" || "3275211848518156288" * 1;
var comment_enabled = "" * 1;
var open_fansmsg = "0" * 1;
var is_https_res = ("" * 1) && (location.protocol == "https:");
var msg_daily_idx = "1" || "";
var profileReportInfo = "" || "";

var devicetype = "";
var source_encode_biz = "";
var source_username = "";
var reprint_ticket = "";
var source_mid = "";
var source_idx = "";
var source_biz = "";
var author = "胜风";
var author_id = "";
var author_cancel = "" * 1 || 0;
var reward_wording = "";


var optimizing_flag = "0" * 1;


var show_comment = "";
var __appmsgCgiData = {
  wxa_product: "" * 1,
  wxa_cps: "" * 1,
  show_msg_voice: "0" * 1,
  can_use_page: "" * 1,
  is_wxg_stuff_uin: "0" * 1,
  card_pos: "",
  copyright_stat: "0",
  source_biz: "",
  hd_head_img: "http://wx.qlogo.cn/mmhead/Q3auHgzwzM4r3vkDjDrRKQ2RCzJtl9XadUAQibZYCCdtlYiazQGookEA/0" || (window.location.protocol + "//" + window.location.host + "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_rumor_link6b6772.jpg"),
  has_red_packet_cover: "0" * 1 || 0,
  minishopCardData: ""
};
var _empty_v = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/audios/empty6b6772.mp3";
var publicTagInfo = [
      {
    title: '计量圈固定效应',
    size: '12' * 1,
    link: 'https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1701751946082107396#wechat_redirect',
    type: '0' * 1,
    albumId: '1701751946082107396',
    tagId: '' * 1,
    tagSource: '1',
    id: 'https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1701751946082107396#wechat_redirect' ? (('https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1701751946082107396#wechat_redirect'.match(/[0-9]{8,}/)) ? ('https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1701751946082107396#wechat_redirect'.match(/[0-9]{8,}/))[0] : '') : '',
    continousReadOn: '1' * 1
  },
    {
    title: '计量圈经验',
    size: '149' * 1,
    link: 'https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1953158166930653188#wechat_redirect',
    type: '0' * 1,
    albumId: '1953158166930653188',
    tagId: '' * 1,
    tagSource: '1',
    id: 'https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1953158166930653188#wechat_redirect' ? (('https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1953158166930653188#wechat_redirect'.match(/[0-9]{8,}/)) ? ('https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MjM5OTMwODM1Mw==&amp;action=getalbum&amp;album_id=1953158166930653188#wechat_redirect'.match(/[0-9]{8,}/))[0] : '') : '',
    continousReadOn: '1' * 1
  },
    ];
var appmsg_album_info = (function () {
  var curAlbumId = '';
  for (var i = 0; i < publicTagInfo.length; i++) {
    if (curAlbumId) {
      if (curAlbumId === publicTagInfo[i].id) {
        return publicTagInfo[i];
      }
    } else {
      if (publicTagInfo[i].continousReadOn) {
        return publicTagInfo[i];
      }
    }
  }
  return {};
})();
var copyright_stat = "0" * 1;
var hideSource = "" * 1;

var pay_fee = "" * 1;
var pay_timestamp = "";
var need_pay = "" * 1;
var is_pay_subscribe = "0" * 1;

var need_report_cost = "0" * 1;
var use_tx_video_player = "0" * 1;
var appmsg_fe_filter = "contenteditable";

var friend_read_source = "" || "";
var friend_read_version = "" || "";
var friend_read_class_id = "" || "";

var is_only_read = "1" * 1;
var read_num = "" * 1;
var like_num = "" * 1;
var liked = "" == 'true' ? true : false;
var is_temp_url = "" ? 1 : 0;
var tempkey = "";
var send_time = "";
var icon_emotion_switch = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/emotion/icon_emotion_switch6b6772.svg";
var icon_emotion_switch_active = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/emotion/icon_emotion_switch_active6b6772.svg";
var icon_emotion_switch_primary = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/emotion/icon_emotion_switch_primary6b6772.svg";
var icon_emotion_switch_active_primary = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/emotion/icon_emotion_switch_active_primary6b6772.svg";
var icon_loading_white = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/common/icon_loading_white6b6772.gif";
var icon_audio_unread = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/audio/icon_audio_unread6b6772.png";
var icon_qqmusic_default = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/audio/icon_qqmusic_default6b6772.png";
var icon_qqmusic_source = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/audio/icon_qqmusic_source6b6772.svg";
var icon_kugou_source = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/audio/icon_kugou_source6b6772.png";

var topic_default_img = '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_book_thumb6b6772.png';
var comment_edit_icon = '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/common/icon_edit6b6772.png';
var comment_loading_img = '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/common/icon_loading_white6b6772.gif';
var comment_c2c_not_support_img = '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_discuss_more6b6772.png';

var tts_is_ban = '' * 1 || 0;
var tts_is_show = '' * 1 || 0;
var tts_heard_person_cnt = '' * 1 || 0;
var voice_in_appmsg = {
  };
var voiceList = {};
voiceList={"voice_in_appmsg":[]}
var reprint_style = '' * 1;
var reprint_type = '' * 1;
var wxa_img_alert = "" != 'false';

var weapp_sn_arr_json = "" || "";

var videoPageInfos = [
  ];
window.__videoPageInfos = videoPageInfos;

var video_snap_json = "" || "";
var mp_profile = [
  ];

var ban_scene = "0" * 1;

var ban_jump_link = {
    };

var svr_time = "1705737536" * 1;
var is_transfer_msg = "" * 1 || 0;

var malicious_title_reason_id = "0" * 1;
var malicious_content_type = "0" * 1;

var modify_time = "" * 1;
var modify_detail = [];

var isprofileblock = "0";

var jumpInfo = [
        {
    title: '广义合成控制法gsynth, 基于交互固定效应的因果推断'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448059508&amp;amp;idx=1&amp;amp;sn=e7543a0354e32902c11ab545a30f8b68&amp;amp;chksm=b323b15a8454384c3bcaac6f0ee59154c77acfa23c27e288e654bb267403243d941828661534&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '用&quot;因果关系图&quot;来进行因果推断的新技能'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448057864&amp;amp;idx=1&amp;amp;sn=5f7059308a1dd4e522e46fca2ea541c5&amp;amp;chksm=b323bb2684543230b5ae496bf5ca5809704981c4579d8326afdec847eb142a11be5a2b9b6958&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '1998-2016年中国地级市年均PM2.5数据release'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448058119&amp;amp;idx=1&amp;amp;sn=79d1e1f0e35a367a76eb0576e49bb963&amp;amp;chksm=b323ba298454333fd4599a881dc19cd7fdba35965e9d05bd7a260a92cba3841bc3953e1d0543&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '1997-2014中国市场化指数权威版本release, 是时候发表AER扬眉吐气'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448059310&amp;amp;idx=1&amp;amp;sn=38f7b997958eb22a33144f9d8a8f6b47&amp;amp;chksm=b323b68084543f966982777e972d698f35d3b9b5de7f314f5ab386839b5933d57c795da6f5c9&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '2005-2015中国分省分行业CO2数据circulation'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448058145&amp;amp;idx=1&amp;amp;sn=fce08fd7873a13f0bab2c08a9f85fa1b&amp;amp;chksm=b323ba0f84543319d1b1c823b7ca718eedf8632ce637dd57a4a77ced784dfde6310583c1de81&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '实证研究中用到的135篇文章, 社科学者常用toolkit'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448058131&amp;amp;idx=1&amp;amp;sn=775cff0263536feabfdfae383d22c365&amp;amp;chksm=b323ba3d8454332b2551fda4b21e47ee00b68a2e6aee4a542a26194e07d517034189839f15c1&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '合成控制法什么鬼? 因果推断的前沿方法指南'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448057440&amp;amp;idx=1&amp;amp;sn=225b8679d4aedc559a83d298e6d652f1&amp;amp;chksm=b323b94e84543058ce552c4265a7d677aa90c8ed249f05145d60135e248a691ea19a617a24a3&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '18+1张图掌握R软件的方方面面, 还有谁, 还有谁?'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448058238&amp;amp;idx=1&amp;amp;sn=827485961988e6e8564e0cdc74802377&amp;amp;chksm=b323ba508454334626f198761497dbaf946e882c5ce2cf906b48b50a0ef287f704bee52ed45e&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: 'CHNS2015重磅来袭,中国健康领域研究者的福音'.html(false),
    item_show_type: '0',
    url: 'http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448056970&amp;amp;idx=1&amp;amp;sn=60464a09b72a72da002d33ddc2f98013&amp;amp;chksm=b323bfa4845436b24f87b67bc3a06d46a1da7270e7e7bde6528edc3a5015f69007b923f91a6b&amp;amp;scene=21#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
      ,  {
    title: '空间计量百科全书式的使用指南的do file公开, 暨空间计量研究小组成立100天'.html(false),
    item_show_type: '0',
    url: 'https://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;amp;mid=2448058317&amp;amp;idx=1&amp;amp;sn=be11b13a539a73d0a15e512f7cb576f7&amp;amp;chksm=b323bae3845433f5bbb0cea353f44febe1acc0f3f3a6397c3a835b702f6577a37030fbccbd79&amp;amp;scene=21&amp;amp;token=15317526&amp;amp;lang=zh_CN#wechat_redirect'.html(false).html(false),
    subject_name: '计量经济圈',
    link_type: 'LINK_TYPE_MP_APPMSG',
  }
    ];
window.service_type = '0' * 1;

var hasRelatedArticleInfo = '0' * 1 || 0;
var relatedArticleFlag = '' * 1 || 0;

var canUseAutoTypeSetting;
canUseAutoTypeSetting = '3' * 1 || 0;
var styleType = '3';
var originTypeSetting = '';
var originStyleType = '';
var reprintEditable = '';
var currentSvrStyleType, originSvrStyleType;

if (!isNaN(parseInt(styleType)) && parseInt(styleType) > 0) {
  currentSvrStyleType = parseInt(styleType);
} else if (!isNaN(parseInt(canUseAutoTypeSetting))) {
  currentSvrStyleType = parseInt(canUseAutoTypeSetting);
} else {
  currentSvrStyleType = 0;
}

if (!isNaN(parseInt(originStyleType)) && parseInt(originStyleType) > 0) {
  originSvrStyleType = parseInt(originStyleType);
} else if (!isNaN(parseInt(originTypeSetting))) {
  originSvrStyleType = parseInt(originTypeSetting);
} else {
  originSvrStyleType = 0;
}

if (reprint_type > 0 && originSvrStyleType !== currentSvrStyleType && parseInt(reprintEditable) === 0) {
  var dc = document.getElementById('js_content').classList;

  dc.remove('autoTypeSetting');
  dc.remove('autoTypeSetting24');
  dc.remove('autoTypeSetting24psection');

  var finalSetting = parseInt(originSvrStyleType);

  if (finalSetting === 1) {
    dc.add('autoTypeSetting');
  } else if (finalSetting === 2) {
    dc.add('autoTypeSetting24');
  } else if (finalSetting === 3) {
    dc.add('autoTypeSetting24psection');
  }
}

window.wxtoken = "777";
window.is_login = '' * 1;

window.__moon_initcallback = function () {
  if (!!window.__initCatch) {
    window.__initCatch({
      idkey: 27611 + 2,
      startKey: 0,
      limit: 128,
      badjsId: 43,
      reportOpt: {
        uin: uin,
        biz: biz,
        mid: mid,
        idx: idx,
        sn: sn
      },
      extInfo: {
        network_rate: 0.01,   
        badjs_rate: 0.1
      }
    });
  }
}
var title = "计量经济圈";

var is_new_msg = true;

var is_wash = '' * 1;
var topbarEnable = false;
var enterid = "" * 1 || "" * 1 || parseInt(Date.now() / 1000);
var reloadid = '' * 1 || parseInt(Date.now() / 1000);
var reloadseq = '' * 1 || 1;
var miniprogram_appid = "";

var defaultAvatarUrl = '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/icon/common/icon_avatar_default6b6772.svg';

document.addEventListener('DOMContentLoaded', function () {
  window.domCompleteTime = Date.now();
});

      var hasRecommendMsg = 0;
  ;
var isPayTopic = '' * 1;
  var payTopicPrice = '' * 1;
var isRemovedFromPayTopic = '' * 1;
var isPaySubscribe = '0' * 1;
var isPaid = '0' * 1;
var isRefund = '' * 1;
var payShowIAPPrice = 1;
var payProductId = '' || '';
var previewPercent = '0' || '';
var payGiftsCount = '0' * 1 || 0;
var payDesc = htmlDecode('');
var payFreeGift = '' * 1 || 0;
var is_finished_preview = 0;
var jump2pay = '' * 1;

var isFans;
var can_reward = '0' * 1 || 0;
var is_need_reward = (isPaySubscribe && !isPaid) ? 0 : "0" * 1;
var is_teenager = '' * 1 || 0;
var is_care_mode = '' * 1 || 0;

var anchor_tree_msg = '';
var colorScheme = '';

var iapPriceInfo = {
  };
var productPayPackage = {
    iap_price_info: iapPriceInfo
};

var isCartoonCopyright = '0' * 1;

var show_msg_voice = '' * 1;
var qnaCardData = '';
var exptype = '' || '';
var expsessionid = '' || '';

var goContentId = '';
var goReplyId = '';

var show_related_article = '' * 1;
var related_article_scene = '' * 1;

var wwdistype = '';

window.cgiData = {
  appImg: '//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_tencent_video6b6772.png',
}

window.ip_wording = {
  countryName: '中国',
  countryId: '156',
  provinceName: '辽宁',
  provinceId: '',
  cityName: '',
  cityId: ''
};
window.show_ip_wording = '1' * 1;
window.source_appid = 'wxf6ad71347de505ab';

window.is_over_sea = '' * 1;
window.showAdMark = "0" * 1;

window.claim_source = {
  claim_source_type: '',
  claim_source: '',
};
window.hideAdMarkOnCps = ("" || "0" * 1) ? 1 : 0;
window.show_version = '' * 1;
window.bar_version = '' * 1;
window.search_keywords = [
              ];
window.s1s_keywords_exp_info = '';
  var need_baike_preload = true;
;

window.mmlisten_playlist_info_buffer = '';
window.key_text = '';
</script>

<script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function () {
  'use strict';

  function _typeof(obj) {
    "@babel/helpers - typeof";

    return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
      return typeof obj;
    } : function (obj) {
      return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
    }, _typeof(obj);
  }

  function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
  function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
  function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
  
  
  var ua = navigator.userAgent;
  var is_ios = /(iPhone|iPad|iPod|iOS)/i.test(ua);
  var is_wp = /Windows\sPhone/i.test(ua);
  var is_android = /(Android)/i.test(ua);
  var is_wechat = /MicroMessenger\/([\d\.]+)/i.test(ua);
  var is_mac = /mac\sos/i.test(ua) && !is_ios;
  var is_windows = /windows\snt/i.test(ua) && !is_wp;
  var is_mpapp = /MPAPP\/([\d\.]+)/i.test(ua);
  var is_ipad = /iPad/i.test(ua);
  var is_windows_wechat = /WindowsWechat/i.test(ua);
  var is_mac_wechat = /MacWechat/i.test(ua) || /wechat.*mac os/i.test(ua);
  var is_prefetch = is_wechat && window.WeixinPrefecherJSBridge;
  var is_donut_app = /SAAASDK/i.test(ua);
  var is_in_miniProgram = is_android && /miniprogram/.test(ua.toLowerCase()) || window.__wxjs_environment == 'miniprogram';
  var is_wx_work = /wxwork/i.test(ua);
  function getUrlParams() {
    var vars = location.search.substring(1).split('&');
    var params = {};
    var _iterator = _createForOfIteratorHelper(vars),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var ele = _step.value;
        var pair = ele.split('=');
        var key = decodeURIComponent(pair[0]);
        if (typeof params[key] === 'undefined') {
          params[key] = decodeURIComponent(pair[1]);
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
    return params;
  }
  function get() {
    var reg = /MicroMessenger\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMac() {
    var reg = /MacWechat\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMacOS() {
    var reg = /Mac OS X ([\d_]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1].replace(/_/g, '.');
    }
    return false;
  }
  function getWindows() {
    var reg = /WindowsWechat\(0x(.+?)\)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getWxWork() {
    var reg = /wxwork\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMpApp() {
    var appVersion = [2, 4, 5];
    var match = navigator.userAgent.match(/MPAPP\/(\d+(\.\d+)*)/);
    if (match) {
      appVersion = match[1].split('.').map(function (v) {
        return Number(v);
      });
    }
    return appVersion.join('.');
  }
  function getVersionNumber(hexStr) {
    return Number(Number('0x' + hexStr).toString(10));
  }
  function getWindowsVersionFormat() {
    var versionInfo = navigator.userAgent.match(/WindowsWechat\(0x(\w+?)\)/);
    if (versionInfo && versionInfo.length === 2) {
      var version = versionInfo[1];
      var mainVersion = getVersionNumber(version.slice(1, 2));
      var subVersion = getVersionNumber(version.slice(2, 4));
      var subVersion2 = getVersionNumber(version.slice(4, 6));
      return [mainVersion, subVersion, subVersion2].join('.');
    }
    return false;
  }
  function getInner() {
    var reg = /MicroMessenger\/[\d\.]+\(0x(.+?)\)/i;
    var ret = ua.match(reg);
    if (ret && ret[1] && ret[1] != null) {
      return ret[1];
    }
    if (!ret && /MicroMessenger\/[\d\.]+/i.test(ua)) {
      var urlParams = getUrlParams();
      if (urlParams.version) {
        return urlParams.version;
      }
    }
    return false;
  }
  var opfunc = {
    'cp-1': function cp1(a, b) {
      return a < b;
    },
    cp0: function cp0(a, b) {
      return a === b;
    },
    cp1: function cp1(a, b) {
      return a > b;
    }
  };
  function cpVersion(ver, op, canEq, type) {
    var mmver = false;
    switch (type) {
      case 'mac':
        mmver = getMac();
        break;
      case 'windows':
        mmver = getWindowsVersionFormat();
        break;
      case 'wxwork':
        mmver = getWxWork();
        break;
      case 'mpapp':
        mmver = getMpApp();
        break;
      default:
        mmver = get();
        break;
    }
    if (!mmver) {
      return;
    }

    var mmversion = mmver.split('.');
    var version = ver.split('.');
    if (!/\d+/g.test(mmversion[mmversion.length - 1])) {
      mmversion.pop();
    }
    for (var i = 0, len = Math.max(mmversion.length, version.length); i < len; ++i) {
      var mmv = mmversion[i] || '';
      var v = version[i] || '';
      var mmvn = parseInt(mmv, 10) || 0;
      var vn = parseInt(v, 10) || 0;
      var eq = opfunc.cp0(mmvn, vn);
      if (eq) {
        continue;
      }
      var cp = opfunc["cp".concat(op)];
      return cp(mmvn, vn);
    }
    return canEq || op === 0;
  }
  function eqVersion(version) {
    return cpVersion(version, 0);
  }
  function gtVersion(version, canEq) {
    return cpVersion(version, 1, canEq);
  }
  function ltVersion(version, canEq) {
    return cpVersion(version, -1, canEq);
  }
  function getPlatform() {
    if (is_ios) {
      return 'ios';
    } else if (is_android) {
      return 'android';
    } else if (is_mac) {
      return 'mac_os';
    } else if (is_windows) {
      return 'windows';
    }
    return 'unknown';
  }
  var is_google_play = false;
  var inner_ver_for_google_play_check = getInner();
  if (is_android && inner_ver_for_google_play_check) {
    var v = '0x' + inner_ver_for_google_play_check.substr(-2);
    if (parseInt(v) >= 64 && parseInt(v) <= 79) {
      is_google_play = true;
    }
  }
  var mmversion = {
    get: get,
    getMac: getMac,
    getMacOS: getMacOS,
    getWindows: getWindows,
    getInner: getInner,
    getWxWork: getWxWork,
    getMpApp: getMpApp,
    cpVersion: cpVersion,
    eqVersion: eqVersion,
    gtVersion: gtVersion,
    ltVersion: ltVersion,
    getPlatform: getPlatform,
    getVersionNumber: getVersionNumber,
    isWp: is_wp,
    isIOS: is_ios,
    isAndroid: is_android,
    isInMiniProgram: is_in_miniProgram,
    isWechat: is_wechat,
    isMac: is_mac,
    isWindows: is_windows,
    isMacWechat: is_mac_wechat,
    isWindowsWechat: is_windows_wechat,
    isWxWork: is_wx_work,
    isOnlyWechat: is_wechat && !is_wx_work,
    isMpapp: is_mpapp,
    isNewMpApp: is_mpapp && cpVersion('3.0.0', 1, true, 'mpapp'),
    isIPad: is_ipad,
    isGooglePlay: is_google_play,
    isPrefetch: is_prefetch,
    isDonutAPP: is_donut_app
  };

  var initJsBridge = false;
  var JSAPIEventCallbackMap$1 = {};
  function connectWebViewJavascriptBridge(callback) {
    if (window.WebViewMPapp || window.WebViewJavascriptBridge) {
      return callback(window.WebViewMPapp || window.WebViewJavascriptBridge);
    }
    if (window.WVJBCallbacks) {
      return window.WVJBCallbacks.push(callback);
    }
    window.WVJBCallbacks = [callback];
    if (!initJsBridge) {
      initJsBridge = true;
      var WVJBIframe = document.createElement('iframe');
      WVJBIframe.style.display = 'none';
      WVJBIframe.src = 'https://__bridge_loaded__';
      document.body.appendChild(WVJBIframe);
      setTimeout(function () {
        initJsBridge = false;
        document.body.removeChild(WVJBIframe);
      }, 0);
    }
    return false;
  }
  function invoke$1(jsapiName, opt, callback) {
    connectWebViewJavascriptBridge(function (bridge) {
      try {
        if (typeof opt === 'function') {
          callback = opt;
        }
        if (_typeof(opt) !== 'object') {
          opt = {};
        }
        bridge.callHandler(jsapiName, opt, function (res) {
          try {
            var ret = _typeof(res) === 'object' ? res : JSON.parse(res);
            var errMsg = ret.err_msg || ret.errMsg;
            console.info("[mpapp jsapi] invoke->".concat(jsapiName, " ").concat(opt.action || '', " ").concat(errMsg));
            typeof callback === 'function' && callback(ret);
          } catch (e) {
            window.WX_BJ_REPORT.BadJs.report('invoke', "callback ".concat(jsapiName, " error:"), {
              mid: 'mmbizwebapp:js_brridge',
              _info: e
            });
            console.error("[mpapp jsapi] ".concat(jsapiName, " ").concat(opt.action || ''), e, res);
          }
        });
      } catch (e) {
        window.WX_BJ_REPORT.BadJs.report('invoke', 'callback error:', {
          mid: 'mmbizwebapp:js_brridge',
          _info: e
        });
        console.error('[mpapp jsapi]', e);
      }
    });
  }
  function on$1(eventName, callback) {
    connectWebViewJavascriptBridge(function (bridge) {
      if (!JSAPIEventCallbackMap$1[eventName]) {
        JSAPIEventCallbackMap$1[eventName] = [];
      }
      JSAPIEventCallbackMap$1[eventName].push(callback);
      if (JSAPIEventCallbackMap$1[eventName].length > 1) {
        return false;
      }
      try {
        bridge.registerHandler(eventName, function () {
          for (var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++) {
            args[_key] = arguments[_key];
          }
          try {
            var data = typeof args[0] === 'string' ? JSON.parse(args[0]) : args[0];
            console.info('[mpapp jsapi] event->' + eventName + ' ' + data.err_msg);
            if (JSAPIEventCallbackMap1[eventName].length) {
              var result;
              for (var i = 0; i < JSAPIEventCallbackMap$1[eventName].length; i++) {
                result = JSAPIEventCallbackMap$1[eventName][i].apply(window, [data].concat(args.slice(1)));
              }
              return result;
            }
          } catch (e) {
            window.WX_BJ_REPORT.BadJs.report('on', "callback ".concat(eventName, " error:"), {
              mid: 'mmbizwebapp:js_brridge',
              _info: e
            });
            console.error('[mpapp jsapi] ' + eventName, e, args[0]);
          }
        });
      } catch (e) {
        window.WX_BJ_REPORT.BadJs.report('on', 'callback error:', {
          mid: 'mmbizwebapp:js_brridge',
          _info: e
        });
        console.error('[mpapp jsapi]', e);
      }
    });
  }
  function remove$1(eventName, callback) {
    connectWebViewJavascriptBridge(function () {
      if (!JSAPIEventCallbackMap$1[eventName]) {
        return false;
      }
      var result = false;
      for (var i = JSAPIEventCallbackMap$1[eventName].length - 1; i >= 0; i--) {
        if (JSAPIEventCallbackMap$1[eventName][i] === callback) {
          JSAPIEventCallbackMap$1[eventName].splice(i, 1);
          result = true;
        }
      }
      return result;
    });
  }

  var doc = {};
  var isAcrossOrigin = false;
  var __moon_report = window.__moon_report || function () {};
  var MOON_JSAPI_KEY_OFFSET = 8;
  try {
    doc = top.window.document;
  } catch (e) {
    isAcrossOrigin = true;
  }
  var JSAPIEventCallbackMap = {};
  function ready(onBridgeReady) {
    var bridgeReady = function bridgeReady() {
      try {
        if (onBridgeReady) {
          window.onBridgeReadyTime = window.onBridgeReadyTime || Date.now();
          onBridgeReady();
        }
      } catch (e) {
        __moon_report([{
          offset: MOON_JSAPI_KEY_OFFSET,
          log: 'ready',
          e: e
        }]);
        throw e;
      }
      window.jsapiReadyTime = Date.now();
    };
    if (!isAcrossOrigin && (typeof top.window.WeixinJSBridge === 'undefined' || !top.window.WeixinJSBridge.invoke)) {
      if (doc.addEventListener) {
        doc.addEventListener('WeixinJSBridgeReady', bridgeReady, false);
      } else if (doc.attachEvent) {
        doc.attachEvent('WeixinJSBridgeReady', bridgeReady);
        doc.attachEvent('onWeixinJSBridgeReady', bridgeReady);
      }
    } else {
      bridgeReady();
    }
  }
  function invoke(methodName, args, callback) {
    ready(function () {
      if (isAcrossOrigin) return false;
      if (_typeof(top.window.WeixinJSBridge) !== 'object') {
        alert('请在微信中打开此链接');
        return false;
      }
      top.window.WeixinJSBridge.invoke(methodName, args, function () {
        try {
          for (var _len = arguments.length, rets = new Array(_len), _key = 0; _key < _len; _key++) {
            rets[_key] = arguments[_key];
          }
          var ret = rets[0];
          var errMsg = ret && ret.err_msg ? ', err_msg-> ' + ret.err_msg : '';
          console.info('[jsapi] invoke->' + methodName + errMsg);
          if (callback) {
            callback.apply(window, rets);
          }
        } catch (e) {
          __moon_report([{
            offset: MOON_JSAPI_KEY_OFFSET,
            log: 'invoke;methodName:' + methodName,
            e: e
          }]);
          throw e;
        }
      });
    });
  }

  function call(methodName) {
    ready(function () {
      if (isAcrossOrigin) return false;
      if (_typeof(top.window.WeixinJSBridge) !== 'object') {
        return false;
      }
      try {
        top.window.WeixinJSBridge.call(methodName);
      } catch (e) {
        __moon_report([{
          offset: MOON_JSAPI_KEY_OFFSET,
          log: 'call;methodName:' + methodName,
          e: e
        }]);
        throw e;
      }
    });
  }

  function on(eventName, callback) {
    ready(function () {
      if (isAcrossOrigin) return false;
      if (_typeof(top.window.WeixinJSBridge) !== 'object' || !top.window.WeixinJSBridge.on) {
        return false;
      }
      if (!JSAPIEventCallbackMap[eventName]) {
        JSAPIEventCallbackMap[eventName] = [];
      }
      JSAPIEventCallbackMap[eventName].push(callback);
      if (JSAPIEventCallbackMap[eventName].length > 1) {
        return false;
      }
      top.window.WeixinJSBridge.on(eventName, function () {
        try {
          for (var _len2 = arguments.length, rets = new Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
            rets[_key2] = arguments[_key2];
          }
          var ret = rets[0];
          var errMsg = ret && ret.err_msg ? ', err_msg-> ' + ret.err_msg : '';
          console.info('[jsapi] event->' + eventName + errMsg);
          if (JSAPIEventCallbackMap[eventName] && JSAPIEventCallbackMap[eventName].length) {
            var result;
            for (var i = 0; i < JSAPIEventCallbackMap[eventName].length; i++) {
              result = JSAPIEventCallbackMap[eventName][i].apply(window, rets);
            }
            return result;
          }
        } catch (e) {
          __moon_report([{
            offset: MOON_JSAPI_KEY_OFFSET,
            log: 'on;eventName:' + eventName,
            e: e
          }]);
          throw e;
        }
      });
    });
  }

  function remove(eventName, callback) {
    ready(function () {
      if (!JSAPIEventCallbackMap[eventName]) {
        return false;
      }
      var result = false;
      for (var i = JSAPIEventCallbackMap[eventName].length - 1; i >= 0; i--) {
        if (JSAPIEventCallbackMap[eventName][i] === callback) {
          JSAPIEventCallbackMap[eventName].splice(i, 1);
          result = true;
        }
      }
      return result;
    });
  }
  var JSAPI = mmversion.isNewMpApp ? {
    ready: connectWebViewJavascriptBridge,
    invoke: invoke$1,
    call: invoke$1,
    on: on$1,
    remove: remove$1
  } : {
    ready: ready,
    invoke: invoke,
    call: call,
    on: on,
    remove: remove
  };
  var setImmersiveMode = function setImmersiveMode(itemShowType) {
    var envStr = window.__wxWebEnv && typeof window.__wxWebEnv.getEnv === 'function' && window.__wxWebEnv.getEnv();
    if (!envStr) return;
    var envObj = {};
    if (!envStr) return;
    try {
      envObj = JSON.parse(envStr);
    } catch (err) {
      console.info(err);
    }
    var immersiveListMode = envObj.immersiveListMode || 0;
    window.__immersiveListMode = immersiveListMode;
    window.__test_immersive_list = 0;
    if (window.__test_immersive_list) {
      window.__immersiveListMode = 1;
    }
    var wxExpandArticleEle = document.getElementById('wx_expand_article');
    document.getElementById('js_article');
    var bottomLoadingTip = document.getElementById('js_network_msg_wrp');
    if (!itemShowType && itemShowType !== 0) {
      itemShowType = window.item_show_type;
    }
    itemShowType = Number(itemShowType);

    if (window.__immersiveListMode) {
      try {
        var immersiveSafeBottom = localStorage.getItem('__immersivefeed_safe_bottom__');
        if (immersiveSafeBottom) {
          document.documentElement.style.setProperty('--immersive-safe-bottom', immersiveSafeBottom);
        }
      } catch (error) {
        console.log(error);
      }
      if (wxExpandArticleEle) {
        wxExpandArticleEle.style.display = 'block';
      }
      if (bottomLoadingTip) {
        bottomLoadingTip.style.display = 'none';
      }
      if (itemShowType === 10 || itemShowType === 7) {
        document.body.classList.add('ellapse_short_content');
      } else {
        document.body.classList.add('ellapse_stream_article');
      }
      if (itemShowType === 0) {
        document.body.classList.add('article_extensive_background');
      } else {
        document.body.classList.add('media_content_extensive_background');
      }
      var interactionPlaceholderEle = document.getElementById('js_interaction_placeholder');
      if (interactionPlaceholderEle) {
        interactionPlaceholderEle.style.display = 'block';
      }
    }
    testOpenStreamJSAPI();
  };
  function testOpenStreamJSAPI() {
    var testStreamBtn = document.getElementById('test_open_stream');
    if (!testStreamBtn) return;
    if (window.__immersiveListMode) {
      testStreamBtn.style.display = 'none';
    }
    var articleList = [{
      "type": 1,
      "url": "https://mp.weixin.qq.com/s/XvRKXjbJvBXVv_G3vvNUvw",
      "title": '无锡经开区十大运动休闲好去处',
      "itemShowType": 0,
      "username": "gh_298c72cd44fe"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s?ranksessionid=1701688162&__biz=MzA3NzE4NTU3Mw==&mid=2247484796&idx=1&sn=c4ffebacfbbca5d97b5eb28ea228edf4&chksm=9f549236a8231b202a3f94f5139a617931f72609801cb7f53dbf0280b122a8ebbd95d2e3b7ed&scene=169&subscene=90&sessionid=1701688162&clicktime=1701688195&enterid=1701688195&ascene=0&realreporttime=1701688195862&devicetype=android-33&version=28002b75&nettype=WIFI&lang=zh_CN&exportkey=n_ChQIAhIQyrZ0kuQbh9ck1nGLQ9fL%2FRLcAQIE97dBBAEAAAAAAKKxIRDG0z0AAAAOpnltbLcz9gKNyK89dVj0TpgwybW22qvMRzq50BtZTd3zb39HujrSpGnyTIZe68fpwQXMIoyn4pakX8tnxJskXFYYtNCAiEAY6q1q8gvGdTpcAulTiB3JMMQx7g7VaZ4p97aEMIrls4kmVTs9JyyZhcyKeF6qmEmfkA50n8%2BEpTRJb1tjMYy0EAThLWQi%2BNC69lH68fk1f2zPn3bOD3vDCn9RtO78kBC9tWuDDvoMRlYJ0c72VQbQHRf319k2OxJxopwf%2Fng%3D&pass_ticket=MuXMZO9uglFgwyFe3Blu6BIbW0CHGVzAvF4xV1mHwrKzVbYGqIMQ4TsyzX36sXCdW%2B1%2FSCEXvjouP%2B%2FaA0jvkg%3D%3D&wx_header=3&forceh5=1",
      "title": '腾讯视频12.03故障预复盘',
      "itemShowType": 0,
      "username": "gh_5084f015ecf3"
    }, {
      "type": 2,
      "finderExportId": "export/UzFfAgtgekIEAQAAAAAAU-YVTuPA_QAAAAstQy6ubaLX4KHWvLEZgBPEi6MwdnsbD8uAzNPgMItcUuI0TtttbQhl_sY-7Uy3"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s/d_naj_sqXIPuQvP7XLljSg",
      "title": '锅包肉家庭做法，记住这两点，酸甜酥脆不回软，跟饭店做的一样香',
      "itemShowType": 8,
      "username": "gh_259659915c48"
    }, {
      itemShowType: 8,
      title: '北海道雪景',
      type: 1,
      url: "https://mp.weixin.qq.com/s?ranksessionid=1701686669&__biz=MjM5OTg3NDM0OQ==&mid=2651083383&idx=1&sn=76417f9f4bcf34845801e375e3a2c123&chksm=bcc428358bb3a12349f78894b52215050cd37a3533f6443cb96869508242981811ba289b03ae&scene=169&subscene=90&sessionid=1701686669&clicktime=1701686705&enterid=1701686705&ascene=0&realreporttime=1701686705675&devicetype=android-33&version=28002b75&nettype=WIFI&lang=zh_CN&exportkey=n_ChQIAhIQ%2FIxEWN1%2FF8Fu04ilrhVmyxLcAQIE97dBBAEAAAAAAGaPFvSlCzUAAAAOpnltbLcz9gKNyK89dVj0r22ddB%2FJL5uoZ7WJMX8GjBcG4wuwus%2BmFhxA5%2FIS7%2FmyKn0v3qNn2TpALU8q8ynAeKGcZLxI04Fjh16dFdu9oLLo%2BBpYti8LJ0Nb%2Fw4wfYnwFHcQd1OzPuX%2FvOojUIu82fy6HTi9f40VEU7EcMk%2BkqG2kzBbzA%2BlSrQuNAHMvCm9cMiyyZrv5ye%2BTBZm3HDTydyhk300GQ3lW2LyXFus6e6YKHNBObxxWPfNx5gmWtsoKzoZ3gU%3D&pass_ticket=MuXMZO9uglFgwyFe3Blu6BIbW0CHGVzAvF4xV1mHwrK1L%2BPkDcLxuNgsCq%2F7unCb7cM5%2B6FXSeJoBWCB4dl1BQ%3D%3D&wx_header=3&forceh5=1",
      username: "gh_20fa395c3183"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s/m5dqi41wQ0eErH932nfQAg",
      "title": '过年特色丸子汤：开胃解腻，清淡美味做法简单，流口水',
      "itemShowType": 8,
      "username": "gh_259659915c48"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s?chksm=c0d6999bf7a1108df03aaaae5c369d39f13b1450f0b76c96b07c7b902df81a94f07fbd0918b3&exptype=unsubscribed_card_recommend_video_u2i_mainprocess_coarse_sort_tlfeeds&ranksessionid=1701686669&mid=2247484691&sn=9264cbd5e195a3972d8237e1147cdcbf&idx=1&__biz=MzkwNzUyOTcwMw%3D%3D&scene=169&subscene=200&sessionid=1701686669&flutter_pos=35&clicktime=1701687194&enterid=1701687194&finder_biz_enter_id=5&ascene=56&realreporttime=1701687194084&devicetype=android-33&version=28002b75&nettype=WIFI&lang=zh_CN&session_us=gh_ec1dd662c114&exportkey=n_ChQIAhIQ5Ba5ow31yRLt5V5uMLPO7RLrAQIE97dBBAEAAAAAAFu4Aii0MFoAAAAOpnltbLcz9gKNyK89dVj0Ul5iiIxDR4Jz%2BCkrgtTD%2BCUdvwU7LnnRjKxnVbW3RPSoVOmHiSFcxJAvRSUjctdT%2FaVIxBk6WDJ3V5TFVGz2v8jy1wfiFDMC6JRzDS58rqUfohmtxi%2BCcuFCJ3wPD6ROGov0YZwhaTew%2BPfwvqsN4mHpyGG4pQdgnGVOEPgDT9MO8Qt%2BbXyLJmJ8C7KMP2cCBzO59WAELsDJbs9UAoQe9kF90PUf04gOOxGau64FLalAweyDF%2Fdr01Mf%2FU%2FBmtgDldQhudI%3D&pass_ticket=MuXMZO9uglFgwyFe3Blu6BIbW0CHGVzAvF4xV1mHwrIjzzVp3fa0dcqvoTfozsgSSlJLW5QSNiDyZDs%2FLy01eg%3D%3D&wx_header=3&forceh5=1",
      "title": '广州老字号肠粉店，不小心把布拉肠做到广州第一，40年食客不断',
      "itemShowType": 5,
      "username": "gh_ec1dd662c114"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s/0OYNlL5WuqRU3nNlgADkxw",
      "title": '家人最爱吃的肉馅饼，不揉面不擀皮，个个皮薄大馅，咬一口满嘴香',
      "itemShowType": 8,
      "username": "gh_259659915c48"
    }, {
      "type": 1,
      "url": "https://mp.weixin.qq.com/s?__biz=MzA4MTA0MTkzMA==&mid=2247506505&idx=1&sn=fb7775c15cf3ffc133793b316c7841c8&chksm=9f99952ca8ee1c3afa8891b2d79ca4231800b758be361f34a1846f7671557b17fffde8349893&sessionid=1701687341&scene=126&subscene=0&clicktime=1701687377&enterid=1701687377&ascene=3&realreporttime=1701687377920&devicetype=android-33&version=28002b75&nettype=WIFI&lang=zh_CN&session_us=gh_8b73de0e711c&exportkey=n_ChQIAhIQUzmd0zbe5NtEkyXbj%2BEZtBLrAQIE97dBBAEAAAAAABoYI7ZqR7YAAAAOpnltbLcz9gKNyK89dVj0y%2B0%2FgHGKlHe1NNChM33CkVCDPg1yG4CnZQc1bQUwdnx7th1vep8%2BDnyIwWE5HMyhA0G8gM%2FdiufAlFOFMqyKfBLIvdlxUVY7qBjJBfRIfchjmGMPNCVgVBfmjDa39jhWGmzketwegugLwtS%2BVbrbgwWjvlxJco4fuBtIR27JVTep7YLN8uNeZO0cKbwmwsoEwqotcNo5Y7Jgn6ABXFrPJypXcz5osDxWJNgw0B6RhDSsvm89crJ3VAoKTyeUT166zBAcu7I%3D&pass_ticket=MuXMZO9uglFgwyFe3Blu6BIbW0CHGVzAvF4xV1mHwrILPxG5Akv%2BCY4scnurLp%2FdyMOInQ%2BD7NTHO37x4KNrPQ%3D%3D&wx_header=3&forceh5=1",
      "title": '吃那就是解放军佳佳春节放假佳佳吹风机',
      "itemShowType": 10,
      "username": "gh_8b73de0e711c"
    }];
    var randomArticleList = articleList;
    testStreamBtn.addEventListener('click', function () {
      var params = {
        action: 'openImmerseList',
        immerseItemList: [{
          type: 1,
          url: window.location.href || '',
          title: window.msg_title.htmlDecode() || window.cgiData.title || '',
          itemShowType: Number(window.item_show_type) || 0,
          username: window.user_name || window.cgiData.user_name || ''
        }].concat(randomArticleList),
        enterScene: 2
      };

      JSAPI.invoke('handleMPPageAction', params, function (res) {
        if (res.err_msg && res.err_msg.indexOf('ok') > 0) {
          weui.toast('成功');
        } else {
          weui.toast('失败');
        }
      });
    });
  }
  if (!window.__second_open__) {
    setImmersiveMode();
  }

  return setImmersiveMode;

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function () {
  'use strict';

  

  

  var getIpWoridng = function getIpWoridng(ipConfig) {
    var ipWording = '';
    if (parseInt(ipConfig.countryId, 10) === 156) {
      ipWording = ipConfig.provinceName;
    } else if (ipConfig.countryId) {
      ipWording = ipConfig.countryName;
    }
    return ipWording;
  };
  var __setIpWording = function __setIpWording(ipConfig, userInfo) {
    var ipWrp = document.getElementById('js_ip_wording_wrp');
    var ipWording = document.getElementById('js_ip_wording');
    if (ipConfig) {
      window.ip_wording = {
        countryName: ipConfig.country_name,
        countryId: ipConfig.country_id,
        provinceName: ipConfig.province_name
      };
    }
    if (userInfo && userInfo.isoversea) {
      window.is_over_sea = parseInt(userInfo.isoversea, 10);
    }
    if (window.ip_wording && ipWrp && ipWording && window.is_over_sea !== 1) {
      var ipWordingDisplay = getIpWoridng(window.ip_wording);
      if (ipWordingDisplay !== '') {
        ipWording.innerHTML = ipWordingDisplay;
        ipWrp.style.display = 'inline-block';
      }
    }
  };
  if (!window.__second_open__) {
    __setIpWording();
    window.__setIpWording = __setIpWording;
  }

  return __setIpWording;

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function () {
  'use strict';

  

  var dealLikeReadShow_en = function dealLikeReadShow_en(realNum) {
    if (typeof LANG === 'undefined' || !LANG) {
      return parseInt(realNum) === 0 ? '' : realNum;
    }
    if (LANG == 'en') {
      var showHTML = '';
      if (parseInt(realNum) > 100000) {
        showHTML = 100 + 'k+';
      } else if (parseInt(realNum) > 10000 && parseInt(realNum) <= 100000) {
        var num = '' + parseInt(realNum) / 1000;
        var dotIndex = num.indexOf('.');
        if (dotIndex === -1) {
          showHTML = num + 'k';
        } else {
          showHTML = num.substring(0, dotIndex) + '.' + num.charAt(dotIndex + 1) + 'k';
        }
      } else if (parseInt(realNum) === 0) {
        showHTML = '';
      } else {
        showHTML = realNum;
      }
      return showHTML;
    }
    return '';
  };
  var i18n = {
    dealLikeReadShow_en: dealLikeReadShow_en
  };

  function getWordCount (dom) {
    if (!dom) return 0;
    var textContet = dom.textContent || '';
    var fillCharReg = new RegExp("\u200B", 'g');
    var bookmarkFillCharReg = new RegExp("\u200D", 'g');
    return textContet.replace(fillCharReg, '')
    .replace(bookmarkFillCharReg, '')
    .replace(/(\b|^)\w+(\b|$)/g, '#')
    .replace(/\s/g, '')
    .length;
  }

  function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
  function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
  function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
  
  
  var ua = navigator.userAgent;
  var is_ios = /(iPhone|iPad|iPod|iOS)/i.test(ua);
  var is_wp = /Windows\sPhone/i.test(ua);
  var is_android = /(Android)/i.test(ua);
  var is_wechat = /MicroMessenger\/([\d\.]+)/i.test(ua);
  var is_mac = /mac\sos/i.test(ua) && !is_ios;
  var is_windows = /windows\snt/i.test(ua) && !is_wp;
  var is_mpapp = /MPAPP\/([\d\.]+)/i.test(ua);
  var is_ipad = /iPad/i.test(ua);
  var is_windows_wechat = /WindowsWechat/i.test(ua);
  var is_mac_wechat = /MacWechat/i.test(ua) || /wechat.*mac os/i.test(ua);
  var is_prefetch = is_wechat && window.WeixinPrefecherJSBridge;
  var is_donut_app = /SAAASDK/i.test(ua);
  var is_in_miniProgram = is_android && /miniprogram/.test(ua.toLowerCase()) || window.__wxjs_environment == 'miniprogram';
  var is_wx_work = /wxwork/i.test(ua);
  function getUrlParams() {
    var vars = location.search.substring(1).split('&');
    var params = {};
    var _iterator = _createForOfIteratorHelper(vars),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var ele = _step.value;
        var pair = ele.split('=');
        var key = decodeURIComponent(pair[0]);
        if (typeof params[key] === 'undefined') {
          params[key] = decodeURIComponent(pair[1]);
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
    return params;
  }
  function get() {
    var reg = /MicroMessenger\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMac() {
    var reg = /MacWechat\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMacOS() {
    var reg = /Mac OS X ([\d_]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1].replace(/_/g, '.');
    }
    return false;
  }
  function getWindows() {
    var reg = /WindowsWechat\(0x(.+?)\)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getWxWork() {
    var reg = /wxwork\/([\d\.]+)/i;
    var ret = ua.match(reg);
    if (ret && ret[1]) {
      return ret[1];
    }
    return false;
  }
  function getMpApp() {
    var appVersion = [2, 4, 5];
    var match = navigator.userAgent.match(/MPAPP\/(\d+(\.\d+)*)/);
    if (match) {
      appVersion = match[1].split('.').map(function (v) {
        return Number(v);
      });
    }
    return appVersion.join('.');
  }
  function getVersionNumber(hexStr) {
    return Number(Number('0x' + hexStr).toString(10));
  }
  function getWindowsVersionFormat() {
    var versionInfo = navigator.userAgent.match(/WindowsWechat\(0x(\w+?)\)/);
    if (versionInfo && versionInfo.length === 2) {
      var version = versionInfo[1];
      var mainVersion = getVersionNumber(version.slice(1, 2));
      var subVersion = getVersionNumber(version.slice(2, 4));
      var subVersion2 = getVersionNumber(version.slice(4, 6));
      return [mainVersion, subVersion, subVersion2].join('.');
    }
    return false;
  }
  function getInner$1() {
    var reg = /MicroMessenger\/[\d\.]+\(0x(.+?)\)/i;
    var ret = ua.match(reg);
    if (ret && ret[1] && ret[1] != null) {
      return ret[1];
    }
    if (!ret && /MicroMessenger\/[\d\.]+/i.test(ua)) {
      var urlParams = getUrlParams();
      if (urlParams.version) {
        return urlParams.version;
      }
    }
    return false;
  }
  var opfunc = {
    'cp-1': function cp1(a, b) {
      return a < b;
    },
    cp0: function cp0(a, b) {
      return a === b;
    },
    cp1: function cp1(a, b) {
      return a > b;
    }
  };
  function cpVersion(ver, op, canEq, type) {
    var mmver = false;
    switch (type) {
      case 'mac':
        mmver = getMac();
        break;
      case 'windows':
        mmver = getWindowsVersionFormat();
        break;
      case 'wxwork':
        mmver = getWxWork();
        break;
      case 'mpapp':
        mmver = getMpApp();
        break;
      default:
        mmver = get();
        break;
    }
    if (!mmver) {
      return;
    }

    var mmversion = mmver.split('.');
    var version = ver.split('.');
    if (!/\d+/g.test(mmversion[mmversion.length - 1])) {
      mmversion.pop();
    }
    for (var i = 0, len = Math.max(mmversion.length, version.length); i < len; ++i) {
      var mmv = mmversion[i] || '';
      var v = version[i] || '';
      var mmvn = parseInt(mmv, 10) || 0;
      var vn = parseInt(v, 10) || 0;
      var eq = opfunc.cp0(mmvn, vn);
      if (eq) {
        continue;
      }
      var cp = opfunc["cp".concat(op)];
      return cp(mmvn, vn);
    }
    return canEq || op === 0;
  }
  function eqVersion(version) {
    return cpVersion(version, 0);
  }
  function gtVersion(version, canEq) {
    return cpVersion(version, 1, canEq);
  }
  function ltVersion(version, canEq) {
    return cpVersion(version, -1, canEq);
  }
  function getPlatform() {
    if (is_ios) {
      return 'ios';
    } else if (is_android) {
      return 'android';
    } else if (is_mac) {
      return 'mac_os';
    } else if (is_windows) {
      return 'windows';
    }
    return 'unknown';
  }
  var is_google_play = false;
  var inner_ver_for_google_play_check = getInner$1();
  if (is_android && inner_ver_for_google_play_check) {
    var v = '0x' + inner_ver_for_google_play_check.substr(-2);
    if (parseInt(v) >= 64 && parseInt(v) <= 79) {
      is_google_play = true;
    }
  }
  var mmVersion = {
    get: get,
    getMac: getMac,
    getMacOS: getMacOS,
    getWindows: getWindows,
    getInner: getInner$1,
    getWxWork: getWxWork,
    getMpApp: getMpApp,
    cpVersion: cpVersion,
    eqVersion: eqVersion,
    gtVersion: gtVersion,
    ltVersion: ltVersion,
    getPlatform: getPlatform,
    getVersionNumber: getVersionNumber,
    isWp: is_wp,
    isIOS: is_ios,
    isAndroid: is_android,
    isInMiniProgram: is_in_miniProgram,
    isWechat: is_wechat,
    isMac: is_mac,
    isWindows: is_windows,
    isMacWechat: is_mac_wechat,
    isWindowsWechat: is_windows_wechat,
    isWxWork: is_wx_work,
    isOnlyWechat: is_wechat && !is_wx_work,
    isMpapp: is_mpapp,
    isNewMpApp: is_mpapp && cpVersion('3.0.0', 1, true, 'mpapp'),
    isIPad: is_ipad,
    isGooglePlay: is_google_play,
    isPrefetch: is_prefetch,
    isDonutAPP: is_donut_app
  };

  
  var isIOS = mmVersion.isIOS,
    getInner = mmVersion.getInner,
    isAndroid = mmVersion.isAndroid;
  var formatReadNum = function formatReadNum(value) {
    if (window.LANG === 'en') {
      return i18n.dealLikeReadShow_en(value);
    }
    var result = '';
    if (parseInt(value, 10) > 100000) {
      result = '10万+';
    } else if (parseInt(value, 10) > 10000 && parseInt(value, 10) <= 100000) {
      var num = '' + parseInt(value, 10) / 10000;
      var dotIndex = num.indexOf('.');
      if (dotIndex === -1) {
        result = num + '万';
      } else {
        result = num.substr(0, dotIndex) + '.' + num.charAt(dotIndex + 1) + '万';
      }
    } else if (parseInt(value, 10) === 0) {
      result = '';
    } else {
      result = value || '';
    }
    return result;
  };
  var __setTingHeard = function __setTingHeard(container, dom, cnt, isTempUrl) {
    var articleWordCnt = getWordCount(container || document.querySelector('#js_content'));
    window.article_word_cnt = articleWordCnt;
    if (!dom || articleWordCnt <= 300 || isTempUrl) return;
    if (isIOS && getInner() >= '18002622' || isAndroid && getInner() >= '2800253A') {
      if (cnt > 100000) dom.innerText = "".concat(formatReadNum(cnt), "听过");else if (cnt > 0) dom.innerText = "".concat(formatReadNum(cnt), "人听过");else {
        dom.innerText = "听全文";
      }
      dom.style.removeProperty('display');
    }
  };
  if (!window.__second_open__) {
    var tempkey = window.tempkey || '';
    var tingHeardDom = document.querySelector('#js_ting_heard');
    var tingIsShow = window.tts_is_show || '';
    var tingHeardCnt = window.tts_heard_person_cnt || '';
    console.log('tingIsShow, tingHeardCnt', tingIsShow, tingHeardCnt);
    !!(tingIsShow * 1) && __setTingHeard(document.querySelector('#js_content'), tingHeardDom, tingHeardCnt * 1, !!tempkey);
    window.__setTingHeard = __setTingHeard;
  }

  return __setTingHeard;

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>(function () {
  'use strict';

  function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
      throw new TypeError("Cannot call a class as a function");
    }
  }

  function _typeof(obj) {
    "@babel/helpers - typeof";

    return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
      return typeof obj;
    } : function (obj) {
      return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
    }, _typeof(obj);
  }

  function _toPrimitive(input, hint) {
    if (_typeof(input) !== "object" || input === null) return input;
    var prim = input[Symbol.toPrimitive];
    if (prim !== undefined) {
      var res = prim.call(input, hint || "default");
      if (_typeof(res) !== "object") return res;
      throw new TypeError("@@toPrimitive must return a primitive value.");
    }
    return (hint === "string" ? String : Number)(input);
  }

  function _toPropertyKey(arg) {
    var key = _toPrimitive(arg, "string");
    return _typeof(key) === "symbol" ? key : String(key);
  }

  function _defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];
      descriptor.enumerable = descriptor.enumerable || false;
      descriptor.configurable = true;
      if ("value" in descriptor) descriptor.writable = true;
      Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor);
    }
  }
  function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) _defineProperties(Constructor.prototype, protoProps);
    if (staticProps) _defineProperties(Constructor, staticProps);
    Object.defineProperty(Constructor, "prototype", {
      writable: false
    });
    return Constructor;
  }

  function _setPrototypeOf(o, p) {
    _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function _setPrototypeOf(o, p) {
      o.__proto__ = p;
      return o;
    };
    return _setPrototypeOf(o, p);
  }

  function _inherits(subClass, superClass) {
    if (typeof superClass !== "function" && superClass !== null) {
      throw new TypeError("Super expression must either be null or a function");
    }
    subClass.prototype = Object.create(superClass && superClass.prototype, {
      constructor: {
        value: subClass,
        writable: true,
        configurable: true
      }
    });
    Object.defineProperty(subClass, "prototype", {
      writable: false
    });
    if (superClass) _setPrototypeOf(subClass, superClass);
  }

  function _assertThisInitialized(self) {
    if (self === void 0) {
      throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
    }
    return self;
  }

  function _possibleConstructorReturn(self, call) {
    if (call && (_typeof(call) === "object" || typeof call === "function")) {
      return call;
    } else if (call !== void 0) {
      throw new TypeError("Derived constructors may only return object or undefined");
    }
    return _assertThisInitialized(self);
  }

  function _getPrototypeOf(o) {
    _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function _getPrototypeOf(o) {
      return o.__proto__ || Object.getPrototypeOf(o);
    };
    return _getPrototypeOf(o);
  }

  var classWhiteList = ['rich_pages', 'blockquote_info', 'blockquote_biz', 'blockquote_other', 'blockquote_article', 'h5_image_link', 'img_loading', 'list-paddingleft-1', 'list-paddingleft-2', 'list-paddingleft-3', 'selectTdClass', 'noBorderTable', 'ue-table-interlace-color-single', 'ue-table-interlace-color-double', '__bg_gif', 'weapp_text_link', 'weapp_image_link', 'qqmusic_area', 'tc', 'tips_global', 'unsupport_tips', 'qqmusic_wrp', 'appmsg_card_context', 'appmsg_card_active', 'qqmusic_bd', 'play_area', 'icon_qqmusic_switch', 'pic_qqmusic_default', 'qqmusic_thumb', 'access_area', 'qqmusic_songname', 'qqmusic_singername', 'qqmusic_source', 'share_audio_context', 'flex_context', 'pages_reset', 'share_audio_switch', 'icon_share_audio_switch', 'share_audio_info', 'flex_bd', 'share_audio_title', 'share_audio_tips', 'share_audio_progress_wrp', 'share_audio_progress', 'share_audio_progress_inner', 'share_audio_progress_buffer', 'share_audio_progress_loading', 'share_audio_progress_loading_inner', 'share_audio_progress_handle', 'share_audio_desc', 'share_audio_length_current', 'share_audio_length_total', 'video_iframe', 'vote_iframe', 'res_iframe', 'card_iframe', 'weapp_display_element', 'weapp_card', 'app_context', 'weapp_card_bd', 'weapp_card_profile', 'radius_avatar', 'weapp_card_avatar', 'weapp_card_nickname', 'weapp_card_info', 'weapp_card_title', 'weapp_card_thumb_wrp', 'weapp_card_ft', 'weapp_card_logo', 'pay', 'pay__mask', 'ct_geography_loc_tip', 'subsc_context', 'subsc_btn', 'reset_btn', 'icon_subsc', 'weui-primary-loading', 'weui-primary-loading__dot', 'wxw-img', 'mp-caret', 'appmsg_poi_iframe', 'cpc_iframe', 'channels_iframe_wrp', 'channels_iframe', 'videosnap_video_iframe', 'videosnap_live_iframe', 'videosnap_image_iframe', 'channels_live_iframe', 'minishop_iframe_wrp', 'minishop_iframe', 'mp_profile_iframe', 'mp_profile_iframe_wrp', 'mp_search_iframe_wrp', 'appmsg_search_iframe_wrp', 'appmsg_search_iframe', 'vote_area', 'vote_iframe', 'mp_vote_iframe_wrp', 'mp_vote_iframe', 'qqmusic_iframe', 'blockquote_iframe', 'blockquote_tips_iframe', 'video_iframe', 'shopcard_iframe', 'topic_iframe', 'weapp_app_iframe', 'img_fail_iframe', 'mp_miniprogram_iframe', 'appmsg_cpslink_iframe', 'js_editor_mpcpslink', 'mp-cpslink-iframe-wrp', 'mp_common_sticker_iframe', 'mp_common_sticker_iframe_wrp', 'mp_common_product_iframe', 'mp_common_product_iframe_wrp', 'new_cps_iframe'];
  var classWhiteListReg = [new RegExp('^editor__content__'), new RegExp('^wxw'), new RegExp('^js_'), new RegExp('^cps_inner'), new RegExp('^bizsvr_'),
  new RegExp('^code-snippet'),
  new RegExp('^wx_'),
  new RegExp('^wx-'),
  new RegExp('^icon_emoji_'),
  new RegExp('^custom_select_card')
  ];

  var contentStyle = {
    classWhiteList: classWhiteList,
    classWhiteListReg: classWhiteListReg
  };

  function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function _createSuperInternal() { var Super = _getPrototypeOf(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = _getPrototypeOf(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return _possibleConstructorReturn(this, result); }; }
  function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }
  function DomFilter (cgiOptData) {
    return function (Plugin) {
      var isMMVersionSetted = false;
      var contentDom = document.getElementById('js_content');
      var classWhiteList = contentStyle.classWhiteList,
        classWhiteListReg = contentStyle.classWhiteListReg;
      var removeClassByWhiteList = function removeClassByWhiteList(node) {
        var classAttr = node.getAttribute('class');
        if (classAttr) {
          var classList = classAttr.split(/\s+/);
          var newClassList = [];
          for (var i = 0, len = classList.length; i < len; ++i) {
            var className = classList[i];
            if (className && classWhiteList.indexOf(className) != -1) {
              newClassList.push(className);
            } else {
              for (var j = 0, jl = classWhiteListReg.length; j < jl; j++) {
                if (classWhiteListReg[j].test(className)) {
                  newClassList.push(className);
                  break;
                }
              }
            }
          }
          node.setAttribute('class', newClassList.join(' '));
        }
      };
      var langBlackList = ['zh-cn', 'en-us'];
      var removeLangByBlackList = function removeLangByBlackList(node) {
        var langAttr = node.getAttribute('lang');
        if (langAttr) {
          var lang = langAttr.toLowerCase();
          for (var i = 0; i < langBlackList.length; i++) {
            if (lang === langBlackList[i]) {
              node.removeAttribute('lang');
              return;
            }
          }
        }
      };
      var isAccessMode = window.localStorage.getItem('isMpUserAccessibility');
      var isCarton = (cgiOptData === null || cgiOptData === void 0 ? void 0 : cgiOptData.copyright_info.is_cartoon_copyright) || (cgiOptData === null || cgiOptData === void 0 ? void 0 : cgiOptData.user_info.is_care_mode) || isAccessMode === '1';
      var bgPlaceholder = 'url("data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==")';
      var lazyloadBackgroundImage = function lazyloadBackgroundImage(node) {
        if (window.__second_open__ && !isCarton && node && node.style && typeof node.getAttribute === 'function' && !node.getAttribute('data-lazy-bgimg')) {
          var bgImg = node.style.backgroundImage;
          var bgImgUrl = bgImg && bgImg.match(/url\(['"]?(.*?)['"]?\)/);
          if (bgImgUrl && bgImgUrl[1]) {
            node.style.backgroundImage = bgImg.replace(/url\(['"]?.*?['"]?\)/, bgPlaceholder);
            node.setAttribute('data-lazy-bgimg', bgImgUrl[1]);
            node.classList.add('wx_imgbc_placeholder');
          }
        }
      };
      return function (_Plugin) {
        _inherits(_class, _Plugin);
        var _super = _createSuper(_class);
        function _class() {
          _classCallCheck(this, _class);
          return _super.apply(this, arguments);
        }
        _createClass(_class, [{
          key: "beforeConvertNode",
          value: function beforeConvertNode(el) {
            if (el && el.tagName) {
              var tagName = el.tagName.toLowerCase();
              if (tagName !== 'iframe') {
                removeClassByWhiteList(el);
                removeLangByBlackList(el);
                lazyloadBackgroundImage(el);
              } else {
                if (el.getAttribute('class') === 'video_ad_iframe') {
                  el.setAttribute('class', '');
                }
              }
            }
          }
        }, {
          key: "afterConvertNode",
          value: function afterConvertNode(el) {
            if (!isMMVersionSetted) {
              var ua = navigator.userAgent;
              /(iPhone|iPad|iPod|iOS|mac\sos)/i.test(ua) ? contentDom.classList.add('fix_apple_default_style') : null;
              isMMVersionSetted = true;
            }
            if (el.style && el.style.webkitTextSizeAdjust !== '' && el.style.webkitTextSizeAdjust !== 'none') {
              el.style.webkitTextSizeAdjust = 'inherit';
            }
            if (el.tagName === 'animate' && el.getAttribute('attributeName') === 'height') {
              var repeatCountVal = el.getAttribute('repeatCount');
              if (repeatCountVal === 'indefinite' || repeatCountVal > '10') {
                if (el.getAttribute('begin') !== 'click' && el.getAttribute('end') !== 'click') {
                  el.setAttribute('repeatCount', 'undefined');
                  el.setAttribute('attributeName', 'undefined');
                  new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=306525_1_1';
                }
              }
            }
            if (el.tagName === 'OL') {
              
              if ((el.parentNode === document.getElementById('js_content') || el.parentNode.getAttribute('id') === 'js_secopen_content') && el.getAttribute('style') && el.getAttribute('style').indexOf('padding-left') < 0) {
                if (el.childNodes.length >= 10 && el.childNodes.length < 100) {
                  el.classList.add('extra-list-padding-level1');
                  el.style.paddingLeft = '2.2em';
                } else if (el.childNodes.length > 100) {
                  el.classList.add('extra-list-padding-level2');
                  el.style.paddingLeft = '3.2em';
                }
              }
            }
            if (el.tagName === 'MP-STYLE-TYPE') {
              var styleType = parseInt(el.getAttribute('data-value'), 10);
              if (styleType === 3) {
                if (el.parentNode && el.parentNode.previousSibling) {
                  var realLastP = el.parentNode.previousSibling;
                  if ((realLastP.tagName === 'P' || realLastP.tagName === 'SECTION') && realLastP.style && !realLastP.style.marginBottom) {
                    realLastP.style.marginBottom = '0';
                  }
                }
              }
            }
          }
        }]);
        return _class;
      }(Plugin);
    };
  }

  
  if (!window.__second_open__ && window.Darkmode) {
    var cost = 0;
    window.Darkmode.extend([DomFilter()]);
    window.Darkmode.run(document.querySelectorAll('#js_content *'), {
      mode: '',
      defaultDarkBgColor: '',
      error: function error() {
        new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_0_1';
      },

      begin: function begin(isSwitch) {
        new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_2_1';
        isSwitch && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_4_1');
        cost = new Date() * 1;
      },

      showFirstPage: function showFirstPage() {
        cost = new Date() * 1 - cost;
        var isTop = (document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop) === 0;
        if (cost <= 10) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_6_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_13_1');
        } else if (cost > 10 && cost <= 20) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_7_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_14_1');
        } else if (cost > 20 && cost <= 30) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_8_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_15_1');
        } else if (cost > 30 && cost <= 40) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_9_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_16_1');
        } else if (cost > 40 && cost <= 50) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_10_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_17_1');
        } else if (cost > 50 && cost <= 60) {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_11_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_18_1');
        } else {
          new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_12_1';
          isTop && (new Image().src = 'https://mp.weixin.qq.com/mp/jsmonitor?idkey=125617_19_1');
        }
      }
    });

    document.getElementById('js_content').style.visibility = 'visible';
  }

})();</script><script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function (exports) {
  'use strict';

  function _typeof(obj) {
    "@babel/helpers - typeof";

    return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
      return typeof obj;
    } : function (obj) {
      return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
    }, _typeof(obj);
  }

  function _toPrimitive(input, hint) {
    if (_typeof(input) !== "object" || input === null) return input;
    var prim = input[Symbol.toPrimitive];
    if (prim !== undefined) {
      var res = prim.call(input, hint || "default");
      if (_typeof(res) !== "object") return res;
      throw new TypeError("@@toPrimitive must return a primitive value.");
    }
    return (hint === "string" ? String : Number)(input);
  }

  function _toPropertyKey(arg) {
    var key = _toPrimitive(arg, "string");
    return _typeof(key) === "symbol" ? key : String(key);
  }

  function _defineProperty(obj, key, value) {
    key = _toPropertyKey(key);
    if (key in obj) {
      Object.defineProperty(obj, key, {
        value: value,
        enumerable: true,
        configurable: true,
        writable: true
      });
    } else {
      obj[key] = value;
    }
    return obj;
  }

  function _arrayLikeToArray$1(arr, len) {
    if (len == null || len > arr.length) len = arr.length;
    for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i];
    return arr2;
  }

  function _arrayWithoutHoles(arr) {
    if (Array.isArray(arr)) return _arrayLikeToArray$1(arr);
  }

  function _iterableToArray(iter) {
    if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter);
  }

  function _unsupportedIterableToArray$1(o, minLen) {
    if (!o) return;
    if (typeof o === "string") return _arrayLikeToArray$1(o, minLen);
    var n = Object.prototype.toString.call(o).slice(8, -1);
    if (n === "Object" && o.constructor) n = o.constructor.name;
    if (n === "Map" || n === "Set") return Array.from(o);
    if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray$1(o, minLen);
  }

  function _nonIterableSpread() {
    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
  }

  function _toConsumableArray(arr) {
    return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray$1(arr) || _nonIterableSpread();
  }

  function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }
  function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { _defineProperty(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }
  function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
  function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
  function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
  function updateProfileAttr(profiles, infos) {
    if (!profiles || !Array.isArray(profiles) || !infos || !Array.isArray(infos)) {
      return;
    }
    var _iterator = _createForOfIteratorHelper(profiles),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var profile = _step.value;
        var profileId = profile.getAttribute('data-id');
        var profileInfo = findBizCardInfo(infos, profileId);
        if (profileInfo) {
          var is_biz_ban = profileInfo.is_biz_ban,
            original_num = profileInfo.original_num,
            biz_account_status = profileInfo.biz_account_status;
          profile.setAttribute('data-origin_num', original_num * 1);
          profile.setAttribute('data-is_biz_ban', is_biz_ban * 1);
          profile.setAttribute('data-isban', is_biz_ban * 1);
          profile.setAttribute('data-biz_account_status', biz_account_status * 1);
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  }
  function findBizCardInfo(infos, id) {
    return infos.find(function (info) {
      return info.fakeid === id;
    });
  }
  function dealWithProfileData(data) {
    var _data$biz_card;
    if (!window.__second_open__) {
      return data;
    }
    var profileData = (data === null || data === void 0 ? void 0 : (_data$biz_card = data.biz_card) === null || _databiz_card.list) || [];
    profileData.map(function (item) {
      return item['original_num'] = item['orignal_num'];
    });
    return profileData;
  }
  function updateCustomElementAttrs(dom, data) {
    if (!dom || !data) return;
    var profiles = dom.querySelectorAll('mp-common-profile');
    updateProfileAttr(Array.from(profiles), dealWithProfileData(data));
  }
  function preprocessMpAudios(dom, data) {
    var voiceList = window.__second_open__ ? data === null || data === void 0 ? void 0 : data.voice_in_appmsg_list_json : data.voiceList;
    if (typeof voiceList === 'string') {
      try {
        voiceList = JSON.parse(voiceList);
      } catch (e) {
        return;
      }
    }
    if (!dom || !voiceList) return;
    var albumlist = [];
    if (voiceList.voice_in_appmsg && voiceList.voice_in_appmsg.length > 0) {
      albumlist = voiceList.voice_in_appmsg;
    }
    var mpvoices = _toConsumableArray(dom.querySelectorAll('mpvoice'));
    mpvoices.forEach(function (mpvoice) {
      var mpaudio = document.createElement('mp-common-mpaudio');
      var attrs = mpvoice.getAttributeNames().reduce(function (acc, name) {
        if (name === 'data-trans_state' || name === 'data-verify_state') return acc;
        return _objectSpread(_objectSpread({}, acc), {}, _defineProperty({}, name, mpvoice.getAttribute(name)));
      }, {});
      for (var key in attrs) {
        mpaudio.setAttribute(key, attrs[key]);
      }
      mpaudio.setAttribute('data-trans_state', 1);
      mpvoice.parentNode.replaceChild(mpaudio, mpvoice);
    });
    var mpaudios = _toConsumableArray(dom.querySelectorAll('mp-common-mpaudio'));
    mpaudios.forEach(function (mpaudio) {
      mpaudio.style.opacity = 0;
      mpaudio.setAttribute('author', data.nick_name || '');
      var album = albumlist.find(function (a) {
        var voice_encode_fileid = mpaudio.getAttribute('voice_encode_fileid');
        try {
          voice_encode_fileid = decodeURIComponent(voice_encode_fileid);
        } catch (e) {}
        return a.voice_id === voice_encode_fileid && a.appmsgalbuminfo;
      });
      if (album) {
        mpaudio.setAttribute('data-topic_id', album.appmsgalbuminfo.album_id || 0);
        mpaudio.setAttribute('data-topic_name', album.appmsgalbuminfo.title || '');
        mpaudio.setAttribute('data-topic_link', album.appmsgalbuminfo.link.html(false).replace('#wechat_redirect', '') + '#wechat_redirect');
        mpaudio.setAttribute('data-topic_num', album.appmsgalbuminfo.tag_content_num || 0);
      }
    });

    var claudios = _toConsumableArray(dom.querySelectorAll('mp-common-claudio'));
    claudios.forEach(function (claudio) {
      claudio.style.opacity = 0;
    });
  }
  function handleTagReplacement(ele, newTagName) {
    var newTag = document.createElement(newTagName);
    var _iterator2 = _createForOfIteratorHelper(ele.attributes),
      _step2;
    try {
      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        var attr = _step2.value;
        newTag.setAttribute(attr.name, attr.value);
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }
    newTag.innerHTML = ele.innerHTML;
    ele.parentNode.replaceChild(newTag, ele);
    return newTag;
  }
  function preprocessMpMusic(root) {
    var qqmusicEles = _toConsumableArray(root.querySelectorAll('qqmusic'));
    qqmusicEles.forEach(function (ele) {
      return handleTagReplacement(ele, 'mp-common-qqmusic');
    });
  }
  if (!window.__second_open__) {
    updateCustomElementAttrs(window.document, window.mp_profile);
    preprocessMpAudios(window.document, {
      voiceList: window.voiceList,
      nick_name: window.nickname
    });
    preprocessMpMusic(window.document);
  }

  exports.preprocessMpAudios = preprocessMpAudios;
  exports.preprocessMpMusic = preprocessMpMusic;
  exports.updateCustomElementAttrs = updateCustomElementAttrs;
  exports.updateProfileAttr = updateProfileAttr;

  Object.defineProperty(exports, '__esModule', { value: true });

  return exports;

})({});</script><script type="text/javascript" nonce="1415253946" reportloaderror>var __INLINE_SCRIPT__ = (function (exports) {
  'use strict';
  function setProfileName() {
    var ua = window.navigator.userAgent;
    if (/wxwork/i.test(ua)) {
      var profileName = document.getElementById('js_name');
      var authorName = document.getElementById('js_author_name');
      var accountNames = document.getElementsByClassName('account_nickname_inner');
      if (profileName) {
        profileName.classList.add('tips_global_primary');
      }
      if (authorName) {
        authorName.classList.add('tips_global_primary');
      }
      if (accountNames && accountNames.length) {
        accountNames[0].classList.add('tips_global_primary');
      }
    }
  }
  if (!window.__second_open__) {
    setProfileName();
  }

  exports.setProfileName = setProfileName;

  Object.defineProperty(exports, '__esModule', { value: true });

  return exports;

})({});</script>
<script  nonce="1415253946" reportloaderror></script>

<script type="text/javascript" nonce="1415253946" reportloaderror>
(function(_g){
    _g.appmsg_like_type = "2" * 1 ? "2" * 1 : 1;
   
    _g.clientversion = "";
    _g.passparam = "";
    if(!_g.msg_link) {
      _g.msg_link = "http://mp.weixin.qq.com/s?__biz=MjM5OTMwODM1Mw==&amp;mid=2448105671&amp;idx=1&amp;sn=576f76eacf5b7b5e5d6363bcf724dd35&amp;chksm=b322fde9845574ff438ab0b44c98ef59f428bab28dd9fd9dacb4d220053dd8025d07defe9668#rd";
    }
    _g.appmsg_type = "9";
    _g.devicetype = "";
    _g.kanyikan_video_educate_pic = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_like_comment_primary6b6772.png";
    _g.kanyikan_educate_pic = "//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/images/pic/pic_like_comment6b6772.png";
})(window);
</script>

<script type="text/javascript" nonce="1415253946" reportloaderror>
(function() {
  var ua = navigator.userAgent;
  if (ua.indexOf("MicroMessenger") != -1 && ua.indexOf("Android") != -1){
    var script = document.createElement('script');
    var head = document.getElementsByTagName('head')[0];
    script.type = 'text/javascript';
    script.src = "https://midas.gtimg.cn/h5sdk/js/api/h5sdk.js";
    head.appendChild(script);
  }
})();
</script>
<script type="text/javascript" nonce="1415253946" reportloaderror>
var real_show_page_time = +new Date();
if (!!window.addEventListener){
  window.addEventListener("load", function(){
    window.onload_endtime = +new Date();
  });
}
</script>

<script nomodule nonce="1415253946" reportloaderror>new Image().src='https://mp.weixin.qq.com/mp/jsmonitor?idkey=66881_111_1&t='+Math.random();</script>

    


<script nomodule nonce="1415253946" reportloaderror>!function(){var e=document,t=e.createElement("script");if(!("noModule"in t)&&"onbeforeload"in t){var n=!1;e.addEventListener("beforeload",(function(e){if(e.target===t)n=!0;else if(!e.target.hasAttribute("nomodule")||!n)return;e.preventDefault()}),!0),t.type="module",t.src=".",e.head.appendChild(t),t.remove()}}();</script>
<script nomodule crossorigin id="vite-legacy-polyfill" src="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/polyfills-legacy.lrjzl8l6694a7cf3.js" nonce="1415253946" reportloaderror></script>
<script nomodule crossorigin id="vite-legacy-entry" data-src="//res.wx.qq.com/mmbizappmsg/zh_CN/htmledition/js/assets/appmsg-legacy.lrjzl8l69fd8eed7.js" nonce="1415253946" reportloaderror>System.import(document.getElementById('vite-legacy-entry').getAttribute('data-src'))</script>

  </body>
</html>


