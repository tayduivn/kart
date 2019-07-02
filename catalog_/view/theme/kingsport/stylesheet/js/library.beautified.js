/**
 * Swiper 4.5.0
 * Most modern mobile touch slider and framework with hardware accelerated transitions
 * http://www.idangero.us/swiper/
 *
 * Copyright 2014-2019 Vladimir Kharlampidi
 *
 * Released under the MIT License
 *
 * Released on: February 22, 2019
 */ !function(e, t) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : (e = e || self).Swiper = t();
}(this, function() {
    "use strict";
    var f = "undefined" == typeof document ? {
        body: {},
        addEventListener: function() {},
        removeEventListener: function() {},
        activeElement: {
            blur: function() {},
            nodeName: ""
        },
        querySelector: function() {
            return null;
        },
        querySelectorAll: function() {
            return [];
        },
        getElementById: function() {
            return null;
        },
        createEvent: function() {
            return {
                initEvent: function() {}
            };
        },
        createElement: function() {
            return {
                children: [],
                childNodes: [],
                style: {},
                setAttribute: function() {},
                getElementsByTagName: function() {
                    return [];
                }
            };
        },
        location: {
            hash: ""
        }
    } : document, J = "undefined" == typeof window ? {
        document: f,
        navigator: {
            userAgent: ""
        },
        location: {},
        history: {},
        CustomEvent: function() {
            return this;
        },
        addEventListener: function() {},
        removeEventListener: function() {},
        getComputedStyle: function() {
            return {
                getPropertyValue: function() {
                    return "";
                }
            };
        },
        Image: function() {},
        Date: function() {},
        screen: {},
        setTimeout: function() {},
        clearTimeout: function() {}
    } : window, l = function(e) {
        for (var t = 0; t < e.length; t += 1) this[t] = e[t];
        return this.length = e.length, this;
    };
    function L(e, t) {
        var a = [], i = 0;
        if (e && !t && e instanceof l) return e;
        if (e) if ("string" == typeof e) {
            var s, r, n = e.trim();
            if (0 <= n.indexOf("<") && 0 <= n.indexOf(">")) {
                var o = "div";
                for (0 === n.indexOf("<li") && (o = "ul"), 0 === n.indexOf("<tr") && (o = "tbody"), 
                0 !== n.indexOf("<td") && 0 !== n.indexOf("<th") || (o = "tr"), 0 === n.indexOf("<tbody") && (o = "table"), 
                0 === n.indexOf("<option") && (o = "select"), (r = f.createElement(o)).innerHTML = n, 
                i = 0; i < r.childNodes.length; i += 1) a.push(r.childNodes[i]);
            } else for (s = t || "#" !== e[0] || e.match(/[ .<>:~]/) ? (t || f).querySelectorAll(e.trim()) : [ f.getElementById(e.trim().split("#")[1]) ], 
            i = 0; i < s.length; i += 1) s[i] && a.push(s[i]);
        } else if (e.nodeType || e === J || e === f) a.push(e); else if (0 < e.length && e[0].nodeType) for (i = 0; i < e.length; i += 1) a.push(e[i]);
        return new l(a);
    }
    function r(e) {
        for (var t = [], a = 0; a < e.length; a += 1) -1 === t.indexOf(e[a]) && t.push(e[a]);
        return t;
    }
    L.fn = l.prototype, L.Class = l, L.Dom7 = l;
    var t = {
        addClass: function(e) {
            if (void 0 === e) return this;
            for (var t = e.split(" "), a = 0; a < t.length; a += 1) for (var i = 0; i < this.length; i += 1) void 0 !== this[i] && void 0 !== this[i].classList && this[i].classList.add(t[a]);
            return this;
        },
        removeClass: function(e) {
            for (var t = e.split(" "), a = 0; a < t.length; a += 1) for (var i = 0; i < this.length; i += 1) void 0 !== this[i] && void 0 !== this[i].classList && this[i].classList.remove(t[a]);
            return this;
        },
        hasClass: function(e) {
            return !!this[0] && this[0].classList.contains(e);
        },
        toggleClass: function(e) {
            for (var t = e.split(" "), a = 0; a < t.length; a += 1) for (var i = 0; i < this.length; i += 1) void 0 !== this[i] && void 0 !== this[i].classList && this[i].classList.toggle(t[a]);
            return this;
        },
        attr: function(e, t) {
            var a = arguments;
            if (1 === arguments.length && "string" == typeof e) return this[0] ? this[0].getAttribute(e) : void 0;
            for (var i = 0; i < this.length; i += 1) if (2 === a.length) this[i].setAttribute(e, t); else for (var s in e) this[i][s] = e[s], 
            this[i].setAttribute(s, e[s]);
            return this;
        },
        removeAttr: function(e) {
            for (var t = 0; t < this.length; t += 1) this[t].removeAttribute(e);
            return this;
        },
        data: function(e, t) {
            var a;
            if (void 0 !== t) {
                for (var i = 0; i < this.length; i += 1) (a = this[i]).dom7ElementDataStorage || (a.dom7ElementDataStorage = {}), 
                a.dom7ElementDataStorage[e] = t;
                return this;
            }
            if (a = this[0]) {
                if (a.dom7ElementDataStorage && e in a.dom7ElementDataStorage) return a.dom7ElementDataStorage[e];
                var s = a.getAttribute("data-" + e);
                return s || void 0;
            }
        },
        transform: function(e) {
            for (var t = 0; t < this.length; t += 1) {
                var a = this[t].style;
                a.webkitTransform = e, a.transform = e;
            }
            return this;
        },
        transition: function(e) {
            "string" != typeof e && (e += "ms");
            for (var t = 0; t < this.length; t += 1) {
                var a = this[t].style;
                a.webkitTransitionDuration = e, a.transitionDuration = e;
            }
            return this;
        },
        on: function() {
            for (var e, t = [], a = arguments.length; a--; ) t[a] = arguments[a];
            var i = t[0], r = t[1], n = t[2], s = t[3];
            function o(e) {
                var t = e.target;
                if (t) {
                    var a = e.target.dom7EventData || [];
                    if (a.indexOf(e) < 0 && a.unshift(e), L(t).is(r)) n.apply(t, a); else for (var i = L(t).parents(), s = 0; s < i.length; s += 1) L(i[s]).is(r) && n.apply(i[s], a);
                }
            }
            function l(e) {
                var t = e && e.target && e.target.dom7EventData || [];
                t.indexOf(e) < 0 && t.unshift(e), n.apply(this, t);
            }
            "function" == typeof t[1] && (i = (e = t)[0], n = e[1], s = e[2], r = void 0), s || (s = !1);
            for (var d, p = i.split(" "), c = 0; c < this.length; c += 1) {
                var u = this[c];
                if (r) for (d = 0; d < p.length; d += 1) {
                    var h = p[d];
                    u.dom7LiveListeners || (u.dom7LiveListeners = {}), u.dom7LiveListeners[h] || (u.dom7LiveListeners[h] = []), 
                    u.dom7LiveListeners[h].push({
                        listener: n,
                        proxyListener: o
                    }), u.addEventListener(h, o, s);
                } else for (d = 0; d < p.length; d += 1) {
                    var v = p[d];
                    u.dom7Listeners || (u.dom7Listeners = {}), u.dom7Listeners[v] || (u.dom7Listeners[v] = []), 
                    u.dom7Listeners[v].push({
                        listener: n,
                        proxyListener: l
                    }), u.addEventListener(v, l, s);
                }
            }
            return this;
        },
        off: function() {
            for (var e, t = [], a = arguments.length; a--; ) t[a] = arguments[a];
            var i = t[0], s = t[1], r = t[2], n = t[3];
            "function" == typeof t[1] && (i = (e = t)[0], r = e[1], n = e[2], s = void 0), n || (n = !1);
            for (var o = i.split(" "), l = 0; l < o.length; l += 1) for (var d = o[l], p = 0; p < this.length; p += 1) {
                var c = this[p], u = void 0;
                if (!s && c.dom7Listeners ? u = c.dom7Listeners[d] : s && c.dom7LiveListeners && (u = c.dom7LiveListeners[d]), 
                u && u.length) for (var h = u.length - 1; 0 <= h; h -= 1) {
                    var v = u[h];
                    r && v.listener === r ? (c.removeEventListener(d, v.proxyListener, n), u.splice(h, 1)) : r && v.listener && v.listener.dom7proxy && v.listener.dom7proxy === r ? (c.removeEventListener(d, v.proxyListener, n), 
                    u.splice(h, 1)) : r || (c.removeEventListener(d, v.proxyListener, n), u.splice(h, 1));
                }
            }
            return this;
        },
        trigger: function() {
            for (var e = [], t = arguments.length; t--; ) e[t] = arguments[t];
            for (var a = e[0].split(" "), i = e[1], s = 0; s < a.length; s += 1) for (var r = a[s], n = 0; n < this.length; n += 1) {
                var o = this[n], l = void 0;
                try {
                    l = new J.CustomEvent(r, {
                        detail: i,
                        bubbles: !0,
                        cancelable: !0
                    });
                } catch (e) {
                    (l = f.createEvent("Event")).initEvent(r, !0, !0), l.detail = i;
                }
                o.dom7EventData = e.filter(function(e, t) {
                    return 0 < t;
                }), o.dispatchEvent(l), o.dom7EventData = [], delete o.dom7EventData;
            }
            return this;
        },
        transitionEnd: function(t) {
            var a, i = [ "webkitTransitionEnd", "transitionend" ], s = this;
            function r(e) {
                if (e.target === this) for (t.call(this, e), a = 0; a < i.length; a += 1) s.off(i[a], r);
            }
            if (t) for (a = 0; a < i.length; a += 1) s.on(i[a], r);
            return this;
        },
        outerWidth: function(e) {
            if (0 < this.length) {
                if (e) {
                    var t = this.styles();
                    return this[0].offsetWidth + parseFloat(t.getPropertyValue("margin-right")) + parseFloat(t.getPropertyValue("margin-left"));
                }
                return this[0].offsetWidth;
            }
            return null;
        },
        outerHeight: function(e) {
            if (0 < this.length) {
                if (e) {
                    var t = this.styles();
                    return this[0].offsetHeight + parseFloat(t.getPropertyValue("margin-top")) + parseFloat(t.getPropertyValue("margin-bottom"));
                }
                return this[0].offsetHeight;
            }
            return null;
        },
        offset: function() {
            if (0 < this.length) {
                var e = this[0], t = e.getBoundingClientRect(), a = f.body, i = e.clientTop || a.clientTop || 0, s = e.clientLeft || a.clientLeft || 0, r = e === J ? J.scrollY : e.scrollTop, n = e === J ? J.scrollX : e.scrollLeft;
                return {
                    top: t.top + r - i,
                    left: t.left + n - s
                };
            }
            return null;
        },
        css: function(e, t) {
            var a;
            if (1 === arguments.length) {
                if ("string" != typeof e) {
                    for (a = 0; a < this.length; a += 1) for (var i in e) this[a].style[i] = e[i];
                    return this;
                }
                if (this[0]) return J.getComputedStyle(this[0], null).getPropertyValue(e);
            }
            if (2 === arguments.length && "string" == typeof e) {
                for (a = 0; a < this.length; a += 1) this[a].style[e] = t;
                return this;
            }
            return this;
        },
        each: function(e) {
            if (!e) return this;
            for (var t = 0; t < this.length; t += 1) if (!1 === e.call(this[t], t, this[t])) return this;
            return this;
        },
        html: function(e) {
            if (void 0 === e) return this[0] ? this[0].innerHTML : void 0;
            for (var t = 0; t < this.length; t += 1) this[t].innerHTML = e;
            return this;
        },
        text: function(e) {
            if (void 0 === e) return this[0] ? this[0].textContent.trim() : null;
            for (var t = 0; t < this.length; t += 1) this[t].textContent = e;
            return this;
        },
        is: function(e) {
            var t, a, i = this[0];
            if (!i || void 0 === e) return !1;
            if ("string" == typeof e) {
                if (i.matches) return i.matches(e);
                if (i.webkitMatchesSelector) return i.webkitMatchesSelector(e);
                if (i.msMatchesSelector) return i.msMatchesSelector(e);
                for (t = L(e), a = 0; a < t.length; a += 1) if (t[a] === i) return !0;
                return !1;
            }
            if (e === f) return i === f;
            if (e === J) return i === J;
            if (e.nodeType || e instanceof l) {
                for (t = e.nodeType ? [ e ] : e, a = 0; a < t.length; a += 1) if (t[a] === i) return !0;
                return !1;
            }
            return !1;
        },
        index: function() {
            var e, t = this[0];
            if (t) {
                for (e = 0; null !== (t = t.previousSibling); ) 1 === t.nodeType && (e += 1);
                return e;
            }
        },
        eq: function(e) {
            if (void 0 === e) return this;
            var t, a = this.length;
            return new l(a - 1 < e ? [] : e < 0 ? (t = a + e) < 0 ? [] : [ this[t] ] : [ this[e] ]);
        },
        append: function() {
            for (var e, t = [], a = arguments.length; a--; ) t[a] = arguments[a];
            for (var i = 0; i < t.length; i += 1) {
                e = t[i];
                for (var s = 0; s < this.length; s += 1) if ("string" == typeof e) {
                    var r = f.createElement("div");
                    for (r.innerHTML = e; r.firstChild; ) this[s].appendChild(r.firstChild);
                } else if (e instanceof l) for (var n = 0; n < e.length; n += 1) this[s].appendChild(e[n]); else this[s].appendChild(e);
            }
            return this;
        },
        prepend: function(e) {
            var t, a;
            for (t = 0; t < this.length; t += 1) if ("string" == typeof e) {
                var i = f.createElement("div");
                for (i.innerHTML = e, a = i.childNodes.length - 1; 0 <= a; a -= 1) this[t].insertBefore(i.childNodes[a], this[t].childNodes[0]);
            } else if (e instanceof l) for (a = 0; a < e.length; a += 1) this[t].insertBefore(e[a], this[t].childNodes[0]); else this[t].insertBefore(e, this[t].childNodes[0]);
            return this;
        },
        next: function(e) {
            return 0 < this.length ? e ? this[0].nextElementSibling && L(this[0].nextElementSibling).is(e) ? new l([ this[0].nextElementSibling ]) : new l([]) : this[0].nextElementSibling ? new l([ this[0].nextElementSibling ]) : new l([]) : new l([]);
        },
        nextAll: function(e) {
            var t = [], a = this[0];
            if (!a) return new l([]);
            for (;a.nextElementSibling; ) {
                var i = a.nextElementSibling;
                e ? L(i).is(e) && t.push(i) : t.push(i), a = i;
            }
            return new l(t);
        },
        prev: function(e) {
            if (0 < this.length) {
                var t = this[0];
                return e ? t.previousElementSibling && L(t.previousElementSibling).is(e) ? new l([ t.previousElementSibling ]) : new l([]) : t.previousElementSibling ? new l([ t.previousElementSibling ]) : new l([]);
            }
            return new l([]);
        },
        prevAll: function(e) {
            var t = [], a = this[0];
            if (!a) return new l([]);
            for (;a.previousElementSibling; ) {
                var i = a.previousElementSibling;
                e ? L(i).is(e) && t.push(i) : t.push(i), a = i;
            }
            return new l(t);
        },
        parent: function(e) {
            for (var t = [], a = 0; a < this.length; a += 1) null !== this[a].parentNode && (e ? L(this[a].parentNode).is(e) && t.push(this[a].parentNode) : t.push(this[a].parentNode));
            return L(r(t));
        },
        parents: function(e) {
            for (var t = [], a = 0; a < this.length; a += 1) for (var i = this[a].parentNode; i; ) e ? L(i).is(e) && t.push(i) : t.push(i), 
            i = i.parentNode;
            return L(r(t));
        },
        closest: function(e) {
            var t = this;
            return void 0 === e ? new l([]) : (t.is(e) || (t = t.parents(e).eq(0)), t);
        },
        find: function(e) {
            for (var t = [], a = 0; a < this.length; a += 1) for (var i = this[a].querySelectorAll(e), s = 0; s < i.length; s += 1) t.push(i[s]);
            return new l(t);
        },
        children: function(e) {
            for (var t = [], a = 0; a < this.length; a += 1) for (var i = this[a].childNodes, s = 0; s < i.length; s += 1) e ? 1 === i[s].nodeType && L(i[s]).is(e) && t.push(i[s]) : 1 === i[s].nodeType && t.push(i[s]);
            return new l(r(t));
        },
        remove: function() {
            for (var e = 0; e < this.length; e += 1) this[e].parentNode && this[e].parentNode.removeChild(this[e]);
            return this;
        },
        add: function() {
            for (var e = [], t = arguments.length; t--; ) e[t] = arguments[t];
            var a, i;
            for (a = 0; a < e.length; a += 1) {
                var s = L(e[a]);
                for (i = 0; i < s.length; i += 1) this[this.length] = s[i], this.length += 1;
            }
            return this;
        },
        styles: function() {
            return this[0] ? J.getComputedStyle(this[0], null) : {};
        }
    };
    Object.keys(t).forEach(function(e) {
        L.fn[e] = t[e];
    });
    var e, a, i, s, ee = {
        deleteProps: function(e) {
            var t = e;
            Object.keys(t).forEach(function(e) {
                try {
                    t[e] = null;
                } catch (e) {}
                try {
                    delete t[e];
                } catch (e) {}
            });
        },
        nextTick: function(e, t) {
            return void 0 === t && (t = 0), setTimeout(e, t);
        },
        now: function() {
            return Date.now();
        },
        getTranslate: function(e, t) {
            var a, i, s;
            void 0 === t && (t = "x");
            var r = J.getComputedStyle(e, null);
            return J.WebKitCSSMatrix ? (6 < (i = r.transform || r.webkitTransform).split(",").length && (i = i.split(", ").map(function(e) {
                return e.replace(",", ".");
            }).join(", ")), s = new J.WebKitCSSMatrix("none" === i ? "" : i)) : a = (s = r.MozTransform || r.OTransform || r.MsTransform || r.msTransform || r.transform || r.getPropertyValue("transform").replace("translate(", "matrix(1, 0, 0, 1,")).toString().split(","), 
            "x" === t && (i = J.WebKitCSSMatrix ? s.m41 : 16 === a.length ? parseFloat(a[12]) : parseFloat(a[4])), 
            "y" === t && (i = J.WebKitCSSMatrix ? s.m42 : 16 === a.length ? parseFloat(a[13]) : parseFloat(a[5])), 
            i || 0;
        },
        parseUrlQuery: function(e) {
            var t, a, i, s, r = {}, n = e || J.location.href;
            if ("string" == typeof n && n.length) for (s = (a = (n = -1 < n.indexOf("?") ? n.replace(/\S*\?/, "") : "").split("&").filter(function(e) {
                return "" !== e;
            })).length, t = 0; t < s; t += 1) i = a[t].replace(/#\S+/g, "").split("="), r[decodeURIComponent(i[0])] = void 0 === i[1] ? void 0 : decodeURIComponent(i[1]) || "";
            return r;
        },
        isObject: function(e) {
            return "object" == typeof e && null !== e && e.constructor && e.constructor === Object;
        },
        extend: function() {
            for (var e = [], t = arguments.length; t--; ) e[t] = arguments[t];
            for (var a = Object(e[0]), i = 1; i < e.length; i += 1) {
                var s = e[i];
                if (null != s) for (var r = Object.keys(Object(s)), n = 0, o = r.length; n < o; n += 1) {
                    var l = r[n], d = Object.getOwnPropertyDescriptor(s, l);
                    void 0 !== d && d.enumerable && (ee.isObject(a[l]) && ee.isObject(s[l]) ? ee.extend(a[l], s[l]) : !ee.isObject(a[l]) && ee.isObject(s[l]) ? (a[l] = {}, 
                    ee.extend(a[l], s[l])) : a[l] = s[l]);
                }
            }
            return a;
        }
    }, te = (i = f.createElement("div"), {
        touch: J.Modernizr && !0 === J.Modernizr.touch || !!(0 < J.navigator.maxTouchPoints || "ontouchstart" in J || J.DocumentTouch && f instanceof J.DocumentTouch),
        pointerEvents: !!(J.navigator.pointerEnabled || J.PointerEvent || "maxTouchPoints" in J.navigator && 0 < J.navigator.maxTouchPoints),
        prefixedPointerEvents: !!J.navigator.msPointerEnabled,
        transition: (a = i.style, "transition" in a || "webkitTransition" in a || "MozTransition" in a),
        transforms3d: J.Modernizr && !0 === J.Modernizr.csstransforms3d || (e = i.style, 
        "webkitPerspective" in e || "MozPerspective" in e || "OPerspective" in e || "MsPerspective" in e || "perspective" in e),
        flexbox: function() {
            for (var e = i.style, t = "alignItems webkitAlignItems webkitBoxAlign msFlexAlign mozBoxAlign webkitFlexDirection msFlexDirection mozBoxDirection mozBoxOrient webkitBoxDirection webkitBoxOrient".split(" "), a = 0; a < t.length; a += 1) if (t[a] in e) return !0;
            return !1;
        }(),
        observer: "MutationObserver" in J || "WebkitMutationObserver" in J,
        passiveListener: function() {
            var e = !1;
            try {
                var t = Object.defineProperty({}, "passive", {
                    get: function() {
                        e = !0;
                    }
                });
                J.addEventListener("testPassiveListener", null, t);
            } catch (e) {}
            return e;
        }(),
        gestures: "ongesturestart" in J
    }), I = {
        isIE: !!J.navigator.userAgent.match(/Trident/g) || !!J.navigator.userAgent.match(/MSIE/g),
        isEdge: !!J.navigator.userAgent.match(/Edge/g),
        isSafari: (s = J.navigator.userAgent.toLowerCase(), 0 <= s.indexOf("safari") && s.indexOf("chrome") < 0 && s.indexOf("android") < 0),
        isUiWebView: /(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/i.test(J.navigator.userAgent)
    }, n = function(e) {
        void 0 === e && (e = {});
        var t = this;
        t.params = e, t.eventsListeners = {}, t.params && t.params.on && Object.keys(t.params.on).forEach(function(e) {
            t.on(e, t.params.on[e]);
        });
    }, o = {
        components: {
            configurable: !0
        }
    };
    n.prototype.on = function(e, t, a) {
        var i = this;
        if ("function" != typeof t) return i;
        var s = a ? "unshift" : "push";
        return e.split(" ").forEach(function(e) {
            i.eventsListeners[e] || (i.eventsListeners[e] = []), i.eventsListeners[e][s](t);
        }), i;
    }, n.prototype.once = function(a, i, e) {
        var s = this;
        if ("function" != typeof i) return s;
        function r() {
            for (var e = [], t = arguments.length; t--; ) e[t] = arguments[t];
            i.apply(s, e), s.off(a, r), r.f7proxy && delete r.f7proxy;
        }
        return r.f7proxy = i, s.on(a, r, e);
    }, n.prototype.off = function(e, i) {
        var s = this;
        return s.eventsListeners && e.split(" ").forEach(function(a) {
            void 0 === i ? s.eventsListeners[a] = [] : s.eventsListeners[a] && s.eventsListeners[a].length && s.eventsListeners[a].forEach(function(e, t) {
                (e === i || e.f7proxy && e.f7proxy === i) && s.eventsListeners[a].splice(t, 1);
            });
        }), s;
    }, n.prototype.emit = function() {
        for (var e = [], t = arguments.length; t--; ) e[t] = arguments[t];
        var a, i, s, r = this;
        return r.eventsListeners && ("string" == typeof e[0] || Array.isArray(e[0]) ? (a = e[0], 
        i = e.slice(1, e.length), s = r) : (a = e[0].events, i = e[0].data, s = e[0].context || r), 
        (Array.isArray(a) ? a : a.split(" ")).forEach(function(e) {
            if (r.eventsListeners && r.eventsListeners[e]) {
                var t = [];
                r.eventsListeners[e].forEach(function(e) {
                    t.push(e);
                }), t.forEach(function(e) {
                    e.apply(s, i);
                });
            }
        })), r;
    }, n.prototype.useModulesParams = function(a) {
        var i = this;
        i.modules && Object.keys(i.modules).forEach(function(e) {
            var t = i.modules[e];
            t.params && ee.extend(a, t.params);
        });
    }, n.prototype.useModules = function(i) {
        void 0 === i && (i = {});
        var s = this;
        s.modules && Object.keys(s.modules).forEach(function(e) {
            var a = s.modules[e], t = i[e] || {};
            a.instance && Object.keys(a.instance).forEach(function(e) {
                var t = a.instance[e];
                s[e] = "function" == typeof t ? t.bind(s) : t;
            }), a.on && s.on && Object.keys(a.on).forEach(function(e) {
                s.on(e, a.on[e]);
            }), a.create && a.create.bind(s)(t);
        });
    }, o.components.set = function(e) {
        this.use && this.use(e);
    }, n.installModule = function(t) {
        for (var e = [], a = arguments.length - 1; 0 < a--; ) e[a] = arguments[a + 1];
        var i = this;
        i.prototype.modules || (i.prototype.modules = {});
        var s = t.name || Object.keys(i.prototype.modules).length + "_" + ee.now();
        return (i.prototype.modules[s] = t).proto && Object.keys(t.proto).forEach(function(e) {
            i.prototype[e] = t.proto[e];
        }), t.static && Object.keys(t.static).forEach(function(e) {
            i[e] = t.static[e];
        }), t.install && t.install.apply(i, e), i;
    }, n.use = function(e) {
        for (var t = [], a = arguments.length - 1; 0 < a--; ) t[a] = arguments[a + 1];
        var i = this;
        return Array.isArray(e) ? (e.forEach(function(e) {
            return i.installModule(e);
        }), i) : i.installModule.apply(i, [ e ].concat(t));
    }, Object.defineProperties(n, o);
    var d = {
        updateSize: function() {
            var e, t, a = this, i = a.$el;
            e = void 0 !== a.params.width ? a.params.width : i[0].clientWidth, t = void 0 !== a.params.height ? a.params.height : i[0].clientHeight, 
            0 === e && a.isHorizontal() || 0 === t && a.isVertical() || (e = e - parseInt(i.css("padding-left"), 10) - parseInt(i.css("padding-right"), 10), 
            t = t - parseInt(i.css("padding-top"), 10) - parseInt(i.css("padding-bottom"), 10), 
            ee.extend(a, {
                width: e,
                height: t,
                size: a.isHorizontal() ? e : t
            }));
        },
        updateSlides: function() {
            var e = this, t = e.params, a = e.$wrapperEl, i = e.size, s = e.rtlTranslate, r = e.wrongRTL, n = e.virtual && t.virtual.enabled, o = n ? e.virtual.slides.length : e.slides.length, l = a.children("." + e.params.slideClass), d = n ? e.virtual.slides.length : l.length, p = [], c = [], u = [], h = t.slidesOffsetBefore;
            "function" == typeof h && (h = t.slidesOffsetBefore.call(e));
            var v = t.slidesOffsetAfter;
            "function" == typeof v && (v = t.slidesOffsetAfter.call(e));
            var f = e.snapGrid.length, m = e.snapGrid.length, g = t.spaceBetween, b = -h, w = 0, y = 0;
            if (void 0 !== i) {
                var x, T;
                "string" == typeof g && 0 <= g.indexOf("%") && (g = parseFloat(g.replace("%", "")) / 100 * i), 
                e.virtualSize = -g, s ? l.css({
                    marginLeft: "",
                    marginTop: ""
                }) : l.css({
                    marginRight: "",
                    marginBottom: ""
                }), 1 < t.slidesPerColumn && (x = Math.floor(d / t.slidesPerColumn) === d / e.params.slidesPerColumn ? d : Math.ceil(d / t.slidesPerColumn) * t.slidesPerColumn, 
                "auto" !== t.slidesPerView && "row" === t.slidesPerColumnFill && (x = Math.max(x, t.slidesPerView * t.slidesPerColumn)));
                for (var E, S = t.slidesPerColumn, C = x / S, M = Math.floor(d / t.slidesPerColumn), z = 0; z < d; z += 1) {
                    T = 0;
                    var P = l.eq(z);
                    if (1 < t.slidesPerColumn) {
                        var k = void 0, $ = void 0, L = void 0;
                        "column" === t.slidesPerColumnFill ? (L = z - ($ = Math.floor(z / S)) * S, (M < $ || $ === M && L === S - 1) && S <= (L += 1) && (L = 0, 
                        $ += 1), k = $ + L * x / S, P.css({
                            "-webkit-box-ordinal-group": k,
                            "-moz-box-ordinal-group": k,
                            "-ms-flex-order": k,
                            "-webkit-order": k,
                            order: k
                        })) : $ = z - (L = Math.floor(z / C)) * C, P.css("margin-" + (e.isHorizontal() ? "top" : "left"), 0 !== L && t.spaceBetween && t.spaceBetween + "px").attr("data-swiper-column", $).attr("data-swiper-row", L);
                    }
                    if ("none" !== P.css("display")) {
                        if ("auto" === t.slidesPerView) {
                            var I = J.getComputedStyle(P[0], null), D = P[0].style.transform, O = P[0].style.webkitTransform;
                            if (D && (P[0].style.transform = "none"), O && (P[0].style.webkitTransform = "none"), 
                            t.roundLengths) T = e.isHorizontal() ? P.outerWidth(!0) : P.outerHeight(!0); else if (e.isHorizontal()) {
                                var A = parseFloat(I.getPropertyValue("width")), H = parseFloat(I.getPropertyValue("padding-left")), N = parseFloat(I.getPropertyValue("padding-right")), G = parseFloat(I.getPropertyValue("margin-left")), B = parseFloat(I.getPropertyValue("margin-right")), X = I.getPropertyValue("box-sizing");
                                T = X && "border-box" === X ? A + G + B : A + H + N + G + B;
                            } else {
                                var Y = parseFloat(I.getPropertyValue("height")), V = parseFloat(I.getPropertyValue("padding-top")), F = parseFloat(I.getPropertyValue("padding-bottom")), R = parseFloat(I.getPropertyValue("margin-top")), q = parseFloat(I.getPropertyValue("margin-bottom")), W = I.getPropertyValue("box-sizing");
                                T = W && "border-box" === W ? Y + R + q : Y + V + F + R + q;
                            }
                            D && (P[0].style.transform = D), O && (P[0].style.webkitTransform = O), t.roundLengths && (T = Math.floor(T));
                        } else T = (i - (t.slidesPerView - 1) * g) / t.slidesPerView, t.roundLengths && (T = Math.floor(T)), 
                        l[z] && (e.isHorizontal() ? l[z].style.width = T + "px" : l[z].style.height = T + "px");
                        l[z] && (l[z].swiperSlideSize = T), u.push(T), t.centeredSlides ? (b = b + T / 2 + w / 2 + g, 
                        0 === w && 0 !== z && (b = b - i / 2 - g), 0 === z && (b = b - i / 2 - g), Math.abs(b) < .001 && (b = 0), 
                        t.roundLengths && (b = Math.floor(b)), y % t.slidesPerGroup == 0 && p.push(b), c.push(b)) : (t.roundLengths && (b = Math.floor(b)), 
                        y % t.slidesPerGroup == 0 && p.push(b), c.push(b), b = b + T + g), e.virtualSize += T + g, 
                        w = T, y += 1;
                    }
                }
                if (e.virtualSize = Math.max(e.virtualSize, i) + v, s && r && ("slide" === t.effect || "coverflow" === t.effect) && a.css({
                    width: e.virtualSize + t.spaceBetween + "px"
                }), te.flexbox && !t.setWrapperSize || (e.isHorizontal() ? a.css({
                    width: e.virtualSize + t.spaceBetween + "px"
                }) : a.css({
                    height: e.virtualSize + t.spaceBetween + "px"
                })), 1 < t.slidesPerColumn && (e.virtualSize = (T + t.spaceBetween) * x, e.virtualSize = Math.ceil(e.virtualSize / t.slidesPerColumn) - t.spaceBetween, 
                e.isHorizontal() ? a.css({
                    width: e.virtualSize + t.spaceBetween + "px"
                }) : a.css({
                    height: e.virtualSize + t.spaceBetween + "px"
                }), t.centeredSlides)) {
                    E = [];
                    for (var j = 0; j < p.length; j += 1) {
                        var U = p[j];
                        t.roundLengths && (U = Math.floor(U)), p[j] < e.virtualSize + p[0] && E.push(U);
                    }
                    p = E;
                }
                if (!t.centeredSlides) {
                    E = [];
                    for (var K = 0; K < p.length; K += 1) {
                        var _ = p[K];
                        t.roundLengths && (_ = Math.floor(_)), p[K] <= e.virtualSize - i && E.push(_);
                    }
                    p = E, 1 < Math.floor(e.virtualSize - i) - Math.floor(p[p.length - 1]) && p.push(e.virtualSize - i);
                }
                if (0 === p.length && (p = [ 0 ]), 0 !== t.spaceBetween && (e.isHorizontal() ? s ? l.css({
                    marginLeft: g + "px"
                }) : l.css({
                    marginRight: g + "px"
                }) : l.css({
                    marginBottom: g + "px"
                })), t.centerInsufficientSlides) {
                    var Z = 0;
                    if (u.forEach(function(e) {
                        Z += e + (t.spaceBetween ? t.spaceBetween : 0);
                    }), (Z -= t.spaceBetween) < i) {
                        var Q = (i - Z) / 2;
                        p.forEach(function(e, t) {
                            p[t] = e - Q;
                        }), c.forEach(function(e, t) {
                            c[t] = e + Q;
                        });
                    }
                }
                ee.extend(e, {
                    slides: l,
                    snapGrid: p,
                    slidesGrid: c,
                    slidesSizesGrid: u
                }), d !== o && e.emit("slidesLengthChange"), p.length !== f && (e.params.watchOverflow && e.checkOverflow(), 
                e.emit("snapGridLengthChange")), c.length !== m && e.emit("slidesGridLengthChange"), 
                (t.watchSlidesProgress || t.watchSlidesVisibility) && e.updateSlidesOffset();
            }
        },
        updateAutoHeight: function(e) {
            var t, a = this, i = [], s = 0;
            if ("number" == typeof e ? a.setTransition(e) : !0 === e && a.setTransition(a.params.speed), 
            "auto" !== a.params.slidesPerView && 1 < a.params.slidesPerView) for (t = 0; t < Math.ceil(a.params.slidesPerView); t += 1) {
                var r = a.activeIndex + t;
                if (r > a.slides.length) break;
                i.push(a.slides.eq(r)[0]);
            } else i.push(a.slides.eq(a.activeIndex)[0]);
            for (t = 0; t < i.length; t += 1) if (void 0 !== i[t]) {
                var n = i[t].offsetHeight;
                s = s < n ? n : s;
            }
            s && a.$wrapperEl.css("height", s + "px");
        },
        updateSlidesOffset: function() {
            for (var e = this.slides, t = 0; t < e.length; t += 1) e[t].swiperSlideOffset = this.isHorizontal() ? e[t].offsetLeft : e[t].offsetTop;
        },
        updateSlidesProgress: function(e) {
            void 0 === e && (e = this && this.translate || 0);
            var t = this, a = t.params, i = t.slides, s = t.rtlTranslate;
            if (0 !== i.length) {
                void 0 === i[0].swiperSlideOffset && t.updateSlidesOffset();
                var r = -e;
                s && (r = e), i.removeClass(a.slideVisibleClass), t.visibleSlidesIndexes = [], t.visibleSlides = [];
                for (var n = 0; n < i.length; n += 1) {
                    var o = i[n], l = (r + (a.centeredSlides ? t.minTranslate() : 0) - o.swiperSlideOffset) / (o.swiperSlideSize + a.spaceBetween);
                    if (a.watchSlidesVisibility) {
                        var d = -(r - o.swiperSlideOffset), p = d + t.slidesSizesGrid[n];
                        (0 <= d && d < t.size || 0 < p && p <= t.size || d <= 0 && p >= t.size) && (t.visibleSlides.push(o), 
                        t.visibleSlidesIndexes.push(n), i.eq(n).addClass(a.slideVisibleClass));
                    }
                    o.progress = s ? -l : l;
                }
                t.visibleSlides = L(t.visibleSlides);
            }
        },
        updateProgress: function(e) {
            void 0 === e && (e = this && this.translate || 0);
            var t = this, a = t.params, i = t.maxTranslate() - t.minTranslate(), s = t.progress, r = t.isBeginning, n = t.isEnd, o = r, l = n;
            0 === i ? n = r = !(s = 0) : (r = (s = (e - t.minTranslate()) / i) <= 0, n = 1 <= s), 
            ee.extend(t, {
                progress: s,
                isBeginning: r,
                isEnd: n
            }), (a.watchSlidesProgress || a.watchSlidesVisibility) && t.updateSlidesProgress(e), 
            r && !o && t.emit("reachBeginning toEdge"), n && !l && t.emit("reachEnd toEdge"), 
            (o && !r || l && !n) && t.emit("fromEdge"), t.emit("progress", s);
        },
        updateSlidesClasses: function() {
            var e, t = this, a = t.slides, i = t.params, s = t.$wrapperEl, r = t.activeIndex, n = t.realIndex, o = t.virtual && i.virtual.enabled;
            a.removeClass(i.slideActiveClass + " " + i.slideNextClass + " " + i.slidePrevClass + " " + i.slideDuplicateActiveClass + " " + i.slideDuplicateNextClass + " " + i.slideDuplicatePrevClass), 
            (e = o ? t.$wrapperEl.find("." + i.slideClass + '[data-swiper-slide-index="' + r + '"]') : a.eq(r)).addClass(i.slideActiveClass), 
            i.loop && (e.hasClass(i.slideDuplicateClass) ? s.children("." + i.slideClass + ":not(." + i.slideDuplicateClass + ')[data-swiper-slide-index="' + n + '"]').addClass(i.slideDuplicateActiveClass) : s.children("." + i.slideClass + "." + i.slideDuplicateClass + '[data-swiper-slide-index="' + n + '"]').addClass(i.slideDuplicateActiveClass));
            var l = e.nextAll("." + i.slideClass).eq(0).addClass(i.slideNextClass);
            i.loop && 0 === l.length && (l = a.eq(0)).addClass(i.slideNextClass);
            var d = e.prevAll("." + i.slideClass).eq(0).addClass(i.slidePrevClass);
            i.loop && 0 === d.length && (d = a.eq(-1)).addClass(i.slidePrevClass), i.loop && (l.hasClass(i.slideDuplicateClass) ? s.children("." + i.slideClass + ":not(." + i.slideDuplicateClass + ')[data-swiper-slide-index="' + l.attr("data-swiper-slide-index") + '"]').addClass(i.slideDuplicateNextClass) : s.children("." + i.slideClass + "." + i.slideDuplicateClass + '[data-swiper-slide-index="' + l.attr("data-swiper-slide-index") + '"]').addClass(i.slideDuplicateNextClass), 
            d.hasClass(i.slideDuplicateClass) ? s.children("." + i.slideClass + ":not(." + i.slideDuplicateClass + ')[data-swiper-slide-index="' + d.attr("data-swiper-slide-index") + '"]').addClass(i.slideDuplicatePrevClass) : s.children("." + i.slideClass + "." + i.slideDuplicateClass + '[data-swiper-slide-index="' + d.attr("data-swiper-slide-index") + '"]').addClass(i.slideDuplicatePrevClass));
        },
        updateActiveIndex: function(e) {
            var t, a = this, i = a.rtlTranslate ? a.translate : -a.translate, s = a.slidesGrid, r = a.snapGrid, n = a.params, o = a.activeIndex, l = a.realIndex, d = a.snapIndex, p = e;
            if (void 0 === p) {
                for (var c = 0; c < s.length; c += 1) void 0 !== s[c + 1] ? i >= s[c] && i < s[c + 1] - (s[c + 1] - s[c]) / 2 ? p = c : i >= s[c] && i < s[c + 1] && (p = c + 1) : i >= s[c] && (p = c);
                n.normalizeSlideIndex && (p < 0 || void 0 === p) && (p = 0);
            }
            if ((t = 0 <= r.indexOf(i) ? r.indexOf(i) : Math.floor(p / n.slidesPerGroup)) >= r.length && (t = r.length - 1), 
            p !== o) {
                var u = parseInt(a.slides.eq(p).attr("data-swiper-slide-index") || p, 10);
                ee.extend(a, {
                    snapIndex: t,
                    realIndex: u,
                    previousIndex: o,
                    activeIndex: p
                }), a.emit("activeIndexChange"), a.emit("snapIndexChange"), l !== u && a.emit("realIndexChange"), 
                a.emit("slideChange");
            } else t !== d && (a.snapIndex = t, a.emit("snapIndexChange"));
        },
        updateClickedSlide: function(e) {
            var t = this, a = t.params, i = L(e.target).closest("." + a.slideClass)[0], s = !1;
            if (i) for (var r = 0; r < t.slides.length; r += 1) t.slides[r] === i && (s = !0);
            if (!i || !s) return t.clickedSlide = void 0, void (t.clickedIndex = void 0);
            t.clickedSlide = i, t.virtual && t.params.virtual.enabled ? t.clickedIndex = parseInt(L(i).attr("data-swiper-slide-index"), 10) : t.clickedIndex = L(i).index(), 
            a.slideToClickedSlide && void 0 !== t.clickedIndex && t.clickedIndex !== t.activeIndex && t.slideToClickedSlide();
        }
    };
    var p = {
        getTranslate: function(e) {
            void 0 === e && (e = this.isHorizontal() ? "x" : "y");
            var t = this.params, a = this.rtlTranslate, i = this.translate, s = this.$wrapperEl;
            if (t.virtualTranslate) return a ? -i : i;
            var r = ee.getTranslate(s[0], e);
            return a && (r = -r), r || 0;
        },
        setTranslate: function(e, t) {
            var a = this, i = a.rtlTranslate, s = a.params, r = a.$wrapperEl, n = a.progress, o = 0, l = 0;
            a.isHorizontal() ? o = i ? -e : e : l = e, s.roundLengths && (o = Math.floor(o), 
            l = Math.floor(l)), s.virtualTranslate || (te.transforms3d ? r.transform("translate3d(" + o + "px, " + l + "px, 0px)") : r.transform("translate(" + o + "px, " + l + "px)")), 
            a.previousTranslate = a.translate, a.translate = a.isHorizontal() ? o : l;
            var d = a.maxTranslate() - a.minTranslate();
            (0 === d ? 0 : (e - a.minTranslate()) / d) !== n && a.updateProgress(e), a.emit("setTranslate", a.translate, t);
        },
        minTranslate: function() {
            return -this.snapGrid[0];
        },
        maxTranslate: function() {
            return -this.snapGrid[this.snapGrid.length - 1];
        }
    };
    var c = {
        setTransition: function(e, t) {
            this.$wrapperEl.transition(e), this.emit("setTransition", e, t);
        },
        transitionStart: function(e, t) {
            void 0 === e && (e = !0);
            var a = this, i = a.activeIndex, s = a.params, r = a.previousIndex;
            s.autoHeight && a.updateAutoHeight();
            var n = t;
            if (n || (n = r < i ? "next" : i < r ? "prev" : "reset"), a.emit("transitionStart"), 
            e && i !== r) {
                if ("reset" === n) return void a.emit("slideResetTransitionStart");
                a.emit("slideChangeTransitionStart"), "next" === n ? a.emit("slideNextTransitionStart") : a.emit("slidePrevTransitionStart");
            }
        },
        transitionEnd: function(e, t) {
            void 0 === e && (e = !0);
            var a = this, i = a.activeIndex, s = a.previousIndex;
            a.animating = !1, a.setTransition(0);
            var r = t;
            if (r || (r = s < i ? "next" : i < s ? "prev" : "reset"), a.emit("transitionEnd"), 
            e && i !== s) {
                if ("reset" === r) return void a.emit("slideResetTransitionEnd");
                a.emit("slideChangeTransitionEnd"), "next" === r ? a.emit("slideNextTransitionEnd") : a.emit("slidePrevTransitionEnd");
            }
        }
    };
    var u = {
        slideTo: function(e, t, a, i) {
            void 0 === e && (e = 0), void 0 === t && (t = this.params.speed), void 0 === a && (a = !0);
            var s = this, r = e;
            r < 0 && (r = 0);
            var n = s.params, o = s.snapGrid, l = s.slidesGrid, d = s.previousIndex, p = s.activeIndex, c = s.rtlTranslate;
            if (s.animating && n.preventInteractionOnTransition) return !1;
            var u = Math.floor(r / n.slidesPerGroup);
            u >= o.length && (u = o.length - 1), (p || n.initialSlide || 0) === (d || 0) && a && s.emit("beforeSlideChangeStart");
            var h, v = -o[u];
            if (s.updateProgress(v), n.normalizeSlideIndex) for (var f = 0; f < l.length; f += 1) -Math.floor(100 * v) >= Math.floor(100 * l[f]) && (r = f);
            if (s.initialized && r !== p) {
                if (!s.allowSlideNext && v < s.translate && v < s.minTranslate()) return !1;
                if (!s.allowSlidePrev && v > s.translate && v > s.maxTranslate() && (p || 0) !== r) return !1;
            }
            return h = p < r ? "next" : r < p ? "prev" : "reset", c && -v === s.translate || !c && v === s.translate ? (s.updateActiveIndex(r), 
            n.autoHeight && s.updateAutoHeight(), s.updateSlidesClasses(), "slide" !== n.effect && s.setTranslate(v), 
            "reset" !== h && (s.transitionStart(a, h), s.transitionEnd(a, h)), !1) : (0 !== t && te.transition ? (s.setTransition(t), 
            s.setTranslate(v), s.updateActiveIndex(r), s.updateSlidesClasses(), s.emit("beforeTransitionStart", t, i), 
            s.transitionStart(a, h), s.animating || (s.animating = !0, s.onSlideToWrapperTransitionEnd || (s.onSlideToWrapperTransitionEnd = function(e) {
                s && !s.destroyed && e.target === this && (s.$wrapperEl[0].removeEventListener("transitionend", s.onSlideToWrapperTransitionEnd), 
                s.$wrapperEl[0].removeEventListener("webkitTransitionEnd", s.onSlideToWrapperTransitionEnd), 
                s.onSlideToWrapperTransitionEnd = null, delete s.onSlideToWrapperTransitionEnd, 
                s.transitionEnd(a, h));
            }), s.$wrapperEl[0].addEventListener("transitionend", s.onSlideToWrapperTransitionEnd), 
            s.$wrapperEl[0].addEventListener("webkitTransitionEnd", s.onSlideToWrapperTransitionEnd))) : (s.setTransition(0), 
            s.setTranslate(v), s.updateActiveIndex(r), s.updateSlidesClasses(), s.emit("beforeTransitionStart", t, i), 
            s.transitionStart(a, h), s.transitionEnd(a, h)), !0);
        },
        slideToLoop: function(e, t, a, i) {
            void 0 === e && (e = 0), void 0 === t && (t = this.params.speed), void 0 === a && (a = !0);
            var s = e;
            return this.params.loop && (s += this.loopedSlides), this.slideTo(s, t, a, i);
        },
        slideNext: function(e, t, a) {
            void 0 === e && (e = this.params.speed), void 0 === t && (t = !0);
            var i = this, s = i.params, r = i.animating;
            return s.loop ? !r && (i.loopFix(), i._clientLeft = i.$wrapperEl[0].clientLeft, 
            i.slideTo(i.activeIndex + s.slidesPerGroup, e, t, a)) : i.slideTo(i.activeIndex + s.slidesPerGroup, e, t, a);
        },
        slidePrev: function(e, t, a) {
            void 0 === e && (e = this.params.speed), void 0 === t && (t = !0);
            var i = this, s = i.params, r = i.animating, n = i.snapGrid, o = i.slidesGrid, l = i.rtlTranslate;
            if (s.loop) {
                if (r) return !1;
                i.loopFix(), i._clientLeft = i.$wrapperEl[0].clientLeft;
            }
            function d(e) {
                return e < 0 ? -Math.floor(Math.abs(e)) : Math.floor(e);
            }
            var p, c = d(l ? i.translate : -i.translate), u = n.map(function(e) {
                return d(e);
            }), h = (o.map(function(e) {
                return d(e);
            }), n[u.indexOf(c)], n[u.indexOf(c) - 1]);
            return void 0 !== h && (p = o.indexOf(h)) < 0 && (p = i.activeIndex - 1), i.slideTo(p, e, t, a);
        },
        slideReset: function(e, t, a) {
            return void 0 === e && (e = this.params.speed), void 0 === t && (t = !0), this.slideTo(this.activeIndex, e, t, a);
        },
        slideToClosest: function(e, t, a) {
            void 0 === e && (e = this.params.speed), void 0 === t && (t = !0);
            var i = this, s = i.activeIndex, r = Math.floor(s / i.params.slidesPerGroup);
            if (r < i.snapGrid.length - 1) {
                var n = i.rtlTranslate ? i.translate : -i.translate, o = i.snapGrid[r];
                (i.snapGrid[r + 1] - o) / 2 < n - o && (s = i.params.slidesPerGroup);
            }
            return i.slideTo(s, e, t, a);
        },
        slideToClickedSlide: function() {
            var e, t = this, a = t.params, i = t.$wrapperEl, s = "auto" === a.slidesPerView ? t.slidesPerViewDynamic() : a.slidesPerView, r = t.clickedIndex;
            if (a.loop) {
                if (t.animating) return;
                e = parseInt(L(t.clickedSlide).attr("data-swiper-slide-index"), 10), a.centeredSlides ? r < t.loopedSlides - s / 2 || r > t.slides.length - t.loopedSlides + s / 2 ? (t.loopFix(), 
                r = i.children("." + a.slideClass + '[data-swiper-slide-index="' + e + '"]:not(.' + a.slideDuplicateClass + ")").eq(0).index(), 
                ee.nextTick(function() {
                    t.slideTo(r);
                })) : t.slideTo(r) : r > t.slides.length - s ? (t.loopFix(), r = i.children("." + a.slideClass + '[data-swiper-slide-index="' + e + '"]:not(.' + a.slideDuplicateClass + ")").eq(0).index(), 
                ee.nextTick(function() {
                    t.slideTo(r);
                })) : t.slideTo(r);
            } else t.slideTo(r);
        }
    };
    var h = {
        loopCreate: function() {
            var i = this, e = i.params, t = i.$wrapperEl;
            t.children("." + e.slideClass + "." + e.slideDuplicateClass).remove();
            var s = t.children("." + e.slideClass);
            if (e.loopFillGroupWithBlank) {
                var a = e.slidesPerGroup - s.length % e.slidesPerGroup;
                if (a !== e.slidesPerGroup) {
                    for (var r = 0; r < a; r += 1) {
                        var n = L(f.createElement("div")).addClass(e.slideClass + " " + e.slideBlankClass);
                        t.append(n);
                    }
                    s = t.children("." + e.slideClass);
                }
            }
            "auto" !== e.slidesPerView || e.loopedSlides || (e.loopedSlides = s.length), i.loopedSlides = parseInt(e.loopedSlides || e.slidesPerView, 10), 
            i.loopedSlides += e.loopAdditionalSlides, i.loopedSlides > s.length && (i.loopedSlides = s.length);
            var o = [], l = [];
            s.each(function(e, t) {
                var a = L(t);
                e < i.loopedSlides && l.push(t), e < s.length && e >= s.length - i.loopedSlides && o.push(t), 
                a.attr("data-swiper-slide-index", e);
            });
            for (var d = 0; d < l.length; d += 1) t.append(L(l[d].cloneNode(!0)).addClass(e.slideDuplicateClass));
            for (var p = o.length - 1; 0 <= p; p -= 1) t.prepend(L(o[p].cloneNode(!0)).addClass(e.slideDuplicateClass));
        },
        loopFix: function() {
            var e, t = this, a = t.params, i = t.activeIndex, s = t.slides, r = t.loopedSlides, n = t.allowSlidePrev, o = t.allowSlideNext, l = t.snapGrid, d = t.rtlTranslate;
            t.allowSlidePrev = !0, t.allowSlideNext = !0;
            var p = -l[i] - t.getTranslate();
            i < r ? (e = s.length - 3 * r + i, e += r, t.slideTo(e, 0, !1, !0) && 0 !== p && t.setTranslate((d ? -t.translate : t.translate) - p)) : ("auto" === a.slidesPerView && 2 * r <= i || i >= s.length - r) && (e = -s.length + i + r, 
            e += r, t.slideTo(e, 0, !1, !0) && 0 !== p && t.setTranslate((d ? -t.translate : t.translate) - p));
            t.allowSlidePrev = n, t.allowSlideNext = o;
        },
        loopDestroy: function() {
            var e = this.$wrapperEl, t = this.params, a = this.slides;
            e.children("." + t.slideClass + "." + t.slideDuplicateClass + ",." + t.slideClass + "." + t.slideBlankClass).remove(), 
            a.removeAttr("data-swiper-slide-index");
        }
    };
    var v = {
        setGrabCursor: function(e) {
            if (!(te.touch || !this.params.simulateTouch || this.params.watchOverflow && this.isLocked)) {
                var t = this.el;
                t.style.cursor = "move", t.style.cursor = e ? "-webkit-grabbing" : "-webkit-grab", 
                t.style.cursor = e ? "-moz-grabbin" : "-moz-grab", t.style.cursor = e ? "grabbing" : "grab";
            }
        },
        unsetGrabCursor: function() {
            te.touch || this.params.watchOverflow && this.isLocked || (this.el.style.cursor = "");
        }
    };
    var m = {
        appendSlide: function(e) {
            var t = this, a = t.$wrapperEl, i = t.params;
            if (i.loop && t.loopDestroy(), "object" == typeof e && "length" in e) for (var s = 0; s < e.length; s += 1) e[s] && a.append(e[s]); else a.append(e);
            i.loop && t.loopCreate(), i.observer && te.observer || t.update();
        },
        prependSlide: function(e) {
            var t = this, a = t.params, i = t.$wrapperEl, s = t.activeIndex;
            a.loop && t.loopDestroy();
            var r = s + 1;
            if ("object" == typeof e && "length" in e) {
                for (var n = 0; n < e.length; n += 1) e[n] && i.prepend(e[n]);
                r = s + e.length;
            } else i.prepend(e);
            a.loop && t.loopCreate(), a.observer && te.observer || t.update(), t.slideTo(r, 0, !1);
        },
        addSlide: function(e, t) {
            var a = this, i = a.$wrapperEl, s = a.params, r = a.activeIndex;
            s.loop && (r -= a.loopedSlides, a.loopDestroy(), a.slides = i.children("." + s.slideClass));
            var n = a.slides.length;
            if (e <= 0) a.prependSlide(t); else if (n <= e) a.appendSlide(t); else {
                for (var o = e < r ? r + 1 : r, l = [], d = n - 1; e <= d; d -= 1) {
                    var p = a.slides.eq(d);
                    p.remove(), l.unshift(p);
                }
                if ("object" == typeof t && "length" in t) {
                    for (var c = 0; c < t.length; c += 1) t[c] && i.append(t[c]);
                    o = e < r ? r + t.length : r;
                } else i.append(t);
                for (var u = 0; u < l.length; u += 1) i.append(l[u]);
                s.loop && a.loopCreate(), s.observer && te.observer || a.update(), s.loop ? a.slideTo(o + a.loopedSlides, 0, !1) : a.slideTo(o, 0, !1);
            }
        },
        removeSlide: function(e) {
            var t = this, a = t.params, i = t.$wrapperEl, s = t.activeIndex;
            a.loop && (s -= t.loopedSlides, t.loopDestroy(), t.slides = i.children("." + a.slideClass));
            var r, n = s;
            if ("object" == typeof e && "length" in e) {
                for (var o = 0; o < e.length; o += 1) r = e[o], t.slides[r] && t.slides.eq(r).remove(), 
                r < n && (n -= 1);
                n = Math.max(n, 0);
            } else r = e, t.slides[r] && t.slides.eq(r).remove(), r < n && (n -= 1), n = Math.max(n, 0);
            a.loop && t.loopCreate(), a.observer && te.observer || t.update(), a.loop ? t.slideTo(n + t.loopedSlides, 0, !1) : t.slideTo(n, 0, !1);
        },
        removeAllSlides: function() {
            for (var e = [], t = 0; t < this.slides.length; t += 1) e.push(t);
            this.removeSlide(e);
        }
    }, g = function() {
        var e = J.navigator.userAgent, t = {
            ios: !1,
            android: !1,
            androidChrome: !1,
            desktop: !1,
            windows: !1,
            iphone: !1,
            ipod: !1,
            ipad: !1,
            cordova: J.cordova || J.phonegap,
            phonegap: J.cordova || J.phonegap
        }, a = e.match(/(Windows Phone);?[\s\/]+([\d.]+)?/), i = e.match(/(Android);?[\s\/]+([\d.]+)?/), s = e.match(/(iPad).*OS\s([\d_]+)/), r = e.match(/(iPod)(.*OS\s([\d_]+))?/), n = !s && e.match(/(iPhone\sOS|iOS)\s([\d_]+)/);
        if (a && (t.os = "windows", t.osVersion = a[2], t.windows = !0), i && !a && (t.os = "android", 
        t.osVersion = i[2], t.android = !0, t.androidChrome = 0 <= e.toLowerCase().indexOf("chrome")), 
        (s || n || r) && (t.os = "ios", t.ios = !0), n && !r && (t.osVersion = n[2].replace(/_/g, "."), 
        t.iphone = !0), s && (t.osVersion = s[2].replace(/_/g, "."), t.ipad = !0), r && (t.osVersion = r[3] ? r[3].replace(/_/g, ".") : null, 
        t.iphone = !0), t.ios && t.osVersion && 0 <= e.indexOf("Version/") && "10" === t.osVersion.split(".")[0] && (t.osVersion = e.toLowerCase().split("version/")[1].split(" ")[0]), 
        t.desktop = !(t.os || t.android || t.webView), t.webView = (n || s || r) && e.match(/.*AppleWebKit(?!.*Safari)/i), 
        t.os && "ios" === t.os) {
            var o = t.osVersion.split("."), l = f.querySelector('meta[name="viewport"]');
            t.minimalUi = !t.webView && (r || n) && (1 * o[0] == 7 ? 1 <= 1 * o[1] : 7 < 1 * o[0]) && l && 0 <= l.getAttribute("content").indexOf("minimal-ui");
        }
        return t.pixelRatio = J.devicePixelRatio || 1, t;
    }();
    function b() {
        var e = this, t = e.params, a = e.el;
        if (!a || 0 !== a.offsetWidth) {
            t.breakpoints && e.setBreakpoint();
            var i = e.allowSlideNext, s = e.allowSlidePrev, r = e.snapGrid;
            if (e.allowSlideNext = !0, e.allowSlidePrev = !0, e.updateSize(), e.updateSlides(), 
            t.freeMode) {
                var n = Math.min(Math.max(e.translate, e.maxTranslate()), e.minTranslate());
                e.setTranslate(n), e.updateActiveIndex(), e.updateSlidesClasses(), t.autoHeight && e.updateAutoHeight();
            } else e.updateSlidesClasses(), ("auto" === t.slidesPerView || 1 < t.slidesPerView) && e.isEnd && !e.params.centeredSlides ? e.slideTo(e.slides.length - 1, 0, !1, !0) : e.slideTo(e.activeIndex, 0, !1, !0);
            e.allowSlidePrev = s, e.allowSlideNext = i, e.params.watchOverflow && r !== e.snapGrid && e.checkOverflow();
        }
    }
    var w = {
        init: !0,
        direction: "horizontal",
        touchEventsTarget: "container",
        initialSlide: 0,
        speed: 300,
        preventInteractionOnTransition: !1,
        edgeSwipeDetection: !1,
        edgeSwipeThreshold: 20,
        freeMode: !1,
        freeModeMomentum: !0,
        freeModeMomentumRatio: 1,
        freeModeMomentumBounce: !0,
        freeModeMomentumBounceRatio: 1,
        freeModeMomentumVelocityRatio: 1,
        freeModeSticky: !1,
        freeModeMinimumVelocity: .02,
        autoHeight: !1,
        setWrapperSize: !1,
        virtualTranslate: !1,
        effect: "slide",
        breakpoints: void 0,
        breakpointsInverse: !1,
        spaceBetween: 0,
        slidesPerView: 1,
        slidesPerColumn: 1,
        slidesPerColumnFill: "column",
        slidesPerGroup: 1,
        centeredSlides: !1,
        slidesOffsetBefore: 0,
        slidesOffsetAfter: 0,
        normalizeSlideIndex: !0,
        centerInsufficientSlides: !1,
        watchOverflow: !1,
        roundLengths: !1,
        touchRatio: 1,
        touchAngle: 45,
        simulateTouch: !0,
        shortSwipes: !0,
        longSwipes: !0,
        longSwipesRatio: .5,
        longSwipesMs: 300,
        followFinger: !0,
        allowTouchMove: !0,
        threshold: 0,
        touchMoveStopPropagation: !0,
        touchStartPreventDefault: !0,
        touchStartForcePreventDefault: !1,
        touchReleaseOnEdges: !1,
        uniqueNavElements: !0,
        resistance: !0,
        resistanceRatio: .85,
        watchSlidesProgress: !1,
        watchSlidesVisibility: !1,
        grabCursor: !1,
        preventClicks: !0,
        preventClicksPropagation: !0,
        slideToClickedSlide: !1,
        preloadImages: !0,
        updateOnImagesReady: !0,
        loop: !1,
        loopAdditionalSlides: 0,
        loopedSlides: null,
        loopFillGroupWithBlank: !1,
        allowSlidePrev: !0,
        allowSlideNext: !0,
        swipeHandler: null,
        noSwiping: !0,
        noSwipingClass: "swiper-no-swiping",
        noSwipingSelector: null,
        passiveListeners: !0,
        containerModifierClass: "swiper-container-",
        slideClass: "swiper-slide",
        slideBlankClass: "swiper-slide-invisible-blank",
        slideActiveClass: "swiper-slide-active",
        slideDuplicateActiveClass: "swiper-slide-duplicate-active",
        slideVisibleClass: "swiper-slide-visible",
        slideDuplicateClass: "swiper-slide-duplicate",
        slideNextClass: "swiper-slide-next",
        slideDuplicateNextClass: "swiper-slide-duplicate-next",
        slidePrevClass: "swiper-slide-prev",
        slideDuplicatePrevClass: "swiper-slide-duplicate-prev",
        wrapperClass: "swiper-wrapper",
        runCallbacksOnInit: !0
    }, y = {
        update: d,
        translate: p,
        transition: c,
        slide: u,
        loop: h,
        grabCursor: v,
        manipulation: m,
        events: {
            attachEvents: function() {
                var e = this, t = e.params, a = e.touchEvents, i = e.el, s = e.wrapperEl;
                e.onTouchStart = function(e) {
                    var t = this, a = t.touchEventsData, i = t.params, s = t.touches;
                    if (!t.animating || !i.preventInteractionOnTransition) {
                        var r = e;
                        if (r.originalEvent && (r = r.originalEvent), a.isTouchEvent = "touchstart" === r.type, 
                        (a.isTouchEvent || !("which" in r) || 3 !== r.which) && !(!a.isTouchEvent && "button" in r && 0 < r.button || a.isTouched && a.isMoved)) if (i.noSwiping && L(r.target).closest(i.noSwipingSelector ? i.noSwipingSelector : "." + i.noSwipingClass)[0]) t.allowClick = !0; else if (!i.swipeHandler || L(r).closest(i.swipeHandler)[0]) {
                            s.currentX = "touchstart" === r.type ? r.targetTouches[0].pageX : r.pageX, s.currentY = "touchstart" === r.type ? r.targetTouches[0].pageY : r.pageY;
                            var n = s.currentX, o = s.currentY, l = i.edgeSwipeDetection || i.iOSEdgeSwipeDetection, d = i.edgeSwipeThreshold || i.iOSEdgeSwipeThreshold;
                            if (!l || !(n <= d || n >= J.screen.width - d)) {
                                if (ee.extend(a, {
                                    isTouched: !0,
                                    isMoved: !1,
                                    allowTouchCallbacks: !0,
                                    isScrolling: void 0,
                                    startMoving: void 0
                                }), s.startX = n, s.startY = o, a.touchStartTime = ee.now(), t.allowClick = !0, 
                                t.updateSize(), t.swipeDirection = void 0, 0 < i.threshold && (a.allowThresholdMove = !1), 
                                "touchstart" !== r.type) {
                                    var p = !0;
                                    L(r.target).is(a.formElements) && (p = !1), f.activeElement && L(f.activeElement).is(a.formElements) && f.activeElement !== r.target && f.activeElement.blur();
                                    var c = p && t.allowTouchMove && i.touchStartPreventDefault;
                                    (i.touchStartForcePreventDefault || c) && r.preventDefault();
                                }
                                t.emit("touchStart", r);
                            }
                        }
                    }
                }.bind(e), e.onTouchMove = function(e) {
                    var t = this, a = t.touchEventsData, i = t.params, s = t.touches, r = t.rtlTranslate, n = e;
                    if (n.originalEvent && (n = n.originalEvent), a.isTouched) {
                        if (!a.isTouchEvent || "mousemove" !== n.type) {
                            var o = "touchmove" === n.type ? n.targetTouches[0].pageX : n.pageX, l = "touchmove" === n.type ? n.targetTouches[0].pageY : n.pageY;
                            if (n.preventedByNestedSwiper) return s.startX = o, void (s.startY = l);
                            if (!t.allowTouchMove) return t.allowClick = !1, void (a.isTouched && (ee.extend(s, {
                                startX: o,
                                startY: l,
                                currentX: o,
                                currentY: l
                            }), a.touchStartTime = ee.now()));
                            if (a.isTouchEvent && i.touchReleaseOnEdges && !i.loop) if (t.isVertical()) {
                                if (l < s.startY && t.translate <= t.maxTranslate() || l > s.startY && t.translate >= t.minTranslate()) return a.isTouched = !1, 
                                void (a.isMoved = !1);
                            } else if (o < s.startX && t.translate <= t.maxTranslate() || o > s.startX && t.translate >= t.minTranslate()) return;
                            if (a.isTouchEvent && f.activeElement && n.target === f.activeElement && L(n.target).is(a.formElements)) return a.isMoved = !0, 
                            void (t.allowClick = !1);
                            if (a.allowTouchCallbacks && t.emit("touchMove", n), !(n.targetTouches && 1 < n.targetTouches.length)) {
                                s.currentX = o, s.currentY = l;
                                var d, p = s.currentX - s.startX, c = s.currentY - s.startY;
                                if (!(t.params.threshold && Math.sqrt(Math.pow(p, 2) + Math.pow(c, 2)) < t.params.threshold)) if (void 0 === a.isScrolling && (t.isHorizontal() && s.currentY === s.startY || t.isVertical() && s.currentX === s.startX ? a.isScrolling = !1 : 25 <= p * p + c * c && (d = 180 * Math.atan2(Math.abs(c), Math.abs(p)) / Math.PI, 
                                a.isScrolling = t.isHorizontal() ? d > i.touchAngle : 90 - d > i.touchAngle)), a.isScrolling && t.emit("touchMoveOpposite", n), 
                                void 0 === a.startMoving && (s.currentX === s.startX && s.currentY === s.startY || (a.startMoving = !0)), 
                                a.isScrolling) a.isTouched = !1; else if (a.startMoving) {
                                    t.allowClick = !1, n.preventDefault(), i.touchMoveStopPropagation && !i.nested && n.stopPropagation(), 
                                    a.isMoved || (i.loop && t.loopFix(), a.startTranslate = t.getTranslate(), t.setTransition(0), 
                                    t.animating && t.$wrapperEl.trigger("webkitTransitionEnd transitionend"), a.allowMomentumBounce = !1, 
                                    !i.grabCursor || !0 !== t.allowSlideNext && !0 !== t.allowSlidePrev || t.setGrabCursor(!0), 
                                    t.emit("sliderFirstMove", n)), t.emit("sliderMove", n), a.isMoved = !0;
                                    var u = t.isHorizontal() ? p : c;
                                    s.diff = u, u *= i.touchRatio, r && (u = -u), t.swipeDirection = 0 < u ? "prev" : "next", 
                                    a.currentTranslate = u + a.startTranslate;
                                    var h = !0, v = i.resistanceRatio;
                                    if (i.touchReleaseOnEdges && (v = 0), 0 < u && a.currentTranslate > t.minTranslate() ? (h = !1, 
                                    i.resistance && (a.currentTranslate = t.minTranslate() - 1 + Math.pow(-t.minTranslate() + a.startTranslate + u, v))) : u < 0 && a.currentTranslate < t.maxTranslate() && (h = !1, 
                                    i.resistance && (a.currentTranslate = t.maxTranslate() + 1 - Math.pow(t.maxTranslate() - a.startTranslate - u, v))), 
                                    h && (n.preventedByNestedSwiper = !0), !t.allowSlideNext && "next" === t.swipeDirection && a.currentTranslate < a.startTranslate && (a.currentTranslate = a.startTranslate), 
                                    !t.allowSlidePrev && "prev" === t.swipeDirection && a.currentTranslate > a.startTranslate && (a.currentTranslate = a.startTranslate), 
                                    0 < i.threshold) {
                                        if (!(Math.abs(u) > i.threshold || a.allowThresholdMove)) return void (a.currentTranslate = a.startTranslate);
                                        if (!a.allowThresholdMove) return a.allowThresholdMove = !0, s.startX = s.currentX, 
                                        s.startY = s.currentY, a.currentTranslate = a.startTranslate, void (s.diff = t.isHorizontal() ? s.currentX - s.startX : s.currentY - s.startY);
                                    }
                                    i.followFinger && ((i.freeMode || i.watchSlidesProgress || i.watchSlidesVisibility) && (t.updateActiveIndex(), 
                                    t.updateSlidesClasses()), i.freeMode && (0 === a.velocities.length && a.velocities.push({
                                        position: s[t.isHorizontal() ? "startX" : "startY"],
                                        time: a.touchStartTime
                                    }), a.velocities.push({
                                        position: s[t.isHorizontal() ? "currentX" : "currentY"],
                                        time: ee.now()
                                    })), t.updateProgress(a.currentTranslate), t.setTranslate(a.currentTranslate));
                                }
                            }
                        }
                    } else a.startMoving && a.isScrolling && t.emit("touchMoveOpposite", n);
                }.bind(e), e.onTouchEnd = function(e) {
                    var t = this, a = t.touchEventsData, i = t.params, s = t.touches, r = t.rtlTranslate, n = t.$wrapperEl, o = t.slidesGrid, l = t.snapGrid, d = e;
                    if (d.originalEvent && (d = d.originalEvent), a.allowTouchCallbacks && t.emit("touchEnd", d), 
                    a.allowTouchCallbacks = !1, !a.isTouched) return a.isMoved && i.grabCursor && t.setGrabCursor(!1), 
                    a.isMoved = !1, void (a.startMoving = !1);
                    i.grabCursor && a.isMoved && a.isTouched && (!0 === t.allowSlideNext || !0 === t.allowSlidePrev) && t.setGrabCursor(!1);
                    var p, c = ee.now(), u = c - a.touchStartTime;
                    if (t.allowClick && (t.updateClickedSlide(d), t.emit("tap", d), u < 300 && 300 < c - a.lastClickTime && (a.clickTimeout && clearTimeout(a.clickTimeout), 
                    a.clickTimeout = ee.nextTick(function() {
                        t && !t.destroyed && t.emit("click", d);
                    }, 300)), u < 300 && c - a.lastClickTime < 300 && (a.clickTimeout && clearTimeout(a.clickTimeout), 
                    t.emit("doubleTap", d))), a.lastClickTime = ee.now(), ee.nextTick(function() {
                        t.destroyed || (t.allowClick = !0);
                    }), !a.isTouched || !a.isMoved || !t.swipeDirection || 0 === s.diff || a.currentTranslate === a.startTranslate) return a.isTouched = !1, 
                    a.isMoved = !1, void (a.startMoving = !1);
                    if (a.isTouched = !1, a.isMoved = !1, a.startMoving = !1, p = i.followFinger ? r ? t.translate : -t.translate : -a.currentTranslate, 
                    i.freeMode) {
                        if (p < -t.minTranslate()) return void t.slideTo(t.activeIndex);
                        if (p > -t.maxTranslate()) return void (t.slides.length < l.length ? t.slideTo(l.length - 1) : t.slideTo(t.slides.length - 1));
                        if (i.freeModeMomentum) {
                            if (1 < a.velocities.length) {
                                var h = a.velocities.pop(), v = a.velocities.pop(), f = h.position - v.position, m = h.time - v.time;
                                t.velocity = f / m, t.velocity /= 2, Math.abs(t.velocity) < i.freeModeMinimumVelocity && (t.velocity = 0), 
                                (150 < m || 300 < ee.now() - h.time) && (t.velocity = 0);
                            } else t.velocity = 0;
                            t.velocity *= i.freeModeMomentumVelocityRatio, a.velocities.length = 0;
                            var g = 1e3 * i.freeModeMomentumRatio, b = t.velocity * g, w = t.translate + b;
                            r && (w = -w);
                            var y, x, T = !1, E = 20 * Math.abs(t.velocity) * i.freeModeMomentumBounceRatio;
                            if (w < t.maxTranslate()) i.freeModeMomentumBounce ? (w + t.maxTranslate() < -E && (w = t.maxTranslate() - E), 
                            y = t.maxTranslate(), T = !0, a.allowMomentumBounce = !0) : w = t.maxTranslate(), 
                            i.loop && i.centeredSlides && (x = !0); else if (w > t.minTranslate()) i.freeModeMomentumBounce ? (w - t.minTranslate() > E && (w = t.minTranslate() + E), 
                            y = t.minTranslate(), T = !0, a.allowMomentumBounce = !0) : w = t.minTranslate(), 
                            i.loop && i.centeredSlides && (x = !0); else if (i.freeModeSticky) {
                                for (var S, C = 0; C < l.length; C += 1) if (l[C] > -w) {
                                    S = C;
                                    break;
                                }
                                w = -(w = Math.abs(l[S] - w) < Math.abs(l[S - 1] - w) || "next" === t.swipeDirection ? l[S] : l[S - 1]);
                            }
                            if (x && t.once("transitionEnd", function() {
                                t.loopFix();
                            }), 0 !== t.velocity) g = r ? Math.abs((-w - t.translate) / t.velocity) : Math.abs((w - t.translate) / t.velocity); else if (i.freeModeSticky) return void t.slideToClosest();
                            i.freeModeMomentumBounce && T ? (t.updateProgress(y), t.setTransition(g), t.setTranslate(w), 
                            t.transitionStart(!0, t.swipeDirection), t.animating = !0, n.transitionEnd(function() {
                                t && !t.destroyed && a.allowMomentumBounce && (t.emit("momentumBounce"), t.setTransition(i.speed), 
                                t.setTranslate(y), n.transitionEnd(function() {
                                    t && !t.destroyed && t.transitionEnd();
                                }));
                            })) : t.velocity ? (t.updateProgress(w), t.setTransition(g), t.setTranslate(w), 
                            t.transitionStart(!0, t.swipeDirection), t.animating || (t.animating = !0, n.transitionEnd(function() {
                                t && !t.destroyed && t.transitionEnd();
                            }))) : t.updateProgress(w), t.updateActiveIndex(), t.updateSlidesClasses();
                        } else if (i.freeModeSticky) return void t.slideToClosest();
                        (!i.freeModeMomentum || u >= i.longSwipesMs) && (t.updateProgress(), t.updateActiveIndex(), 
                        t.updateSlidesClasses());
                    } else {
                        for (var M = 0, z = t.slidesSizesGrid[0], P = 0; P < o.length; P += i.slidesPerGroup) void 0 !== o[P + i.slidesPerGroup] ? p >= o[P] && p < o[P + i.slidesPerGroup] && (z = o[(M = P) + i.slidesPerGroup] - o[P]) : p >= o[P] && (M = P, 
                        z = o[o.length - 1] - o[o.length - 2]);
                        var k = (p - o[M]) / z;
                        if (u > i.longSwipesMs) {
                            if (!i.longSwipes) return void t.slideTo(t.activeIndex);
                            "next" === t.swipeDirection && (k >= i.longSwipesRatio ? t.slideTo(M + i.slidesPerGroup) : t.slideTo(M)), 
                            "prev" === t.swipeDirection && (k > 1 - i.longSwipesRatio ? t.slideTo(M + i.slidesPerGroup) : t.slideTo(M));
                        } else {
                            if (!i.shortSwipes) return void t.slideTo(t.activeIndex);
                            "next" === t.swipeDirection && t.slideTo(M + i.slidesPerGroup), "prev" === t.swipeDirection && t.slideTo(M);
                        }
                    }
                }.bind(e), e.onClick = function(e) {
                    this.allowClick || (this.params.preventClicks && e.preventDefault(), this.params.preventClicksPropagation && this.animating && (e.stopPropagation(), 
                    e.stopImmediatePropagation()));
                }.bind(e);
                var r = "container" === t.touchEventsTarget ? i : s, n = !!t.nested;
                if (te.touch || !te.pointerEvents && !te.prefixedPointerEvents) {
                    if (te.touch) {
                        var o = !("touchstart" !== a.start || !te.passiveListener || !t.passiveListeners) && {
                            passive: !0,
                            capture: !1
                        };
                        r.addEventListener(a.start, e.onTouchStart, o), r.addEventListener(a.move, e.onTouchMove, te.passiveListener ? {
                            passive: !1,
                            capture: n
                        } : n), r.addEventListener(a.end, e.onTouchEnd, o);
                    }
                    (t.simulateTouch && !g.ios && !g.android || t.simulateTouch && !te.touch && g.ios) && (r.addEventListener("mousedown", e.onTouchStart, !1), 
                    f.addEventListener("mousemove", e.onTouchMove, n), f.addEventListener("mouseup", e.onTouchEnd, !1));
                } else r.addEventListener(a.start, e.onTouchStart, !1), f.addEventListener(a.move, e.onTouchMove, n), 
                f.addEventListener(a.end, e.onTouchEnd, !1);
                (t.preventClicks || t.preventClicksPropagation) && r.addEventListener("click", e.onClick, !0), 
                e.on(g.ios || g.android ? "resize orientationchange observerUpdate" : "resize observerUpdate", b, !0);
            },
            detachEvents: function() {
                var e = this, t = e.params, a = e.touchEvents, i = e.el, s = e.wrapperEl, r = "container" === t.touchEventsTarget ? i : s, n = !!t.nested;
                if (te.touch || !te.pointerEvents && !te.prefixedPointerEvents) {
                    if (te.touch) {
                        var o = !("onTouchStart" !== a.start || !te.passiveListener || !t.passiveListeners) && {
                            passive: !0,
                            capture: !1
                        };
                        r.removeEventListener(a.start, e.onTouchStart, o), r.removeEventListener(a.move, e.onTouchMove, n), 
                        r.removeEventListener(a.end, e.onTouchEnd, o);
                    }
                    (t.simulateTouch && !g.ios && !g.android || t.simulateTouch && !te.touch && g.ios) && (r.removeEventListener("mousedown", e.onTouchStart, !1), 
                    f.removeEventListener("mousemove", e.onTouchMove, n), f.removeEventListener("mouseup", e.onTouchEnd, !1));
                } else r.removeEventListener(a.start, e.onTouchStart, !1), f.removeEventListener(a.move, e.onTouchMove, n), 
                f.removeEventListener(a.end, e.onTouchEnd, !1);
                (t.preventClicks || t.preventClicksPropagation) && r.removeEventListener("click", e.onClick, !0), 
                e.off(g.ios || g.android ? "resize orientationchange observerUpdate" : "resize observerUpdate", b);
            }
        },
        breakpoints: {
            setBreakpoint: function() {
                var e = this, t = e.activeIndex, a = e.initialized, i = e.loopedSlides;
                void 0 === i && (i = 0);
                var s = e.params, r = s.breakpoints;
                if (r && (!r || 0 !== Object.keys(r).length)) {
                    var n = e.getBreakpoint(r);
                    if (n && e.currentBreakpoint !== n) {
                        var o = n in r ? r[n] : void 0;
                        o && [ "slidesPerView", "spaceBetween", "slidesPerGroup" ].forEach(function(e) {
                            var t = o[e];
                            void 0 !== t && (o[e] = "slidesPerView" !== e || "AUTO" !== t && "auto" !== t ? "slidesPerView" === e ? parseFloat(t) : parseInt(t, 10) : "auto");
                        });
                        var l = o || e.originalParams, d = l.direction && l.direction !== s.direction, p = s.loop && (l.slidesPerView !== s.slidesPerView || d);
                        d && a && e.changeDirection(), ee.extend(e.params, l), ee.extend(e, {
                            allowTouchMove: e.params.allowTouchMove,
                            allowSlideNext: e.params.allowSlideNext,
                            allowSlidePrev: e.params.allowSlidePrev
                        }), e.currentBreakpoint = n, p && a && (e.loopDestroy(), e.loopCreate(), e.updateSlides(), 
                        e.slideTo(t - i + e.loopedSlides, 0, !1)), e.emit("breakpoint", l);
                    }
                }
            },
            getBreakpoint: function(e) {
                if (e) {
                    var t = !1, a = [];
                    Object.keys(e).forEach(function(e) {
                        a.push(e);
                    }), a.sort(function(e, t) {
                        return parseInt(e, 10) - parseInt(t, 10);
                    });
                    for (var i = 0; i < a.length; i += 1) {
                        var s = a[i];
                        this.params.breakpointsInverse ? s <= J.innerWidth && (t = s) : s >= J.innerWidth && !t && (t = s);
                    }
                    return t || "max";
                }
            }
        },
        checkOverflow: {
            checkOverflow: function() {
                var e = this, t = e.isLocked;
                e.isLocked = 1 === e.snapGrid.length, e.allowSlideNext = !e.isLocked, e.allowSlidePrev = !e.isLocked, 
                t !== e.isLocked && e.emit(e.isLocked ? "lock" : "unlock"), t && t !== e.isLocked && (e.isEnd = !1, 
                e.navigation.update());
            }
        },
        classes: {
            addClasses: function() {
                var t = this.classNames, a = this.params, e = this.rtl, i = this.$el, s = [];
                s.push("initialized"), s.push(a.direction), a.freeMode && s.push("free-mode"), te.flexbox || s.push("no-flexbox"), 
                a.autoHeight && s.push("autoheight"), e && s.push("rtl"), 1 < a.slidesPerColumn && s.push("multirow"), 
                g.android && s.push("android"), g.ios && s.push("ios"), (I.isIE || I.isEdge) && (te.pointerEvents || te.prefixedPointerEvents) && s.push("wp8-" + a.direction), 
                s.forEach(function(e) {
                    t.push(a.containerModifierClass + e);
                }), i.addClass(t.join(" "));
            },
            removeClasses: function() {
                var e = this.$el, t = this.classNames;
                e.removeClass(t.join(" "));
            }
        },
        images: {
            loadImage: function(e, t, a, i, s, r) {
                var n;
                function o() {
                    r && r();
                }
                e.complete && s ? o() : t ? ((n = new J.Image()).onload = o, n.onerror = o, i && (n.sizes = i), 
                a && (n.srcset = a), t && (n.src = t)) : o();
            },
            preloadImages: function() {
                var e = this;
                function t() {
                    null != e && e && !e.destroyed && (void 0 !== e.imagesLoaded && (e.imagesLoaded += 1), 
                    e.imagesLoaded === e.imagesToLoad.length && (e.params.updateOnImagesReady && e.update(), 
                    e.emit("imagesReady")));
                }
                e.imagesToLoad = e.$el.find("img");
                for (var a = 0; a < e.imagesToLoad.length; a += 1) {
                    var i = e.imagesToLoad[a];
                    e.loadImage(i, i.currentSrc || i.getAttribute("src"), i.srcset || i.getAttribute("srcset"), i.sizes || i.getAttribute("sizes"), !0, t);
                }
            }
        }
    }, x = {}, T = function(u) {
        function h() {
            for (var e, t, s, a = [], i = arguments.length; i--; ) a[i] = arguments[i];
            1 === a.length && a[0].constructor && a[0].constructor === Object ? s = a[0] : (t = (e = a)[0], 
            s = e[1]), s || (s = {}), s = ee.extend({}, s), t && !s.el && (s.el = t), u.call(this, s), 
            Object.keys(y).forEach(function(t) {
                Object.keys(y[t]).forEach(function(e) {
                    h.prototype[e] || (h.prototype[e] = y[t][e]);
                });
            });
            var r = this;
            void 0 === r.modules && (r.modules = {}), Object.keys(r.modules).forEach(function(e) {
                var t = r.modules[e];
                if (t.params) {
                    var a = Object.keys(t.params)[0], i = t.params[a];
                    if ("object" != typeof i || null === i) return;
                    if (!(a in s && "enabled" in i)) return;
                    !0 === s[a] && (s[a] = {
                        enabled: !0
                    }), "object" != typeof s[a] || "enabled" in s[a] || (s[a].enabled = !0), s[a] || (s[a] = {
                        enabled: !1
                    });
                }
            });
            var n = ee.extend({}, w);
            r.useModulesParams(n), r.params = ee.extend({}, n, x, s), r.originalParams = ee.extend({}, r.params), 
            r.passedParams = ee.extend({}, s);
            var o = (r.$ = L)(r.params.el);
            if (t = o[0]) {
                if (1 < o.length) {
                    var l = [];
                    return o.each(function(e, t) {
                        var a = ee.extend({}, s, {
                            el: t
                        });
                        l.push(new h(a));
                    }), l;
                }
                t.swiper = r, o.data("swiper", r);
                var d, p, c = o.children("." + r.params.wrapperClass);
                return ee.extend(r, {
                    $el: o,
                    el: t,
                    $wrapperEl: c,
                    wrapperEl: c[0],
                    classNames: [],
                    slides: L(),
                    slidesGrid: [],
                    snapGrid: [],
                    slidesSizesGrid: [],
                    isHorizontal: function() {
                        return "horizontal" === r.params.direction;
                    },
                    isVertical: function() {
                        return "vertical" === r.params.direction;
                    },
                    rtl: "rtl" === t.dir.toLowerCase() || "rtl" === o.css("direction"),
                    rtlTranslate: "horizontal" === r.params.direction && ("rtl" === t.dir.toLowerCase() || "rtl" === o.css("direction")),
                    wrongRTL: "-webkit-box" === c.css("display"),
                    activeIndex: 0,
                    realIndex: 0,
                    isBeginning: !0,
                    isEnd: !1,
                    translate: 0,
                    previousTranslate: 0,
                    progress: 0,
                    velocity: 0,
                    animating: !1,
                    allowSlideNext: r.params.allowSlideNext,
                    allowSlidePrev: r.params.allowSlidePrev,
                    touchEvents: (d = [ "touchstart", "touchmove", "touchend" ], p = [ "mousedown", "mousemove", "mouseup" ], 
                    te.pointerEvents ? p = [ "pointerdown", "pointermove", "pointerup" ] : te.prefixedPointerEvents && (p = [ "MSPointerDown", "MSPointerMove", "MSPointerUp" ]), 
                    r.touchEventsTouch = {
                        start: d[0],
                        move: d[1],
                        end: d[2]
                    }, r.touchEventsDesktop = {
                        start: p[0],
                        move: p[1],
                        end: p[2]
                    }, te.touch || !r.params.simulateTouch ? r.touchEventsTouch : r.touchEventsDesktop),
                    touchEventsData: {
                        isTouched: void 0,
                        isMoved: void 0,
                        allowTouchCallbacks: void 0,
                        touchStartTime: void 0,
                        isScrolling: void 0,
                        currentTranslate: void 0,
                        startTranslate: void 0,
                        allowThresholdMove: void 0,
                        formElements: "input, select, option, textarea, button, video",
                        lastClickTime: ee.now(),
                        clickTimeout: void 0,
                        velocities: [],
                        allowMomentumBounce: void 0,
                        isTouchEvent: void 0,
                        startMoving: void 0
                    },
                    allowClick: !0,
                    allowTouchMove: r.params.allowTouchMove,
                    touches: {
                        startX: 0,
                        startY: 0,
                        currentX: 0,
                        currentY: 0,
                        diff: 0
                    },
                    imagesToLoad: [],
                    imagesLoaded: 0
                }), r.useModules(), r.params.init && r.init(), r;
            }
        }
        u && (h.__proto__ = u);
        var e = {
            extendedDefaults: {
                configurable: !0
            },
            defaults: {
                configurable: !0
            },
            Class: {
                configurable: !0
            },
            $: {
                configurable: !0
            }
        };
        return ((h.prototype = Object.create(u && u.prototype)).constructor = h).prototype.slidesPerViewDynamic = function() {
            var e = this, t = e.params, a = e.slides, i = e.slidesGrid, s = e.size, r = e.activeIndex, n = 1;
            if (t.centeredSlides) {
                for (var o, l = a[r].swiperSlideSize, d = r + 1; d < a.length; d += 1) a[d] && !o && (n += 1, 
                s < (l += a[d].swiperSlideSize) && (o = !0));
                for (var p = r - 1; 0 <= p; p -= 1) a[p] && !o && (n += 1, s < (l += a[p].swiperSlideSize) && (o = !0));
            } else for (var c = r + 1; c < a.length; c += 1) i[c] - i[r] < s && (n += 1);
            return n;
        }, h.prototype.update = function() {
            var a = this;
            if (a && !a.destroyed) {
                var e = a.snapGrid, t = a.params;
                t.breakpoints && a.setBreakpoint(), a.updateSize(), a.updateSlides(), a.updateProgress(), 
                a.updateSlidesClasses(), a.params.freeMode ? (i(), a.params.autoHeight && a.updateAutoHeight()) : (("auto" === a.params.slidesPerView || 1 < a.params.slidesPerView) && a.isEnd && !a.params.centeredSlides ? a.slideTo(a.slides.length - 1, 0, !1, !0) : a.slideTo(a.activeIndex, 0, !1, !0)) || i(), 
                t.watchOverflow && e !== a.snapGrid && a.checkOverflow(), a.emit("update");
            }
            function i() {
                var e = a.rtlTranslate ? -1 * a.translate : a.translate, t = Math.min(Math.max(e, a.maxTranslate()), a.minTranslate());
                a.setTranslate(t), a.updateActiveIndex(), a.updateSlidesClasses();
            }
        }, h.prototype.changeDirection = function(a, e) {
            void 0 === e && (e = !0);
            var t = this, i = t.params.direction;
            return a || (a = "horizontal" === i ? "vertical" : "horizontal"), a === i || "horizontal" !== a && "vertical" !== a || ("vertical" === i && (t.$el.removeClass(t.params.containerModifierClass + "vertical wp8-vertical").addClass("" + t.params.containerModifierClass + a), 
            (I.isIE || I.isEdge) && (te.pointerEvents || te.prefixedPointerEvents) && t.$el.addClass(t.params.containerModifierClass + "wp8-" + a)), 
            "horizontal" === i && (t.$el.removeClass(t.params.containerModifierClass + "horizontal wp8-horizontal").addClass("" + t.params.containerModifierClass + a), 
            (I.isIE || I.isEdge) && (te.pointerEvents || te.prefixedPointerEvents) && t.$el.addClass(t.params.containerModifierClass + "wp8-" + a)), 
            t.params.direction = a, t.slides.each(function(e, t) {
                "vertical" === a ? t.style.width = "" : t.style.height = "";
            }), t.emit("changeDirection"), e && t.update()), t;
        }, h.prototype.init = function() {
            var e = this;
            e.initialized || (e.emit("beforeInit"), e.params.breakpoints && e.setBreakpoint(), 
            e.addClasses(), e.params.loop && e.loopCreate(), e.updateSize(), e.updateSlides(), 
            e.params.watchOverflow && e.checkOverflow(), e.params.grabCursor && e.setGrabCursor(), 
            e.params.preloadImages && e.preloadImages(), e.params.loop ? e.slideTo(e.params.initialSlide + e.loopedSlides, 0, e.params.runCallbacksOnInit) : e.slideTo(e.params.initialSlide, 0, e.params.runCallbacksOnInit), 
            e.attachEvents(), e.initialized = !0, e.emit("init"));
        }, h.prototype.destroy = function(e, t) {
            void 0 === e && (e = !0), void 0 === t && (t = !0);
            var a = this, i = a.params, s = a.$el, r = a.$wrapperEl, n = a.slides;
            return void 0 === a.params || a.destroyed || (a.emit("beforeDestroy"), a.initialized = !1, 
            a.detachEvents(), i.loop && a.loopDestroy(), t && (a.removeClasses(), s.removeAttr("style"), 
            r.removeAttr("style"), n && n.length && n.removeClass([ i.slideVisibleClass, i.slideActiveClass, i.slideNextClass, i.slidePrevClass ].join(" ")).removeAttr("style").removeAttr("data-swiper-slide-index").removeAttr("data-swiper-column").removeAttr("data-swiper-row")), 
            a.emit("destroy"), Object.keys(a.eventsListeners).forEach(function(e) {
                a.off(e);
            }), !1 !== e && (a.$el[0].swiper = null, a.$el.data("swiper", null), ee.deleteProps(a)), 
            a.destroyed = !0), null;
        }, h.extendDefaults = function(e) {
            ee.extend(x, e);
        }, e.extendedDefaults.get = function() {
            return x;
        }, e.defaults.get = function() {
            return w;
        }, e.Class.get = function() {
            return u;
        }, e.$.get = function() {
            return L;
        }, Object.defineProperties(h, e), h;
    }(n), E = {
        name: "device",
        proto: {
            device: g
        },
        static: {
            device: g
        }
    }, S = {
        name: "support",
        proto: {
            support: te
        },
        static: {
            support: te
        }
    }, C = {
        name: "browser",
        proto: {
            browser: I
        },
        static: {
            browser: I
        }
    }, M = {
        name: "resize",
        create: function() {
            var e = this;
            ee.extend(e, {
                resize: {
                    resizeHandler: function() {
                        e && !e.destroyed && e.initialized && (e.emit("beforeResize"), e.emit("resize"));
                    },
                    orientationChangeHandler: function() {
                        e && !e.destroyed && e.initialized && e.emit("orientationchange");
                    }
                }
            });
        },
        on: {
            init: function() {
                J.addEventListener("resize", this.resize.resizeHandler), J.addEventListener("orientationchange", this.resize.orientationChangeHandler);
            },
            destroy: function() {
                J.removeEventListener("resize", this.resize.resizeHandler), J.removeEventListener("orientationchange", this.resize.orientationChangeHandler);
            }
        }
    }, z = {
        func: J.MutationObserver || J.WebkitMutationObserver,
        attach: function(e, t) {
            void 0 === t && (t = {});
            var a = this, i = new z.func(function(e) {
                if (1 !== e.length) {
                    var t = function() {
                        a.emit("observerUpdate", e[0]);
                    };
                    J.requestAnimationFrame ? J.requestAnimationFrame(t) : J.setTimeout(t, 0);
                } else a.emit("observerUpdate", e[0]);
            });
            i.observe(e, {
                attributes: void 0 === t.attributes || t.attributes,
                childList: void 0 === t.childList || t.childList,
                characterData: void 0 === t.characterData || t.characterData
            }), a.observer.observers.push(i);
        },
        init: function() {
            var e = this;
            if (te.observer && e.params.observer) {
                if (e.params.observeParents) for (var t = e.$el.parents(), a = 0; a < t.length; a += 1) e.observer.attach(t[a]);
                e.observer.attach(e.$el[0], {
                    childList: e.params.observeSlideChildren
                }), e.observer.attach(e.$wrapperEl[0], {
                    attributes: !1
                });
            }
        },
        destroy: function() {
            this.observer.observers.forEach(function(e) {
                e.disconnect();
            }), this.observer.observers = [];
        }
    }, P = {
        name: "observer",
        params: {
            observer: !1,
            observeParents: !1,
            observeSlideChildren: !1
        },
        create: function() {
            ee.extend(this, {
                observer: {
                    init: z.init.bind(this),
                    attach: z.attach.bind(this),
                    destroy: z.destroy.bind(this),
                    observers: []
                }
            });
        },
        on: {
            init: function() {
                this.observer.init();
            },
            destroy: function() {
                this.observer.destroy();
            }
        }
    }, k = {
        update: function(e) {
            var t = this, a = t.params, i = a.slidesPerView, s = a.slidesPerGroup, r = a.centeredSlides, n = t.params.virtual, o = n.addSlidesBefore, l = n.addSlidesAfter, d = t.virtual, p = d.from, c = d.to, u = d.slides, h = d.slidesGrid, v = d.renderSlide, f = d.offset;
            t.updateActiveIndex();
            var m, g, b, w = t.activeIndex || 0;
            m = t.rtlTranslate ? "right" : t.isHorizontal() ? "left" : "top", r ? (g = Math.floor(i / 2) + s + o, 
            b = Math.floor(i / 2) + s + l) : (g = i + (s - 1) + o, b = s + l);
            var y = Math.max((w || 0) - b, 0), x = Math.min((w || 0) + g, u.length - 1), T = (t.slidesGrid[y] || 0) - (t.slidesGrid[0] || 0);
            function E() {
                t.updateSlides(), t.updateProgress(), t.updateSlidesClasses(), t.lazy && t.params.lazy.enabled && t.lazy.load();
            }
            if (ee.extend(t.virtual, {
                from: y,
                to: x,
                offset: T,
                slidesGrid: t.slidesGrid
            }), p === y && c === x && !e) return t.slidesGrid !== h && T !== f && t.slides.css(m, T + "px"), 
            void t.updateProgress();
            if (t.params.virtual.renderExternal) return t.params.virtual.renderExternal.call(t, {
                offset: T,
                from: y,
                to: x,
                slides: function() {
                    for (var e = [], t = y; t <= x; t += 1) e.push(u[t]);
                    return e;
                }()
            }), void E();
            var S = [], C = [];
            if (e) t.$wrapperEl.find("." + t.params.slideClass).remove(); else for (var M = p; M <= c; M += 1) (M < y || x < M) && t.$wrapperEl.find("." + t.params.slideClass + '[data-swiper-slide-index="' + M + '"]').remove();
            for (var z = 0; z < u.length; z += 1) y <= z && z <= x && (void 0 === c || e ? C.push(z) : (c < z && C.push(z), 
            z < p && S.push(z)));
            C.forEach(function(e) {
                t.$wrapperEl.append(v(u[e], e));
            }), S.sort(function(e, t) {
                return t - e;
            }).forEach(function(e) {
                t.$wrapperEl.prepend(v(u[e], e));
            }), t.$wrapperEl.children(".swiper-slide").css(m, T + "px"), E();
        },
        renderSlide: function(e, t) {
            var a = this, i = a.params.virtual;
            if (i.cache && a.virtual.cache[t]) return a.virtual.cache[t];
            var s = i.renderSlide ? L(i.renderSlide.call(a, e, t)) : L('<div class="' + a.params.slideClass + '" data-swiper-slide-index="' + t + '">' + e + "</div>");
            return s.attr("data-swiper-slide-index") || s.attr("data-swiper-slide-index", t), 
            i.cache && (a.virtual.cache[t] = s), s;
        },
        appendSlide: function(e) {
            if ("object" == typeof e && "length" in e) for (var t = 0; t < e.length; t += 1) e[t] && this.virtual.slides.push(e[t]); else this.virtual.slides.push(e);
            this.virtual.update(!0);
        },
        prependSlide: function(e) {
            var t = this, a = t.activeIndex, i = a + 1, s = 1;
            if (Array.isArray(e)) {
                for (var r = 0; r < e.length; r += 1) e[r] && t.virtual.slides.unshift(e[r]);
                i = a + e.length, s = e.length;
            } else t.virtual.slides.unshift(e);
            if (t.params.virtual.cache) {
                var n = t.virtual.cache, o = {};
                Object.keys(n).forEach(function(e) {
                    o[parseInt(e, 10) + s] = n[e];
                }), t.virtual.cache = o;
            }
            t.virtual.update(!0), t.slideTo(i, 0);
        },
        removeSlide: function(e) {
            var t = this;
            if (null != e) {
                var a = t.activeIndex;
                if (Array.isArray(e)) for (var i = e.length - 1; 0 <= i; i -= 1) t.virtual.slides.splice(e[i], 1), 
                t.params.virtual.cache && delete t.virtual.cache[e[i]], e[i] < a && (a -= 1), a = Math.max(a, 0); else t.virtual.slides.splice(e, 1), 
                t.params.virtual.cache && delete t.virtual.cache[e], e < a && (a -= 1), a = Math.max(a, 0);
                t.virtual.update(!0), t.slideTo(a, 0);
            }
        },
        removeAllSlides: function() {
            var e = this;
            e.virtual.slides = [], e.params.virtual.cache && (e.virtual.cache = {}), e.virtual.update(!0), 
            e.slideTo(0, 0);
        }
    }, $ = {
        name: "virtual",
        params: {
            virtual: {
                enabled: !1,
                slides: [],
                cache: !0,
                renderSlide: null,
                renderExternal: null,
                addSlidesBefore: 0,
                addSlidesAfter: 0
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                virtual: {
                    update: k.update.bind(e),
                    appendSlide: k.appendSlide.bind(e),
                    prependSlide: k.prependSlide.bind(e),
                    removeSlide: k.removeSlide.bind(e),
                    removeAllSlides: k.removeAllSlides.bind(e),
                    renderSlide: k.renderSlide.bind(e),
                    slides: e.params.virtual.slides,
                    cache: {}
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this;
                if (e.params.virtual.enabled) {
                    e.classNames.push(e.params.containerModifierClass + "virtual");
                    var t = {
                        watchSlidesProgress: !0
                    };
                    ee.extend(e.params, t), ee.extend(e.originalParams, t), e.params.initialSlide || e.virtual.update();
                }
            },
            setTranslate: function() {
                this.params.virtual.enabled && this.virtual.update();
            }
        }
    }, D = {
        handle: function(e) {
            var t = this, a = t.rtlTranslate, i = e;
            i.originalEvent && (i = i.originalEvent);
            var s = i.keyCode || i.charCode;
            if (!t.allowSlideNext && (t.isHorizontal() && 39 === s || t.isVertical() && 40 === s)) return !1;
            if (!t.allowSlidePrev && (t.isHorizontal() && 37 === s || t.isVertical() && 38 === s)) return !1;
            if (!(i.shiftKey || i.altKey || i.ctrlKey || i.metaKey || f.activeElement && f.activeElement.nodeName && ("input" === f.activeElement.nodeName.toLowerCase() || "textarea" === f.activeElement.nodeName.toLowerCase()))) {
                if (t.params.keyboard.onlyInViewport && (37 === s || 39 === s || 38 === s || 40 === s)) {
                    var r = !1;
                    if (0 < t.$el.parents("." + t.params.slideClass).length && 0 === t.$el.parents("." + t.params.slideActiveClass).length) return;
                    var n = J.innerWidth, o = J.innerHeight, l = t.$el.offset();
                    a && (l.left -= t.$el[0].scrollLeft);
                    for (var d = [ [ l.left, l.top ], [ l.left + t.width, l.top ], [ l.left, l.top + t.height ], [ l.left + t.width, l.top + t.height ] ], p = 0; p < d.length; p += 1) {
                        var c = d[p];
                        0 <= c[0] && c[0] <= n && 0 <= c[1] && c[1] <= o && (r = !0);
                    }
                    if (!r) return;
                }
                t.isHorizontal() ? (37 !== s && 39 !== s || (i.preventDefault ? i.preventDefault() : i.returnValue = !1), 
                (39 === s && !a || 37 === s && a) && t.slideNext(), (37 === s && !a || 39 === s && a) && t.slidePrev()) : (38 !== s && 40 !== s || (i.preventDefault ? i.preventDefault() : i.returnValue = !1), 
                40 === s && t.slideNext(), 38 === s && t.slidePrev()), t.emit("keyPress", s);
            }
        },
        enable: function() {
            this.keyboard.enabled || (L(f).on("keydown", this.keyboard.handle), this.keyboard.enabled = !0);
        },
        disable: function() {
            this.keyboard.enabled && (L(f).off("keydown", this.keyboard.handle), this.keyboard.enabled = !1);
        }
    }, O = {
        name: "keyboard",
        params: {
            keyboard: {
                enabled: !1,
                onlyInViewport: !0
            }
        },
        create: function() {
            ee.extend(this, {
                keyboard: {
                    enabled: !1,
                    enable: D.enable.bind(this),
                    disable: D.disable.bind(this),
                    handle: D.handle.bind(this)
                }
            });
        },
        on: {
            init: function() {
                this.params.keyboard.enabled && this.keyboard.enable();
            },
            destroy: function() {
                this.keyboard.enabled && this.keyboard.disable();
            }
        }
    };
    var A = {
        lastScrollTime: ee.now(),
        event: -1 < J.navigator.userAgent.indexOf("firefox") ? "DOMMouseScroll" : function() {
            var e = "onwheel", t = e in f;
            if (!t) {
                var a = f.createElement("div");
                a.setAttribute(e, "return;"), t = "function" == typeof a[e];
            }
            return !t && f.implementation && f.implementation.hasFeature && !0 !== f.implementation.hasFeature("", "") && (t = f.implementation.hasFeature("Events.wheel", "3.0")), 
            t;
        }() ? "wheel" : "mousewheel",
        normalize: function(e) {
            var t = 0, a = 0, i = 0, s = 0;
            return "detail" in e && (a = e.detail), "wheelDelta" in e && (a = -e.wheelDelta / 120), 
            "wheelDeltaY" in e && (a = -e.wheelDeltaY / 120), "wheelDeltaX" in e && (t = -e.wheelDeltaX / 120), 
            "axis" in e && e.axis === e.HORIZONTAL_AXIS && (t = a, a = 0), i = 10 * t, s = 10 * a, 
            "deltaY" in e && (s = e.deltaY), "deltaX" in e && (i = e.deltaX), (i || s) && e.deltaMode && (1 === e.deltaMode ? (i *= 40, 
            s *= 40) : (i *= 800, s *= 800)), i && !t && (t = i < 1 ? -1 : 1), s && !a && (a = s < 1 ? -1 : 1), 
            {
                spinX: t,
                spinY: a,
                pixelX: i,
                pixelY: s
            };
        },
        handleMouseEnter: function() {
            this.mouseEntered = !0;
        },
        handleMouseLeave: function() {
            this.mouseEntered = !1;
        },
        handle: function(e) {
            var t = e, a = this, i = a.params.mousewheel;
            if (!a.mouseEntered && !i.releaseOnEdges) return !0;
            t.originalEvent && (t = t.originalEvent);
            var s = 0, r = a.rtlTranslate ? -1 : 1, n = A.normalize(t);
            if (i.forceToAxis) if (a.isHorizontal()) {
                if (!(Math.abs(n.pixelX) > Math.abs(n.pixelY))) return !0;
                s = n.pixelX * r;
            } else {
                if (!(Math.abs(n.pixelY) > Math.abs(n.pixelX))) return !0;
                s = n.pixelY;
            } else s = Math.abs(n.pixelX) > Math.abs(n.pixelY) ? -n.pixelX * r : -n.pixelY;
            if (0 === s) return !0;
            if (i.invert && (s = -s), a.params.freeMode) {
                a.params.loop && a.loopFix();
                var o = a.getTranslate() + s * i.sensitivity, l = a.isBeginning, d = a.isEnd;
                if (o >= a.minTranslate() && (o = a.minTranslate()), o <= a.maxTranslate() && (o = a.maxTranslate()), 
                a.setTransition(0), a.setTranslate(o), a.updateProgress(), a.updateActiveIndex(), 
                a.updateSlidesClasses(), (!l && a.isBeginning || !d && a.isEnd) && a.updateSlidesClasses(), 
                a.params.freeModeSticky && (clearTimeout(a.mousewheel.timeout), a.mousewheel.timeout = ee.nextTick(function() {
                    a.slideToClosest();
                }, 300)), a.emit("scroll", t), a.params.autoplay && a.params.autoplayDisableOnInteraction && a.autoplay.stop(), 
                o === a.minTranslate() || o === a.maxTranslate()) return !0;
            } else {
                if (60 < ee.now() - a.mousewheel.lastScrollTime) if (s < 0) if (a.isEnd && !a.params.loop || a.animating) {
                    if (i.releaseOnEdges) return !0;
                } else a.slideNext(), a.emit("scroll", t); else if (a.isBeginning && !a.params.loop || a.animating) {
                    if (i.releaseOnEdges) return !0;
                } else a.slidePrev(), a.emit("scroll", t);
                a.mousewheel.lastScrollTime = new J.Date().getTime();
            }
            return t.preventDefault ? t.preventDefault() : t.returnValue = !1, !1;
        },
        enable: function() {
            var e = this;
            if (!A.event) return !1;
            if (e.mousewheel.enabled) return !1;
            var t = e.$el;
            return "container" !== e.params.mousewheel.eventsTarged && (t = L(e.params.mousewheel.eventsTarged)), 
            t.on("mouseenter", e.mousewheel.handleMouseEnter), t.on("mouseleave", e.mousewheel.handleMouseLeave), 
            t.on(A.event, e.mousewheel.handle), e.mousewheel.enabled = !0;
        },
        disable: function() {
            var e = this;
            if (!A.event) return !1;
            if (!e.mousewheel.enabled) return !1;
            var t = e.$el;
            return "container" !== e.params.mousewheel.eventsTarged && (t = L(e.params.mousewheel.eventsTarged)), 
            t.off(A.event, e.mousewheel.handle), !(e.mousewheel.enabled = !1);
        }
    }, H = {
        update: function() {
            var e = this, t = e.params.navigation;
            if (!e.params.loop) {
                var a = e.navigation, i = a.$nextEl, s = a.$prevEl;
                s && 0 < s.length && (e.isBeginning ? s.addClass(t.disabledClass) : s.removeClass(t.disabledClass), 
                s[e.params.watchOverflow && e.isLocked ? "addClass" : "removeClass"](t.lockClass)), 
                i && 0 < i.length && (e.isEnd ? i.addClass(t.disabledClass) : i.removeClass(t.disabledClass), 
                i[e.params.watchOverflow && e.isLocked ? "addClass" : "removeClass"](t.lockClass));
            }
        },
        onPrevClick: function(e) {
            e.preventDefault(), this.isBeginning && !this.params.loop || this.slidePrev();
        },
        onNextClick: function(e) {
            e.preventDefault(), this.isEnd && !this.params.loop || this.slideNext();
        },
        init: function() {
            var e, t, a = this, i = a.params.navigation;
            (i.nextEl || i.prevEl) && (i.nextEl && (e = L(i.nextEl), a.params.uniqueNavElements && "string" == typeof i.nextEl && 1 < e.length && 1 === a.$el.find(i.nextEl).length && (e = a.$el.find(i.nextEl))), 
            i.prevEl && (t = L(i.prevEl), a.params.uniqueNavElements && "string" == typeof i.prevEl && 1 < t.length && 1 === a.$el.find(i.prevEl).length && (t = a.$el.find(i.prevEl))), 
            e && 0 < e.length && e.on("click", a.navigation.onNextClick), t && 0 < t.length && t.on("click", a.navigation.onPrevClick), 
            ee.extend(a.navigation, {
                $nextEl: e,
                nextEl: e && e[0],
                $prevEl: t,
                prevEl: t && t[0]
            }));
        },
        destroy: function() {
            var e = this, t = e.navigation, a = t.$nextEl, i = t.$prevEl;
            a && a.length && (a.off("click", e.navigation.onNextClick), a.removeClass(e.params.navigation.disabledClass)), 
            i && i.length && (i.off("click", e.navigation.onPrevClick), i.removeClass(e.params.navigation.disabledClass));
        }
    }, N = {
        update: function() {
            var e = this, t = e.rtl, s = e.params.pagination;
            if (s.el && e.pagination.el && e.pagination.$el && 0 !== e.pagination.$el.length) {
                var r, a = e.virtual && e.params.virtual.enabled ? e.virtual.slides.length : e.slides.length, i = e.pagination.$el, n = e.params.loop ? Math.ceil((a - 2 * e.loopedSlides) / e.params.slidesPerGroup) : e.snapGrid.length;
                if (e.params.loop ? ((r = Math.ceil((e.activeIndex - e.loopedSlides) / e.params.slidesPerGroup)) > a - 1 - 2 * e.loopedSlides && (r -= a - 2 * e.loopedSlides), 
                n - 1 < r && (r -= n), r < 0 && "bullets" !== e.params.paginationType && (r = n + r)) : r = void 0 !== e.snapIndex ? e.snapIndex : e.activeIndex || 0, 
                "bullets" === s.type && e.pagination.bullets && 0 < e.pagination.bullets.length) {
                    var o, l, d, p = e.pagination.bullets;
                    if (s.dynamicBullets && (e.pagination.bulletSize = p.eq(0)[e.isHorizontal() ? "outerWidth" : "outerHeight"](!0), 
                    i.css(e.isHorizontal() ? "width" : "height", e.pagination.bulletSize * (s.dynamicMainBullets + 4) + "px"), 
                    1 < s.dynamicMainBullets && void 0 !== e.previousIndex && (e.pagination.dynamicBulletIndex += r - e.previousIndex, 
                    e.pagination.dynamicBulletIndex > s.dynamicMainBullets - 1 ? e.pagination.dynamicBulletIndex = s.dynamicMainBullets - 1 : e.pagination.dynamicBulletIndex < 0 && (e.pagination.dynamicBulletIndex = 0)), 
                    o = r - e.pagination.dynamicBulletIndex, d = ((l = o + (Math.min(p.length, s.dynamicMainBullets) - 1)) + o) / 2), 
                    p.removeClass(s.bulletActiveClass + " " + s.bulletActiveClass + "-next " + s.bulletActiveClass + "-next-next " + s.bulletActiveClass + "-prev " + s.bulletActiveClass + "-prev-prev " + s.bulletActiveClass + "-main"), 
                    1 < i.length) p.each(function(e, t) {
                        var a = L(t), i = a.index();
                        i === r && a.addClass(s.bulletActiveClass), s.dynamicBullets && (o <= i && i <= l && a.addClass(s.bulletActiveClass + "-main"), 
                        i === o && a.prev().addClass(s.bulletActiveClass + "-prev").prev().addClass(s.bulletActiveClass + "-prev-prev"), 
                        i === l && a.next().addClass(s.bulletActiveClass + "-next").next().addClass(s.bulletActiveClass + "-next-next"));
                    }); else if (p.eq(r).addClass(s.bulletActiveClass), s.dynamicBullets) {
                        for (var c = p.eq(o), u = p.eq(l), h = o; h <= l; h += 1) p.eq(h).addClass(s.bulletActiveClass + "-main");
                        c.prev().addClass(s.bulletActiveClass + "-prev").prev().addClass(s.bulletActiveClass + "-prev-prev"), 
                        u.next().addClass(s.bulletActiveClass + "-next").next().addClass(s.bulletActiveClass + "-next-next");
                    }
                    if (s.dynamicBullets) {
                        var v = Math.min(p.length, s.dynamicMainBullets + 4), f = (e.pagination.bulletSize * v - e.pagination.bulletSize) / 2 - d * e.pagination.bulletSize, m = t ? "right" : "left";
                        p.css(e.isHorizontal() ? m : "top", f + "px");
                    }
                }
                if ("fraction" === s.type && (i.find("." + s.currentClass).text(s.formatFractionCurrent(r + 1)), 
                i.find("." + s.totalClass).text(s.formatFractionTotal(n))), "progressbar" === s.type) {
                    var g;
                    g = s.progressbarOpposite ? e.isHorizontal() ? "vertical" : "horizontal" : e.isHorizontal() ? "horizontal" : "vertical";
                    var b = (r + 1) / n, w = 1, y = 1;
                    "horizontal" === g ? w = b : y = b, i.find("." + s.progressbarFillClass).transform("translate3d(0,0,0) scaleX(" + w + ") scaleY(" + y + ")").transition(e.params.speed);
                }
                "custom" === s.type && s.renderCustom ? (i.html(s.renderCustom(e, r + 1, n)), e.emit("paginationRender", e, i[0])) : e.emit("paginationUpdate", e, i[0]), 
                i[e.params.watchOverflow && e.isLocked ? "addClass" : "removeClass"](s.lockClass);
            }
        },
        render: function() {
            var e = this, t = e.params.pagination;
            if (t.el && e.pagination.el && e.pagination.$el && 0 !== e.pagination.$el.length) {
                var a = e.virtual && e.params.virtual.enabled ? e.virtual.slides.length : e.slides.length, i = e.pagination.$el, s = "";
                if ("bullets" === t.type) {
                    for (var r = e.params.loop ? Math.ceil((a - 2 * e.loopedSlides) / e.params.slidesPerGroup) : e.snapGrid.length, n = 0; n < r; n += 1) t.renderBullet ? s += t.renderBullet.call(e, n, t.bulletClass) : s += "<" + t.bulletElement + ' class="' + t.bulletClass + '"></' + t.bulletElement + ">";
                    i.html(s), e.pagination.bullets = i.find("." + t.bulletClass);
                }
                "fraction" === t.type && (s = t.renderFraction ? t.renderFraction.call(e, t.currentClass, t.totalClass) : '<span class="' + t.currentClass + '"></span> / <span class="' + t.totalClass + '"></span>', 
                i.html(s)), "progressbar" === t.type && (s = t.renderProgressbar ? t.renderProgressbar.call(e, t.progressbarFillClass) : '<span class="' + t.progressbarFillClass + '"></span>', 
                i.html(s)), "custom" !== t.type && e.emit("paginationRender", e.pagination.$el[0]);
            }
        },
        init: function() {
            var a = this, e = a.params.pagination;
            if (e.el) {
                var t = L(e.el);
                0 !== t.length && (a.params.uniqueNavElements && "string" == typeof e.el && 1 < t.length && 1 === a.$el.find(e.el).length && (t = a.$el.find(e.el)), 
                "bullets" === e.type && e.clickable && t.addClass(e.clickableClass), t.addClass(e.modifierClass + e.type), 
                "bullets" === e.type && e.dynamicBullets && (t.addClass("" + e.modifierClass + e.type + "-dynamic"), 
                a.pagination.dynamicBulletIndex = 0, e.dynamicMainBullets < 1 && (e.dynamicMainBullets = 1)), 
                "progressbar" === e.type && e.progressbarOpposite && t.addClass(e.progressbarOppositeClass), 
                e.clickable && t.on("click", "." + e.bulletClass, function(e) {
                    e.preventDefault();
                    var t = L(this).index() * a.params.slidesPerGroup;
                    a.params.loop && (t += a.loopedSlides), a.slideTo(t);
                }), ee.extend(a.pagination, {
                    $el: t,
                    el: t[0]
                }));
            }
        },
        destroy: function() {
            var e = this, t = e.params.pagination;
            if (t.el && e.pagination.el && e.pagination.$el && 0 !== e.pagination.$el.length) {
                var a = e.pagination.$el;
                a.removeClass(t.hiddenClass), a.removeClass(t.modifierClass + t.type), e.pagination.bullets && e.pagination.bullets.removeClass(t.bulletActiveClass), 
                t.clickable && a.off("click", "." + t.bulletClass);
            }
        }
    }, G = {
        setTranslate: function() {
            var e = this;
            if (e.params.scrollbar.el && e.scrollbar.el) {
                var t = e.scrollbar, a = e.rtlTranslate, i = e.progress, s = t.dragSize, r = t.trackSize, n = t.$dragEl, o = t.$el, l = e.params.scrollbar, d = s, p = (r - s) * i;
                a ? 0 < (p = -p) ? (d = s - p, p = 0) : r < -p + s && (d = r + p) : p < 0 ? (d = s + p, 
                p = 0) : r < p + s && (d = r - p), e.isHorizontal() ? (te.transforms3d ? n.transform("translate3d(" + p + "px, 0, 0)") : n.transform("translateX(" + p + "px)"), 
                n[0].style.width = d + "px") : (te.transforms3d ? n.transform("translate3d(0px, " + p + "px, 0)") : n.transform("translateY(" + p + "px)"), 
                n[0].style.height = d + "px"), l.hide && (clearTimeout(e.scrollbar.timeout), o[0].style.opacity = 1, 
                e.scrollbar.timeout = setTimeout(function() {
                    o[0].style.opacity = 0, o.transition(400);
                }, 1e3));
            }
        },
        setTransition: function(e) {
            this.params.scrollbar.el && this.scrollbar.el && this.scrollbar.$dragEl.transition(e);
        },
        updateSize: function() {
            var e = this;
            if (e.params.scrollbar.el && e.scrollbar.el) {
                var t = e.scrollbar, a = t.$dragEl, i = t.$el;
                a[0].style.width = "", a[0].style.height = "";
                var s, r = e.isHorizontal() ? i[0].offsetWidth : i[0].offsetHeight, n = e.size / e.virtualSize, o = n * (r / e.size);
                s = "auto" === e.params.scrollbar.dragSize ? r * n : parseInt(e.params.scrollbar.dragSize, 10), 
                e.isHorizontal() ? a[0].style.width = s + "px" : a[0].style.height = s + "px", i[0].style.display = 1 <= n ? "none" : "", 
                e.params.scrollbar.hide && (i[0].style.opacity = 0), ee.extend(t, {
                    trackSize: r,
                    divider: n,
                    moveDivider: o,
                    dragSize: s
                }), t.$el[e.params.watchOverflow && e.isLocked ? "addClass" : "removeClass"](e.params.scrollbar.lockClass);
            }
        },
        setDragPosition: function(e) {
            var t, a = this, i = a.scrollbar, s = a.rtlTranslate, r = i.$el, n = i.dragSize, o = i.trackSize;
            t = ((a.isHorizontal() ? "touchstart" === e.type || "touchmove" === e.type ? e.targetTouches[0].pageX : e.pageX || e.clientX : "touchstart" === e.type || "touchmove" === e.type ? e.targetTouches[0].pageY : e.pageY || e.clientY) - r.offset()[a.isHorizontal() ? "left" : "top"] - n / 2) / (o - n), 
            t = Math.max(Math.min(t, 1), 0), s && (t = 1 - t);
            var l = a.minTranslate() + (a.maxTranslate() - a.minTranslate()) * t;
            a.updateProgress(l), a.setTranslate(l), a.updateActiveIndex(), a.updateSlidesClasses();
        },
        onDragStart: function(e) {
            var t = this, a = t.params.scrollbar, i = t.scrollbar, s = t.$wrapperEl, r = i.$el, n = i.$dragEl;
            t.scrollbar.isTouched = !0, e.preventDefault(), e.stopPropagation(), s.transition(100), 
            n.transition(100), i.setDragPosition(e), clearTimeout(t.scrollbar.dragTimeout), 
            r.transition(0), a.hide && r.css("opacity", 1), t.emit("scrollbarDragStart", e);
        },
        onDragMove: function(e) {
            var t = this.scrollbar, a = this.$wrapperEl, i = t.$el, s = t.$dragEl;
            this.scrollbar.isTouched && (e.preventDefault ? e.preventDefault() : e.returnValue = !1, 
            t.setDragPosition(e), a.transition(0), i.transition(0), s.transition(0), this.emit("scrollbarDragMove", e));
        },
        onDragEnd: function(e) {
            var t = this, a = t.params.scrollbar, i = t.scrollbar.$el;
            t.scrollbar.isTouched && (t.scrollbar.isTouched = !1, a.hide && (clearTimeout(t.scrollbar.dragTimeout), 
            t.scrollbar.dragTimeout = ee.nextTick(function() {
                i.css("opacity", 0), i.transition(400);
            }, 1e3)), t.emit("scrollbarDragEnd", e), a.snapOnRelease && t.slideToClosest());
        },
        enableDraggable: function() {
            var e = this;
            if (e.params.scrollbar.el) {
                var t = e.scrollbar, a = e.touchEventsTouch, i = e.touchEventsDesktop, s = e.params, r = t.$el[0], n = !(!te.passiveListener || !s.passiveListeners) && {
                    passive: !1,
                    capture: !1
                }, o = !(!te.passiveListener || !s.passiveListeners) && {
                    passive: !0,
                    capture: !1
                };
                te.touch ? (r.addEventListener(a.start, e.scrollbar.onDragStart, n), r.addEventListener(a.move, e.scrollbar.onDragMove, n), 
                r.addEventListener(a.end, e.scrollbar.onDragEnd, o)) : (r.addEventListener(i.start, e.scrollbar.onDragStart, n), 
                f.addEventListener(i.move, e.scrollbar.onDragMove, n), f.addEventListener(i.end, e.scrollbar.onDragEnd, o));
            }
        },
        disableDraggable: function() {
            var e = this;
            if (e.params.scrollbar.el) {
                var t = e.scrollbar, a = e.touchEventsTouch, i = e.touchEventsDesktop, s = e.params, r = t.$el[0], n = !(!te.passiveListener || !s.passiveListeners) && {
                    passive: !1,
                    capture: !1
                }, o = !(!te.passiveListener || !s.passiveListeners) && {
                    passive: !0,
                    capture: !1
                };
                te.touch ? (r.removeEventListener(a.start, e.scrollbar.onDragStart, n), r.removeEventListener(a.move, e.scrollbar.onDragMove, n), 
                r.removeEventListener(a.end, e.scrollbar.onDragEnd, o)) : (r.removeEventListener(i.start, e.scrollbar.onDragStart, n), 
                f.removeEventListener(i.move, e.scrollbar.onDragMove, n), f.removeEventListener(i.end, e.scrollbar.onDragEnd, o));
            }
        },
        init: function() {
            var e = this;
            if (e.params.scrollbar.el) {
                var t = e.scrollbar, a = e.$el, i = e.params.scrollbar, s = L(i.el);
                e.params.uniqueNavElements && "string" == typeof i.el && 1 < s.length && 1 === a.find(i.el).length && (s = a.find(i.el));
                var r = s.find("." + e.params.scrollbar.dragClass);
                0 === r.length && (r = L('<div class="' + e.params.scrollbar.dragClass + '"></div>'), 
                s.append(r)), ee.extend(t, {
                    $el: s,
                    el: s[0],
                    $dragEl: r,
                    dragEl: r[0]
                }), i.draggable && t.enableDraggable();
            }
        },
        destroy: function() {
            this.scrollbar.disableDraggable();
        }
    }, B = {
        setTransform: function(e, t) {
            var a = this.rtl, i = L(e), s = a ? -1 : 1, r = i.attr("data-swiper-parallax") || "0", n = i.attr("data-swiper-parallax-x"), o = i.attr("data-swiper-parallax-y"), l = i.attr("data-swiper-parallax-scale"), d = i.attr("data-swiper-parallax-opacity");
            if (n || o ? (n = n || "0", o = o || "0") : this.isHorizontal() ? (n = r, o = "0") : (o = r, 
            n = "0"), n = 0 <= n.indexOf("%") ? parseInt(n, 10) * t * s + "%" : n * t * s + "px", 
            o = 0 <= o.indexOf("%") ? parseInt(o, 10) * t + "%" : o * t + "px", null != d) {
                var p = d - (d - 1) * (1 - Math.abs(t));
                i[0].style.opacity = p;
            }
            if (null == l) i.transform("translate3d(" + n + ", " + o + ", 0px)"); else {
                var c = l - (l - 1) * (1 - Math.abs(t));
                i.transform("translate3d(" + n + ", " + o + ", 0px) scale(" + c + ")");
            }
        },
        setTranslate: function() {
            var i = this, e = i.$el, t = i.slides, s = i.progress, r = i.snapGrid;
            e.children("[data-swiper-parallax], [data-swiper-parallax-x], [data-swiper-parallax-y]").each(function(e, t) {
                i.parallax.setTransform(t, s);
            }), t.each(function(e, t) {
                var a = t.progress;
                1 < i.params.slidesPerGroup && "auto" !== i.params.slidesPerView && (a += Math.ceil(e / 2) - s * (r.length - 1)), 
                a = Math.min(Math.max(a, -1), 1), L(t).find("[data-swiper-parallax], [data-swiper-parallax-x], [data-swiper-parallax-y]").each(function(e, t) {
                    i.parallax.setTransform(t, a);
                });
            });
        },
        setTransition: function(s) {
            void 0 === s && (s = this.params.speed);
            this.$el.find("[data-swiper-parallax], [data-swiper-parallax-x], [data-swiper-parallax-y]").each(function(e, t) {
                var a = L(t), i = parseInt(a.attr("data-swiper-parallax-duration"), 10) || s;
                0 === s && (i = 0), a.transition(i);
            });
        }
    }, X = {
        getDistanceBetweenTouches: function(e) {
            if (e.targetTouches.length < 2) return 1;
            var t = e.targetTouches[0].pageX, a = e.targetTouches[0].pageY, i = e.targetTouches[1].pageX, s = e.targetTouches[1].pageY;
            return Math.sqrt(Math.pow(i - t, 2) + Math.pow(s - a, 2));
        },
        onGestureStart: function(e) {
            var t = this, a = t.params.zoom, i = t.zoom, s = i.gesture;
            if (i.fakeGestureTouched = !1, i.fakeGestureMoved = !1, !te.gestures) {
                if ("touchstart" !== e.type || "touchstart" === e.type && e.targetTouches.length < 2) return;
                i.fakeGestureTouched = !0, s.scaleStart = X.getDistanceBetweenTouches(e);
            }
            s.$slideEl && s.$slideEl.length || (s.$slideEl = L(e.target).closest(".swiper-slide"), 
            0 === s.$slideEl.length && (s.$slideEl = t.slides.eq(t.activeIndex)), s.$imageEl = s.$slideEl.find("img, svg, canvas"), 
            s.$imageWrapEl = s.$imageEl.parent("." + a.containerClass), s.maxRatio = s.$imageWrapEl.attr("data-swiper-zoom") || a.maxRatio, 
            0 !== s.$imageWrapEl.length) ? (s.$imageEl.transition(0), t.zoom.isScaling = !0) : s.$imageEl = void 0;
        },
        onGestureChange: function(e) {
            var t = this.params.zoom, a = this.zoom, i = a.gesture;
            if (!te.gestures) {
                if ("touchmove" !== e.type || "touchmove" === e.type && e.targetTouches.length < 2) return;
                a.fakeGestureMoved = !0, i.scaleMove = X.getDistanceBetweenTouches(e);
            }
            i.$imageEl && 0 !== i.$imageEl.length && (a.scale = te.gestures ? e.scale * a.currentScale : i.scaleMove / i.scaleStart * a.currentScale, 
            a.scale > i.maxRatio && (a.scale = i.maxRatio - 1 + Math.pow(a.scale - i.maxRatio + 1, .5)), 
            a.scale < t.minRatio && (a.scale = t.minRatio + 1 - Math.pow(t.minRatio - a.scale + 1, .5)), 
            i.$imageEl.transform("translate3d(0,0,0) scale(" + a.scale + ")"));
        },
        onGestureEnd: function(e) {
            var t = this.params.zoom, a = this.zoom, i = a.gesture;
            if (!te.gestures) {
                if (!a.fakeGestureTouched || !a.fakeGestureMoved) return;
                if ("touchend" !== e.type || "touchend" === e.type && e.changedTouches.length < 2 && !g.android) return;
                a.fakeGestureTouched = !1, a.fakeGestureMoved = !1;
            }
            i.$imageEl && 0 !== i.$imageEl.length && (a.scale = Math.max(Math.min(a.scale, i.maxRatio), t.minRatio), 
            i.$imageEl.transition(this.params.speed).transform("translate3d(0,0,0) scale(" + a.scale + ")"), 
            a.currentScale = a.scale, a.isScaling = !1, 1 === a.scale && (i.$slideEl = void 0));
        },
        onTouchStart: function(e) {
            var t = this.zoom, a = t.gesture, i = t.image;
            a.$imageEl && 0 !== a.$imageEl.length && (i.isTouched || (g.android && e.preventDefault(), 
            i.isTouched = !0, i.touchesStart.x = "touchstart" === e.type ? e.targetTouches[0].pageX : e.pageX, 
            i.touchesStart.y = "touchstart" === e.type ? e.targetTouches[0].pageY : e.pageY));
        },
        onTouchMove: function(e) {
            var t = this, a = t.zoom, i = a.gesture, s = a.image, r = a.velocity;
            if (i.$imageEl && 0 !== i.$imageEl.length && (t.allowClick = !1, s.isTouched && i.$slideEl)) {
                s.isMoved || (s.width = i.$imageEl[0].offsetWidth, s.height = i.$imageEl[0].offsetHeight, 
                s.startX = ee.getTranslate(i.$imageWrapEl[0], "x") || 0, s.startY = ee.getTranslate(i.$imageWrapEl[0], "y") || 0, 
                i.slideWidth = i.$slideEl[0].offsetWidth, i.slideHeight = i.$slideEl[0].offsetHeight, 
                i.$imageWrapEl.transition(0), t.rtl && (s.startX = -s.startX, s.startY = -s.startY));
                var n = s.width * a.scale, o = s.height * a.scale;
                if (!(n < i.slideWidth && o < i.slideHeight)) {
                    if (s.minX = Math.min(i.slideWidth / 2 - n / 2, 0), s.maxX = -s.minX, s.minY = Math.min(i.slideHeight / 2 - o / 2, 0), 
                    s.maxY = -s.minY, s.touchesCurrent.x = "touchmove" === e.type ? e.targetTouches[0].pageX : e.pageX, 
                    s.touchesCurrent.y = "touchmove" === e.type ? e.targetTouches[0].pageY : e.pageY, 
                    !s.isMoved && !a.isScaling) {
                        if (t.isHorizontal() && (Math.floor(s.minX) === Math.floor(s.startX) && s.touchesCurrent.x < s.touchesStart.x || Math.floor(s.maxX) === Math.floor(s.startX) && s.touchesCurrent.x > s.touchesStart.x)) return void (s.isTouched = !1);
                        if (!t.isHorizontal() && (Math.floor(s.minY) === Math.floor(s.startY) && s.touchesCurrent.y < s.touchesStart.y || Math.floor(s.maxY) === Math.floor(s.startY) && s.touchesCurrent.y > s.touchesStart.y)) return void (s.isTouched = !1);
                    }
                    e.preventDefault(), e.stopPropagation(), s.isMoved = !0, s.currentX = s.touchesCurrent.x - s.touchesStart.x + s.startX, 
                    s.currentY = s.touchesCurrent.y - s.touchesStart.y + s.startY, s.currentX < s.minX && (s.currentX = s.minX + 1 - Math.pow(s.minX - s.currentX + 1, .8)), 
                    s.currentX > s.maxX && (s.currentX = s.maxX - 1 + Math.pow(s.currentX - s.maxX + 1, .8)), 
                    s.currentY < s.minY && (s.currentY = s.minY + 1 - Math.pow(s.minY - s.currentY + 1, .8)), 
                    s.currentY > s.maxY && (s.currentY = s.maxY - 1 + Math.pow(s.currentY - s.maxY + 1, .8)), 
                    r.prevPositionX || (r.prevPositionX = s.touchesCurrent.x), r.prevPositionY || (r.prevPositionY = s.touchesCurrent.y), 
                    r.prevTime || (r.prevTime = Date.now()), r.x = (s.touchesCurrent.x - r.prevPositionX) / (Date.now() - r.prevTime) / 2, 
                    r.y = (s.touchesCurrent.y - r.prevPositionY) / (Date.now() - r.prevTime) / 2, Math.abs(s.touchesCurrent.x - r.prevPositionX) < 2 && (r.x = 0), 
                    Math.abs(s.touchesCurrent.y - r.prevPositionY) < 2 && (r.y = 0), r.prevPositionX = s.touchesCurrent.x, 
                    r.prevPositionY = s.touchesCurrent.y, r.prevTime = Date.now(), i.$imageWrapEl.transform("translate3d(" + s.currentX + "px, " + s.currentY + "px,0)");
                }
            }
        },
        onTouchEnd: function() {
            var e = this.zoom, t = e.gesture, a = e.image, i = e.velocity;
            if (t.$imageEl && 0 !== t.$imageEl.length) {
                if (!a.isTouched || !a.isMoved) return a.isTouched = !1, void (a.isMoved = !1);
                a.isTouched = !1, a.isMoved = !1;
                var s = 300, r = 300, n = i.x * s, o = a.currentX + n, l = i.y * r, d = a.currentY + l;
                0 !== i.x && (s = Math.abs((o - a.currentX) / i.x)), 0 !== i.y && (r = Math.abs((d - a.currentY) / i.y));
                var p = Math.max(s, r);
                a.currentX = o, a.currentY = d;
                var c = a.width * e.scale, u = a.height * e.scale;
                a.minX = Math.min(t.slideWidth / 2 - c / 2, 0), a.maxX = -a.minX, a.minY = Math.min(t.slideHeight / 2 - u / 2, 0), 
                a.maxY = -a.minY, a.currentX = Math.max(Math.min(a.currentX, a.maxX), a.minX), a.currentY = Math.max(Math.min(a.currentY, a.maxY), a.minY), 
                t.$imageWrapEl.transition(p).transform("translate3d(" + a.currentX + "px, " + a.currentY + "px,0)");
            }
        },
        onTransitionEnd: function() {
            var e = this.zoom, t = e.gesture;
            t.$slideEl && this.previousIndex !== this.activeIndex && (t.$imageEl.transform("translate3d(0,0,0) scale(1)"), 
            t.$imageWrapEl.transform("translate3d(0,0,0)"), e.scale = 1, e.currentScale = 1, 
            t.$slideEl = void 0, t.$imageEl = void 0, t.$imageWrapEl = void 0);
        },
        toggle: function(e) {
            var t = this.zoom;
            t.scale && 1 !== t.scale ? t.out() : t.in(e);
        },
        in: function(e) {
            var t, a, i, s, r, n, o, l, d, p, c, u, h, v, f, m, g = this, b = g.zoom, w = g.params.zoom, y = b.gesture, x = b.image;
            (y.$slideEl || (y.$slideEl = g.clickedSlide ? L(g.clickedSlide) : g.slides.eq(g.activeIndex), 
            y.$imageEl = y.$slideEl.find("img, svg, canvas"), y.$imageWrapEl = y.$imageEl.parent("." + w.containerClass)), 
            y.$imageEl && 0 !== y.$imageEl.length) && (y.$slideEl.addClass("" + w.zoomedSlideClass), 
            void 0 === x.touchesStart.x && e ? (t = "touchend" === e.type ? e.changedTouches[0].pageX : e.pageX, 
            a = "touchend" === e.type ? e.changedTouches[0].pageY : e.pageY) : (t = x.touchesStart.x, 
            a = x.touchesStart.y), b.scale = y.$imageWrapEl.attr("data-swiper-zoom") || w.maxRatio, 
            b.currentScale = y.$imageWrapEl.attr("data-swiper-zoom") || w.maxRatio, e ? (f = y.$slideEl[0].offsetWidth, 
            m = y.$slideEl[0].offsetHeight, i = y.$slideEl.offset().left + f / 2 - t, s = y.$slideEl.offset().top + m / 2 - a, 
            o = y.$imageEl[0].offsetWidth, l = y.$imageEl[0].offsetHeight, d = o * b.scale, 
            p = l * b.scale, h = -(c = Math.min(f / 2 - d / 2, 0)), v = -(u = Math.min(m / 2 - p / 2, 0)), 
            (r = i * b.scale) < c && (r = c), h < r && (r = h), (n = s * b.scale) < u && (n = u), 
            v < n && (n = v)) : n = r = 0, y.$imageWrapEl.transition(300).transform("translate3d(" + r + "px, " + n + "px,0)"), 
            y.$imageEl.transition(300).transform("translate3d(0,0,0) scale(" + b.scale + ")"));
        },
        out: function() {
            var e = this, t = e.zoom, a = e.params.zoom, i = t.gesture;
            i.$slideEl || (i.$slideEl = e.clickedSlide ? L(e.clickedSlide) : e.slides.eq(e.activeIndex), 
            i.$imageEl = i.$slideEl.find("img, svg, canvas"), i.$imageWrapEl = i.$imageEl.parent("." + a.containerClass)), 
            i.$imageEl && 0 !== i.$imageEl.length && (t.scale = 1, t.currentScale = 1, i.$imageWrapEl.transition(300).transform("translate3d(0,0,0)"), 
            i.$imageEl.transition(300).transform("translate3d(0,0,0) scale(1)"), i.$slideEl.removeClass("" + a.zoomedSlideClass), 
            i.$slideEl = void 0);
        },
        enable: function() {
            var e = this, t = e.zoom;
            if (!t.enabled) {
                t.enabled = !0;
                var a = !("touchstart" !== e.touchEvents.start || !te.passiveListener || !e.params.passiveListeners) && {
                    passive: !0,
                    capture: !1
                };
                te.gestures ? (e.$wrapperEl.on("gesturestart", ".swiper-slide", t.onGestureStart, a), 
                e.$wrapperEl.on("gesturechange", ".swiper-slide", t.onGestureChange, a), e.$wrapperEl.on("gestureend", ".swiper-slide", t.onGestureEnd, a)) : "touchstart" === e.touchEvents.start && (e.$wrapperEl.on(e.touchEvents.start, ".swiper-slide", t.onGestureStart, a), 
                e.$wrapperEl.on(e.touchEvents.move, ".swiper-slide", t.onGestureChange, a), e.$wrapperEl.on(e.touchEvents.end, ".swiper-slide", t.onGestureEnd, a)), 
                e.$wrapperEl.on(e.touchEvents.move, "." + e.params.zoom.containerClass, t.onTouchMove);
            }
        },
        disable: function() {
            var e = this, t = e.zoom;
            if (t.enabled) {
                e.zoom.enabled = !1;
                var a = !("touchstart" !== e.touchEvents.start || !te.passiveListener || !e.params.passiveListeners) && {
                    passive: !0,
                    capture: !1
                };
                te.gestures ? (e.$wrapperEl.off("gesturestart", ".swiper-slide", t.onGestureStart, a), 
                e.$wrapperEl.off("gesturechange", ".swiper-slide", t.onGestureChange, a), e.$wrapperEl.off("gestureend", ".swiper-slide", t.onGestureEnd, a)) : "touchstart" === e.touchEvents.start && (e.$wrapperEl.off(e.touchEvents.start, ".swiper-slide", t.onGestureStart, a), 
                e.$wrapperEl.off(e.touchEvents.move, ".swiper-slide", t.onGestureChange, a), e.$wrapperEl.off(e.touchEvents.end, ".swiper-slide", t.onGestureEnd, a)), 
                e.$wrapperEl.off(e.touchEvents.move, "." + e.params.zoom.containerClass, t.onTouchMove);
            }
        }
    }, Y = {
        loadInSlide: function(e, l) {
            void 0 === l && (l = !0);
            var d = this, p = d.params.lazy;
            if (void 0 !== e && 0 !== d.slides.length) {
                var c = d.virtual && d.params.virtual.enabled ? d.$wrapperEl.children("." + d.params.slideClass + '[data-swiper-slide-index="' + e + '"]') : d.slides.eq(e), t = c.find("." + p.elementClass + ":not(." + p.loadedClass + "):not(." + p.loadingClass + ")");
                !c.hasClass(p.elementClass) || c.hasClass(p.loadedClass) || c.hasClass(p.loadingClass) || (t = t.add(c[0])), 
                0 !== t.length && t.each(function(e, t) {
                    var i = L(t);
                    i.addClass(p.loadingClass);
                    var s = i.attr("data-background"), r = i.attr("data-src"), n = i.attr("data-srcset"), o = i.attr("data-sizes");
                    d.loadImage(i[0], r || s, n, o, !1, function() {
                        if (null != d && d && (!d || d.params) && !d.destroyed) {
                            if (s ? (i.css("background-image", 'url("' + s + '")'), i.removeAttr("data-background")) : (n && (i.attr("srcset", n), 
                            i.removeAttr("data-srcset")), o && (i.attr("sizes", o), i.removeAttr("data-sizes")), 
                            r && (i.attr("src", r), i.removeAttr("data-src"))), i.addClass(p.loadedClass).removeClass(p.loadingClass), 
                            c.find("." + p.preloaderClass).remove(), d.params.loop && l) {
                                var e = c.attr("data-swiper-slide-index");
                                if (c.hasClass(d.params.slideDuplicateClass)) {
                                    var t = d.$wrapperEl.children('[data-swiper-slide-index="' + e + '"]:not(.' + d.params.slideDuplicateClass + ")");
                                    d.lazy.loadInSlide(t.index(), !1);
                                } else {
                                    var a = d.$wrapperEl.children("." + d.params.slideDuplicateClass + '[data-swiper-slide-index="' + e + '"]');
                                    d.lazy.loadInSlide(a.index(), !1);
                                }
                            }
                            d.emit("lazyImageReady", c[0], i[0]);
                        }
                    }), d.emit("lazyImageLoad", c[0], i[0]);
                });
            }
        },
        load: function() {
            var i = this, t = i.$wrapperEl, a = i.params, s = i.slides, e = i.activeIndex, r = i.virtual && a.virtual.enabled, n = a.lazy, o = a.slidesPerView;
            function l(e) {
                if (r) {
                    if (t.children("." + a.slideClass + '[data-swiper-slide-index="' + e + '"]').length) return !0;
                } else if (s[e]) return !0;
                return !1;
            }
            function d(e) {
                return r ? L(e).attr("data-swiper-slide-index") : L(e).index();
            }
            if ("auto" === o && (o = 0), i.lazy.initialImageLoaded || (i.lazy.initialImageLoaded = !0), 
            i.params.watchSlidesVisibility) t.children("." + a.slideVisibleClass).each(function(e, t) {
                var a = r ? L(t).attr("data-swiper-slide-index") : L(t).index();
                i.lazy.loadInSlide(a);
            }); else if (1 < o) for (var p = e; p < e + o; p += 1) l(p) && i.lazy.loadInSlide(p); else i.lazy.loadInSlide(e);
            if (n.loadPrevNext) if (1 < o || n.loadPrevNextAmount && 1 < n.loadPrevNextAmount) {
                for (var c = n.loadPrevNextAmount, u = o, h = Math.min(e + u + Math.max(c, u), s.length), v = Math.max(e - Math.max(u, c), 0), f = e + o; f < h; f += 1) l(f) && i.lazy.loadInSlide(f);
                for (var m = v; m < e; m += 1) l(m) && i.lazy.loadInSlide(m);
            } else {
                var g = t.children("." + a.slideNextClass);
                0 < g.length && i.lazy.loadInSlide(d(g));
                var b = t.children("." + a.slidePrevClass);
                0 < b.length && i.lazy.loadInSlide(d(b));
            }
        }
    }, V = {
        LinearSpline: function(e, t) {
            var a, i, s, r, n, o = function(e, t) {
                for (i = -1, a = e.length; 1 < a - i; ) e[s = a + i >> 1] <= t ? i = s : a = s;
                return a;
            };
            return this.x = e, this.y = t, this.lastIndex = e.length - 1, this.interpolate = function(e) {
                return e ? (n = o(this.x, e), r = n - 1, (e - this.x[r]) * (this.y[n] - this.y[r]) / (this.x[n] - this.x[r]) + this.y[r]) : 0;
            }, this;
        },
        getInterpolateFunction: function(e) {
            var t = this;
            t.controller.spline || (t.controller.spline = t.params.loop ? new V.LinearSpline(t.slidesGrid, e.slidesGrid) : new V.LinearSpline(t.snapGrid, e.snapGrid));
        },
        setTranslate: function(e, t) {
            var a, i, s = this, r = s.controller.control;
            function n(e) {
                var t = s.rtlTranslate ? -s.translate : s.translate;
                "slide" === s.params.controller.by && (s.controller.getInterpolateFunction(e), i = -s.controller.spline.interpolate(-t)), 
                i && "container" !== s.params.controller.by || (a = (e.maxTranslate() - e.minTranslate()) / (s.maxTranslate() - s.minTranslate()), 
                i = (t - s.minTranslate()) * a + e.minTranslate()), s.params.controller.inverse && (i = e.maxTranslate() - i), 
                e.updateProgress(i), e.setTranslate(i, s), e.updateActiveIndex(), e.updateSlidesClasses();
            }
            if (Array.isArray(r)) for (var o = 0; o < r.length; o += 1) r[o] !== t && r[o] instanceof T && n(r[o]); else r instanceof T && t !== r && n(r);
        },
        setTransition: function(t, e) {
            var a, i = this, s = i.controller.control;
            function r(e) {
                e.setTransition(t, i), 0 !== t && (e.transitionStart(), e.params.autoHeight && ee.nextTick(function() {
                    e.updateAutoHeight();
                }), e.$wrapperEl.transitionEnd(function() {
                    s && (e.params.loop && "slide" === i.params.controller.by && e.loopFix(), e.transitionEnd());
                }));
            }
            if (Array.isArray(s)) for (a = 0; a < s.length; a += 1) s[a] !== e && s[a] instanceof T && r(s[a]); else s instanceof T && e !== s && r(s);
        }
    }, F = {
        makeElFocusable: function(e) {
            return e.attr("tabIndex", "0"), e;
        },
        addElRole: function(e, t) {
            return e.attr("role", t), e;
        },
        addElLabel: function(e, t) {
            return e.attr("aria-label", t), e;
        },
        disableEl: function(e) {
            return e.attr("aria-disabled", !0), e;
        },
        enableEl: function(e) {
            return e.attr("aria-disabled", !1), e;
        },
        onEnterKey: function(e) {
            var t = this, a = t.params.a11y;
            if (13 === e.keyCode) {
                var i = L(e.target);
                t.navigation && t.navigation.$nextEl && i.is(t.navigation.$nextEl) && (t.isEnd && !t.params.loop || t.slideNext(), 
                t.isEnd ? t.a11y.notify(a.lastSlideMessage) : t.a11y.notify(a.nextSlideMessage)), 
                t.navigation && t.navigation.$prevEl && i.is(t.navigation.$prevEl) && (t.isBeginning && !t.params.loop || t.slidePrev(), 
                t.isBeginning ? t.a11y.notify(a.firstSlideMessage) : t.a11y.notify(a.prevSlideMessage)), 
                t.pagination && i.is("." + t.params.pagination.bulletClass) && i[0].click();
            }
        },
        notify: function(e) {
            var t = this.a11y.liveRegion;
            0 !== t.length && (t.html(""), t.html(e));
        },
        updateNavigation: function() {
            var e = this;
            if (!e.params.loop) {
                var t = e.navigation, a = t.$nextEl, i = t.$prevEl;
                i && 0 < i.length && (e.isBeginning ? e.a11y.disableEl(i) : e.a11y.enableEl(i)), 
                a && 0 < a.length && (e.isEnd ? e.a11y.disableEl(a) : e.a11y.enableEl(a));
            }
        },
        updatePagination: function() {
            var i = this, s = i.params.a11y;
            i.pagination && i.params.pagination.clickable && i.pagination.bullets && i.pagination.bullets.length && i.pagination.bullets.each(function(e, t) {
                var a = L(t);
                i.a11y.makeElFocusable(a), i.a11y.addElRole(a, "button"), i.a11y.addElLabel(a, s.paginationBulletMessage.replace(/{{index}}/, a.index() + 1));
            });
        },
        init: function() {
            var e = this;
            e.$el.append(e.a11y.liveRegion);
            var t, a, i = e.params.a11y;
            e.navigation && e.navigation.$nextEl && (t = e.navigation.$nextEl), e.navigation && e.navigation.$prevEl && (a = e.navigation.$prevEl), 
            t && (e.a11y.makeElFocusable(t), e.a11y.addElRole(t, "button"), e.a11y.addElLabel(t, i.nextSlideMessage), 
            t.on("keydown", e.a11y.onEnterKey)), a && (e.a11y.makeElFocusable(a), e.a11y.addElRole(a, "button"), 
            e.a11y.addElLabel(a, i.prevSlideMessage), a.on("keydown", e.a11y.onEnterKey)), e.pagination && e.params.pagination.clickable && e.pagination.bullets && e.pagination.bullets.length && e.pagination.$el.on("keydown", "." + e.params.pagination.bulletClass, e.a11y.onEnterKey);
        },
        destroy: function() {
            var e, t, a = this;
            a.a11y.liveRegion && 0 < a.a11y.liveRegion.length && a.a11y.liveRegion.remove(), 
            a.navigation && a.navigation.$nextEl && (e = a.navigation.$nextEl), a.navigation && a.navigation.$prevEl && (t = a.navigation.$prevEl), 
            e && e.off("keydown", a.a11y.onEnterKey), t && t.off("keydown", a.a11y.onEnterKey), 
            a.pagination && a.params.pagination.clickable && a.pagination.bullets && a.pagination.bullets.length && a.pagination.$el.off("keydown", "." + a.params.pagination.bulletClass, a.a11y.onEnterKey);
        }
    }, R = {
        init: function() {
            var e = this;
            if (e.params.history) {
                if (!J.history || !J.history.pushState) return e.params.history.enabled = !1, void (e.params.hashNavigation.enabled = !0);
                var t = e.history;
                t.initialized = !0, t.paths = R.getPathValues(), (t.paths.key || t.paths.value) && (t.scrollToSlide(0, t.paths.value, e.params.runCallbacksOnInit), 
                e.params.history.replaceState || J.addEventListener("popstate", e.history.setHistoryPopState));
            }
        },
        destroy: function() {
            this.params.history.replaceState || J.removeEventListener("popstate", this.history.setHistoryPopState);
        },
        setHistoryPopState: function() {
            this.history.paths = R.getPathValues(), this.history.scrollToSlide(this.params.speed, this.history.paths.value, !1);
        },
        getPathValues: function() {
            var e = J.location.pathname.slice(1).split("/").filter(function(e) {
                return "" !== e;
            }), t = e.length;
            return {
                key: e[t - 2],
                value: e[t - 1]
            };
        },
        setHistory: function(e, t) {
            if (this.history.initialized && this.params.history.enabled) {
                var a = this.slides.eq(t), i = R.slugify(a.attr("data-history"));
                J.location.pathname.includes(e) || (i = e + "/" + i);
                var s = J.history.state;
                s && s.value === i || (this.params.history.replaceState ? J.history.replaceState({
                    value: i
                }, null, i) : J.history.pushState({
                    value: i
                }, null, i));
            }
        },
        slugify: function(e) {
            return e.toString().replace(/\s+/g, "-").replace(/[^\w-]+/g, "").replace(/--+/g, "-").replace(/^-+/, "").replace(/-+$/, "");
        },
        scrollToSlide: function(e, t, a) {
            var i = this;
            if (t) for (var s = 0, r = i.slides.length; s < r; s += 1) {
                var n = i.slides.eq(s);
                if (R.slugify(n.attr("data-history")) === t && !n.hasClass(i.params.slideDuplicateClass)) {
                    var o = n.index();
                    i.slideTo(o, e, a);
                }
            } else i.slideTo(0, e, a);
        }
    }, q = {
        onHashCange: function() {
            var e = this, t = f.location.hash.replace("#", "");
            if (t !== e.slides.eq(e.activeIndex).attr("data-hash")) {
                var a = e.$wrapperEl.children("." + e.params.slideClass + '[data-hash="' + t + '"]').index();
                if (void 0 === a) return;
                e.slideTo(a);
            }
        },
        setHash: function() {
            var e = this;
            if (e.hashNavigation.initialized && e.params.hashNavigation.enabled) if (e.params.hashNavigation.replaceState && J.history && J.history.replaceState) J.history.replaceState(null, null, "#" + e.slides.eq(e.activeIndex).attr("data-hash") || ""); else {
                var t = e.slides.eq(e.activeIndex), a = t.attr("data-hash") || t.attr("data-history");
                f.location.hash = a || "";
            }
        },
        init: function() {
            var e = this;
            if (!(!e.params.hashNavigation.enabled || e.params.history && e.params.history.enabled)) {
                e.hashNavigation.initialized = !0;
                var t = f.location.hash.replace("#", "");
                if (t) for (var a = 0, i = e.slides.length; a < i; a += 1) {
                    var s = e.slides.eq(a);
                    if ((s.attr("data-hash") || s.attr("data-history")) === t && !s.hasClass(e.params.slideDuplicateClass)) {
                        var r = s.index();
                        e.slideTo(r, 0, e.params.runCallbacksOnInit, !0);
                    }
                }
                e.params.hashNavigation.watchState && L(J).on("hashchange", e.hashNavigation.onHashCange);
            }
        },
        destroy: function() {
            this.params.hashNavigation.watchState && L(J).off("hashchange", this.hashNavigation.onHashCange);
        }
    }, W = {
        run: function() {
            var e = this, t = e.slides.eq(e.activeIndex), a = e.params.autoplay.delay;
            t.attr("data-swiper-autoplay") && (a = t.attr("data-swiper-autoplay") || e.params.autoplay.delay), 
            e.autoplay.timeout = ee.nextTick(function() {
                e.params.autoplay.reverseDirection ? e.params.loop ? (e.loopFix(), e.slidePrev(e.params.speed, !0, !0), 
                e.emit("autoplay")) : e.isBeginning ? e.params.autoplay.stopOnLastSlide ? e.autoplay.stop() : (e.slideTo(e.slides.length - 1, e.params.speed, !0, !0), 
                e.emit("autoplay")) : (e.slidePrev(e.params.speed, !0, !0), e.emit("autoplay")) : e.params.loop ? (e.loopFix(), 
                e.slideNext(e.params.speed, !0, !0), e.emit("autoplay")) : e.isEnd ? e.params.autoplay.stopOnLastSlide ? e.autoplay.stop() : (e.slideTo(0, e.params.speed, !0, !0), 
                e.emit("autoplay")) : (e.slideNext(e.params.speed, !0, !0), e.emit("autoplay"));
            }, a);
        },
        start: function() {
            var e = this;
            return void 0 === e.autoplay.timeout && (!e.autoplay.running && (e.autoplay.running = !0, 
            e.emit("autoplayStart"), e.autoplay.run(), !0));
        },
        stop: function() {
            var e = this;
            return !!e.autoplay.running && (void 0 !== e.autoplay.timeout && (e.autoplay.timeout && (clearTimeout(e.autoplay.timeout), 
            e.autoplay.timeout = void 0), e.autoplay.running = !1, e.emit("autoplayStop"), !0));
        },
        pause: function(e) {
            var t = this;
            t.autoplay.running && (t.autoplay.paused || (t.autoplay.timeout && clearTimeout(t.autoplay.timeout), 
            t.autoplay.paused = !0, 0 !== e && t.params.autoplay.waitForTransition ? (t.$wrapperEl[0].addEventListener("transitionend", t.autoplay.onTransitionEnd), 
            t.$wrapperEl[0].addEventListener("webkitTransitionEnd", t.autoplay.onTransitionEnd)) : (t.autoplay.paused = !1, 
            t.autoplay.run())));
        }
    }, j = {
        setTranslate: function() {
            for (var e = this, t = e.slides, a = 0; a < t.length; a += 1) {
                var i = e.slides.eq(a), s = -i[0].swiperSlideOffset;
                e.params.virtualTranslate || (s -= e.translate);
                var r = 0;
                e.isHorizontal() || (r = s, s = 0);
                var n = e.params.fadeEffect.crossFade ? Math.max(1 - Math.abs(i[0].progress), 0) : 1 + Math.min(Math.max(i[0].progress, -1), 0);
                i.css({
                    opacity: n
                }).transform("translate3d(" + s + "px, " + r + "px, 0px)");
            }
        },
        setTransition: function(e) {
            var a = this, t = a.slides, i = a.$wrapperEl;
            if (t.transition(e), a.params.virtualTranslate && 0 !== e) {
                var s = !1;
                t.transitionEnd(function() {
                    if (!s && a && !a.destroyed) {
                        s = !0, a.animating = !1;
                        for (var e = [ "webkitTransitionEnd", "transitionend" ], t = 0; t < e.length; t += 1) i.trigger(e[t]);
                    }
                });
            }
        }
    }, U = {
        setTranslate: function() {
            var e, t = this, a = t.$el, i = t.$wrapperEl, s = t.slides, r = t.width, n = t.height, o = t.rtlTranslate, l = t.size, d = t.params.cubeEffect, p = t.isHorizontal(), c = t.virtual && t.params.virtual.enabled, u = 0;
            d.shadow && (p ? (0 === (e = i.find(".swiper-cube-shadow")).length && (e = L('<div class="swiper-cube-shadow"></div>'), 
            i.append(e)), e.css({
                height: r + "px"
            })) : 0 === (e = a.find(".swiper-cube-shadow")).length && (e = L('<div class="swiper-cube-shadow"></div>'), 
            a.append(e)));
            for (var h = 0; h < s.length; h += 1) {
                var v = s.eq(h), f = h;
                c && (f = parseInt(v.attr("data-swiper-slide-index"), 10));
                var m = 90 * f, g = Math.floor(m / 360);
                o && (m = -m, g = Math.floor(-m / 360));
                var b = Math.max(Math.min(v[0].progress, 1), -1), w = 0, y = 0, x = 0;
                f % 4 == 0 ? (w = 4 * -g * l, x = 0) : (f - 1) % 4 == 0 ? (w = 0, x = 4 * -g * l) : (f - 2) % 4 == 0 ? (w = l + 4 * g * l, 
                x = l) : (f - 3) % 4 == 0 && (w = -l, x = 3 * l + 4 * l * g), o && (w = -w), p || (y = w, 
                w = 0);
                var T = "rotateX(" + (p ? 0 : -m) + "deg) rotateY(" + (p ? m : 0) + "deg) translate3d(" + w + "px, " + y + "px, " + x + "px)";
                if (b <= 1 && -1 < b && (u = 90 * f + 90 * b, o && (u = 90 * -f - 90 * b)), v.transform(T), 
                d.slideShadows) {
                    var E = p ? v.find(".swiper-slide-shadow-left") : v.find(".swiper-slide-shadow-top"), S = p ? v.find(".swiper-slide-shadow-right") : v.find(".swiper-slide-shadow-bottom");
                    0 === E.length && (E = L('<div class="swiper-slide-shadow-' + (p ? "left" : "top") + '"></div>'), 
                    v.append(E)), 0 === S.length && (S = L('<div class="swiper-slide-shadow-' + (p ? "right" : "bottom") + '"></div>'), 
                    v.append(S)), E.length && (E[0].style.opacity = Math.max(-b, 0)), S.length && (S[0].style.opacity = Math.max(b, 0));
                }
            }
            if (i.css({
                "-webkit-transform-origin": "50% 50% -" + l / 2 + "px",
                "-moz-transform-origin": "50% 50% -" + l / 2 + "px",
                "-ms-transform-origin": "50% 50% -" + l / 2 + "px",
                "transform-origin": "50% 50% -" + l / 2 + "px"
            }), d.shadow) if (p) e.transform("translate3d(0px, " + (r / 2 + d.shadowOffset) + "px, " + -r / 2 + "px) rotateX(90deg) rotateZ(0deg) scale(" + d.shadowScale + ")"); else {
                var C = Math.abs(u) - 90 * Math.floor(Math.abs(u) / 90), M = 1.5 - (Math.sin(2 * C * Math.PI / 360) / 2 + Math.cos(2 * C * Math.PI / 360) / 2), z = d.shadowScale, P = d.shadowScale / M, k = d.shadowOffset;
                e.transform("scale3d(" + z + ", 1, " + P + ") translate3d(0px, " + (n / 2 + k) + "px, " + -n / 2 / P + "px) rotateX(-90deg)");
            }
            var $ = I.isSafari || I.isUiWebView ? -l / 2 : 0;
            i.transform("translate3d(0px,0," + $ + "px) rotateX(" + (t.isHorizontal() ? 0 : u) + "deg) rotateY(" + (t.isHorizontal() ? -u : 0) + "deg)");
        },
        setTransition: function(e) {
            var t = this.$el;
            this.slides.transition(e).find(".swiper-slide-shadow-top, .swiper-slide-shadow-right, .swiper-slide-shadow-bottom, .swiper-slide-shadow-left").transition(e), 
            this.params.cubeEffect.shadow && !this.isHorizontal() && t.find(".swiper-cube-shadow").transition(e);
        }
    }, K = {
        setTranslate: function() {
            for (var e = this, t = e.slides, a = e.rtlTranslate, i = 0; i < t.length; i += 1) {
                var s = t.eq(i), r = s[0].progress;
                e.params.flipEffect.limitRotation && (r = Math.max(Math.min(s[0].progress, 1), -1));
                var n = -180 * r, o = 0, l = -s[0].swiperSlideOffset, d = 0;
                if (e.isHorizontal() ? a && (n = -n) : (d = l, o = -n, n = l = 0), s[0].style.zIndex = -Math.abs(Math.round(r)) + t.length, 
                e.params.flipEffect.slideShadows) {
                    var p = e.isHorizontal() ? s.find(".swiper-slide-shadow-left") : s.find(".swiper-slide-shadow-top"), c = e.isHorizontal() ? s.find(".swiper-slide-shadow-right") : s.find(".swiper-slide-shadow-bottom");
                    0 === p.length && (p = L('<div class="swiper-slide-shadow-' + (e.isHorizontal() ? "left" : "top") + '"></div>'), 
                    s.append(p)), 0 === c.length && (c = L('<div class="swiper-slide-shadow-' + (e.isHorizontal() ? "right" : "bottom") + '"></div>'), 
                    s.append(c)), p.length && (p[0].style.opacity = Math.max(-r, 0)), c.length && (c[0].style.opacity = Math.max(r, 0));
                }
                s.transform("translate3d(" + l + "px, " + d + "px, 0px) rotateX(" + o + "deg) rotateY(" + n + "deg)");
            }
        },
        setTransition: function(e) {
            var a = this, t = a.slides, i = a.activeIndex, s = a.$wrapperEl;
            if (t.transition(e).find(".swiper-slide-shadow-top, .swiper-slide-shadow-right, .swiper-slide-shadow-bottom, .swiper-slide-shadow-left").transition(e), 
            a.params.virtualTranslate && 0 !== e) {
                var r = !1;
                t.eq(i).transitionEnd(function() {
                    if (!r && a && !a.destroyed) {
                        r = !0, a.animating = !1;
                        for (var e = [ "webkitTransitionEnd", "transitionend" ], t = 0; t < e.length; t += 1) s.trigger(e[t]);
                    }
                });
            }
        }
    }, _ = {
        setTranslate: function() {
            for (var e = this, t = e.width, a = e.height, i = e.slides, s = e.$wrapperEl, r = e.slidesSizesGrid, n = e.params.coverflowEffect, o = e.isHorizontal(), l = e.translate, d = o ? t / 2 - l : a / 2 - l, p = o ? n.rotate : -n.rotate, c = n.depth, u = 0, h = i.length; u < h; u += 1) {
                var v = i.eq(u), f = r[u], m = (d - v[0].swiperSlideOffset - f / 2) / f * n.modifier, g = o ? p * m : 0, b = o ? 0 : p * m, w = -c * Math.abs(m), y = o ? 0 : n.stretch * m, x = o ? n.stretch * m : 0;
                Math.abs(x) < .001 && (x = 0), Math.abs(y) < .001 && (y = 0), Math.abs(w) < .001 && (w = 0), 
                Math.abs(g) < .001 && (g = 0), Math.abs(b) < .001 && (b = 0);
                var T = "translate3d(" + x + "px," + y + "px," + w + "px)  rotateX(" + b + "deg) rotateY(" + g + "deg)";
                if (v.transform(T), v[0].style.zIndex = 1 - Math.abs(Math.round(m)), n.slideShadows) {
                    var E = o ? v.find(".swiper-slide-shadow-left") : v.find(".swiper-slide-shadow-top"), S = o ? v.find(".swiper-slide-shadow-right") : v.find(".swiper-slide-shadow-bottom");
                    0 === E.length && (E = L('<div class="swiper-slide-shadow-' + (o ? "left" : "top") + '"></div>'), 
                    v.append(E)), 0 === S.length && (S = L('<div class="swiper-slide-shadow-' + (o ? "right" : "bottom") + '"></div>'), 
                    v.append(S)), E.length && (E[0].style.opacity = 0 < m ? m : 0), S.length && (S[0].style.opacity = 0 < -m ? -m : 0);
                }
            }
            (te.pointerEvents || te.prefixedPointerEvents) && (s[0].style.perspectiveOrigin = d + "px 50%");
        },
        setTransition: function(e) {
            this.slides.transition(e).find(".swiper-slide-shadow-top, .swiper-slide-shadow-right, .swiper-slide-shadow-bottom, .swiper-slide-shadow-left").transition(e);
        }
    }, Z = {
        init: function() {
            var e = this, t = e.params.thumbs, a = e.constructor;
            t.swiper instanceof a ? (e.thumbs.swiper = t.swiper, ee.extend(e.thumbs.swiper.originalParams, {
                watchSlidesProgress: !0,
                slideToClickedSlide: !1
            }), ee.extend(e.thumbs.swiper.params, {
                watchSlidesProgress: !0,
                slideToClickedSlide: !1
            })) : ee.isObject(t.swiper) && (e.thumbs.swiper = new a(ee.extend({}, t.swiper, {
                watchSlidesVisibility: !0,
                watchSlidesProgress: !0,
                slideToClickedSlide: !1
            })), e.thumbs.swiperCreated = !0), e.thumbs.swiper.$el.addClass(e.params.thumbs.thumbsContainerClass), 
            e.thumbs.swiper.on("tap", e.thumbs.onThumbClick);
        },
        onThumbClick: function() {
            var e = this, t = e.thumbs.swiper;
            if (t) {
                var a = t.clickedIndex, i = t.clickedSlide;
                if (!(i && L(i).hasClass(e.params.thumbs.slideThumbActiveClass) || null == a)) {
                    var s;
                    if (s = t.params.loop ? parseInt(L(t.clickedSlide).attr("data-swiper-slide-index"), 10) : a, 
                    e.params.loop) {
                        var r = e.activeIndex;
                        e.slides.eq(r).hasClass(e.params.slideDuplicateClass) && (e.loopFix(), e._clientLeft = e.$wrapperEl[0].clientLeft, 
                        r = e.activeIndex);
                        var n = e.slides.eq(r).prevAll('[data-swiper-slide-index="' + s + '"]').eq(0).index(), o = e.slides.eq(r).nextAll('[data-swiper-slide-index="' + s + '"]').eq(0).index();
                        s = void 0 === n ? o : void 0 === o ? n : o - r < r - n ? o : n;
                    }
                    e.slideTo(s);
                }
            }
        },
        update: function(e) {
            var t = this, a = t.thumbs.swiper;
            if (a) {
                var i = "auto" === a.params.slidesPerView ? a.slidesPerViewDynamic() : a.params.slidesPerView;
                if (t.realIndex !== a.realIndex) {
                    var s, r = a.activeIndex;
                    if (a.params.loop) {
                        a.slides.eq(r).hasClass(a.params.slideDuplicateClass) && (a.loopFix(), a._clientLeft = a.$wrapperEl[0].clientLeft, 
                        r = a.activeIndex);
                        var n = a.slides.eq(r).prevAll('[data-swiper-slide-index="' + t.realIndex + '"]').eq(0).index(), o = a.slides.eq(r).nextAll('[data-swiper-slide-index="' + t.realIndex + '"]').eq(0).index();
                        s = void 0 === n ? o : void 0 === o ? n : o - r == r - n ? r : o - r < r - n ? o : n;
                    } else s = t.realIndex;
                    a.visibleSlidesIndexes.indexOf(s) < 0 && (a.params.centeredSlides ? s = r < s ? s - Math.floor(i / 2) + 1 : s + Math.floor(i / 2) - 1 : r < s && (s = s - i + 1), 
                    a.slideTo(s, e ? 0 : void 0));
                }
                var l = 1, d = t.params.thumbs.slideThumbActiveClass;
                if (1 < t.params.slidesPerView && !t.params.centeredSlides && (l = t.params.slidesPerView), 
                a.slides.removeClass(d), a.params.loop) for (var p = 0; p < l; p += 1) a.$wrapperEl.children('[data-swiper-slide-index="' + (t.realIndex + p) + '"]').addClass(d); else for (var c = 0; c < l; c += 1) a.slides.eq(t.realIndex + c).addClass(d);
            }
        }
    }, Q = [ E, S, C, M, P, $, O, {
        name: "mousewheel",
        params: {
            mousewheel: {
                enabled: !1,
                releaseOnEdges: !1,
                invert: !1,
                forceToAxis: !1,
                sensitivity: 1,
                eventsTarged: "container"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                mousewheel: {
                    enabled: !1,
                    enable: A.enable.bind(e),
                    disable: A.disable.bind(e),
                    handle: A.handle.bind(e),
                    handleMouseEnter: A.handleMouseEnter.bind(e),
                    handleMouseLeave: A.handleMouseLeave.bind(e),
                    lastScrollTime: ee.now()
                }
            });
        },
        on: {
            init: function() {
                this.params.mousewheel.enabled && this.mousewheel.enable();
            },
            destroy: function() {
                this.mousewheel.enabled && this.mousewheel.disable();
            }
        }
    }, {
        name: "navigation",
        params: {
            navigation: {
                nextEl: null,
                prevEl: null,
                hideOnClick: !1,
                disabledClass: "swiper-button-disabled",
                hiddenClass: "swiper-button-hidden",
                lockClass: "swiper-button-lock"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                navigation: {
                    init: H.init.bind(e),
                    update: H.update.bind(e),
                    destroy: H.destroy.bind(e),
                    onNextClick: H.onNextClick.bind(e),
                    onPrevClick: H.onPrevClick.bind(e)
                }
            });
        },
        on: {
            init: function() {
                this.navigation.init(), this.navigation.update();
            },
            toEdge: function() {
                this.navigation.update();
            },
            fromEdge: function() {
                this.navigation.update();
            },
            destroy: function() {
                this.navigation.destroy();
            },
            click: function(e) {
                var t, a = this, i = a.navigation, s = i.$nextEl, r = i.$prevEl;
                !a.params.navigation.hideOnClick || L(e.target).is(r) || L(e.target).is(s) || (s ? t = s.hasClass(a.params.navigation.hiddenClass) : r && (t = r.hasClass(a.params.navigation.hiddenClass)), 
                !0 === t ? a.emit("navigationShow", a) : a.emit("navigationHide", a), s && s.toggleClass(a.params.navigation.hiddenClass), 
                r && r.toggleClass(a.params.navigation.hiddenClass));
            }
        }
    }, {
        name: "pagination",
        params: {
            pagination: {
                el: null,
                bulletElement: "span",
                clickable: !1,
                hideOnClick: !1,
                renderBullet: null,
                renderProgressbar: null,
                renderFraction: null,
                renderCustom: null,
                progressbarOpposite: !1,
                type: "bullets",
                dynamicBullets: !1,
                dynamicMainBullets: 1,
                formatFractionCurrent: function(e) {
                    return e;
                },
                formatFractionTotal: function(e) {
                    return e;
                },
                bulletClass: "swiper-pagination-bullet",
                bulletActiveClass: "swiper-pagination-bullet-active",
                modifierClass: "swiper-pagination-",
                currentClass: "swiper-pagination-current",
                totalClass: "swiper-pagination-total",
                hiddenClass: "swiper-pagination-hidden",
                progressbarFillClass: "swiper-pagination-progressbar-fill",
                progressbarOppositeClass: "swiper-pagination-progressbar-opposite",
                clickableClass: "swiper-pagination-clickable",
                lockClass: "swiper-pagination-lock"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                pagination: {
                    init: N.init.bind(e),
                    render: N.render.bind(e),
                    update: N.update.bind(e),
                    destroy: N.destroy.bind(e),
                    dynamicBulletIndex: 0
                }
            });
        },
        on: {
            init: function() {
                this.pagination.init(), this.pagination.render(), this.pagination.update();
            },
            activeIndexChange: function() {
                this.params.loop ? this.pagination.update() : void 0 === this.snapIndex && this.pagination.update();
            },
            snapIndexChange: function() {
                this.params.loop || this.pagination.update();
            },
            slidesLengthChange: function() {
                this.params.loop && (this.pagination.render(), this.pagination.update());
            },
            snapGridLengthChange: function() {
                this.params.loop || (this.pagination.render(), this.pagination.update());
            },
            destroy: function() {
                this.pagination.destroy();
            },
            click: function(e) {
                var t = this;
                t.params.pagination.el && t.params.pagination.hideOnClick && 0 < t.pagination.$el.length && !L(e.target).hasClass(t.params.pagination.bulletClass) && (!0 === t.pagination.$el.hasClass(t.params.pagination.hiddenClass) ? t.emit("paginationShow", t) : t.emit("paginationHide", t), 
                t.pagination.$el.toggleClass(t.params.pagination.hiddenClass));
            }
        }
    }, {
        name: "scrollbar",
        params: {
            scrollbar: {
                el: null,
                dragSize: "auto",
                hide: !1,
                draggable: !1,
                snapOnRelease: !0,
                lockClass: "swiper-scrollbar-lock",
                dragClass: "swiper-scrollbar-drag"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                scrollbar: {
                    init: G.init.bind(e),
                    destroy: G.destroy.bind(e),
                    updateSize: G.updateSize.bind(e),
                    setTranslate: G.setTranslate.bind(e),
                    setTransition: G.setTransition.bind(e),
                    enableDraggable: G.enableDraggable.bind(e),
                    disableDraggable: G.disableDraggable.bind(e),
                    setDragPosition: G.setDragPosition.bind(e),
                    onDragStart: G.onDragStart.bind(e),
                    onDragMove: G.onDragMove.bind(e),
                    onDragEnd: G.onDragEnd.bind(e),
                    isTouched: !1,
                    timeout: null,
                    dragTimeout: null
                }
            });
        },
        on: {
            init: function() {
                this.scrollbar.init(), this.scrollbar.updateSize(), this.scrollbar.setTranslate();
            },
            update: function() {
                this.scrollbar.updateSize();
            },
            resize: function() {
                this.scrollbar.updateSize();
            },
            observerUpdate: function() {
                this.scrollbar.updateSize();
            },
            setTranslate: function() {
                this.scrollbar.setTranslate();
            },
            setTransition: function(e) {
                this.scrollbar.setTransition(e);
            },
            destroy: function() {
                this.scrollbar.destroy();
            }
        }
    }, {
        name: "parallax",
        params: {
            parallax: {
                enabled: !1
            }
        },
        create: function() {
            ee.extend(this, {
                parallax: {
                    setTransform: B.setTransform.bind(this),
                    setTranslate: B.setTranslate.bind(this),
                    setTransition: B.setTransition.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                this.params.parallax.enabled && (this.params.watchSlidesProgress = !0, this.originalParams.watchSlidesProgress = !0);
            },
            init: function() {
                this.params.parallax.enabled && this.parallax.setTranslate();
            },
            setTranslate: function() {
                this.params.parallax.enabled && this.parallax.setTranslate();
            },
            setTransition: function(e) {
                this.params.parallax.enabled && this.parallax.setTransition(e);
            }
        }
    }, {
        name: "zoom",
        params: {
            zoom: {
                enabled: !1,
                maxRatio: 3,
                minRatio: 1,
                toggle: !0,
                containerClass: "swiper-zoom-container",
                zoomedSlideClass: "swiper-slide-zoomed"
            }
        },
        create: function() {
            var i = this, t = {
                enabled: !1,
                scale: 1,
                currentScale: 1,
                isScaling: !1,
                gesture: {
                    $slideEl: void 0,
                    slideWidth: void 0,
                    slideHeight: void 0,
                    $imageEl: void 0,
                    $imageWrapEl: void 0,
                    maxRatio: 3
                },
                image: {
                    isTouched: void 0,
                    isMoved: void 0,
                    currentX: void 0,
                    currentY: void 0,
                    minX: void 0,
                    minY: void 0,
                    maxX: void 0,
                    maxY: void 0,
                    width: void 0,
                    height: void 0,
                    startX: void 0,
                    startY: void 0,
                    touchesStart: {},
                    touchesCurrent: {}
                },
                velocity: {
                    x: void 0,
                    y: void 0,
                    prevPositionX: void 0,
                    prevPositionY: void 0,
                    prevTime: void 0
                }
            };
            "onGestureStart onGestureChange onGestureEnd onTouchStart onTouchMove onTouchEnd onTransitionEnd toggle enable disable in out".split(" ").forEach(function(e) {
                t[e] = X[e].bind(i);
            }), ee.extend(i, {
                zoom: t
            });
            var s = 1;
            Object.defineProperty(i.zoom, "scale", {
                get: function() {
                    return s;
                },
                set: function(e) {
                    if (s !== e) {
                        var t = i.zoom.gesture.$imageEl ? i.zoom.gesture.$imageEl[0] : void 0, a = i.zoom.gesture.$slideEl ? i.zoom.gesture.$slideEl[0] : void 0;
                        i.emit("zoomChange", e, t, a);
                    }
                    s = e;
                }
            });
        },
        on: {
            init: function() {
                this.params.zoom.enabled && this.zoom.enable();
            },
            destroy: function() {
                this.zoom.disable();
            },
            touchStart: function(e) {
                this.zoom.enabled && this.zoom.onTouchStart(e);
            },
            touchEnd: function(e) {
                this.zoom.enabled && this.zoom.onTouchEnd(e);
            },
            doubleTap: function(e) {
                this.params.zoom.enabled && this.zoom.enabled && this.params.zoom.toggle && this.zoom.toggle(e);
            },
            transitionEnd: function() {
                this.zoom.enabled && this.params.zoom.enabled && this.zoom.onTransitionEnd();
            }
        }
    }, {
        name: "lazy",
        params: {
            lazy: {
                enabled: !1,
                loadPrevNext: !1,
                loadPrevNextAmount: 1,
                loadOnTransitionStart: !1,
                elementClass: "swiper-lazy",
                loadingClass: "swiper-lazy-loading",
                loadedClass: "swiper-lazy-loaded",
                preloaderClass: "swiper-lazy-preloader"
            }
        },
        create: function() {
            ee.extend(this, {
                lazy: {
                    initialImageLoaded: !1,
                    load: Y.load.bind(this),
                    loadInSlide: Y.loadInSlide.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                this.params.lazy.enabled && this.params.preloadImages && (this.params.preloadImages = !1);
            },
            init: function() {
                this.params.lazy.enabled && !this.params.loop && 0 === this.params.initialSlide && this.lazy.load();
            },
            scroll: function() {
                this.params.freeMode && !this.params.freeModeSticky && this.lazy.load();
            },
            resize: function() {
                this.params.lazy.enabled && this.lazy.load();
            },
            scrollbarDragMove: function() {
                this.params.lazy.enabled && this.lazy.load();
            },
            transitionStart: function() {
                var e = this;
                e.params.lazy.enabled && (e.params.lazy.loadOnTransitionStart || !e.params.lazy.loadOnTransitionStart && !e.lazy.initialImageLoaded) && e.lazy.load();
            },
            transitionEnd: function() {
                this.params.lazy.enabled && !this.params.lazy.loadOnTransitionStart && this.lazy.load();
            }
        }
    }, {
        name: "controller",
        params: {
            controller: {
                control: void 0,
                inverse: !1,
                by: "slide"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                controller: {
                    control: e.params.controller.control,
                    getInterpolateFunction: V.getInterpolateFunction.bind(e),
                    setTranslate: V.setTranslate.bind(e),
                    setTransition: V.setTransition.bind(e)
                }
            });
        },
        on: {
            update: function() {
                this.controller.control && this.controller.spline && (this.controller.spline = void 0, 
                delete this.controller.spline);
            },
            resize: function() {
                this.controller.control && this.controller.spline && (this.controller.spline = void 0, 
                delete this.controller.spline);
            },
            observerUpdate: function() {
                this.controller.control && this.controller.spline && (this.controller.spline = void 0, 
                delete this.controller.spline);
            },
            setTranslate: function(e, t) {
                this.controller.control && this.controller.setTranslate(e, t);
            },
            setTransition: function(e, t) {
                this.controller.control && this.controller.setTransition(e, t);
            }
        }
    }, {
        name: "a11y",
        params: {
            a11y: {
                enabled: !0,
                notificationClass: "swiper-notification",
                prevSlideMessage: "Previous slide",
                nextSlideMessage: "Next slide",
                firstSlideMessage: "This is the first slide",
                lastSlideMessage: "This is the last slide",
                paginationBulletMessage: "Go to slide {{index}}"
            }
        },
        create: function() {
            var t = this;
            ee.extend(t, {
                a11y: {
                    liveRegion: L('<span class="' + t.params.a11y.notificationClass + '" aria-live="assertive" aria-atomic="true"></span>')
                }
            }), Object.keys(F).forEach(function(e) {
                t.a11y[e] = F[e].bind(t);
            });
        },
        on: {
            init: function() {
                this.params.a11y.enabled && (this.a11y.init(), this.a11y.updateNavigation());
            },
            toEdge: function() {
                this.params.a11y.enabled && this.a11y.updateNavigation();
            },
            fromEdge: function() {
                this.params.a11y.enabled && this.a11y.updateNavigation();
            },
            paginationUpdate: function() {
                this.params.a11y.enabled && this.a11y.updatePagination();
            },
            destroy: function() {
                this.params.a11y.enabled && this.a11y.destroy();
            }
        }
    }, {
        name: "history",
        params: {
            history: {
                enabled: !1,
                replaceState: !1,
                key: "slides"
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                history: {
                    init: R.init.bind(e),
                    setHistory: R.setHistory.bind(e),
                    setHistoryPopState: R.setHistoryPopState.bind(e),
                    scrollToSlide: R.scrollToSlide.bind(e),
                    destroy: R.destroy.bind(e)
                }
            });
        },
        on: {
            init: function() {
                this.params.history.enabled && this.history.init();
            },
            destroy: function() {
                this.params.history.enabled && this.history.destroy();
            },
            transitionEnd: function() {
                this.history.initialized && this.history.setHistory(this.params.history.key, this.activeIndex);
            }
        }
    }, {
        name: "hash-navigation",
        params: {
            hashNavigation: {
                enabled: !1,
                replaceState: !1,
                watchState: !1
            }
        },
        create: function() {
            var e = this;
            ee.extend(e, {
                hashNavigation: {
                    initialized: !1,
                    init: q.init.bind(e),
                    destroy: q.destroy.bind(e),
                    setHash: q.setHash.bind(e),
                    onHashCange: q.onHashCange.bind(e)
                }
            });
        },
        on: {
            init: function() {
                this.params.hashNavigation.enabled && this.hashNavigation.init();
            },
            destroy: function() {
                this.params.hashNavigation.enabled && this.hashNavigation.destroy();
            },
            transitionEnd: function() {
                this.hashNavigation.initialized && this.hashNavigation.setHash();
            }
        }
    }, {
        name: "autoplay",
        params: {
            autoplay: {
                enabled: !1,
                delay: 3e3,
                waitForTransition: !0,
                disableOnInteraction: !0,
                stopOnLastSlide: !1,
                reverseDirection: !1
            }
        },
        create: function() {
            var t = this;
            ee.extend(t, {
                autoplay: {
                    running: !1,
                    paused: !1,
                    run: W.run.bind(t),
                    start: W.start.bind(t),
                    stop: W.stop.bind(t),
                    pause: W.pause.bind(t),
                    onTransitionEnd: function(e) {
                        t && !t.destroyed && t.$wrapperEl && e.target === this && (t.$wrapperEl[0].removeEventListener("transitionend", t.autoplay.onTransitionEnd), 
                        t.$wrapperEl[0].removeEventListener("webkitTransitionEnd", t.autoplay.onTransitionEnd), 
                        t.autoplay.paused = !1, t.autoplay.running ? t.autoplay.run() : t.autoplay.stop());
                    }
                }
            });
        },
        on: {
            init: function() {
                this.params.autoplay.enabled && this.autoplay.start();
            },
            beforeTransitionStart: function(e, t) {
                this.autoplay.running && (t || !this.params.autoplay.disableOnInteraction ? this.autoplay.pause(e) : this.autoplay.stop());
            },
            sliderFirstMove: function() {
                this.autoplay.running && (this.params.autoplay.disableOnInteraction ? this.autoplay.stop() : this.autoplay.pause());
            },
            destroy: function() {
                this.autoplay.running && this.autoplay.stop();
            }
        }
    }, {
        name: "effect-fade",
        params: {
            fadeEffect: {
                crossFade: !1
            }
        },
        create: function() {
            ee.extend(this, {
                fadeEffect: {
                    setTranslate: j.setTranslate.bind(this),
                    setTransition: j.setTransition.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this;
                if ("fade" === e.params.effect) {
                    e.classNames.push(e.params.containerModifierClass + "fade");
                    var t = {
                        slidesPerView: 1,
                        slidesPerColumn: 1,
                        slidesPerGroup: 1,
                        watchSlidesProgress: !0,
                        spaceBetween: 0,
                        virtualTranslate: !0
                    };
                    ee.extend(e.params, t), ee.extend(e.originalParams, t);
                }
            },
            setTranslate: function() {
                "fade" === this.params.effect && this.fadeEffect.setTranslate();
            },
            setTransition: function(e) {
                "fade" === this.params.effect && this.fadeEffect.setTransition(e);
            }
        }
    }, {
        name: "effect-cube",
        params: {
            cubeEffect: {
                slideShadows: !0,
                shadow: !0,
                shadowOffset: 20,
                shadowScale: .94
            }
        },
        create: function() {
            ee.extend(this, {
                cubeEffect: {
                    setTranslate: U.setTranslate.bind(this),
                    setTransition: U.setTransition.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this;
                if ("cube" === e.params.effect) {
                    e.classNames.push(e.params.containerModifierClass + "cube"), e.classNames.push(e.params.containerModifierClass + "3d");
                    var t = {
                        slidesPerView: 1,
                        slidesPerColumn: 1,
                        slidesPerGroup: 1,
                        watchSlidesProgress: !0,
                        resistanceRatio: 0,
                        spaceBetween: 0,
                        centeredSlides: !1,
                        virtualTranslate: !0
                    };
                    ee.extend(e.params, t), ee.extend(e.originalParams, t);
                }
            },
            setTranslate: function() {
                "cube" === this.params.effect && this.cubeEffect.setTranslate();
            },
            setTransition: function(e) {
                "cube" === this.params.effect && this.cubeEffect.setTransition(e);
            }
        }
    }, {
        name: "effect-flip",
        params: {
            flipEffect: {
                slideShadows: !0,
                limitRotation: !0
            }
        },
        create: function() {
            ee.extend(this, {
                flipEffect: {
                    setTranslate: K.setTranslate.bind(this),
                    setTransition: K.setTransition.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this;
                if ("flip" === e.params.effect) {
                    e.classNames.push(e.params.containerModifierClass + "flip"), e.classNames.push(e.params.containerModifierClass + "3d");
                    var t = {
                        slidesPerView: 1,
                        slidesPerColumn: 1,
                        slidesPerGroup: 1,
                        watchSlidesProgress: !0,
                        spaceBetween: 0,
                        virtualTranslate: !0
                    };
                    ee.extend(e.params, t), ee.extend(e.originalParams, t);
                }
            },
            setTranslate: function() {
                "flip" === this.params.effect && this.flipEffect.setTranslate();
            },
            setTransition: function(e) {
                "flip" === this.params.effect && this.flipEffect.setTransition(e);
            }
        }
    }, {
        name: "effect-coverflow",
        params: {
            coverflowEffect: {
                rotate: 50,
                stretch: 0,
                depth: 100,
                modifier: 1,
                slideShadows: !0
            }
        },
        create: function() {
            ee.extend(this, {
                coverflowEffect: {
                    setTranslate: _.setTranslate.bind(this),
                    setTransition: _.setTransition.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this;
                "coverflow" === e.params.effect && (e.classNames.push(e.params.containerModifierClass + "coverflow"), 
                e.classNames.push(e.params.containerModifierClass + "3d"), e.params.watchSlidesProgress = !0, 
                e.originalParams.watchSlidesProgress = !0);
            },
            setTranslate: function() {
                "coverflow" === this.params.effect && this.coverflowEffect.setTranslate();
            },
            setTransition: function(e) {
                "coverflow" === this.params.effect && this.coverflowEffect.setTransition(e);
            }
        }
    }, {
        name: "thumbs",
        params: {
            thumbs: {
                swiper: null,
                slideThumbActiveClass: "swiper-slide-thumb-active",
                thumbsContainerClass: "swiper-container-thumbs"
            }
        },
        create: function() {
            ee.extend(this, {
                thumbs: {
                    swiper: null,
                    init: Z.init.bind(this),
                    update: Z.update.bind(this),
                    onThumbClick: Z.onThumbClick.bind(this)
                }
            });
        },
        on: {
            beforeInit: function() {
                var e = this.params.thumbs;
                e && e.swiper && (this.thumbs.init(), this.thumbs.update(!0));
            },
            slideChange: function() {
                this.thumbs.swiper && this.thumbs.update();
            },
            update: function() {
                this.thumbs.swiper && this.thumbs.update();
            },
            resize: function() {
                this.thumbs.swiper && this.thumbs.update();
            },
            observerUpdate: function() {
                this.thumbs.swiper && this.thumbs.update();
            },
            setTransition: function(e) {
                var t = this.thumbs.swiper;
                t && t.setTransition(e);
            },
            beforeDestroy: function() {
                var e = this.thumbs.swiper;
                e && this.thumbs.swiperCreated && e && e.destroy();
            }
        }
    } ];
    return void 0 === T.use && (T.use = T.Class.use, T.installModule = T.Class.installModule), 
    T.use(Q), T;
});

//# sourceMappingURL=swiper.min.js.map
/**
 * Owl Carousel v2.3.4
 * Copyright 2013-2018 David Deutsch
 * Licensed under: SEE LICENSE IN https://github.com/OwlCarousel2/OwlCarousel2/blob/master/LICENSE
 */ !function(a, b, c, d) {
    function e(b, c) {
        this.settings = null, this.options = a.extend({}, e.Defaults, c), this.$element = a(b), 
        this._handlers = {}, this._plugins = {}, this._supress = {}, this._current = null, 
        this._speed = null, this._coordinates = [], this._breakpoint = null, this._width = null, 
        this._items = [], this._clones = [], this._mergers = [], this._widths = [], this._invalidated = {}, 
        this._pipe = [], this._drag = {
            time: null,
            target: null,
            pointer: null,
            stage: {
                start: null,
                current: null
            },
            direction: null
        }, this._states = {
            current: {},
            tags: {
                initializing: [ "busy" ],
                animating: [ "busy" ],
                dragging: [ "interacting" ]
            }
        }, a.each([ "onResize", "onThrottledResize" ], a.proxy(function(b, c) {
            this._handlers[c] = a.proxy(this[c], this);
        }, this)), a.each(e.Plugins, a.proxy(function(a, b) {
            this._plugins[a.charAt(0).toLowerCase() + a.slice(1)] = new b(this);
        }, this)), a.each(e.Workers, a.proxy(function(b, c) {
            this._pipe.push({
                filter: c.filter,
                run: a.proxy(c.run, this)
            });
        }, this)), this.setup(), this.initialize();
    }
    e.Defaults = {
        items: 3,
        loop: !1,
        center: !1,
        rewind: !1,
        checkVisibility: !0,
        mouseDrag: !0,
        touchDrag: !0,
        pullDrag: !0,
        freeDrag: !1,
        margin: 0,
        stagePadding: 0,
        merge: !1,
        mergeFit: !0,
        autoWidth: !1,
        startPosition: 0,
        rtl: !1,
        smartSpeed: 250,
        fluidSpeed: !1,
        dragEndSpeed: !1,
        responsive: {},
        responsiveRefreshRate: 200,
        responsiveBaseElement: b,
        fallbackEasing: "swing",
        slideTransition: "",
        info: !1,
        nestedItemSelector: !1,
        itemElement: "div",
        stageElement: "div",
        refreshClass: "owl-refresh",
        loadedClass: "owl-loaded",
        loadingClass: "owl-loading",
        rtlClass: "owl-rtl",
        responsiveClass: "owl-responsive",
        dragClass: "owl-drag",
        itemClass: "owl-item",
        stageClass: "owl-stage",
        stageOuterClass: "owl-stage-outer",
        grabClass: "owl-grab"
    }, e.Width = {
        Default: "default",
        Inner: "inner",
        Outer: "outer"
    }, e.Type = {
        Event: "event",
        State: "state"
    }, e.Plugins = {}, e.Workers = [ {
        filter: [ "width", "settings" ],
        run: function() {
            this._width = this.$element.width();
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function(a) {
            a.current = this._items && this._items[this.relative(this._current)];
        }
    }, {
        filter: [ "items", "settings" ],
        run: function() {
            this.$stage.children(".cloned").remove();
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function(a) {
            var b = this.settings.margin || "", c = !this.settings.autoWidth, d = this.settings.rtl, e = {
                width: "auto",
                "margin-left": d ? b : "",
                "margin-right": d ? "" : b
            };
            !c && this.$stage.children().css(e), a.css = e;
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function(a) {
            var b = (this.width() / this.settings.items).toFixed(3) - this.settings.margin, c = null, d = this._items.length, e = !this.settings.autoWidth, f = [];
            for (a.items = {
                merge: !1,
                width: b
            }; d--; ) c = this._mergers[d], c = this.settings.mergeFit && Math.min(c, this.settings.items) || c, 
            a.items.merge = c > 1 || a.items.merge, f[d] = e ? b * c : this._items[d].width();
            this._widths = f;
        }
    }, {
        filter: [ "items", "settings" ],
        run: function() {
            var b = [], c = this._items, d = this.settings, e = Math.max(2 * d.items, 4), f = 2 * Math.ceil(c.length / 2), g = d.loop && c.length ? d.rewind ? e : Math.max(e, f) : 0, h = "", i = "";
            for (g /= 2; g > 0; ) b.push(this.normalize(b.length / 2, !0)), h += c[b[b.length - 1]][0].outerHTML, 
            b.push(this.normalize(c.length - 1 - (b.length - 1) / 2, !0)), i = c[b[b.length - 1]][0].outerHTML + i, 
            g -= 1;
            this._clones = b, a(h).addClass("cloned").appendTo(this.$stage), a(i).addClass("cloned").prependTo(this.$stage);
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function() {
            for (var a = this.settings.rtl ? 1 : -1, b = this._clones.length + this._items.length, c = -1, d = 0, e = 0, f = []; ++c < b; ) d = f[c - 1] || 0, 
            e = this._widths[this.relative(c)] + this.settings.margin, f.push(d + e * a);
            this._coordinates = f;
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function() {
            var a = this.settings.stagePadding, b = this._coordinates, c = {
                width: Math.ceil(Math.abs(b[b.length - 1])) + 2 * a,
                "padding-left": a || "",
                "padding-right": a || ""
            };
            this.$stage.css(c);
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function(a) {
            var b = this._coordinates.length, c = !this.settings.autoWidth, d = this.$stage.children();
            if (c && a.items.merge) for (;b--; ) a.css.width = this._widths[this.relative(b)], 
            d.eq(b).css(a.css); else c && (a.css.width = a.items.width, d.css(a.css));
        }
    }, {
        filter: [ "items" ],
        run: function() {
            this._coordinates.length < 1 && this.$stage.removeAttr("style");
        }
    }, {
        filter: [ "width", "items", "settings" ],
        run: function(a) {
            a.current = a.current ? this.$stage.children().index(a.current) : 0, a.current = Math.max(this.minimum(), Math.min(this.maximum(), a.current)), 
            this.reset(a.current);
        }
    }, {
        filter: [ "position" ],
        run: function() {
            this.animate(this.coordinates(this._current));
        }
    }, {
        filter: [ "width", "position", "items", "settings" ],
        run: function() {
            var a, b, c, d, e = this.settings.rtl ? 1 : -1, f = 2 * this.settings.stagePadding, g = this.coordinates(this.current()) + f, h = g + this.width() * e, i = [];
            for (c = 0, d = this._coordinates.length; c < d; c++) a = this._coordinates[c - 1] || 0, 
            b = Math.abs(this._coordinates[c]) + f * e, (this.op(a, "<=", g) && this.op(a, ">", h) || this.op(b, "<", g) && this.op(b, ">", h)) && i.push(c);
            this.$stage.children(".active").removeClass("active"), this.$stage.children(":eq(" + i.join("), :eq(") + ")").addClass("active"), 
            this.$stage.children(".center").removeClass("center"), this.settings.center && this.$stage.children().eq(this.current()).addClass("center");
        }
    } ], e.prototype.initializeStage = function() {
        this.$stage = this.$element.find("." + this.settings.stageClass), this.$stage.length || (this.$element.addClass(this.options.loadingClass), 
        this.$stage = a("<" + this.settings.stageElement + ">", {
            class: this.settings.stageClass
        }).wrap(a("<div/>", {
            class: this.settings.stageOuterClass
        })), this.$element.append(this.$stage.parent()));
    }, e.prototype.initializeItems = function() {
        var b = this.$element.find(".owl-item");
        if (b.length) return this._items = b.get().map(function(b) {
            return a(b);
        }), this._mergers = this._items.map(function() {
            return 1;
        }), void this.refresh();
        this.replace(this.$element.children().not(this.$stage.parent())), this.isVisible() ? this.refresh() : this.invalidate("width"), 
        this.$element.removeClass(this.options.loadingClass).addClass(this.options.loadedClass);
    }, e.prototype.initialize = function() {
        if (this.enter("initializing"), this.trigger("initialize"), this.$element.toggleClass(this.settings.rtlClass, this.settings.rtl), 
        this.settings.autoWidth && !this.is("pre-loading")) {
            var a, b, c;
            a = this.$element.find("img"), b = this.settings.nestedItemSelector ? "." + this.settings.nestedItemSelector : d, 
            c = this.$element.children(b).width(), a.length && c <= 0 && this.preloadAutoWidthImages(a);
        }
        this.initializeStage(), this.initializeItems(), this.registerEventHandlers(), this.leave("initializing"), 
        this.trigger("initialized");
    }, e.prototype.isVisible = function() {
        return !this.settings.checkVisibility || this.$element.is(":visible");
    }, e.prototype.setup = function() {
        var b = this.viewport(), c = this.options.responsive, d = -1, e = null;
        c ? (a.each(c, function(a) {
            a <= b && a > d && (d = Number(a));
        }), e = a.extend({}, this.options, c[d]), "function" == typeof e.stagePadding && (e.stagePadding = e.stagePadding()), 
        delete e.responsive, e.responsiveClass && this.$element.attr("class", this.$element.attr("class").replace(new RegExp("(" + this.options.responsiveClass + "-)\\S+\\s", "g"), "$1" + d))) : e = a.extend({}, this.options), 
        this.trigger("change", {
            property: {
                name: "settings",
                value: e
            }
        }), this._breakpoint = d, this.settings = e, this.invalidate("settings"), this.trigger("changed", {
            property: {
                name: "settings",
                value: this.settings
            }
        });
    }, e.prototype.optionsLogic = function() {
        this.settings.autoWidth && (this.settings.stagePadding = !1, this.settings.merge = !1);
    }, e.prototype.prepare = function(b) {
        var c = this.trigger("prepare", {
            content: b
        });
        return c.data || (c.data = a("<" + this.settings.itemElement + "/>").addClass(this.options.itemClass).append(b)), 
        this.trigger("prepared", {
            content: c.data
        }), c.data;
    }, e.prototype.update = function() {
        for (var b = 0, c = this._pipe.length, d = a.proxy(function(a) {
            return this[a];
        }, this._invalidated), e = {}; b < c; ) (this._invalidated.all || a.grep(this._pipe[b].filter, d).length > 0) && this._pipe[b].run(e), 
        b++;
        this._invalidated = {}, !this.is("valid") && this.enter("valid");
    }, e.prototype.width = function(a) {
        switch (a = a || e.Width.Default) {
          case e.Width.Inner:
          case e.Width.Outer:
            return this._width;

          default:
            return this._width - 2 * this.settings.stagePadding + this.settings.margin;
        }
    }, e.prototype.refresh = function() {
        this.enter("refreshing"), this.trigger("refresh"), this.setup(), this.optionsLogic(), 
        this.$element.addClass(this.options.refreshClass), this.update(), this.$element.removeClass(this.options.refreshClass), 
        this.leave("refreshing"), this.trigger("refreshed");
    }, e.prototype.onThrottledResize = function() {
        b.clearTimeout(this.resizeTimer), this.resizeTimer = b.setTimeout(this._handlers.onResize, this.settings.responsiveRefreshRate);
    }, e.prototype.onResize = function() {
        return !!this._items.length && (this._width !== this.$element.width() && (!!this.isVisible() && (this.enter("resizing"), 
        this.trigger("resize").isDefaultPrevented() ? (this.leave("resizing"), !1) : (this.invalidate("width"), 
        this.refresh(), this.leave("resizing"), void this.trigger("resized")))));
    }, e.prototype.registerEventHandlers = function() {
        a.support.transition && this.$stage.on(a.support.transition.end + ".owl.core", a.proxy(this.onTransitionEnd, this)), 
        !1 !== this.settings.responsive && this.on(b, "resize", this._handlers.onThrottledResize), 
        this.settings.mouseDrag && (this.$element.addClass(this.options.dragClass), this.$stage.on("mousedown.owl.core", a.proxy(this.onDragStart, this)), 
        this.$stage.on("dragstart.owl.core selectstart.owl.core", function() {
            return !1;
        })), this.settings.touchDrag && (this.$stage.on("touchstart.owl.core", a.proxy(this.onDragStart, this)), 
        this.$stage.on("touchcancel.owl.core", a.proxy(this.onDragEnd, this)));
    }, e.prototype.onDragStart = function(b) {
        var d = null;
        3 !== b.which && (a.support.transform ? (d = this.$stage.css("transform").replace(/.*\(|\)| /g, "").split(","), 
        d = {
            x: d[16 === d.length ? 12 : 4],
            y: d[16 === d.length ? 13 : 5]
        }) : (d = this.$stage.position(), d = {
            x: this.settings.rtl ? d.left + this.$stage.width() - this.width() + this.settings.margin : d.left,
            y: d.top
        }), this.is("animating") && (a.support.transform ? this.animate(d.x) : this.$stage.stop(), 
        this.invalidate("position")), this.$element.toggleClass(this.options.grabClass, "mousedown" === b.type), 
        this.speed(0), this._drag.time = new Date().getTime(), this._drag.target = a(b.target), 
        this._drag.stage.start = d, this._drag.stage.current = d, this._drag.pointer = this.pointer(b), 
        a(c).on("mouseup.owl.core touchend.owl.core", a.proxy(this.onDragEnd, this)), a(c).one("mousemove.owl.core touchmove.owl.core", a.proxy(function(b) {
            var d = this.difference(this._drag.pointer, this.pointer(b));
            a(c).on("mousemove.owl.core touchmove.owl.core", a.proxy(this.onDragMove, this)), 
            Math.abs(d.x) < Math.abs(d.y) && this.is("valid") || (b.preventDefault(), this.enter("dragging"), 
            this.trigger("drag"));
        }, this)));
    }, e.prototype.onDragMove = function(a) {
        var b = null, c = null, d = null, e = this.difference(this._drag.pointer, this.pointer(a)), f = this.difference(this._drag.stage.start, e);
        this.is("dragging") && (a.preventDefault(), this.settings.loop ? (b = this.coordinates(this.minimum()), 
        c = this.coordinates(this.maximum() + 1) - b, f.x = ((f.x - b) % c + c) % c + b) : (b = this.settings.rtl ? this.coordinates(this.maximum()) : this.coordinates(this.minimum()), 
        c = this.settings.rtl ? this.coordinates(this.minimum()) : this.coordinates(this.maximum()), 
        d = this.settings.pullDrag ? -1 * e.x / 5 : 0, f.x = Math.max(Math.min(f.x, b + d), c + d)), 
        this._drag.stage.current = f, this.animate(f.x));
    }, e.prototype.onDragEnd = function(b) {
        var d = this.difference(this._drag.pointer, this.pointer(b)), e = this._drag.stage.current, f = d.x > 0 ^ this.settings.rtl ? "left" : "right";
        a(c).off(".owl.core"), this.$element.removeClass(this.options.grabClass), (0 !== d.x && this.is("dragging") || !this.is("valid")) && (this.speed(this.settings.dragEndSpeed || this.settings.smartSpeed), 
        this.current(this.closest(e.x, 0 !== d.x ? f : this._drag.direction)), this.invalidate("position"), 
        this.update(), this._drag.direction = f, (Math.abs(d.x) > 3 || new Date().getTime() - this._drag.time > 300) && this._drag.target.one("click.owl.core", function() {
            return !1;
        })), this.is("dragging") && (this.leave("dragging"), this.trigger("dragged"));
    }, e.prototype.closest = function(b, c) {
        var e = -1, f = 30, g = this.width(), h = this.coordinates();
        return this.settings.freeDrag || a.each(h, a.proxy(function(a, i) {
            return "left" === c && b > i - f && b < i + f ? e = a : "right" === c && b > i - g - f && b < i - g + f ? e = a + 1 : this.op(b, "<", i) && this.op(b, ">", h[a + 1] !== d ? h[a + 1] : i - g) && (e = "left" === c ? a + 1 : a), 
            -1 === e;
        }, this)), this.settings.loop || (this.op(b, ">", h[this.minimum()]) ? e = b = this.minimum() : this.op(b, "<", h[this.maximum()]) && (e = b = this.maximum())), 
        e;
    }, e.prototype.animate = function(b) {
        var c = this.speed() > 0;
        this.is("animating") && this.onTransitionEnd(), c && (this.enter("animating"), this.trigger("translate")), 
        a.support.transform3d && a.support.transition ? this.$stage.css({
            transform: "translate3d(" + b + "px,0px,0px)",
            transition: this.speed() / 1e3 + "s" + (this.settings.slideTransition ? " " + this.settings.slideTransition : "")
        }) : c ? this.$stage.animate({
            left: b + "px"
        }, this.speed(), this.settings.fallbackEasing, a.proxy(this.onTransitionEnd, this)) : this.$stage.css({
            left: b + "px"
        });
    }, e.prototype.is = function(a) {
        return this._states.current[a] && this._states.current[a] > 0;
    }, e.prototype.current = function(a) {
        if (a === d) return this._current;
        if (0 === this._items.length) return d;
        if (a = this.normalize(a), this._current !== a) {
            var b = this.trigger("change", {
                property: {
                    name: "position",
                    value: a
                }
            });
            b.data !== d && (a = this.normalize(b.data)), this._current = a, this.invalidate("position"), 
            this.trigger("changed", {
                property: {
                    name: "position",
                    value: this._current
                }
            });
        }
        return this._current;
    }, e.prototype.invalidate = function(b) {
        return "string" === a.type(b) && (this._invalidated[b] = !0, this.is("valid") && this.leave("valid")), 
        a.map(this._invalidated, function(a, b) {
            return b;
        });
    }, e.prototype.reset = function(a) {
        (a = this.normalize(a)) !== d && (this._speed = 0, this._current = a, this.suppress([ "translate", "translated" ]), 
        this.animate(this.coordinates(a)), this.release([ "translate", "translated" ]));
    }, e.prototype.normalize = function(a, b) {
        var c = this._items.length, e = b ? 0 : this._clones.length;
        return !this.isNumeric(a) || c < 1 ? a = d : (a < 0 || a >= c + e) && (a = ((a - e / 2) % c + c) % c + e / 2), 
        a;
    }, e.prototype.relative = function(a) {
        return a -= this._clones.length / 2, this.normalize(a, !0);
    }, e.prototype.maximum = function(a) {
        var b, c, d, e = this.settings, f = this._coordinates.length;
        if (e.loop) f = this._clones.length / 2 + this._items.length - 1; else if (e.autoWidth || e.merge) {
            if (b = this._items.length) for (c = this._items[--b].width(), d = this.$element.width(); b-- && !((c += this._items[b].width() + this.settings.margin) > d); ) ;
            f = b + 1;
        } else f = e.center ? this._items.length - 1 : this._items.length - e.items;
        return a && (f -= this._clones.length / 2), Math.max(f, 0);
    }, e.prototype.minimum = function(a) {
        return a ? 0 : this._clones.length / 2;
    }, e.prototype.items = function(a) {
        return a === d ? this._items.slice() : (a = this.normalize(a, !0), this._items[a]);
    }, e.prototype.mergers = function(a) {
        return a === d ? this._mergers.slice() : (a = this.normalize(a, !0), this._mergers[a]);
    }, e.prototype.clones = function(b) {
        var c = this._clones.length / 2, e = c + this._items.length, f = function(a) {
            return a % 2 == 0 ? e + a / 2 : c - (a + 1) / 2;
        };
        return b === d ? a.map(this._clones, function(a, b) {
            return f(b);
        }) : a.map(this._clones, function(a, c) {
            return a === b ? f(c) : null;
        });
    }, e.prototype.speed = function(a) {
        return a !== d && (this._speed = a), this._speed;
    }, e.prototype.coordinates = function(b) {
        var c, e = 1, f = b - 1;
        return b === d ? a.map(this._coordinates, a.proxy(function(a, b) {
            return this.coordinates(b);
        }, this)) : (this.settings.center ? (this.settings.rtl && (e = -1, f = b + 1), c = this._coordinates[b], 
        c += (this.width() - c + (this._coordinates[f] || 0)) / 2 * e) : c = this._coordinates[f] || 0, 
        c = Math.ceil(c));
    }, e.prototype.duration = function(a, b, c) {
        return 0 === c ? 0 : Math.min(Math.max(Math.abs(b - a), 1), 6) * Math.abs(c || this.settings.smartSpeed);
    }, e.prototype.to = function(a, b) {
        var c = this.current(), d = null, e = a - this.relative(c), f = (e > 0) - (e < 0), g = this._items.length, h = this.minimum(), i = this.maximum();
        this.settings.loop ? (!this.settings.rewind && Math.abs(e) > g / 2 && (e += -1 * f * g), 
        a = c + e, (d = ((a - h) % g + g) % g + h) !== a && d - e <= i && d - e > 0 && (c = d - e, 
        a = d, this.reset(c))) : this.settings.rewind ? (i += 1, a = (a % i + i) % i) : a = Math.max(h, Math.min(i, a)), 
        this.speed(this.duration(c, a, b)), this.current(a), this.isVisible() && this.update();
    }, e.prototype.next = function(a) {
        a = a || !1, this.to(this.relative(this.current()) + 1, a);
    }, e.prototype.prev = function(a) {
        a = a || !1, this.to(this.relative(this.current()) - 1, a);
    }, e.prototype.onTransitionEnd = function(a) {
        if (a !== d && (a.stopPropagation(), (a.target || a.srcElement || a.originalTarget) !== this.$stage.get(0))) return !1;
        this.leave("animating"), this.trigger("translated");
    }, e.prototype.viewport = function() {
        var d;
        return this.options.responsiveBaseElement !== b ? d = a(this.options.responsiveBaseElement).width() : b.innerWidth ? d = b.innerWidth : c.documentElement && c.documentElement.clientWidth ? d = c.documentElement.clientWidth : console.warn("Can not detect viewport width."), 
        d;
    }, e.prototype.replace = function(b) {
        this.$stage.empty(), this._items = [], b && (b = b instanceof jQuery ? b : a(b)), 
        this.settings.nestedItemSelector && (b = b.find("." + this.settings.nestedItemSelector)), 
        b.filter(function() {
            return 1 === this.nodeType;
        }).each(a.proxy(function(a, b) {
            b = this.prepare(b), this.$stage.append(b), this._items.push(b), this._mergers.push(1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1);
        }, this)), this.reset(this.isNumeric(this.settings.startPosition) ? this.settings.startPosition : 0), 
        this.invalidate("items");
    }, e.prototype.add = function(b, c) {
        var e = this.relative(this._current);
        c = c === d ? this._items.length : this.normalize(c, !0), b = b instanceof jQuery ? b : a(b), 
        this.trigger("add", {
            content: b,
            position: c
        }), b = this.prepare(b), 0 === this._items.length || c === this._items.length ? (0 === this._items.length && this.$stage.append(b), 
        0 !== this._items.length && this._items[c - 1].after(b), this._items.push(b), this._mergers.push(1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)) : (this._items[c].before(b), 
        this._items.splice(c, 0, b), this._mergers.splice(c, 0, 1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)), 
        this._items[e] && this.reset(this._items[e].index()), this.invalidate("items"), 
        this.trigger("added", {
            content: b,
            position: c
        });
    }, e.prototype.remove = function(a) {
        (a = this.normalize(a, !0)) !== d && (this.trigger("remove", {
            content: this._items[a],
            position: a
        }), this._items[a].remove(), this._items.splice(a, 1), this._mergers.splice(a, 1), 
        this.invalidate("items"), this.trigger("removed", {
            content: null,
            position: a
        }));
    }, e.prototype.preloadAutoWidthImages = function(b) {
        b.each(a.proxy(function(b, c) {
            this.enter("pre-loading"), c = a(c), a(new Image()).one("load", a.proxy(function(a) {
                c.attr("src", a.target.src), c.css("opacity", 1), this.leave("pre-loading"), !this.is("pre-loading") && !this.is("initializing") && this.refresh();
            }, this)).attr("src", c.attr("src") || c.attr("data-src") || c.attr("data-src-retina"));
        }, this));
    }, e.prototype.destroy = function() {
        this.$element.off(".owl.core"), this.$stage.off(".owl.core"), a(c).off(".owl.core"), 
        !1 !== this.settings.responsive && (b.clearTimeout(this.resizeTimer), this.off(b, "resize", this._handlers.onThrottledResize));
        for (var d in this._plugins) this._plugins[d].destroy();
        this.$stage.children(".cloned").remove(), this.$stage.unwrap(), this.$stage.children().contents().unwrap(), 
        this.$stage.children().unwrap(), this.$stage.remove(), this.$element.removeClass(this.options.refreshClass).removeClass(this.options.loadingClass).removeClass(this.options.loadedClass).removeClass(this.options.rtlClass).removeClass(this.options.dragClass).removeClass(this.options.grabClass).attr("class", this.$element.attr("class").replace(new RegExp(this.options.responsiveClass + "-\\S+\\s", "g"), "")).removeData("owl.carousel");
    }, e.prototype.op = function(a, b, c) {
        var d = this.settings.rtl;
        switch (b) {
          case "<":
            return d ? a > c : a < c;

          case ">":
            return d ? a < c : a > c;

          case ">=":
            return d ? a <= c : a >= c;

          case "<=":
            return d ? a >= c : a <= c;
        }
    }, e.prototype.on = function(a, b, c, d) {
        a.addEventListener ? a.addEventListener(b, c, d) : a.attachEvent && a.attachEvent("on" + b, c);
    }, e.prototype.off = function(a, b, c, d) {
        a.removeEventListener ? a.removeEventListener(b, c, d) : a.detachEvent && a.detachEvent("on" + b, c);
    }, e.prototype.trigger = function(b, c, d, f, g) {
        var h = {
            item: {
                count: this._items.length,
                index: this.current()
            }
        }, i = a.camelCase(a.grep([ "on", b, d ], function(a) {
            return a;
        }).join("-").toLowerCase()), j = a.Event([ b, "owl", d || "carousel" ].join(".").toLowerCase(), a.extend({
            relatedTarget: this
        }, h, c));
        return this._supress[b] || (a.each(this._plugins, function(a, b) {
            b.onTrigger && b.onTrigger(j);
        }), this.register({
            type: e.Type.Event,
            name: b
        }), this.$element.trigger(j), this.settings && "function" == typeof this.settings[i] && this.settings[i].call(this, j)), 
        j;
    }, e.prototype.enter = function(b) {
        a.each([ b ].concat(this._states.tags[b] || []), a.proxy(function(a, b) {
            this._states.current[b] === d && (this._states.current[b] = 0), this._states.current[b]++;
        }, this));
    }, e.prototype.leave = function(b) {
        a.each([ b ].concat(this._states.tags[b] || []), a.proxy(function(a, b) {
            this._states.current[b]--;
        }, this));
    }, e.prototype.register = function(b) {
        if (b.type === e.Type.Event) {
            if (a.event.special[b.name] || (a.event.special[b.name] = {}), !a.event.special[b.name].owl) {
                var c = a.event.special[b.name]._default;
                a.event.special[b.name]._default = function(a) {
                    return !c || !c.apply || a.namespace && -1 !== a.namespace.indexOf("owl") ? a.namespace && a.namespace.indexOf("owl") > -1 : c.apply(this, arguments);
                }, a.event.special[b.name].owl = !0;
            }
        } else b.type === e.Type.State && (this._states.tags[b.name] ? this._states.tags[b.name] = this._states.tags[b.name].concat(b.tags) : this._states.tags[b.name] = b.tags, 
        this._states.tags[b.name] = a.grep(this._states.tags[b.name], a.proxy(function(c, d) {
            return a.inArray(c, this._states.tags[b.name]) === d;
        }, this)));
    }, e.prototype.suppress = function(b) {
        a.each(b, a.proxy(function(a, b) {
            this._supress[b] = !0;
        }, this));
    }, e.prototype.release = function(b) {
        a.each(b, a.proxy(function(a, b) {
            delete this._supress[b];
        }, this));
    }, e.prototype.pointer = function(a) {
        var c = {
            x: null,
            y: null
        };
        return a = a.originalEvent || a || b.event, a = a.touches && a.touches.length ? a.touches[0] : a.changedTouches && a.changedTouches.length ? a.changedTouches[0] : a, 
        a.pageX ? (c.x = a.pageX, c.y = a.pageY) : (c.x = a.clientX, c.y = a.clientY), c;
    }, e.prototype.isNumeric = function(a) {
        return !isNaN(parseFloat(a));
    }, e.prototype.difference = function(a, b) {
        return {
            x: a.x - b.x,
            y: a.y - b.y
        };
    }, a.fn.owlCarousel = function(b) {
        var c = Array.prototype.slice.call(arguments, 1);
        return this.each(function() {
            var d = a(this), f = d.data("owl.carousel");
            f || (f = new e(this, "object" == typeof b && b), d.data("owl.carousel", f), a.each([ "next", "prev", "to", "destroy", "refresh", "replace", "add", "remove" ], function(b, c) {
                f.register({
                    type: e.Type.Event,
                    name: c
                }), f.$element.on(c + ".owl.carousel.core", a.proxy(function(a) {
                    a.namespace && a.relatedTarget !== this && (this.suppress([ c ]), f[c].apply(this, [].slice.call(arguments, 1)), 
                    this.release([ c ]));
                }, f));
            })), "string" == typeof b && "_" !== b.charAt(0) && f[b].apply(f, c);
        });
    }, a.fn.owlCarousel.Constructor = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(b) {
        this._core = b, this._interval = null, this._visible = null, this._handlers = {
            "initialized.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.autoRefresh && this.watch();
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers);
    };
    e.Defaults = {
        autoRefresh: !0,
        autoRefreshInterval: 500
    }, e.prototype.watch = function() {
        this._interval || (this._visible = this._core.isVisible(), this._interval = b.setInterval(a.proxy(this.refresh, this), this._core.settings.autoRefreshInterval));
    }, e.prototype.refresh = function() {
        this._core.isVisible() !== this._visible && (this._visible = !this._visible, this._core.$element.toggleClass("owl-hidden", !this._visible), 
        this._visible && this._core.invalidate("width") && this._core.refresh());
    }, e.prototype.destroy = function() {
        var a, c;
        b.clearInterval(this._interval);
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (c in Object.getOwnPropertyNames(this)) "function" != typeof this[c] && (this[c] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.AutoRefresh = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(b) {
        this._core = b, this._loaded = [], this._handlers = {
            "initialized.owl.carousel change.owl.carousel resized.owl.carousel": a.proxy(function(b) {
                if (b.namespace && this._core.settings && this._core.settings.lazyLoad && (b.property && "position" == b.property.name || "initialized" == b.type)) {
                    var c = this._core.settings, e = c.center && Math.ceil(c.items / 2) || c.items, f = c.center && -1 * e || 0, g = (b.property && b.property.value !== d ? b.property.value : this._core.current()) + f, h = this._core.clones().length, i = a.proxy(function(a, b) {
                        this.load(b);
                    }, this);
                    for (c.lazyLoadEager > 0 && (e += c.lazyLoadEager, c.loop && (g -= c.lazyLoadEager, 
                    e++)); f++ < e; ) this.load(h / 2 + this._core.relative(g)), h && a.each(this._core.clones(this._core.relative(g)), i), 
                    g++;
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers);
    };
    e.Defaults = {
        lazyLoad: !1,
        lazyLoadEager: 0
    }, e.prototype.load = function(c) {
        var d = this._core.$stage.children().eq(c), e = d && d.find(".owl-lazy");
        !e || a.inArray(d.get(0), this._loaded) > -1 || (e.each(a.proxy(function(c, d) {
            var e, f = a(d), g = b.devicePixelRatio > 1 && f.attr("data-src-retina") || f.attr("data-src") || f.attr("data-srcset");
            this._core.trigger("load", {
                element: f,
                url: g
            }, "lazy"), f.is("img") ? f.one("load.owl.lazy", a.proxy(function() {
                f.css("opacity", 1), this._core.trigger("loaded", {
                    element: f,
                    url: g
                }, "lazy");
            }, this)).attr("src", g) : f.is("source") ? f.one("load.owl.lazy", a.proxy(function() {
                this._core.trigger("loaded", {
                    element: f,
                    url: g
                }, "lazy");
            }, this)).attr("srcset", g) : (e = new Image(), e.onload = a.proxy(function() {
                f.css({
                    "background-image": 'url("' + g + '")',
                    opacity: "1"
                }), this._core.trigger("loaded", {
                    element: f,
                    url: g
                }, "lazy");
            }, this), e.src = g);
        }, this)), this._loaded.push(d.get(0)));
    }, e.prototype.destroy = function() {
        var a, b;
        for (a in this.handlers) this._core.$element.off(a, this.handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.Lazy = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(c) {
        this._core = c, this._previousHeight = null, this._handlers = {
            "initialized.owl.carousel refreshed.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.autoHeight && this.update();
            }, this),
            "changed.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.autoHeight && "position" === a.property.name && this.update();
            }, this),
            "loaded.owl.lazy": a.proxy(function(a) {
                a.namespace && this._core.settings.autoHeight && a.element.closest("." + this._core.settings.itemClass).index() === this._core.current() && this.update();
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers), 
        this._intervalId = null;
        var d = this;
        a(b).on("load", function() {
            d._core.settings.autoHeight && d.update();
        }), a(b).resize(function() {
            d._core.settings.autoHeight && (null != d._intervalId && clearTimeout(d._intervalId), 
            d._intervalId = setTimeout(function() {
                d.update();
            }, 250));
        });
    };
    e.Defaults = {
        autoHeight: !1,
        autoHeightClass: "owl-height"
    }, e.prototype.update = function() {
        var b = this._core._current, c = b + this._core.settings.items, d = this._core.settings.lazyLoad, e = this._core.$stage.children().toArray().slice(b, c), f = [], g = 0;
        a.each(e, function(b, c) {
            f.push(a(c).height());
        }), g = Math.max.apply(null, f), g <= 1 && d && this._previousHeight && (g = this._previousHeight), 
        this._previousHeight = g, this._core.$stage.parent().height(g).addClass(this._core.settings.autoHeightClass);
    }, e.prototype.destroy = function() {
        var a, b;
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.AutoHeight = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(b) {
        this._core = b, this._videos = {}, this._playing = null, this._handlers = {
            "initialized.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.register({
                    type: "state",
                    name: "playing",
                    tags: [ "interacting" ]
                });
            }, this),
            "resize.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.video && this.isInFullScreen() && a.preventDefault();
            }, this),
            "refreshed.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.is("resizing") && this._core.$stage.find(".cloned .owl-video-frame").remove();
            }, this),
            "changed.owl.carousel": a.proxy(function(a) {
                a.namespace && "position" === a.property.name && this._playing && this.stop();
            }, this),
            "prepared.owl.carousel": a.proxy(function(b) {
                if (b.namespace) {
                    var c = a(b.content).find(".owl-video");
                    c.length && (c.css("display", "none"), this.fetch(c, a(b.content)));
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers), 
        this._core.$element.on("click.owl.video", ".owl-video-play-icon", a.proxy(function(a) {
            this.play(a);
        }, this));
    };
    e.Defaults = {
        video: !1,
        videoHeight: !1,
        videoWidth: !1
    }, e.prototype.fetch = function(a, b) {
        var c = function() {
            return a.attr("data-vimeo-id") ? "vimeo" : a.attr("data-vzaar-id") ? "vzaar" : "youtube";
        }(), d = a.attr("data-vimeo-id") || a.attr("data-youtube-id") || a.attr("data-vzaar-id"), e = a.attr("data-width") || this._core.settings.videoWidth, f = a.attr("data-height") || this._core.settings.videoHeight, g = a.attr("href");
        if (!g) throw new Error("Missing video URL.");
        if (d = g.match(/(http:|https:|)\/\/(player.|www.|app.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com|be\-nocookie\.com)|vzaar\.com)\/(video\/|videos\/|embed\/|channels\/.+\/|groups\/.+\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/), 
        d[3].indexOf("youtu") > -1) c = "youtube"; else if (d[3].indexOf("vimeo") > -1) c = "vimeo"; else {
            if (!(d[3].indexOf("vzaar") > -1)) throw new Error("Video URL not supported.");
            c = "vzaar";
        }
        d = d[6], this._videos[g] = {
            type: c,
            id: d,
            width: e,
            height: f
        }, b.attr("data-video", g), this.thumbnail(a, this._videos[g]);
    }, e.prototype.thumbnail = function(b, c) {
        var d, e, f, g = c.width && c.height ? "width:" + c.width + "px;height:" + c.height + "px;" : "", h = b.find("img"), i = "src", j = "", k = this._core.settings, l = function(c) {
            e = '<div class="owl-video-play-icon"></div>', d = k.lazyLoad ? a("<div/>", {
                class: "owl-video-tn " + j,
                srcType: c
            }) : a("<div/>", {
                class: "owl-video-tn",
                style: "opacity:1;background-image:url(" + c + ")"
            }), b.after(d), b.after(e);
        };
        if (b.wrap(a("<div/>", {
            class: "owl-video-wrapper",
            style: g
        })), this._core.settings.lazyLoad && (i = "data-src", j = "owl-lazy"), h.length) return l(h.attr(i)), 
        h.remove(), !1;
        "youtube" === c.type ? (f = "//img.youtube.com/vi/" + c.id + "/hqdefault.jpg", l(f)) : "vimeo" === c.type ? a.ajax({
            type: "GET",
            url: "//vimeo.com/api/v2/video/" + c.id + ".json",
            jsonp: "callback",
            dataType: "jsonp",
            success: function(a) {
                f = a[0].thumbnail_large, l(f);
            }
        }) : "vzaar" === c.type && a.ajax({
            type: "GET",
            url: "//vzaar.com/api/videos/" + c.id + ".json",
            jsonp: "callback",
            dataType: "jsonp",
            success: function(a) {
                f = a.framegrab_url, l(f);
            }
        });
    }, e.prototype.stop = function() {
        this._core.trigger("stop", null, "video"), this._playing.find(".owl-video-frame").remove(), 
        this._playing.removeClass("owl-video-playing"), this._playing = null, this._core.leave("playing"), 
        this._core.trigger("stopped", null, "video");
    }, e.prototype.play = function(b) {
        var c, d = a(b.target), e = d.closest("." + this._core.settings.itemClass), f = this._videos[e.attr("data-video")], g = f.width || "100%", h = f.height || this._core.$stage.height();
        this._playing || (this._core.enter("playing"), this._core.trigger("play", null, "video"), 
        e = this._core.items(this._core.relative(e.index())), this._core.reset(e.index()), 
        c = a('<iframe frameborder="0" allowfullscreen mozallowfullscreen webkitAllowFullScreen ></iframe>'), 
        c.attr("height", h), c.attr("width", g), "youtube" === f.type ? c.attr("src", "//www.youtube.com/embed/" + f.id + "?autoplay=1&rel=0&v=" + f.id) : "vimeo" === f.type ? c.attr("src", "//player.vimeo.com/video/" + f.id + "?autoplay=1") : "vzaar" === f.type && c.attr("src", "//view.vzaar.com/" + f.id + "/player?autoplay=true"), 
        a(c).wrap('<div class="owl-video-frame" />').insertAfter(e.find(".owl-video")), 
        this._playing = e.addClass("owl-video-playing"));
    }, e.prototype.isInFullScreen = function() {
        var b = c.fullscreenElement || c.mozFullScreenElement || c.webkitFullscreenElement;
        return b && a(b).parent().hasClass("owl-video-frame");
    }, e.prototype.destroy = function() {
        var a, b;
        this._core.$element.off("click.owl.video");
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.Video = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(b) {
        this.core = b, this.core.options = a.extend({}, e.Defaults, this.core.options), 
        this.swapping = !0, this.previous = d, this.next = d, this.handlers = {
            "change.owl.carousel": a.proxy(function(a) {
                a.namespace && "position" == a.property.name && (this.previous = this.core.current(), 
                this.next = a.property.value);
            }, this),
            "drag.owl.carousel dragged.owl.carousel translated.owl.carousel": a.proxy(function(a) {
                a.namespace && (this.swapping = "translated" == a.type);
            }, this),
            "translate.owl.carousel": a.proxy(function(a) {
                a.namespace && this.swapping && (this.core.options.animateOut || this.core.options.animateIn) && this.swap();
            }, this)
        }, this.core.$element.on(this.handlers);
    };
    e.Defaults = {
        animateOut: !1,
        animateIn: !1
    }, e.prototype.swap = function() {
        if (1 === this.core.settings.items && a.support.animation && a.support.transition) {
            this.core.speed(0);
            var b, c = a.proxy(this.clear, this), d = this.core.$stage.children().eq(this.previous), e = this.core.$stage.children().eq(this.next), f = this.core.settings.animateIn, g = this.core.settings.animateOut;
            this.core.current() !== this.previous && (g && (b = this.core.coordinates(this.previous) - this.core.coordinates(this.next), 
            d.one(a.support.animation.end, c).css({
                left: b + "px"
            }).addClass("animated owl-animated-out").addClass(g)), f && e.one(a.support.animation.end, c).addClass("animated owl-animated-in").addClass(f));
        }
    }, e.prototype.clear = function(b) {
        a(b.target).css({
            left: ""
        }).removeClass("animated owl-animated-out owl-animated-in").removeClass(this.core.settings.animateIn).removeClass(this.core.settings.animateOut), 
        this.core.onTransitionEnd();
    }, e.prototype.destroy = function() {
        var a, b;
        for (a in this.handlers) this.core.$element.off(a, this.handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.Animate = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    var e = function(b) {
        this._core = b, this._call = null, this._time = 0, this._timeout = 0, this._paused = !0, 
        this._handlers = {
            "changed.owl.carousel": a.proxy(function(a) {
                a.namespace && "settings" === a.property.name ? this._core.settings.autoplay ? this.play() : this.stop() : a.namespace && "position" === a.property.name && this._paused && (this._time = 0);
            }, this),
            "initialized.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.autoplay && this.play();
            }, this),
            "play.owl.autoplay": a.proxy(function(a, b, c) {
                a.namespace && this.play(b, c);
            }, this),
            "stop.owl.autoplay": a.proxy(function(a) {
                a.namespace && this.stop();
            }, this),
            "mouseover.owl.autoplay": a.proxy(function() {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause();
            }, this),
            "mouseleave.owl.autoplay": a.proxy(function() {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.play();
            }, this),
            "touchstart.owl.core": a.proxy(function() {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause();
            }, this),
            "touchend.owl.core": a.proxy(function() {
                this._core.settings.autoplayHoverPause && this.play();
            }, this)
        }, this._core.$element.on(this._handlers), this._core.options = a.extend({}, e.Defaults, this._core.options);
    };
    e.Defaults = {
        autoplay: !1,
        autoplayTimeout: 5e3,
        autoplayHoverPause: !1,
        autoplaySpeed: !1
    }, e.prototype._next = function(d) {
        this._call = b.setTimeout(a.proxy(this._next, this, d), this._timeout * (Math.round(this.read() / this._timeout) + 1) - this.read()), 
        this._core.is("interacting") || c.hidden || this._core.next(d || this._core.settings.autoplaySpeed);
    }, e.prototype.read = function() {
        return new Date().getTime() - this._time;
    }, e.prototype.play = function(c, d) {
        var e;
        this._core.is("rotating") || this._core.enter("rotating"), c = c || this._core.settings.autoplayTimeout, 
        e = Math.min(this._time % (this._timeout || c), c), this._paused ? (this._time = this.read(), 
        this._paused = !1) : b.clearTimeout(this._call), this._time += this.read() % c - e, 
        this._timeout = c, this._call = b.setTimeout(a.proxy(this._next, this, d), c - e);
    }, e.prototype.stop = function() {
        this._core.is("rotating") && (this._time = 0, this._paused = !0, b.clearTimeout(this._call), 
        this._core.leave("rotating"));
    }, e.prototype.pause = function() {
        this._core.is("rotating") && !this._paused && (this._time = this.read(), this._paused = !0, 
        b.clearTimeout(this._call));
    }, e.prototype.destroy = function() {
        var a, b;
        this.stop();
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.autoplay = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    "use strict";
    var e = function(b) {
        this._core = b, this._initialized = !1, this._pages = [], this._controls = {}, this._templates = [], 
        this.$element = this._core.$element, this._overrides = {
            next: this._core.next,
            prev: this._core.prev,
            to: this._core.to
        }, this._handlers = {
            "prepared.owl.carousel": a.proxy(function(b) {
                b.namespace && this._core.settings.dotsData && this._templates.push('<div class="' + this._core.settings.dotClass + '">' + a(b.content).find("[data-dot]").addBack("[data-dot]").attr("data-dot") + "</div>");
            }, this),
            "added.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.dotsData && this._templates.splice(a.position, 0, this._templates.pop());
            }, this),
            "remove.owl.carousel": a.proxy(function(a) {
                a.namespace && this._core.settings.dotsData && this._templates.splice(a.position, 1);
            }, this),
            "changed.owl.carousel": a.proxy(function(a) {
                a.namespace && "position" == a.property.name && this.draw();
            }, this),
            "initialized.owl.carousel": a.proxy(function(a) {
                a.namespace && !this._initialized && (this._core.trigger("initialize", null, "navigation"), 
                this.initialize(), this.update(), this.draw(), this._initialized = !0, this._core.trigger("initialized", null, "navigation"));
            }, this),
            "refreshed.owl.carousel": a.proxy(function(a) {
                a.namespace && this._initialized && (this._core.trigger("refresh", null, "navigation"), 
                this.update(), this.draw(), this._core.trigger("refreshed", null, "navigation"));
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this.$element.on(this._handlers);
    };
    e.Defaults = {
        nav: !1,
        navText: [ '<span aria-label="Previous">&#x2039;</span>', '<span aria-label="Next">&#x203a;</span>' ],
        navSpeed: !1,
        navElement: 'button type="button" role="presentation"',
        navContainer: !1,
        navContainerClass: "owl-nav",
        navClass: [ "owl-prev", "owl-next" ],
        slideBy: 1,
        dotClass: "owl-dot",
        dotsClass: "owl-dots",
        dots: !0,
        dotsEach: !1,
        dotsData: !1,
        dotsSpeed: !1,
        dotsContainer: !1
    }, e.prototype.initialize = function() {
        var b, c = this._core.settings;
        this._controls.$relative = (c.navContainer ? a(c.navContainer) : a("<div>").addClass(c.navContainerClass).appendTo(this.$element)).addClass("disabled"), 
        this._controls.$previous = a("<" + c.navElement + ">").addClass(c.navClass[0]).html(c.navText[0]).prependTo(this._controls.$relative).on("click", a.proxy(function(a) {
            this.prev(c.navSpeed);
        }, this)), this._controls.$next = a("<" + c.navElement + ">").addClass(c.navClass[1]).html(c.navText[1]).appendTo(this._controls.$relative).on("click", a.proxy(function(a) {
            this.next(c.navSpeed);
        }, this)), c.dotsData || (this._templates = [ a('<button role="button">').addClass(c.dotClass).append(a("<span>")).prop("outerHTML") ]), 
        this._controls.$absolute = (c.dotsContainer ? a(c.dotsContainer) : a("<div>").addClass(c.dotsClass).appendTo(this.$element)).addClass("disabled"), 
        this._controls.$absolute.on("click", "button", a.proxy(function(b) {
            var d = a(b.target).parent().is(this._controls.$absolute) ? a(b.target).index() : a(b.target).parent().index();
            b.preventDefault(), this.to(d, c.dotsSpeed);
        }, this));
        for (b in this._overrides) this._core[b] = a.proxy(this[b], this);
    }, e.prototype.destroy = function() {
        var a, b, c, d, e;
        e = this._core.settings;
        for (a in this._handlers) this.$element.off(a, this._handlers[a]);
        for (b in this._controls) "$relative" === b && e.navContainer ? this._controls[b].html("") : this._controls[b].remove();
        for (d in this.overides) this._core[d] = this._overrides[d];
        for (c in Object.getOwnPropertyNames(this)) "function" != typeof this[c] && (this[c] = null);
    }, e.prototype.update = function() {
        var a, b, c, d = this._core.clones().length / 2, e = d + this._core.items().length, f = this._core.maximum(!0), g = this._core.settings, h = g.center || g.autoWidth || g.dotsData ? 1 : g.dotsEach || g.items;
        if ("page" !== g.slideBy && (g.slideBy = Math.min(g.slideBy, g.items)), g.dots || "page" == g.slideBy) for (this._pages = [], 
        a = d, b = 0, c = 0; a < e; a++) {
            if (b >= h || 0 === b) {
                if (this._pages.push({
                    start: Math.min(f, a - d),
                    end: a - d + h - 1
                }), Math.min(f, a - d) === f) break;
                b = 0, ++c;
            }
            b += this._core.mergers(this._core.relative(a));
        }
    }, e.prototype.draw = function() {
        var b, c = this._core.settings, d = this._core.items().length <= c.items, e = this._core.relative(this._core.current()), f = c.loop || c.rewind;
        this._controls.$relative.toggleClass("disabled", !c.nav || d), c.nav && (this._controls.$previous.toggleClass("disabled", !f && e <= this._core.minimum(!0)), 
        this._controls.$next.toggleClass("disabled", !f && e >= this._core.maximum(!0))), 
        this._controls.$absolute.toggleClass("disabled", !c.dots || d), c.dots && (b = this._pages.length - this._controls.$absolute.children().length, 
        c.dotsData && 0 !== b ? this._controls.$absolute.html(this._templates.join("")) : b > 0 ? this._controls.$absolute.append(new Array(b + 1).join(this._templates[0])) : b < 0 && this._controls.$absolute.children().slice(b).remove(), 
        this._controls.$absolute.find(".active").removeClass("active"), this._controls.$absolute.children().eq(a.inArray(this.current(), this._pages)).addClass("active"));
    }, e.prototype.onTrigger = function(b) {
        var c = this._core.settings;
        b.page = {
            index: a.inArray(this.current(), this._pages),
            count: this._pages.length,
            size: c && (c.center || c.autoWidth || c.dotsData ? 1 : c.dotsEach || c.items)
        };
    }, e.prototype.current = function() {
        var b = this._core.relative(this._core.current());
        return a.grep(this._pages, a.proxy(function(a, c) {
            return a.start <= b && a.end >= b;
        }, this)).pop();
    }, e.prototype.getPosition = function(b) {
        var c, d, e = this._core.settings;
        return "page" == e.slideBy ? (c = a.inArray(this.current(), this._pages), d = this._pages.length, 
        b ? ++c : --c, c = this._pages[(c % d + d) % d].start) : (c = this._core.relative(this._core.current()), 
        d = this._core.items().length, b ? c += e.slideBy : c -= e.slideBy), c;
    }, e.prototype.next = function(b) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(!0), b);
    }, e.prototype.prev = function(b) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(!1), b);
    }, e.prototype.to = function(b, c, d) {
        var e;
        !d && this._pages.length ? (e = this._pages.length, a.proxy(this._overrides.to, this._core)(this._pages[(b % e + e) % e].start, c)) : a.proxy(this._overrides.to, this._core)(b, c);
    }, a.fn.owlCarousel.Constructor.Plugins.Navigation = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    "use strict";
    var e = function(c) {
        this._core = c, this._hashes = {}, this.$element = this._core.$element, this._handlers = {
            "initialized.owl.carousel": a.proxy(function(c) {
                c.namespace && "URLHash" === this._core.settings.startPosition && a(b).trigger("hashchange.owl.navigation");
            }, this),
            "prepared.owl.carousel": a.proxy(function(b) {
                if (b.namespace) {
                    var c = a(b.content).find("[data-hash]").addBack("[data-hash]").attr("data-hash");
                    if (!c) return;
                    this._hashes[c] = b.content;
                }
            }, this),
            "changed.owl.carousel": a.proxy(function(c) {
                if (c.namespace && "position" === c.property.name) {
                    var d = this._core.items(this._core.relative(this._core.current())), e = a.map(this._hashes, function(a, b) {
                        return a === d ? b : null;
                    }).join();
                    if (!e || b.location.hash.slice(1) === e) return;
                    b.location.hash = e;
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this.$element.on(this._handlers), 
        a(b).on("hashchange.owl.navigation", a.proxy(function(a) {
            var c = b.location.hash.substring(1), e = this._core.$stage.children(), f = this._hashes[c] && e.index(this._hashes[c]);
            f !== d && f !== this._core.current() && this._core.to(this._core.relative(f), !1, !0);
        }, this));
    };
    e.Defaults = {
        URLhashListener: !1
    }, e.prototype.destroy = function() {
        var c, d;
        a(b).off("hashchange.owl.navigation");
        for (c in this._handlers) this._core.$element.off(c, this._handlers[c]);
        for (d in Object.getOwnPropertyNames(this)) "function" != typeof this[d] && (this[d] = null);
    }, a.fn.owlCarousel.Constructor.Plugins.Hash = e;
}(window.Zepto || window.jQuery, window, document), function(a, b, c, d) {
    function e(b, c) {
        var e = !1, f = b.charAt(0).toUpperCase() + b.slice(1);
        return a.each((b + " " + h.join(f + " ") + f).split(" "), function(a, b) {
            if (g[b] !== d) return e = !c || b, !1;
        }), e;
    }
    function f(a) {
        return e(a, !0);
    }
    var g = a("<support>").get(0).style, h = "Webkit Moz O ms".split(" "), i = {
        transition: {
            end: {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd",
                transition: "transitionend"
            }
        },
        animation: {
            end: {
                WebkitAnimation: "webkitAnimationEnd",
                MozAnimation: "animationend",
                OAnimation: "oAnimationEnd",
                animation: "animationend"
            }
        }
    }, j = {
        csstransforms: function() {
            return !!e("transform");
        },
        csstransforms3d: function() {
            return !!e("perspective");
        },
        csstransitions: function() {
            return !!e("transition");
        },
        cssanimations: function() {
            return !!e("animation");
        }
    };
    j.csstransitions() && (a.support.transition = new String(f("transition")), a.support.transition.end = i.transition.end[a.support.transition]), 
    j.cssanimations() && (a.support.animation = new String(f("animation")), a.support.animation.end = i.animation.end[a.support.animation]), 
    j.csstransforms() && (a.support.transform = new String(f("transform")), a.support.transform3d = j.csstransforms3d());
}(window.Zepto || window.jQuery, window, document);

// ==================================================
// fancyBox v3.5.7
//
// Licensed GPLv3 for open source use
// or fancyBox Commercial License for commercial use
//
// http://fancyapps.com/fancybox/
// Copyright 2019 fancyApps
//
// ==================================================
// ==================================================
// fancyBox v3.5.7
//
// Licensed GPLv3 for open source use
// or fancyBox Commercial License for commercial use
//
// http://fancyapps.com/fancybox/
// Copyright 2019 fancyApps
//
// ==================================================
(function(window, document, $, undefined) {
    "use strict";
    window.console = window.console || {
        info: function(stuff) {}
    };
    // If there's no jQuery, fancyBox can't work
    // =========================================
        if (!$) {
        return;
    }
    // Check if fancyBox is already initialized
    // ========================================
        if ($.fn.fancybox) {
        console.info("fancyBox already initialized");
        return;
    }
    // Private default settings
    // ========================
        var defaults = {
        // Close existing modals
        // Set this to false if you do not need to stack multiple instances
        closeExisting: false,
        // Enable infinite gallery navigation
        loop: false,
        // Horizontal space between slides
        gutter: 50,
        // Enable keyboard navigation
        keyboard: true,
        // Should allow caption to overlap the content
        preventCaptionOverlap: true,
        // Should display navigation arrows at the screen edges
        arrows: true,
        // Should display counter at the top left corner
        infobar: true,
        // Should display close button (using `btnTpl.smallBtn` template) over the content
        // Can be true, false, "auto"
        // If "auto" - will be automatically enabled for "html", "inline" or "ajax" items
        smallBtn: "auto",
        // Should display toolbar (buttons at the top)
        // Can be true, false, "auto"
        // If "auto" - will be automatically hidden if "smallBtn" is enabled
        toolbar: "auto",
        // What buttons should appear in the top right corner.
        // Buttons will be created using templates from `btnTpl` option
        // and they will be placed into toolbar (class="fancybox-toolbar"` element)
        buttons: [ "zoom", 
        //"share",
        "slideShow", 
        //"fullScreen",
        //"download",
        "thumbs", "close" ],
        // Detect "idle" time in seconds
        idleTime: 3,
        // Disable right-click and use simple image protection for images
        protect: false,
        // Shortcut to make content "modal" - disable keyboard navigtion, hide buttons, etc
        modal: false,
        image: {
            // Wait for images to load before displaying
            //   true  - wait for image to load and then display;
            //   false - display thumbnail and load the full-sized image over top,
            //           requires predefined image dimensions (`data-width` and `data-height` attributes)
            preload: false
        },
        ajax: {
            // Object containing settings for ajax request
            settings: {
                // This helps to indicate that request comes from the modal
                // Feel free to change naming
                data: {
                    fancybox: true
                }
            }
        },
        iframe: {
            // Iframe template
            tpl: '<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" allowfullscreen="allowfullscreen" allow="autoplay; fullscreen" src=""></iframe>',
            // Preload iframe before displaying it
            // This allows to calculate iframe content width and height
            // (note: Due to "Same Origin Policy", you can't get cross domain data).
            preload: true,
            // Custom CSS styling for iframe wrapping element
            // You can use this to set custom iframe dimensions
            css: {},
            // Iframe tag attributes
            attr: {
                scrolling: "auto"
            }
        },
        // For HTML5 video only
        video: {
            tpl: '<video class="fancybox-video" controls controlsList="nodownload" poster="{{poster}}">' + '<source src="{{src}}" type="{{format}}" />' + 'Sorry, your browser doesn\'t support embedded videos, <a href="{{src}}">download</a> and watch with your favorite video player!' + "</video>",
            format: "",
            // custom video format
            autoStart: true
        },
        // Default content type if cannot be detected automatically
        defaultType: "image",
        // Open/close animation type
        // Possible values:
        //   false            - disable
        //   "zoom"           - zoom images from/to thumbnail
        //   "fade"
        //   "zoom-in-out"
        //
        animationEffect: "zoom",
        // Duration in ms for open/close animation
        animationDuration: 366,
        // Should image change opacity while zooming
        // If opacity is "auto", then opacity will be changed if image and thumbnail have different aspect ratios
        zoomOpacity: "auto",
        // Transition effect between slides
        //
        // Possible values:
        //   false            - disable
        //   "fade'
        //   "slide'
        //   "circular'
        //   "tube'
        //   "zoom-in-out'
        //   "rotate'
        //
        transitionEffect: "fade",
        // Duration in ms for transition animation
        transitionDuration: 366,
        // Custom CSS class for slide element
        slideClass: "",
        // Custom CSS class for layout
        baseClass: "",
        // Base template for layout
        baseTpl: '<div class="fancybox-container" role="dialog" tabindex="-1">' + '<div class="fancybox-bg"></div>' + '<div class="fancybox-inner">' + '<div class="fancybox-infobar"><span data-fancybox-index></span>&nbsp;/&nbsp;<span data-fancybox-count></span></div>' + '<div class="fancybox-toolbar">{{buttons}}</div>' + '<div class="fancybox-navigation">{{arrows}}</div>' + '<div class="fancybox-stage"></div>' + '<div class="fancybox-caption"><div class="fancybox-caption__body"></div></div>' + "</div>" + "</div>",
        // Loading indicator template
        spinnerTpl: '<div class="fancybox-loading"></div>',
        // Error message template
        errorTpl: '<div class="fancybox-error"><p>{{ERROR}}</p></div>',
        btnTpl: {
            download: '<a download data-fancybox-download class="fancybox-button fancybox-button--download" title="{{DOWNLOAD}}" href="javascript:;">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.62 17.09V19H5.38v-1.91zm-2.97-6.96L17 11.45l-5 4.87-5-4.87 1.36-1.32 2.68 2.64V5h1.92v7.77z"/></svg>' + "</a>",
            zoom: '<button data-fancybox-zoom class="fancybox-button fancybox-button--zoom" title="{{ZOOM}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.7 17.3l-3-3a5.9 5.9 0 0 0-.6-7.6 5.9 5.9 0 0 0-8.4 0 5.9 5.9 0 0 0 0 8.4 5.9 5.9 0 0 0 7.7.7l3 3a1 1 0 0 0 1.3 0c.4-.5.4-1 0-1.5zM8.1 13.8a4 4 0 0 1 0-5.7 4 4 0 0 1 5.7 0 4 4 0 0 1 0 5.7 4 4 0 0 1-5.7 0z"/></svg>' + "</button>",
            close: '<button data-fancybox-close class="fancybox-button fancybox-button--close" title="{{CLOSE}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 10.6L6.6 5.2 5.2 6.6l5.4 5.4-5.4 5.4 1.4 1.4 5.4-5.4 5.4 5.4 1.4-1.4-5.4-5.4 5.4-5.4-1.4-1.4-5.4 5.4z"/></svg>' + "</button>",
            // Arrows
            arrowLeft: '<button data-fancybox-prev class="fancybox-button fancybox-button--arrow_left" title="{{PREV}}">' + '<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M11.28 15.7l-1.34 1.37L5 12l4.94-5.07 1.34 1.38-2.68 2.72H19v1.94H8.6z"/></svg></div>' + "</button>",
            arrowRight: '<button data-fancybox-next class="fancybox-button fancybox-button--arrow_right" title="{{NEXT}}">' + '<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.4 12.97l-2.68 2.72 1.34 1.38L19 12l-4.94-5.07-1.34 1.38 2.68 2.72H5v1.94z"/></svg></div>' + "</button>",
            // This small close button will be appended to your html/inline/ajax content by default,
            // if "smallBtn" option is not set to false
            smallBtn: '<button type="button" data-fancybox-close class="fancybox-button fancybox-close-small" title="{{CLOSE}}">' + '<svg xmlns="http://www.w3.org/2000/svg" version="1" viewBox="0 0 24 24"><path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"/></svg>' + "</button>"
        },
        // Container is injected into this element
        parentEl: "body",
        // Hide browser vertical scrollbars; use at your own risk
        hideScrollbar: true,
        // Focus handling
        // ==============
        // Try to focus on the first focusable element after opening
        autoFocus: true,
        // Put focus back to active element after closing
        backFocus: true,
        // Do not let user to focus on element outside modal content
        trapFocus: true,
        // Module specific options
        // =======================
        fullScreen: {
            autoStart: false
        },
        // Set `touch: false` to disable panning/swiping
        touch: {
            vertical: true,
            // Allow to drag content vertically
            momentum: true
        },
        // Hash value when initializing manually,
        // set `false` to disable hash change
        hash: null,
        // Customize or add new media types
        // Example:
        /*
      media : {
        youtube : {
          params : {
            autoplay : 0
          }
        }
      }
    */
        media: {},
        slideShow: {
            autoStart: false,
            speed: 3e3
        },
        thumbs: {
            autoStart: false,
            // Display thumbnails on opening
            hideOnClose: true,
            // Hide thumbnail grid when closing animation starts
            parentEl: ".fancybox-container",
            // Container is injected into this element
            axis: "y"
        },
        // Use mousewheel to navigate gallery
        // If 'auto' - enabled for images only
        wheel: "auto",
        // Callbacks
        //==========
        // See Documentation/API/Events for more information
        // Example:
        /*
      afterShow: function( instance, current ) {
        console.info( 'Clicked element:' );
        console.info( current.opts.$orig );
      }
    */
        onInit: $.noop,
        // When instance has been initialized
        beforeLoad: $.noop,
        // Before the content of a slide is being loaded
        afterLoad: $.noop,
        // When the content of a slide is done loading
        beforeShow: $.noop,
        // Before open animation starts
        afterShow: $.noop,
        // When content is done loading and animating
        beforeClose: $.noop,
        // Before the instance attempts to close. Return false to cancel the close.
        afterClose: $.noop,
        // After instance has been closed
        onActivate: $.noop,
        // When instance is brought to front
        onDeactivate: $.noop,
        // When other instance has been activated
        // Interaction
        // ===========
        // Use options below to customize taken action when user clicks or double clicks on the fancyBox area,
        // each option can be string or method that returns value.
        //
        // Possible values:
        //   "close"           - close instance
        //   "next"            - move to next gallery item
        //   "nextOrClose"     - move to next gallery item or close if gallery has only one item
        //   "toggleControls"  - show/hide controls
        //   "zoom"            - zoom image (if loaded)
        //   false             - do nothing
        // Clicked on the content
        clickContent: function(current, event) {
            return current.type === "image" ? "zoom" : false;
        },
        // Clicked on the slide
        clickSlide: "close",
        // Clicked on the background (backdrop) element;
        // if you have not changed the layout, then most likely you need to use `clickSlide` option
        clickOutside: "close",
        // Same as previous two, but for double click
        dblclickContent: false,
        dblclickSlide: false,
        dblclickOutside: false,
        // Custom options when mobile device is detected
        // =============================================
        mobile: {
            preventCaptionOverlap: false,
            idleTime: false,
            clickContent: function(current, event) {
                return current.type === "image" ? "toggleControls" : false;
            },
            clickSlide: function(current, event) {
                return current.type === "image" ? "toggleControls" : "close";
            },
            dblclickContent: function(current, event) {
                return current.type === "image" ? "zoom" : false;
            },
            dblclickSlide: function(current, event) {
                return current.type === "image" ? "zoom" : false;
            }
        },
        // Internationalization
        // ====================
        lang: "en",
        i18n: {
            en: {
                CLOSE: "Close",
                NEXT: "Next",
                PREV: "Previous",
                ERROR: "The requested content cannot be loaded. <br/> Please try again later.",
                PLAY_START: "Start slideshow",
                PLAY_STOP: "Pause slideshow",
                FULL_SCREEN: "Full screen",
                THUMBS: "Thumbnails",
                DOWNLOAD: "Download",
                SHARE: "Share",
                ZOOM: "Zoom"
            },
            de: {
                CLOSE: "Schlie&szlig;en",
                NEXT: "Weiter",
                PREV: "Zur&uuml;ck",
                ERROR: "Die angeforderten Daten konnten nicht geladen werden. <br/> Bitte versuchen Sie es sp&auml;ter nochmal.",
                PLAY_START: "Diaschau starten",
                PLAY_STOP: "Diaschau beenden",
                FULL_SCREEN: "Vollbild",
                THUMBS: "Vorschaubilder",
                DOWNLOAD: "Herunterladen",
                SHARE: "Teilen",
                ZOOM: "Vergr&ouml;&szlig;ern"
            }
        }
    };
    // Few useful variables and methods
    // ================================
        var $W = $(window);
    var $D = $(document);
    var called = 0;
    // Check if an object is a jQuery object and not a native JavaScript object
    // ========================================================================
        var isQuery = function(obj) {
        return obj && obj.hasOwnProperty && obj instanceof $;
    };
    // Handle multiple browsers for "requestAnimationFrame" and "cancelAnimationFrame"
    // ===============================================================================
        var requestAFrame = function() {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || 
        // if all else fails, use setTimeout
        function(callback) {
            return window.setTimeout(callback, 1e3 / 60);
        };
    }();
    var cancelAFrame = function() {
        return window.cancelAnimationFrame || window.webkitCancelAnimationFrame || window.mozCancelAnimationFrame || window.oCancelAnimationFrame || function(id) {
            window.clearTimeout(id);
        };
    }();
    // Detect the supported transition-end event property name
    // =======================================================
        var transitionEnd = function() {
        var el = document.createElement("fakeelement"), t;
        var transitions = {
            transition: "transitionend",
            OTransition: "oTransitionEnd",
            MozTransition: "transitionend",
            WebkitTransition: "webkitTransitionEnd"
        };
        for (t in transitions) {
            if (el.style[t] !== undefined) {
                return transitions[t];
            }
        }
        return "transitionend";
    }();
    // Force redraw on an element.
    // This helps in cases where the browser doesn't redraw an updated element properly
    // ================================================================================
        var forceRedraw = function($el) {
        return $el && $el.length && $el[0].offsetHeight;
    };
    // Exclude array (`buttons`) options from deep merging
    // ===================================================
        var mergeOpts = function(opts1, opts2) {
        var rez = $.extend(true, {}, opts1, opts2);
        $.each(opts2, function(key, value) {
            if ($.isArray(value)) {
                rez[key] = value;
            }
        });
        return rez;
    };
    // How much of an element is visible in viewport
    // =============================================
        var inViewport = function(elem) {
        var elemCenter, rez;
        if (!elem || elem.ownerDocument !== document) {
            return false;
        }
        $(".fancybox-container").css("pointer-events", "none");
        elemCenter = {
            x: elem.getBoundingClientRect().left + elem.offsetWidth / 2,
            y: elem.getBoundingClientRect().top + elem.offsetHeight / 2
        };
        rez = document.elementFromPoint(elemCenter.x, elemCenter.y) === elem;
        $(".fancybox-container").css("pointer-events", "");
        return rez;
    };
    // Class definition
    // ================
        var FancyBox = function(content, opts, index) {
        var self = this;
        self.opts = mergeOpts({
            index: index
        }, $.fancybox.defaults);
        if ($.isPlainObject(opts)) {
            self.opts = mergeOpts(self.opts, opts);
        }
        if ($.fancybox.isMobile) {
            self.opts = mergeOpts(self.opts, self.opts.mobile);
        }
        self.id = self.opts.id || ++called;
        self.currIndex = parseInt(self.opts.index, 10) || 0;
        self.prevIndex = null;
        self.prevPos = null;
        self.currPos = 0;
        self.firstRun = true;
        // All group items
                self.group = [];
        // Existing slides (for current, next and previous gallery items)
                self.slides = {};
        // Create group elements
                self.addContent(content);
        if (!self.group.length) {
            return;
        }
        self.init();
    };
    $.extend(FancyBox.prototype, {
        // Create DOM structure
        // ====================
        init: function() {
            var self = this, firstItem = self.group[self.currIndex], firstItemOpts = firstItem.opts, $container, buttonStr;
            if (firstItemOpts.closeExisting) {
                $.fancybox.close(true);
            }
            // Hide scrollbars
            // ===============
                        $("body").addClass("fancybox-active");
            if (!$.fancybox.getInstance() && firstItemOpts.hideScrollbar !== false && !$.fancybox.isMobile && document.body.scrollHeight > window.innerHeight) {
                $("head").append('<style id="fancybox-style-noscroll" type="text/css">.compensate-for-scrollbar{margin-right:' + (window.innerWidth - document.documentElement.clientWidth) + "px;}</style>");
                $("body").addClass("compensate-for-scrollbar");
            }
            // Build html markup and set references
            // ====================================
            // Build html code for buttons and insert into main template
                        buttonStr = "";
            $.each(firstItemOpts.buttons, function(index, value) {
                buttonStr += firstItemOpts.btnTpl[value] || "";
            });
            // Create markup from base template, it will be initially hidden to
            // avoid unnecessary work like painting while initializing is not complete
                        $container = $(self.translate(self, firstItemOpts.baseTpl.replace("{{buttons}}", buttonStr).replace("{{arrows}}", firstItemOpts.btnTpl.arrowLeft + firstItemOpts.btnTpl.arrowRight))).attr("id", "fancybox-container-" + self.id).addClass(firstItemOpts.baseClass).data("FancyBox", self).appendTo(firstItemOpts.parentEl);
            // Create object holding references to jQuery wrapped nodes
                        self.$refs = {
                container: $container
            };
            [ "bg", "inner", "infobar", "toolbar", "stage", "caption", "navigation" ].forEach(function(item) {
                self.$refs[item] = $container.find(".fancybox-" + item);
            });
            self.trigger("onInit");
            // Enable events, deactive previous instances
                        self.activate();
            // Build slides, load and reveal content
                        self.jumpTo(self.currIndex);
        },
        // Simple i18n support - replaces object keys found in template
        // with corresponding values
        // ============================================================
        translate: function(obj, str) {
            var arr = obj.opts.i18n[obj.opts.lang] || obj.opts.i18n.en;
            return str.replace(/\{\{(\w+)\}\}/g, function(match, n) {
                return arr[n] === undefined ? match : arr[n];
            });
        },
        // Populate current group with fresh content
        // Check if each object has valid type and content
        // ===============================================
        addContent: function(content) {
            var self = this, items = $.makeArray(content), thumbs;
            $.each(items, function(i, item) {
                var obj = {}, opts = {}, $item, type, found, src, srcParts;
                // Step 1 - Make sure we have an object
                // ====================================
                                if ($.isPlainObject(item)) {
                    // We probably have manual usage here, something like
                    // $.fancybox.open( [ { src : "image.jpg", type : "image" } ] )
                    obj = item;
                    opts = item.opts || item;
                } else if ($.type(item) === "object" && $(item).length) {
                    // Here we probably have jQuery collection returned by some selector
                    $item = $(item);
                    // Support attributes like `data-options='{"touch" : false}'` and `data-touch='false'`
                                        opts = $item.data() || {};
                    opts = $.extend(true, {}, opts, opts.options);
                    // Here we store clicked element
                                        opts.$orig = $item;
                    obj.src = self.opts.src || opts.src || $item.attr("href");
                    // Assume that simple syntax is used, for example:
                    //   `$.fancybox.open( $("#test"), {} );`
                                        if (!obj.type && !obj.src) {
                        obj.type = "inline";
                        obj.src = item;
                    }
                } else {
                    // Assume we have a simple html code, for example:
                    //   $.fancybox.open( '<div><h1>Hi!</h1></div>' );
                    obj = {
                        type: "html",
                        src: item + ""
                    };
                }
                // Each gallery object has full collection of options
                                obj.opts = $.extend(true, {}, self.opts, opts);
                // Do not merge buttons array
                                if ($.isArray(opts.buttons)) {
                    obj.opts.buttons = opts.buttons;
                }
                if ($.fancybox.isMobile && obj.opts.mobile) {
                    obj.opts = mergeOpts(obj.opts, obj.opts.mobile);
                }
                // Step 2 - Make sure we have content type, if not - try to guess
                // ==============================================================
                                type = obj.type || obj.opts.type;
                src = obj.src || "";
                if (!type && src) {
                    if (found = src.match(/\.(mp4|mov|ogv|webm)((\?|#).*)?$/i)) {
                        type = "video";
                        if (!obj.opts.video.format) {
                            obj.opts.video.format = "video/" + (found[1] === "ogv" ? "ogg" : found[1]);
                        }
                    } else if (src.match(/(^data:image\/[a-z0-9+\/=]*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg|ico)((\?|#).*)?$)/i)) {
                        type = "image";
                    } else if (src.match(/\.(pdf)((\?|#).*)?$/i)) {
                        type = "iframe";
                        obj = $.extend(true, obj, {
                            contentType: "pdf",
                            opts: {
                                iframe: {
                                    preload: false
                                }
                            }
                        });
                    } else if (src.charAt(0) === "#") {
                        type = "inline";
                    }
                }
                if (type) {
                    obj.type = type;
                } else {
                    self.trigger("objectNeedsType", obj);
                }
                if (!obj.contentType) {
                    obj.contentType = $.inArray(obj.type, [ "html", "inline", "ajax" ]) > -1 ? "html" : obj.type;
                }
                // Step 3 - Some adjustments
                // =========================
                                obj.index = self.group.length;
                if (obj.opts.smallBtn == "auto") {
                    obj.opts.smallBtn = $.inArray(obj.type, [ "html", "inline", "ajax" ]) > -1;
                }
                if (obj.opts.toolbar === "auto") {
                    obj.opts.toolbar = !obj.opts.smallBtn;
                }
                // Find thumbnail image, check if exists and if is in the viewport
                                obj.$thumb = obj.opts.$thumb || null;
                if (obj.opts.$trigger && obj.index === self.opts.index) {
                    obj.$thumb = obj.opts.$trigger.find("img:first");
                    if (obj.$thumb.length) {
                        obj.opts.$orig = obj.opts.$trigger;
                    }
                }
                if (!(obj.$thumb && obj.$thumb.length) && obj.opts.$orig) {
                    obj.$thumb = obj.opts.$orig.find("img:first");
                }
                if (obj.$thumb && !obj.$thumb.length) {
                    obj.$thumb = null;
                }
                obj.thumb = obj.opts.thumb || (obj.$thumb ? obj.$thumb[0].src : null);
                // "caption" is a "special" option, it can be used to customize caption per gallery item
                                if ($.type(obj.opts.caption) === "function") {
                    obj.opts.caption = obj.opts.caption.apply(item, [ self, obj ]);
                }
                if ($.type(self.opts.caption) === "function") {
                    obj.opts.caption = self.opts.caption.apply(item, [ self, obj ]);
                }
                // Make sure we have caption as a string or jQuery object
                                if (!(obj.opts.caption instanceof $)) {
                    obj.opts.caption = obj.opts.caption === undefined ? "" : obj.opts.caption + "";
                }
                // Check if url contains "filter" used to filter the content
                // Example: "ajax.html #something"
                                if (obj.type === "ajax") {
                    srcParts = src.split(/\s+/, 2);
                    if (srcParts.length > 1) {
                        obj.src = srcParts.shift();
                        obj.opts.filter = srcParts.shift();
                    }
                }
                // Hide all buttons and disable interactivity for modal items
                                if (obj.opts.modal) {
                    obj.opts = $.extend(true, obj.opts, {
                        trapFocus: true,
                        // Remove buttons
                        infobar: 0,
                        toolbar: 0,
                        smallBtn: 0,
                        // Disable keyboard navigation
                        keyboard: 0,
                        // Disable some modules
                        slideShow: 0,
                        fullScreen: 0,
                        thumbs: 0,
                        touch: 0,
                        // Disable click event handlers
                        clickContent: false,
                        clickSlide: false,
                        clickOutside: false,
                        dblclickContent: false,
                        dblclickSlide: false,
                        dblclickOutside: false
                    });
                }
                // Step 4 - Add processed object to group
                // ======================================
                                self.group.push(obj);
            });
            // Update controls if gallery is already opened
                        if (Object.keys(self.slides).length) {
                self.updateControls();
                // Update thumbnails, if needed
                                thumbs = self.Thumbs;
                if (thumbs && thumbs.isActive) {
                    thumbs.create();
                    thumbs.focus();
                }
            }
        },
        // Attach an event handler functions for:
        //   - navigation buttons
        //   - browser scrolling, resizing;
        //   - focusing
        //   - keyboard
        //   - detecting inactivity
        // ======================================
        addEvents: function() {
            var self = this;
            self.removeEvents();
            // Make navigation elements clickable
            // ==================================
                        self.$refs.container.on("click.fb-close", "[data-fancybox-close]", function(e) {
                e.stopPropagation();
                e.preventDefault();
                self.close(e);
            }).on("touchstart.fb-prev click.fb-prev", "[data-fancybox-prev]", function(e) {
                e.stopPropagation();
                e.preventDefault();
                self.previous();
            }).on("touchstart.fb-next click.fb-next", "[data-fancybox-next]", function(e) {
                e.stopPropagation();
                e.preventDefault();
                self.next();
            }).on("click.fb", "[data-fancybox-zoom]", function(e) {
                // Click handler for zoom button
                self[self.isScaledDown() ? "scaleToActual" : "scaleToFit"]();
            });
            // Handle page scrolling and browser resizing
            // ==========================================
                        $W.on("orientationchange.fb resize.fb", function(e) {
                if (e && e.originalEvent && e.originalEvent.type === "resize") {
                    if (self.requestId) {
                        cancelAFrame(self.requestId);
                    }
                    self.requestId = requestAFrame(function() {
                        self.update(e);
                    });
                } else {
                    if (self.current && self.current.type === "iframe") {
                        self.$refs.stage.hide();
                    }
                    setTimeout(function() {
                        self.$refs.stage.show();
                        self.update(e);
                    }, $.fancybox.isMobile ? 600 : 250);
                }
            });
            $D.on("keydown.fb", function(e) {
                var instance = $.fancybox ? $.fancybox.getInstance() : null, current = instance.current, keycode = e.keyCode || e.which;
                // Trap keyboard focus inside of the modal
                // =======================================
                                if (keycode == 9) {
                    if (current.opts.trapFocus) {
                        self.focus(e);
                    }
                    return;
                }
                // Enable keyboard navigation
                // ==========================
                                if (!current.opts.keyboard || e.ctrlKey || e.altKey || e.shiftKey || $(e.target).is("input,textarea,video,audio,select")) {
                    return;
                }
                // Backspace and Esc keys
                                if (keycode === 8 || keycode === 27) {
                    e.preventDefault();
                    self.close(e);
                    return;
                }
                // Left arrow and Up arrow
                                if (keycode === 37 || keycode === 38) {
                    e.preventDefault();
                    self.previous();
                    return;
                }
                // Righ arrow and Down arrow
                                if (keycode === 39 || keycode === 40) {
                    e.preventDefault();
                    self.next();
                    return;
                }
                self.trigger("afterKeydown", e, keycode);
            });
            // Hide controls after some inactivity period
                        if (self.group[self.currIndex].opts.idleTime) {
                self.idleSecondsCounter = 0;
                $D.on("mousemove.fb-idle mouseleave.fb-idle mousedown.fb-idle touchstart.fb-idle touchmove.fb-idle scroll.fb-idle keydown.fb-idle", function(e) {
                    self.idleSecondsCounter = 0;
                    if (self.isIdle) {
                        self.showControls();
                    }
                    self.isIdle = false;
                });
                self.idleInterval = window.setInterval(function() {
                    self.idleSecondsCounter++;
                    if (self.idleSecondsCounter >= self.group[self.currIndex].opts.idleTime && !self.isDragging) {
                        self.isIdle = true;
                        self.idleSecondsCounter = 0;
                        self.hideControls();
                    }
                }, 1e3);
            }
        },
        // Remove events added by the core
        // ===============================
        removeEvents: function() {
            var self = this;
            $W.off("orientationchange.fb resize.fb");
            $D.off("keydown.fb .fb-idle");
            this.$refs.container.off(".fb-close .fb-prev .fb-next");
            if (self.idleInterval) {
                window.clearInterval(self.idleInterval);
                self.idleInterval = null;
            }
        },
        // Change to previous gallery item
        // ===============================
        previous: function(duration) {
            return this.jumpTo(this.currPos - 1, duration);
        },
        // Change to next gallery item
        // ===========================
        next: function(duration) {
            return this.jumpTo(this.currPos + 1, duration);
        },
        // Switch to selected gallery item
        // ===============================
        jumpTo: function(pos, duration) {
            var self = this, groupLen = self.group.length, firstRun, isMoved, loop, current, previous, slidePos, stagePos, prop, diff;
            if (self.isDragging || self.isClosing || self.isAnimating && self.firstRun) {
                return;
            }
            // Should loop?
                        pos = parseInt(pos, 10);
            loop = self.current ? self.current.opts.loop : self.opts.loop;
            if (!loop && (pos < 0 || pos >= groupLen)) {
                return false;
            }
            // Check if opening for the first time; this helps to speed things up
                        firstRun = self.firstRun = !Object.keys(self.slides).length;
            // Create slides
                        previous = self.current;
            self.prevIndex = self.currIndex;
            self.prevPos = self.currPos;
            current = self.createSlide(pos);
            if (groupLen > 1) {
                if (loop || current.index < groupLen - 1) {
                    self.createSlide(pos + 1);
                }
                if (loop || current.index > 0) {
                    self.createSlide(pos - 1);
                }
            }
            self.current = current;
            self.currIndex = current.index;
            self.currPos = current.pos;
            self.trigger("beforeShow", firstRun);
            self.updateControls();
            // Validate duration length
                        current.forcedDuration = undefined;
            if ($.isNumeric(duration)) {
                current.forcedDuration = duration;
            } else {
                duration = current.opts[firstRun ? "animationDuration" : "transitionDuration"];
            }
            duration = parseInt(duration, 10);
            // Check if user has swiped the slides or if still animating
                        isMoved = self.isMoved(current);
            // Make sure current slide is visible
                        current.$slide.addClass("fancybox-slide--current");
            // Fresh start - reveal container, current slide and start loading content
                        if (firstRun) {
                if (current.opts.animationEffect && duration) {
                    self.$refs.container.css("transition-duration", duration + "ms");
                }
                self.$refs.container.addClass("fancybox-is-open").trigger("focus");
                // Attempt to load content into slide
                // This will later call `afterLoad` -> `revealContent`
                                self.loadSlide(current);
                self.preload("image");
                return;
            }
            // Get actual slide/stage positions (before cleaning up)
                        slidePos = $.fancybox.getTranslate(previous.$slide);
            stagePos = $.fancybox.getTranslate(self.$refs.stage);
            // Clean up all slides
                        $.each(self.slides, function(index, slide) {
                $.fancybox.stop(slide.$slide, true);
            });
            if (previous.pos !== current.pos) {
                previous.isComplete = false;
            }
            previous.$slide.removeClass("fancybox-slide--complete fancybox-slide--current");
            // If slides are out of place, then animate them to correct position
                        if (isMoved) {
                // Calculate horizontal swipe distance
                diff = slidePos.left - (previous.pos * slidePos.width + previous.pos * previous.opts.gutter);
                $.each(self.slides, function(index, slide) {
                    slide.$slide.removeClass("fancybox-animated").removeClass(function(index, className) {
                        return (className.match(/(^|\s)fancybox-fx-\S+/g) || []).join(" ");
                    });
                    // Make sure that each slide is in equal distance
                    // This is mostly needed for freshly added slides, because they are not yet positioned
                                        var leftPos = slide.pos * slidePos.width + slide.pos * slide.opts.gutter;
                    $.fancybox.setTranslate(slide.$slide, {
                        top: 0,
                        left: leftPos - stagePos.left + diff
                    });
                    if (slide.pos !== current.pos) {
                        slide.$slide.addClass("fancybox-slide--" + (slide.pos > current.pos ? "next" : "previous"));
                    }
                    // Redraw to make sure that transition will start
                                        forceRedraw(slide.$slide);
                    // Animate the slide
                                        $.fancybox.animate(slide.$slide, {
                        top: 0,
                        left: (slide.pos - current.pos) * slidePos.width + (slide.pos - current.pos) * slide.opts.gutter
                    }, duration, function() {
                        slide.$slide.css({
                            transform: "",
                            opacity: ""
                        }).removeClass("fancybox-slide--next fancybox-slide--previous");
                        if (slide.pos === self.currPos) {
                            self.complete();
                        }
                    });
                });
            } else if (duration && current.opts.transitionEffect) {
                // Set transition effect for previously active slide
                prop = "fancybox-animated fancybox-fx-" + current.opts.transitionEffect;
                previous.$slide.addClass("fancybox-slide--" + (previous.pos > current.pos ? "next" : "previous"));
                $.fancybox.animate(previous.$slide, prop, duration, function() {
                    previous.$slide.removeClass(prop).removeClass("fancybox-slide--next fancybox-slide--previous");
                }, false);
            }
            if (current.isLoaded) {
                self.revealContent(current);
            } else {
                self.loadSlide(current);
            }
            self.preload("image");
        },
        // Create new "slide" element
        // These are gallery items  that are actually added to DOM
        // =======================================================
        createSlide: function(pos) {
            var self = this, $slide, index;
            index = pos % self.group.length;
            index = index < 0 ? self.group.length + index : index;
            if (!self.slides[pos] && self.group[index]) {
                $slide = $('<div class="fancybox-slide"></div>').appendTo(self.$refs.stage);
                self.slides[pos] = $.extend(true, {}, self.group[index], {
                    pos: pos,
                    $slide: $slide,
                    isLoaded: false
                });
                self.updateSlide(self.slides[pos]);
            }
            return self.slides[pos];
        },
        // Scale image to the actual size of the image;
        // x and y values should be relative to the slide
        // ==============================================
        scaleToActual: function(x, y, duration) {
            var self = this, current = self.current, $content = current.$content, canvasWidth = $.fancybox.getTranslate(current.$slide).width, canvasHeight = $.fancybox.getTranslate(current.$slide).height, newImgWidth = current.width, newImgHeight = current.height, imgPos, posX, posY, scaleX, scaleY;
            if (self.isAnimating || self.isMoved() || !$content || !(current.type == "image" && current.isLoaded && !current.hasError)) {
                return;
            }
            self.isAnimating = true;
            $.fancybox.stop($content);
            x = x === undefined ? canvasWidth * .5 : x;
            y = y === undefined ? canvasHeight * .5 : y;
            imgPos = $.fancybox.getTranslate($content);
            imgPos.top -= $.fancybox.getTranslate(current.$slide).top;
            imgPos.left -= $.fancybox.getTranslate(current.$slide).left;
            scaleX = newImgWidth / imgPos.width;
            scaleY = newImgHeight / imgPos.height;
            // Get center position for original image
                        posX = canvasWidth * .5 - newImgWidth * .5;
            posY = canvasHeight * .5 - newImgHeight * .5;
            // Make sure image does not move away from edges
                        if (newImgWidth > canvasWidth) {
                posX = imgPos.left * scaleX - (x * scaleX - x);
                if (posX > 0) {
                    posX = 0;
                }
                if (posX < canvasWidth - newImgWidth) {
                    posX = canvasWidth - newImgWidth;
                }
            }
            if (newImgHeight > canvasHeight) {
                posY = imgPos.top * scaleY - (y * scaleY - y);
                if (posY > 0) {
                    posY = 0;
                }
                if (posY < canvasHeight - newImgHeight) {
                    posY = canvasHeight - newImgHeight;
                }
            }
            self.updateCursor(newImgWidth, newImgHeight);
            $.fancybox.animate($content, {
                top: posY,
                left: posX,
                scaleX: scaleX,
                scaleY: scaleY
            }, duration || 366, function() {
                self.isAnimating = false;
            });
            // Stop slideshow
                        if (self.SlideShow && self.SlideShow.isActive) {
                self.SlideShow.stop();
            }
        },
        // Scale image to fit inside parent element
        // ========================================
        scaleToFit: function(duration) {
            var self = this, current = self.current, $content = current.$content, end;
            if (self.isAnimating || self.isMoved() || !$content || !(current.type == "image" && current.isLoaded && !current.hasError)) {
                return;
            }
            self.isAnimating = true;
            $.fancybox.stop($content);
            end = self.getFitPos(current);
            self.updateCursor(end.width, end.height);
            $.fancybox.animate($content, {
                top: end.top,
                left: end.left,
                scaleX: end.width / $content.width(),
                scaleY: end.height / $content.height()
            }, duration || 366, function() {
                self.isAnimating = false;
            });
        },
        // Calculate image size to fit inside viewport
        // ===========================================
        getFitPos: function(slide) {
            var self = this, $content = slide.$content, $slide = slide.$slide, width = slide.width || slide.opts.width, height = slide.height || slide.opts.height, maxWidth, maxHeight, minRatio, aspectRatio, rez = {};
            if (!slide.isLoaded || !$content || !$content.length) {
                return false;
            }
            maxWidth = $.fancybox.getTranslate(self.$refs.stage).width;
            maxHeight = $.fancybox.getTranslate(self.$refs.stage).height;
            maxWidth -= parseFloat($slide.css("paddingLeft")) + parseFloat($slide.css("paddingRight")) + parseFloat($content.css("marginLeft")) + parseFloat($content.css("marginRight"));
            maxHeight -= parseFloat($slide.css("paddingTop")) + parseFloat($slide.css("paddingBottom")) + parseFloat($content.css("marginTop")) + parseFloat($content.css("marginBottom"));
            if (!width || !height) {
                width = maxWidth;
                height = maxHeight;
            }
            minRatio = Math.min(1, maxWidth / width, maxHeight / height);
            width = minRatio * width;
            height = minRatio * height;
            // Adjust width/height to precisely fit into container
                        if (width > maxWidth - .5) {
                width = maxWidth;
            }
            if (height > maxHeight - .5) {
                height = maxHeight;
            }
            if (slide.type === "image") {
                rez.top = Math.floor((maxHeight - height) * .5) + parseFloat($slide.css("paddingTop"));
                rez.left = Math.floor((maxWidth - width) * .5) + parseFloat($slide.css("paddingLeft"));
            } else if (slide.contentType === "video") {
                // Force aspect ratio for the video
                // "I say the whole world must learn of our peaceful ways… by force!"
                aspectRatio = slide.opts.width && slide.opts.height ? width / height : slide.opts.ratio || 16 / 9;
                if (height > width / aspectRatio) {
                    height = width / aspectRatio;
                } else if (width > height * aspectRatio) {
                    width = height * aspectRatio;
                }
            }
            rez.width = width;
            rez.height = height;
            return rez;
        },
        // Update content size and position for all slides
        // ==============================================
        update: function(e) {
            var self = this;
            $.each(self.slides, function(key, slide) {
                self.updateSlide(slide, e);
            });
        },
        // Update slide content position and size
        // ======================================
        updateSlide: function(slide, e) {
            var self = this, $content = slide && slide.$content, width = slide.width || slide.opts.width, height = slide.height || slide.opts.height, $slide = slide.$slide;
            // First, prevent caption overlap, if needed
                        self.adjustCaption(slide);
            // Then resize content to fit inside the slide
                        if ($content && (width || height || slide.contentType === "video") && !slide.hasError) {
                $.fancybox.stop($content);
                $.fancybox.setTranslate($content, self.getFitPos(slide));
                if (slide.pos === self.currPos) {
                    self.isAnimating = false;
                    self.updateCursor();
                }
            }
            // Then some adjustments
                        self.adjustLayout(slide);
            if ($slide.length) {
                $slide.trigger("refresh");
                if (slide.pos === self.currPos) {
                    self.$refs.toolbar.add(self.$refs.navigation.find(".fancybox-button--arrow_right")).toggleClass("compensate-for-scrollbar", $slide.get(0).scrollHeight > $slide.get(0).clientHeight);
                }
            }
            self.trigger("onUpdate", slide, e);
        },
        // Horizontally center slide
        // =========================
        centerSlide: function(duration) {
            var self = this, current = self.current, $slide = current.$slide;
            if (self.isClosing || !current) {
                return;
            }
            $slide.siblings().css({
                transform: "",
                opacity: ""
            });
            $slide.parent().children().removeClass("fancybox-slide--previous fancybox-slide--next");
            $.fancybox.animate($slide, {
                top: 0,
                left: 0,
                opacity: 1
            }, duration === undefined ? 0 : duration, function() {
                // Clean up
                $slide.css({
                    transform: "",
                    opacity: ""
                });
                if (!current.isComplete) {
                    self.complete();
                }
            }, false);
        },
        // Check if current slide is moved (swiped)
        // ========================================
        isMoved: function(slide) {
            var current = slide || this.current, slidePos, stagePos;
            if (!current) {
                return false;
            }
            stagePos = $.fancybox.getTranslate(this.$refs.stage);
            slidePos = $.fancybox.getTranslate(current.$slide);
            return !current.$slide.hasClass("fancybox-animated") && (Math.abs(slidePos.top - stagePos.top) > .5 || Math.abs(slidePos.left - stagePos.left) > .5);
        },
        // Update cursor style depending if content can be zoomed
        // ======================================================
        updateCursor: function(nextWidth, nextHeight) {
            var self = this, current = self.current, $container = self.$refs.container, canPan, isZoomable;
            if (!current || self.isClosing || !self.Guestures) {
                return;
            }
            $container.removeClass("fancybox-is-zoomable fancybox-can-zoomIn fancybox-can-zoomOut fancybox-can-swipe fancybox-can-pan");
            canPan = self.canPan(nextWidth, nextHeight);
            isZoomable = canPan ? true : self.isZoomable();
            $container.toggleClass("fancybox-is-zoomable", isZoomable);
            $("[data-fancybox-zoom]").prop("disabled", !isZoomable);
            if (canPan) {
                $container.addClass("fancybox-can-pan");
            } else if (isZoomable && (current.opts.clickContent === "zoom" || $.isFunction(current.opts.clickContent) && current.opts.clickContent(current) == "zoom")) {
                $container.addClass("fancybox-can-zoomIn");
            } else if (current.opts.touch && (current.opts.touch.vertical || self.group.length > 1) && current.contentType !== "video") {
                $container.addClass("fancybox-can-swipe");
            }
        },
        // Check if current slide is zoomable
        // ==================================
        isZoomable: function() {
            var self = this, current = self.current, fitPos;
            // Assume that slide is zoomable if:
            //   - image is still loading
            //   - actual size of the image is smaller than available area
                        if (current && !self.isClosing && current.type === "image" && !current.hasError) {
                if (!current.isLoaded) {
                    return true;
                }
                fitPos = self.getFitPos(current);
                if (fitPos && (current.width > fitPos.width || current.height > fitPos.height)) {
                    return true;
                }
            }
            return false;
        },
        // Check if current image dimensions are smaller than actual
        // =========================================================
        isScaledDown: function(nextWidth, nextHeight) {
            var self = this, rez = false, current = self.current, $content = current.$content;
            if (nextWidth !== undefined && nextHeight !== undefined) {
                rez = nextWidth < current.width && nextHeight < current.height;
            } else if ($content) {
                rez = $.fancybox.getTranslate($content);
                rez = rez.width < current.width && rez.height < current.height;
            }
            return rez;
        },
        // Check if image dimensions exceed parent element
        // ===============================================
        canPan: function(nextWidth, nextHeight) {
            var self = this, current = self.current, pos = null, rez = false;
            if (current.type === "image" && (current.isComplete || nextWidth && nextHeight) && !current.hasError) {
                rez = self.getFitPos(current);
                if (nextWidth !== undefined && nextHeight !== undefined) {
                    pos = {
                        width: nextWidth,
                        height: nextHeight
                    };
                } else if (current.isComplete) {
                    pos = $.fancybox.getTranslate(current.$content);
                }
                if (pos && rez) {
                    rez = Math.abs(pos.width - rez.width) > 1.5 || Math.abs(pos.height - rez.height) > 1.5;
                }
            }
            return rez;
        },
        // Load content into the slide
        // ===========================
        loadSlide: function(slide) {
            var self = this, type, $slide, ajaxLoad;
            if (slide.isLoading || slide.isLoaded) {
                return;
            }
            slide.isLoading = true;
            if (self.trigger("beforeLoad", slide) === false) {
                slide.isLoading = false;
                return false;
            }
            type = slide.type;
            $slide = slide.$slide;
            $slide.off("refresh").trigger("onReset").addClass(slide.opts.slideClass);
            // Create content depending on the type
                        switch (type) {
              case "image":
                self.setImage(slide);
                break;

              case "iframe":
                self.setIframe(slide);
                break;

              case "html":
                self.setContent(slide, slide.src || slide.content);
                break;

              case "video":
                self.setContent(slide, slide.opts.video.tpl.replace(/\{\{src\}\}/gi, slide.src).replace("{{format}}", slide.opts.videoFormat || slide.opts.video.format || "").replace("{{poster}}", slide.thumb || ""));
                break;

              case "inline":
                if ($(slide.src).length) {
                    self.setContent(slide, $(slide.src));
                } else {
                    self.setError(slide);
                }
                break;

              case "ajax":
                self.showLoading(slide);
                ajaxLoad = $.ajax($.extend({}, slide.opts.ajax.settings, {
                    url: slide.src,
                    success: function(data, textStatus) {
                        if (textStatus === "success") {
                            self.setContent(slide, data);
                        }
                    },
                    error: function(jqXHR, textStatus) {
                        if (jqXHR && textStatus !== "abort") {
                            self.setError(slide);
                        }
                    }
                }));
                $slide.one("onReset", function() {
                    ajaxLoad.abort();
                });
                break;

              default:
                self.setError(slide);
                break;
            }
            return true;
        },
        // Use thumbnail image, if possible
        // ================================
        setImage: function(slide) {
            var self = this, ghost;
            // Check if need to show loading icon
                        setTimeout(function() {
                var $img = slide.$image;
                if (!self.isClosing && slide.isLoading && (!$img || !$img.length || !$img[0].complete) && !slide.hasError) {
                    self.showLoading(slide);
                }
            }, 50);
            //Check if image has srcset
                        self.checkSrcset(slide);
            // This will be wrapper containing both ghost and actual image
                        slide.$content = $('<div class="fancybox-content"></div>').addClass("fancybox-is-hidden").appendTo(slide.$slide.addClass("fancybox-slide--image"));
            // If we have a thumbnail, we can display it while actual image is loading
            // Users will not stare at black screen and actual image will appear gradually
                        if (slide.opts.preload !== false && slide.opts.width && slide.opts.height && slide.thumb) {
                slide.width = slide.opts.width;
                slide.height = slide.opts.height;
                ghost = document.createElement("img");
                ghost.onerror = function() {
                    $(this).remove();
                    slide.$ghost = null;
                };
                ghost.onload = function() {
                    self.afterLoad(slide);
                };
                slide.$ghost = $(ghost).addClass("fancybox-image").appendTo(slide.$content).attr("src", slide.thumb);
            }
            // Start loading actual image
                        self.setBigImage(slide);
        },
        // Check if image has srcset and get the source
        // ============================================
        checkSrcset: function(slide) {
            var srcset = slide.opts.srcset || slide.opts.image.srcset, found, temp, pxRatio, windowWidth;
            // If we have "srcset", then we need to find first matching "src" value.
            // This is necessary, because when you set an src attribute, the browser will preload the image
            // before any javascript or even CSS is applied.
                        if (srcset) {
                pxRatio = window.devicePixelRatio || 1;
                windowWidth = window.innerWidth * pxRatio;
                temp = srcset.split(",").map(function(el) {
                    var ret = {};
                    el.trim().split(/\s+/).forEach(function(el, i) {
                        var value = parseInt(el.substring(0, el.length - 1), 10);
                        if (i === 0) {
                            return ret.url = el;
                        }
                        if (value) {
                            ret.value = value;
                            ret.postfix = el[el.length - 1];
                        }
                    });
                    return ret;
                });
                // Sort by value
                                temp.sort(function(a, b) {
                    return a.value - b.value;
                });
                // Ok, now we have an array of all srcset values
                                for (var j = 0; j < temp.length; j++) {
                    var el = temp[j];
                    if (el.postfix === "w" && el.value >= windowWidth || el.postfix === "x" && el.value >= pxRatio) {
                        found = el;
                        break;
                    }
                }
                // If not found, take the last one
                                if (!found && temp.length) {
                    found = temp[temp.length - 1];
                }
                if (found) {
                    slide.src = found.url;
                    // If we have default width/height values, we can calculate height for matching source
                                        if (slide.width && slide.height && found.postfix == "w") {
                        slide.height = slide.width / slide.height * found.value;
                        slide.width = found.value;
                    }
                    slide.opts.srcset = srcset;
                }
            }
        },
        // Create full-size image
        // ======================
        setBigImage: function(slide) {
            var self = this, img = document.createElement("img"), $img = $(img);
            slide.$image = $img.one("error", function() {
                self.setError(slide);
            }).one("load", function() {
                var sizes;
                if (!slide.$ghost) {
                    self.resolveImageSlideSize(slide, this.naturalWidth, this.naturalHeight);
                    self.afterLoad(slide);
                }
                if (self.isClosing) {
                    return;
                }
                if (slide.opts.srcset) {
                    sizes = slide.opts.sizes;
                    if (!sizes || sizes === "auto") {
                        sizes = (slide.width / slide.height > 1 && $W.width() / $W.height() > 1 ? "100" : Math.round(slide.width / slide.height * 100)) + "vw";
                    }
                    $img.attr("sizes", sizes).attr("srcset", slide.opts.srcset);
                }
                // Hide temporary image after some delay
                                if (slide.$ghost) {
                    setTimeout(function() {
                        if (slide.$ghost && !self.isClosing) {
                            slide.$ghost.hide();
                        }
                    }, Math.min(300, Math.max(1e3, slide.height / 1600)));
                }
                self.hideLoading(slide);
            }).addClass("fancybox-image").attr("src", slide.src).appendTo(slide.$content);
            if ((img.complete || img.readyState == "complete") && $img.naturalWidth && $img.naturalHeight) {
                $img.trigger("load");
            } else if (img.error) {
                $img.trigger("error");
            }
        },
        // Computes the slide size from image size and maxWidth/maxHeight
        // ==============================================================
        resolveImageSlideSize: function(slide, imgWidth, imgHeight) {
            var maxWidth = parseInt(slide.opts.width, 10), maxHeight = parseInt(slide.opts.height, 10);
            // Sets the default values from the image
                        slide.width = imgWidth;
            slide.height = imgHeight;
            if (maxWidth > 0) {
                slide.width = maxWidth;
                slide.height = Math.floor(maxWidth * imgHeight / imgWidth);
            }
            if (maxHeight > 0) {
                slide.width = Math.floor(maxHeight * imgWidth / imgHeight);
                slide.height = maxHeight;
            }
        },
        // Create iframe wrapper, iframe and bindings
        // ==========================================
        setIframe: function(slide) {
            var self = this, opts = slide.opts.iframe, $slide = slide.$slide, $iframe;
            slide.$content = $('<div class="fancybox-content' + (opts.preload ? " fancybox-is-hidden" : "") + '"></div>').css(opts.css).appendTo($slide);
            $slide.addClass("fancybox-slide--" + slide.contentType);
            slide.$iframe = $iframe = $(opts.tpl.replace(/\{rnd\}/g, new Date().getTime())).attr(opts.attr).appendTo(slide.$content);
            if (opts.preload) {
                self.showLoading(slide);
                // Unfortunately, it is not always possible to determine if iframe is successfully loaded
                // (due to browser security policy)
                                $iframe.on("load.fb error.fb", function(e) {
                    this.isReady = 1;
                    slide.$slide.trigger("refresh");
                    self.afterLoad(slide);
                });
                // Recalculate iframe content size
                // ===============================
                                $slide.on("refresh.fb", function() {
                    var $content = slide.$content, frameWidth = opts.css.width, frameHeight = opts.css.height, $contents, $body;
                    if ($iframe[0].isReady !== 1) {
                        return;
                    }
                    try {
                        $contents = $iframe.contents();
                        $body = $contents.find("body");
                    } catch (ignore) {}
                    // Calculate content dimensions, if it is accessible
                                        if ($body && $body.length && $body.children().length) {
                        // Avoid scrolling to top (if multiple instances)
                        $slide.css("overflow", "visible");
                        $content.css({
                            width: "100%",
                            "max-width": "100%",
                            height: "9999px"
                        });
                        if (frameWidth === undefined) {
                            frameWidth = Math.ceil(Math.max($body[0].clientWidth, $body.outerWidth(true)));
                        }
                        $content.css("width", frameWidth ? frameWidth : "").css("max-width", "");
                        if (frameHeight === undefined) {
                            frameHeight = Math.ceil(Math.max($body[0].clientHeight, $body.outerHeight(true)));
                        }
                        $content.css("height", frameHeight ? frameHeight : "");
                        $slide.css("overflow", "auto");
                    }
                    $content.removeClass("fancybox-is-hidden");
                });
            } else {
                self.afterLoad(slide);
            }
            $iframe.attr("src", slide.src);
            // Remove iframe if closing or changing gallery item
                        $slide.one("onReset", function() {
                // This helps IE not to throw errors when closing
                try {
                    $(this).find("iframe").hide().unbind().attr("src", "//about:blank");
                } catch (ignore) {}
                $(this).off("refresh.fb").empty();
                slide.isLoaded = false;
                slide.isRevealed = false;
            });
        },
        // Wrap and append content to the slide
        // ======================================
        setContent: function(slide, content) {
            var self = this;
            if (self.isClosing) {
                return;
            }
            self.hideLoading(slide);
            if (slide.$content) {
                $.fancybox.stop(slide.$content);
            }
            slide.$slide.empty();
            // If content is a jQuery object, then it will be moved to the slide.
            // The placeholder is created so we will know where to put it back.
                        if (isQuery(content) && content.parent().length) {
                // Make sure content is not already moved to fancyBox
                if (content.hasClass("fancybox-content") || content.parent().hasClass("fancybox-content")) {
                    content.parents(".fancybox-slide").trigger("onReset");
                }
                // Create temporary element marking original place of the content
                                slide.$placeholder = $("<div>").hide().insertAfter(content);
                // Make sure content is visible
                                content.css("display", "inline-block");
            } else if (!slide.hasError) {
                // If content is just a plain text, try to convert it to html
                if ($.type(content) === "string") {
                    content = $("<div>").append($.trim(content)).contents();
                }
                // If "filter" option is provided, then filter content
                                if (slide.opts.filter) {
                    content = $("<div>").html(content).find(slide.opts.filter);
                }
            }
            slide.$slide.one("onReset", function() {
                // Pause all html5 video/audio
                $(this).find("video,audio").trigger("pause");
                // Put content back
                                if (slide.$placeholder) {
                    slide.$placeholder.after(content.removeClass("fancybox-content").hide()).remove();
                    slide.$placeholder = null;
                }
                // Remove custom close button
                                if (slide.$smallBtn) {
                    slide.$smallBtn.remove();
                    slide.$smallBtn = null;
                }
                // Remove content and mark slide as not loaded
                                if (!slide.hasError) {
                    $(this).empty();
                    slide.isLoaded = false;
                    slide.isRevealed = false;
                }
            });
            $(content).appendTo(slide.$slide);
            if ($(content).is("video,audio")) {
                $(content).addClass("fancybox-video");
                $(content).wrap("<div></div>");
                slide.contentType = "video";
                slide.opts.width = slide.opts.width || $(content).attr("width");
                slide.opts.height = slide.opts.height || $(content).attr("height");
            }
            slide.$content = slide.$slide.children().filter("div,form,main,video,audio,article,.fancybox-content").first();
            slide.$content.siblings().hide();
            // Re-check if there is a valid content
            // (in some cases, ajax response can contain various elements or plain text)
                        if (!slide.$content.length) {
                slide.$content = slide.$slide.wrapInner("<div></div>").children().first();
            }
            slide.$content.addClass("fancybox-content");
            slide.$slide.addClass("fancybox-slide--" + slide.contentType);
            self.afterLoad(slide);
        },
        // Display error message
        // =====================
        setError: function(slide) {
            slide.hasError = true;
            slide.$slide.trigger("onReset").removeClass("fancybox-slide--" + slide.contentType).addClass("fancybox-slide--error");
            slide.contentType = "html";
            this.setContent(slide, this.translate(slide, slide.opts.errorTpl));
            if (slide.pos === this.currPos) {
                this.isAnimating = false;
            }
        },
        // Show loading icon inside the slide
        // ==================================
        showLoading: function(slide) {
            var self = this;
            slide = slide || self.current;
            if (slide && !slide.$spinner) {
                slide.$spinner = $(self.translate(self, self.opts.spinnerTpl)).appendTo(slide.$slide).hide().fadeIn("fast");
            }
        },
        // Remove loading icon from the slide
        // ==================================
        hideLoading: function(slide) {
            var self = this;
            slide = slide || self.current;
            if (slide && slide.$spinner) {
                slide.$spinner.stop().remove();
                delete slide.$spinner;
            }
        },
        // Adjustments after slide content has been loaded
        // ===============================================
        afterLoad: function(slide) {
            var self = this;
            if (self.isClosing) {
                return;
            }
            slide.isLoading = false;
            slide.isLoaded = true;
            self.trigger("afterLoad", slide);
            self.hideLoading(slide);
            // Add small close button
                        if (slide.opts.smallBtn && (!slide.$smallBtn || !slide.$smallBtn.length)) {
                slide.$smallBtn = $(self.translate(slide, slide.opts.btnTpl.smallBtn)).appendTo(slide.$content);
            }
            // Disable right click
                        if (slide.opts.protect && slide.$content && !slide.hasError) {
                slide.$content.on("contextmenu.fb", function(e) {
                    if (e.button == 2) {
                        e.preventDefault();
                    }
                    return true;
                });
                // Add fake element on top of the image
                // This makes a bit harder for user to select image
                                if (slide.type === "image") {
                    $('<div class="fancybox-spaceball"></div>').appendTo(slide.$content);
                }
            }
            self.adjustCaption(slide);
            self.adjustLayout(slide);
            if (slide.pos === self.currPos) {
                self.updateCursor();
            }
            self.revealContent(slide);
        },
        // Prevent caption overlap,
        // fix css inconsistency across browsers
        // =====================================
        adjustCaption: function(slide) {
            var self = this, current = slide || self.current, caption = current.opts.caption, preventOverlap = current.opts.preventCaptionOverlap, $caption = self.$refs.caption, $clone, captionH = false;
            $caption.toggleClass("fancybox-caption--separate", preventOverlap);
            if (preventOverlap && caption && caption.length) {
                if (current.pos !== self.currPos) {
                    $clone = $caption.clone().appendTo($caption.parent());
                    $clone.children().eq(0).empty().html(caption);
                    captionH = $clone.outerHeight(true);
                    $clone.empty().remove();
                } else if (self.$caption) {
                    captionH = self.$caption.outerHeight(true);
                }
                current.$slide.css("padding-bottom", captionH || "");
            }
        },
        // Simple hack to fix inconsistency across browsers, described here (affects Edge, too):
        // https://bugzilla.mozilla.org/show_bug.cgi?id=748518
        // ====================================================================================
        adjustLayout: function(slide) {
            var self = this, current = slide || self.current, scrollHeight, marginBottom, inlinePadding, actualPadding;
            if (current.isLoaded && current.opts.disableLayoutFix !== true) {
                current.$content.css("margin-bottom", "");
                // If we would always set margin-bottom for the content,
                // then it would potentially break vertical align
                                if (current.$content.outerHeight() > current.$slide.height() + .5) {
                    inlinePadding = current.$slide[0].style["padding-bottom"];
                    actualPadding = current.$slide.css("padding-bottom");
                    if (parseFloat(actualPadding) > 0) {
                        scrollHeight = current.$slide[0].scrollHeight;
                        current.$slide.css("padding-bottom", 0);
                        if (Math.abs(scrollHeight - current.$slide[0].scrollHeight) < 1) {
                            marginBottom = actualPadding;
                        }
                        current.$slide.css("padding-bottom", inlinePadding);
                    }
                }
                current.$content.css("margin-bottom", marginBottom);
            }
        },
        // Make content visible
        // This method is called right after content has been loaded or
        // user navigates gallery and transition should start
        // ============================================================
        revealContent: function(slide) {
            var self = this, $slide = slide.$slide, end = false, start = false, isMoved = self.isMoved(slide), isRevealed = slide.isRevealed, effect, effectClassName, duration, opacity;
            slide.isRevealed = true;
            effect = slide.opts[self.firstRun ? "animationEffect" : "transitionEffect"];
            duration = slide.opts[self.firstRun ? "animationDuration" : "transitionDuration"];
            duration = parseInt(slide.forcedDuration === undefined ? duration : slide.forcedDuration, 10);
            if (isMoved || slide.pos !== self.currPos || !duration) {
                effect = false;
            }
            // Check if can zoom
                        if (effect === "zoom") {
                if (slide.pos === self.currPos && duration && slide.type === "image" && !slide.hasError && (start = self.getThumbPos(slide))) {
                    end = self.getFitPos(slide);
                } else {
                    effect = "fade";
                }
            }
            // Zoom animation
            // ==============
                        if (effect === "zoom") {
                self.isAnimating = true;
                end.scaleX = end.width / start.width;
                end.scaleY = end.height / start.height;
                // Check if we need to animate opacity
                                opacity = slide.opts.zoomOpacity;
                if (opacity == "auto") {
                    opacity = Math.abs(slide.width / slide.height - start.width / start.height) > .1;
                }
                if (opacity) {
                    start.opacity = .1;
                    end.opacity = 1;
                }
                // Draw image at start position
                                $.fancybox.setTranslate(slide.$content.removeClass("fancybox-is-hidden"), start);
                forceRedraw(slide.$content);
                // Start animation
                                $.fancybox.animate(slide.$content, end, duration, function() {
                    self.isAnimating = false;
                    self.complete();
                });
                return;
            }
            self.updateSlide(slide);
            // Simply show content if no effect
            // ================================
                        if (!effect) {
                slide.$content.removeClass("fancybox-is-hidden");
                if (!isRevealed && isMoved && slide.type === "image" && !slide.hasError) {
                    slide.$content.hide().fadeIn("fast");
                }
                if (slide.pos === self.currPos) {
                    self.complete();
                }
                return;
            }
            // Prepare for CSS transiton
            // =========================
                        $.fancybox.stop($slide);
            //effectClassName = "fancybox-animated fancybox-slide--" + (slide.pos >= self.prevPos ? "next" : "previous") + " fancybox-fx-" + effect;
                        effectClassName = "fancybox-slide--" + (slide.pos >= self.prevPos ? "next" : "previous") + " fancybox-animated fancybox-fx-" + effect;
            $slide.addClass(effectClassName).removeClass("fancybox-slide--current");
 //.addClass(effectClassName);
                        slide.$content.removeClass("fancybox-is-hidden");
            // Force reflow
                        forceRedraw($slide);
            if (slide.type !== "image") {
                slide.$content.hide().show(0);
            }
            $.fancybox.animate($slide, "fancybox-slide--current", duration, function() {
                $slide.removeClass(effectClassName).css({
                    transform: "",
                    opacity: ""
                });
                if (slide.pos === self.currPos) {
                    self.complete();
                }
            }, true);
        },
        // Check if we can and have to zoom from thumbnail
        //================================================
        getThumbPos: function(slide) {
            var rez = false, $thumb = slide.$thumb, thumbPos, btw, brw, bbw, blw;
            if (!$thumb || !inViewport($thumb[0])) {
                return false;
            }
            thumbPos = $.fancybox.getTranslate($thumb);
            btw = parseFloat($thumb.css("border-top-width") || 0);
            brw = parseFloat($thumb.css("border-right-width") || 0);
            bbw = parseFloat($thumb.css("border-bottom-width") || 0);
            blw = parseFloat($thumb.css("border-left-width") || 0);
            rez = {
                top: thumbPos.top + btw,
                left: thumbPos.left + blw,
                width: thumbPos.width - brw - blw,
                height: thumbPos.height - btw - bbw,
                scaleX: 1,
                scaleY: 1
            };
            return thumbPos.width > 0 && thumbPos.height > 0 ? rez : false;
        },
        // Final adjustments after current gallery item is moved to position
        // and it`s content is loaded
        // ==================================================================
        complete: function() {
            var self = this, current = self.current, slides = {}, $el;
            if (self.isMoved() || !current.isLoaded) {
                return;
            }
            if (!current.isComplete) {
                current.isComplete = true;
                current.$slide.siblings().trigger("onReset");
                self.preload("inline");
                // Trigger any CSS transiton inside the slide
                                forceRedraw(current.$slide);
                current.$slide.addClass("fancybox-slide--complete");
                // Remove unnecessary slides
                                $.each(self.slides, function(key, slide) {
                    if (slide.pos >= self.currPos - 1 && slide.pos <= self.currPos + 1) {
                        slides[slide.pos] = slide;
                    } else if (slide) {
                        $.fancybox.stop(slide.$slide);
                        slide.$slide.off().remove();
                    }
                });
                self.slides = slides;
            }
            self.isAnimating = false;
            self.updateCursor();
            self.trigger("afterShow");
            // Autoplay first html5 video/audio
                        if (!!current.opts.video.autoStart) {
                current.$slide.find("video,audio").filter(":visible:first").trigger("play").one("ended", function() {
                    if (Document.exitFullscreen) {
                        Document.exitFullscreen();
                    } else if (this.webkitExitFullscreen) {
                        this.webkitExitFullscreen();
                    }
                    self.next();
                });
            }
            // Try to focus on the first focusable element
                        if (current.opts.autoFocus && current.contentType === "html") {
                // Look for the first input with autofocus attribute
                $el = current.$content.find("input[autofocus]:enabled:visible:first");
                if ($el.length) {
                    $el.trigger("focus");
                } else {
                    self.focus(null, true);
                }
            }
            // Avoid jumping
                        current.$slide.scrollTop(0).scrollLeft(0);
        },
        // Preload next and previous slides
        // ================================
        preload: function(type) {
            var self = this, prev, next;
            if (self.group.length < 2) {
                return;
            }
            next = self.slides[self.currPos + 1];
            prev = self.slides[self.currPos - 1];
            if (prev && prev.type === type) {
                self.loadSlide(prev);
            }
            if (next && next.type === type) {
                self.loadSlide(next);
            }
        },
        // Try to find and focus on the first focusable element
        // ====================================================
        focus: function(e, firstRun) {
            var self = this, focusableStr = [ "a[href]", "area[href]", 'input:not([disabled]):not([type="hidden"]):not([aria-hidden])', "select:not([disabled]):not([aria-hidden])", "textarea:not([disabled]):not([aria-hidden])", "button:not([disabled]):not([aria-hidden])", "iframe", "object", "embed", "video", "audio", "[contenteditable]", '[tabindex]:not([tabindex^="-"])' ].join(","), focusableItems, focusedItemIndex;
            if (self.isClosing) {
                return;
            }
            if (e || !self.current || !self.current.isComplete) {
                // Focus on any element inside fancybox
                focusableItems = self.$refs.container.find("*:visible");
            } else {
                // Focus inside current slide
                focusableItems = self.current.$slide.find("*:visible" + (firstRun ? ":not(.fancybox-close-small)" : ""));
            }
            focusableItems = focusableItems.filter(focusableStr).filter(function() {
                return $(this).css("visibility") !== "hidden" && !$(this).hasClass("disabled");
            });
            if (focusableItems.length) {
                focusedItemIndex = focusableItems.index(document.activeElement);
                if (e && e.shiftKey) {
                    // Back tab
                    if (focusedItemIndex < 0 || focusedItemIndex == 0) {
                        e.preventDefault();
                        focusableItems.eq(focusableItems.length - 1).trigger("focus");
                    }
                } else {
                    // Outside or Forward tab
                    if (focusedItemIndex < 0 || focusedItemIndex == focusableItems.length - 1) {
                        if (e) {
                            e.preventDefault();
                        }
                        focusableItems.eq(0).trigger("focus");
                    }
                }
            } else {
                self.$refs.container.trigger("focus");
            }
        },
        // Activates current instance - brings container to the front and enables keyboard,
        // notifies other instances about deactivating
        // =================================================================================
        activate: function() {
            var self = this;
            // Deactivate all instances
                        $(".fancybox-container").each(function() {
                var instance = $(this).data("FancyBox");
                // Skip self and closing instances
                                if (instance && instance.id !== self.id && !instance.isClosing) {
                    instance.trigger("onDeactivate");
                    instance.removeEvents();
                    instance.isVisible = false;
                }
            });
            self.isVisible = true;
            if (self.current || self.isIdle) {
                self.update();
                self.updateControls();
            }
            self.trigger("onActivate");
            self.addEvents();
        },
        // Start closing procedure
        // This will start "zoom-out" animation if needed and clean everything up afterwards
        // =================================================================================
        close: function(e, d) {
            var self = this, current = self.current, effect, duration, $content, domRect, opacity, start, end;
            var done = function() {
                self.cleanUp(e);
            };
            if (self.isClosing) {
                return false;
            }
            self.isClosing = true;
            // If beforeClose callback prevents closing, make sure content is centered
                        if (self.trigger("beforeClose", e) === false) {
                self.isClosing = false;
                requestAFrame(function() {
                    self.update();
                });
                return false;
            }
            // Remove all events
            // If there are multiple instances, they will be set again by "activate" method
                        self.removeEvents();
            $content = current.$content;
            effect = current.opts.animationEffect;
            duration = $.isNumeric(d) ? d : effect ? current.opts.animationDuration : 0;
            current.$slide.removeClass("fancybox-slide--complete fancybox-slide--next fancybox-slide--previous fancybox-animated");
            if (e !== true) {
                $.fancybox.stop(current.$slide);
            } else {
                effect = false;
            }
            // Remove other slides
                        current.$slide.siblings().trigger("onReset").remove();
            // Trigger animations
                        if (duration) {
                self.$refs.container.removeClass("fancybox-is-open").addClass("fancybox-is-closing").css("transition-duration", duration + "ms");
            }
            // Clean up
                        self.hideLoading(current);
            self.hideControls(true);
            self.updateCursor();
            // Check if possible to zoom-out
                        if (effect === "zoom" && !($content && duration && current.type === "image" && !self.isMoved() && !current.hasError && (end = self.getThumbPos(current)))) {
                effect = "fade";
            }
            if (effect === "zoom") {
                $.fancybox.stop($content);
                domRect = $.fancybox.getTranslate($content);
                start = {
                    top: domRect.top,
                    left: domRect.left,
                    scaleX: domRect.width / end.width,
                    scaleY: domRect.height / end.height,
                    width: end.width,
                    height: end.height
                };
                // Check if we need to animate opacity
                                opacity = current.opts.zoomOpacity;
                if (opacity == "auto") {
                    opacity = Math.abs(current.width / current.height - end.width / end.height) > .1;
                }
                if (opacity) {
                    end.opacity = 0;
                }
                $.fancybox.setTranslate($content, start);
                forceRedraw($content);
                $.fancybox.animate($content, end, duration, done);
                return true;
            }
            if (effect && duration) {
                $.fancybox.animate(current.$slide.addClass("fancybox-slide--previous").removeClass("fancybox-slide--current"), "fancybox-animated fancybox-fx-" + effect, duration, done);
            } else {
                // If skip animation
                if (e === true) {
                    setTimeout(done, duration);
                } else {
                    done();
                }
            }
            return true;
        },
        // Final adjustments after removing the instance
        // =============================================
        cleanUp: function(e) {
            var self = this, instance, $focus = self.current.opts.$orig, x, y;
            self.current.$slide.trigger("onReset");
            self.$refs.container.empty().remove();
            self.trigger("afterClose", e);
            // Place back focus
                        if (!!self.current.opts.backFocus) {
                if (!$focus || !$focus.length || !$focus.is(":visible")) {
                    $focus = self.$trigger;
                }
                if ($focus && $focus.length) {
                    x = window.scrollX;
                    y = window.scrollY;
                    $focus.trigger("focus");
                    $("html, body").scrollTop(y).scrollLeft(x);
                }
            }
            self.current = null;
            // Check if there are other instances
                        instance = $.fancybox.getInstance();
            if (instance) {
                instance.activate();
            } else {
                $("body").removeClass("fancybox-active compensate-for-scrollbar");
                $("#fancybox-style-noscroll").remove();
            }
        },
        // Call callback and trigger an event
        // ==================================
        trigger: function(name, slide) {
            var args = Array.prototype.slice.call(arguments, 1), self = this, obj = slide && slide.opts ? slide : self.current, rez;
            if (obj) {
                args.unshift(obj);
            } else {
                obj = self;
            }
            args.unshift(self);
            if ($.isFunction(obj.opts[name])) {
                rez = obj.opts[name].apply(obj, args);
            }
            if (rez === false) {
                return rez;
            }
            if (name === "afterClose" || !self.$refs) {
                $D.trigger(name + ".fb", args);
            } else {
                self.$refs.container.trigger(name + ".fb", args);
            }
        },
        // Update infobar values, navigation button states and reveal caption
        // ==================================================================
        updateControls: function() {
            var self = this, current = self.current, index = current.index, $container = self.$refs.container, $caption = self.$refs.caption, caption = current.opts.caption;
            // Recalculate content dimensions
                        current.$slide.trigger("refresh");
            // Set caption
                        if (caption && caption.length) {
                self.$caption = $caption;
                $caption.children().eq(0).html(caption);
            } else {
                self.$caption = null;
            }
            if (!self.hasHiddenControls && !self.isIdle) {
                self.showControls();
            }
            // Update info and navigation elements
                        $container.find("[data-fancybox-count]").html(self.group.length);
            $container.find("[data-fancybox-index]").html(index + 1);
            $container.find("[data-fancybox-prev]").prop("disabled", !current.opts.loop && index <= 0);
            $container.find("[data-fancybox-next]").prop("disabled", !current.opts.loop && index >= self.group.length - 1);
            if (current.type === "image") {
                // Re-enable buttons; update download button source
                $container.find("[data-fancybox-zoom]").show().end().find("[data-fancybox-download]").attr("href", current.opts.image.src || current.src).show();
            } else if (current.opts.toolbar) {
                $container.find("[data-fancybox-download],[data-fancybox-zoom]").hide();
            }
            // Make sure focus is not on disabled button/element
                        if ($(document.activeElement).is(":hidden,[disabled]")) {
                self.$refs.container.trigger("focus");
            }
        },
        // Hide toolbar and caption
        // ========================
        hideControls: function(andCaption) {
            var self = this, arr = [ "infobar", "toolbar", "nav" ];
            if (andCaption || !self.current.opts.preventCaptionOverlap) {
                arr.push("caption");
            }
            this.$refs.container.removeClass(arr.map(function(i) {
                return "fancybox-show-" + i;
            }).join(" "));
            this.hasHiddenControls = true;
        },
        showControls: function() {
            var self = this, opts = self.current ? self.current.opts : self.opts, $container = self.$refs.container;
            self.hasHiddenControls = false;
            self.idleSecondsCounter = 0;
            $container.toggleClass("fancybox-show-toolbar", !!(opts.toolbar && opts.buttons)).toggleClass("fancybox-show-infobar", !!(opts.infobar && self.group.length > 1)).toggleClass("fancybox-show-caption", !!self.$caption).toggleClass("fancybox-show-nav", !!(opts.arrows && self.group.length > 1)).toggleClass("fancybox-is-modal", !!opts.modal);
        },
        // Toggle toolbar and caption
        // ==========================
        toggleControls: function() {
            if (this.hasHiddenControls) {
                this.showControls();
            } else {
                this.hideControls();
            }
        }
    });
    $.fancybox = {
        version: "3.5.7",
        defaults: defaults,
        // Get current instance and execute a command.
        //
        // Examples of usage:
        //
        //   $instance = $.fancybox.getInstance();
        //   $.fancybox.getInstance().jumpTo( 1 );
        //   $.fancybox.getInstance( 'jumpTo', 1 );
        //   $.fancybox.getInstance( function() {
        //       console.info( this.currIndex );
        //   });
        // ======================================================
        getInstance: function(command) {
            var instance = $('.fancybox-container:not(".fancybox-is-closing"):last').data("FancyBox"), args = Array.prototype.slice.call(arguments, 1);
            if (instance instanceof FancyBox) {
                if ($.type(command) === "string") {
                    instance[command].apply(instance, args);
                } else if ($.type(command) === "function") {
                    command.apply(instance, args);
                }
                return instance;
            }
            return false;
        },
        // Create new instance
        // ===================
        open: function(items, opts, index) {
            return new FancyBox(items, opts, index);
        },
        // Close current or all instances
        // ==============================
        close: function(all) {
            var instance = this.getInstance();
            if (instance) {
                instance.close();
                // Try to find and close next instance
                                if (all === true) {
                    this.close(all);
                }
            }
        },
        // Close all instances and unbind all events
        // =========================================
        destroy: function() {
            this.close(true);
            $D.add("body").off("click.fb-start", "**");
        },
        // Try to detect mobile devices
        // ============================
        isMobile: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent),
        // Detect if 'translate3d' support is available
        // ============================================
        use3d: function() {
            var div = document.createElement("div");
            return window.getComputedStyle && window.getComputedStyle(div) && window.getComputedStyle(div).getPropertyValue("transform") && !(document.documentMode && document.documentMode < 11);
        }(),
        // Helper function to get current visual state of an element
        // returns array[ top, left, horizontal-scale, vertical-scale, opacity ]
        // =====================================================================
        getTranslate: function($el) {
            var domRect;
            if (!$el || !$el.length) {
                return false;
            }
            domRect = $el[0].getBoundingClientRect();
            return {
                top: domRect.top || 0,
                left: domRect.left || 0,
                width: domRect.width,
                height: domRect.height,
                opacity: parseFloat($el.css("opacity"))
            };
        },
        // Shortcut for setting "translate3d" properties for element
        // Can set be used to set opacity, too
        // ========================================================
        setTranslate: function($el, props) {
            var str = "", css = {};
            if (!$el || !props) {
                return;
            }
            if (props.left !== undefined || props.top !== undefined) {
                str = (props.left === undefined ? $el.position().left : props.left) + "px, " + (props.top === undefined ? $el.position().top : props.top) + "px";
                if (this.use3d) {
                    str = "translate3d(" + str + ", 0px)";
                } else {
                    str = "translate(" + str + ")";
                }
            }
            if (props.scaleX !== undefined && props.scaleY !== undefined) {
                str += " scale(" + props.scaleX + ", " + props.scaleY + ")";
            } else if (props.scaleX !== undefined) {
                str += " scaleX(" + props.scaleX + ")";
            }
            if (str.length) {
                css.transform = str;
            }
            if (props.opacity !== undefined) {
                css.opacity = props.opacity;
            }
            if (props.width !== undefined) {
                css.width = props.width;
            }
            if (props.height !== undefined) {
                css.height = props.height;
            }
            return $el.css(css);
        },
        // Simple CSS transition handler
        // =============================
        animate: function($el, to, duration, callback, leaveAnimationName) {
            var self = this, from;
            if ($.isFunction(duration)) {
                callback = duration;
                duration = null;
            }
            self.stop($el);
            from = self.getTranslate($el);
            $el.on(transitionEnd, function(e) {
                // Skip events from child elements and z-index change
                if (e && e.originalEvent && (!$el.is(e.originalEvent.target) || e.originalEvent.propertyName == "z-index")) {
                    return;
                }
                self.stop($el);
                if ($.isNumeric(duration)) {
                    $el.css("transition-duration", "");
                }
                if ($.isPlainObject(to)) {
                    if (to.scaleX !== undefined && to.scaleY !== undefined) {
                        self.setTranslate($el, {
                            top: to.top,
                            left: to.left,
                            width: from.width * to.scaleX,
                            height: from.height * to.scaleY,
                            scaleX: 1,
                            scaleY: 1
                        });
                    }
                } else if (leaveAnimationName !== true) {
                    $el.removeClass(to);
                }
                if ($.isFunction(callback)) {
                    callback(e);
                }
            });
            if ($.isNumeric(duration)) {
                $el.css("transition-duration", duration + "ms");
            }
            // Start animation by changing CSS properties or class name
                        if ($.isPlainObject(to)) {
                if (to.scaleX !== undefined && to.scaleY !== undefined) {
                    delete to.width;
                    delete to.height;
                    if ($el.parent().hasClass("fancybox-slide--image")) {
                        $el.parent().addClass("fancybox-is-scaling");
                    }
                }
                $.fancybox.setTranslate($el, to);
            } else {
                $el.addClass(to);
            }
            // Make sure that `transitionend` callback gets fired
                        $el.data("timer", setTimeout(function() {
                $el.trigger(transitionEnd);
            }, duration + 33));
        },
        stop: function($el, callCallback) {
            if ($el && $el.length) {
                clearTimeout($el.data("timer"));
                if (callCallback) {
                    $el.trigger(transitionEnd);
                }
                $el.off(transitionEnd).css("transition-duration", "");
                $el.parent().removeClass("fancybox-is-scaling");
            }
        }
    };
    // Default click handler for "fancyboxed" links
    // ============================================
        function _run(e, opts) {
        var items = [], index = 0, $target, value, instance;
        // Avoid opening multiple times
                if (e && e.isDefaultPrevented()) {
            return;
        }
        e.preventDefault();
        opts = opts || {};
        if (e && e.data) {
            opts = mergeOpts(e.data.options, opts);
        }
        $target = opts.$target || $(e.currentTarget).trigger("blur");
        instance = $.fancybox.getInstance();
        if (instance && instance.$trigger && instance.$trigger.is($target)) {
            return;
        }
        if (opts.selector) {
            items = $(opts.selector);
        } else {
            // Get all related items and find index for clicked one
            value = $target.attr("data-fancybox") || "";
            if (value) {
                items = e.data ? e.data.items : [];
                items = items.length ? items.filter('[data-fancybox="' + value + '"]') : $('[data-fancybox="' + value + '"]');
            } else {
                items = [ $target ];
            }
        }
        index = $(items).index($target);
        // Sometimes current item can not be found
                if (index < 0) {
            index = 0;
        }
        instance = $.fancybox.open(items, opts, index);
        // Save last active element
                instance.$trigger = $target;
    }
    // Create a jQuery plugin
    // ======================
        $.fn.fancybox = function(options) {
        var selector;
        options = options || {};
        selector = options.selector || false;
        if (selector) {
            // Use body element instead of document so it executes first
            $("body").off("click.fb-start", selector).on("click.fb-start", selector, {
                options: options
            }, _run);
        } else {
            this.off("click.fb-start").on("click.fb-start", {
                items: this,
                options: options
            }, _run);
        }
        return this;
    };
    // Self initializing plugin for all elements having `data-fancybox` attribute
    // ==========================================================================
        $D.on("click.fb-start", "[data-fancybox]", _run);
    // Enable "trigger elements"
    // =========================
        $D.on("click.fb-start", "[data-fancybox-trigger]", function(e) {
        $('[data-fancybox="' + $(this).attr("data-fancybox-trigger") + '"]').eq($(this).attr("data-fancybox-index") || 0).trigger("click.fb-start", {
            $trigger: $(this)
        });
    });
    // Track focus event for better accessibility styling
    // ==================================================
        // Track focus event for better accessibility styling
    // ==================================================
    (function() {
        var buttonStr = ".fancybox-button", focusStr = "fancybox-focus", $pressed = null;
        $D.on("mousedown mouseup focus blur", buttonStr, function(e) {
            switch (e.type) {
              case "mousedown":
                $pressed = $(this);
                break;

              case "mouseup":
                $pressed = null;
                break;

              case "focusin":
                $(buttonStr).removeClass(focusStr);
                if (!$(this).is($pressed) && !$(this).is("[disabled]")) {
                    $(this).addClass(focusStr);
                }
                break;

              case "focusout":
                $(buttonStr).removeClass(focusStr);
                break;
            }
        });
    })();
})(window, document, jQuery);

// ==========================================================================
//
// Media
// Adds additional media type support
//
// ==========================================================================
// ==========================================================================
//
// Media
// Adds additional media type support
//
// ==========================================================================
(function($) {
    "use strict";
    // Object containing properties for each media type
        var defaults = {
        youtube: {
            matcher: /(youtube\.com|youtu\.be|youtube\-nocookie\.com)\/(watch\?(.*&)?v=|v\/|u\/|embed\/?)?(videoseries\?list=(.*)|[\w-]{11}|\?listType=(.*)&list=(.*))(.*)/i,
            params: {
                autoplay: 1,
                autohide: 1,
                fs: 1,
                rel: 0,
                hd: 1,
                wmode: "transparent",
                enablejsapi: 1,
                html5: 1
            },
            paramPlace: 8,
            type: "iframe",
            url: "https://www.youtube-nocookie.com/embed/$4",
            thumb: "https://img.youtube.com/vi/$4/hqdefault.jpg"
        },
        vimeo: {
            matcher: /^.+vimeo.com\/(.*\/)?([\d]+)(.*)?/,
            params: {
                autoplay: 1,
                hd: 1,
                show_title: 1,
                show_byline: 1,
                show_portrait: 0,
                fullscreen: 1
            },
            paramPlace: 3,
            type: "iframe",
            url: "//player.vimeo.com/video/$2"
        },
        instagram: {
            matcher: /(instagr\.am|instagram\.com)\/p\/([a-zA-Z0-9_\-]+)\/?/i,
            type: "image",
            url: "//$1/p/$2/media/?size=l"
        },
        // Examples:
        // http://maps.google.com/?ll=48.857995,2.294297&spn=0.007666,0.021136&t=m&z=16
        // https://www.google.com/maps/@37.7852006,-122.4146355,14.65z
        // https://www.google.com/maps/@52.2111123,2.9237542,6.61z?hl=en
        // https://www.google.com/maps/place/Googleplex/@37.4220041,-122.0833494,17z/data=!4m5!3m4!1s0x0:0x6c296c66619367e0!8m2!3d37.4219998!4d-122.0840572
        gmap_place: {
            matcher: /(maps\.)?google\.([a-z]{2,3}(\.[a-z]{2})?)\/(((maps\/(place\/(.*)\/)?\@(.*),(\d+.?\d+?)z))|(\?ll=))(.*)?/i,
            type: "iframe",
            url: function(rez) {
                return "//maps.google." + rez[2] + "/?ll=" + (rez[9] ? rez[9] + "&z=" + Math.floor(rez[10]) + (rez[12] ? rez[12].replace(/^\//, "&") : "") : rez[12] + "").replace(/\?/, "&") + "&output=" + (rez[12] && rez[12].indexOf("layer=c") > 0 ? "svembed" : "embed");
            }
        },
        // Examples:
        // https://www.google.com/maps/search/Empire+State+Building/
        // https://www.google.com/maps/search/?api=1&query=centurylink+field
        // https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393
        gmap_search: {
            matcher: /(maps\.)?google\.([a-z]{2,3}(\.[a-z]{2})?)\/(maps\/search\/)(.*)/i,
            type: "iframe",
            url: function(rez) {
                return "//maps.google." + rez[2] + "/maps?q=" + rez[5].replace("query=", "q=").replace("api=1", "") + "&output=embed";
            }
        }
    };
    // Formats matching url to final form
        var format = function(url, rez, params) {
        if (!url) {
            return;
        }
        params = params || "";
        if ($.type(params) === "object") {
            params = $.param(params, true);
        }
        $.each(rez, function(key, value) {
            url = url.replace("$" + key, value || "");
        });
        if (params.length) {
            url += (url.indexOf("?") > 0 ? "&" : "?") + params;
        }
        return url;
    };
    $(document).on("objectNeedsType.fb", function(e, instance, item) {
        var url = item.src || "", type = false, media, thumb, rez, params, urlParams, paramObj, provider;
        media = $.extend(true, {}, defaults, item.opts.media);
        // Look for any matching media type
                $.each(media, function(providerName, providerOpts) {
            rez = url.match(providerOpts.matcher);
            if (!rez) {
                return;
            }
            type = providerOpts.type;
            provider = providerName;
            paramObj = {};
            if (providerOpts.paramPlace && rez[providerOpts.paramPlace]) {
                urlParams = rez[providerOpts.paramPlace];
                if (urlParams[0] == "?") {
                    urlParams = urlParams.substring(1);
                }
                urlParams = urlParams.split("&");
                for (var m = 0; m < urlParams.length; ++m) {
                    var p = urlParams[m].split("=", 2);
                    if (p.length == 2) {
                        paramObj[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
                    }
                }
            }
            params = $.extend(true, {}, providerOpts.params, item.opts[providerName], paramObj);
            url = $.type(providerOpts.url) === "function" ? providerOpts.url.call(this, rez, params, item) : format(providerOpts.url, rez, params);
            thumb = $.type(providerOpts.thumb) === "function" ? providerOpts.thumb.call(this, rez, params, item) : format(providerOpts.thumb, rez);
            if (providerName === "youtube") {
                url = url.replace(/&t=((\d+)m)?(\d+)s/, function(match, p1, m, s) {
                    return "&start=" + ((m ? parseInt(m, 10) * 60 : 0) + parseInt(s, 10));
                });
            } else if (providerName === "vimeo") {
                url = url.replace("&%23", "#");
            }
            return false;
        });
        // If it is found, then change content type and update the url
                if (type) {
            if (!item.opts.thumb && !(item.opts.$thumb && item.opts.$thumb.length)) {
                item.opts.thumb = thumb;
            }
            if (type === "iframe") {
                item.opts = $.extend(true, item.opts, {
                    iframe: {
                        preload: false,
                        attr: {
                            scrolling: "no"
                        }
                    }
                });
            }
            $.extend(item, {
                type: type,
                src: url,
                origSrc: item.src,
                contentSource: provider,
                contentType: type === "image" ? "image" : provider == "gmap_place" || provider == "gmap_search" ? "map" : "video"
            });
        } else if (url) {
            item.type = item.opts.defaultType;
        }
    });
    // Load YouTube/Video API on request to detect when video finished playing
        var VideoAPILoader = {
        youtube: {
            src: "https://www.youtube.com/iframe_api",
            class: "YT",
            loading: false,
            loaded: false
        },
        vimeo: {
            src: "https://player.vimeo.com/api/player.js",
            class: "Vimeo",
            loading: false,
            loaded: false
        },
        load: function(vendor) {
            var _this = this, script;
            if (this[vendor].loaded) {
                setTimeout(function() {
                    _this.done(vendor);
                });
                return;
            }
            if (this[vendor].loading) {
                return;
            }
            this[vendor].loading = true;
            script = document.createElement("script");
            script.type = "text/javascript";
            script.src = this[vendor].src;
            if (vendor === "youtube") {
                window.onYouTubeIframeAPIReady = function() {
                    _this[vendor].loaded = true;
                    _this.done(vendor);
                };
            } else {
                script.onload = function() {
                    _this[vendor].loaded = true;
                    _this.done(vendor);
                };
            }
            document.body.appendChild(script);
        },
        done: function(vendor) {
            var instance, $el, player;
            if (vendor === "youtube") {
                delete window.onYouTubeIframeAPIReady;
            }
            instance = $.fancybox.getInstance();
            if (instance) {
                $el = instance.current.$content.find("iframe");
                if (vendor === "youtube" && YT !== undefined && YT) {
                    player = new YT.Player($el.attr("id"), {
                        events: {
                            onStateChange: function(e) {
                                if (e.data == 0) {
                                    instance.next();
                                }
                            }
                        }
                    });
                } else if (vendor === "vimeo" && Vimeo !== undefined && Vimeo) {
                    player = new Vimeo.Player($el);
                    player.on("ended", function() {
                        instance.next();
                    });
                }
            }
        }
    };
    $(document).on({
        "afterShow.fb": function(e, instance, current) {
            if (instance.group.length > 1 && (current.contentSource === "youtube" || current.contentSource === "vimeo")) {
                VideoAPILoader.load(current.contentSource);
            }
        }
    });
})(jQuery);

// ==========================================================================
//
// Guestures
// Adds touch guestures, handles click and tap events
//
// ==========================================================================
// ==========================================================================
//
// Guestures
// Adds touch guestures, handles click and tap events
//
// ==========================================================================
(function(window, document, $) {
    "use strict";
    var requestAFrame = function() {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || 
        // if all else fails, use setTimeout
        function(callback) {
            return window.setTimeout(callback, 1e3 / 60);
        };
    }();
    var cancelAFrame = function() {
        return window.cancelAnimationFrame || window.webkitCancelAnimationFrame || window.mozCancelAnimationFrame || window.oCancelAnimationFrame || function(id) {
            window.clearTimeout(id);
        };
    }();
    var getPointerXY = function(e) {
        var result = [];
        e = e.originalEvent || e || window.e;
        e = e.touches && e.touches.length ? e.touches : e.changedTouches && e.changedTouches.length ? e.changedTouches : [ e ];
        for (var key in e) {
            if (e[key].pageX) {
                result.push({
                    x: e[key].pageX,
                    y: e[key].pageY
                });
            } else if (e[key].clientX) {
                result.push({
                    x: e[key].clientX,
                    y: e[key].clientY
                });
            }
        }
        return result;
    };
    var distance = function(point2, point1, what) {
        if (!point1 || !point2) {
            return 0;
        }
        if (what === "x") {
            return point2.x - point1.x;
        } else if (what === "y") {
            return point2.y - point1.y;
        }
        return Math.sqrt(Math.pow(point2.x - point1.x, 2) + Math.pow(point2.y - point1.y, 2));
    };
    var isClickable = function($el) {
        if ($el.is('a,area,button,[role="button"],input,label,select,summary,textarea,video,audio,iframe') || $.isFunction($el.get(0).onclick) || $el.data("selectable")) {
            return true;
        }
        // Check for attributes like data-fancybox-next or data-fancybox-close
                for (var i = 0, atts = $el[0].attributes, n = atts.length; i < n; i++) {
            if (atts[i].nodeName.substr(0, 14) === "data-fancybox-") {
                return true;
            }
        }
        return false;
    };
    var hasScrollbars = function(el) {
        var overflowY = window.getComputedStyle(el)["overflow-y"], overflowX = window.getComputedStyle(el)["overflow-x"], vertical = (overflowY === "scroll" || overflowY === "auto") && el.scrollHeight > el.clientHeight, horizontal = (overflowX === "scroll" || overflowX === "auto") && el.scrollWidth > el.clientWidth;
        return vertical || horizontal;
    };
    var isScrollable = function($el) {
        var rez = false;
        while (true) {
            rez = hasScrollbars($el.get(0));
            if (rez) {
                break;
            }
            $el = $el.parent();
            if (!$el.length || $el.hasClass("fancybox-stage") || $el.is("body")) {
                break;
            }
        }
        return rez;
    };
    var Guestures = function(instance) {
        var self = this;
        self.instance = instance;
        self.$bg = instance.$refs.bg;
        self.$stage = instance.$refs.stage;
        self.$container = instance.$refs.container;
        self.destroy();
        self.$container.on("touchstart.fb.touch mousedown.fb.touch", $.proxy(self, "ontouchstart"));
    };
    Guestures.prototype.destroy = function() {
        var self = this;
        self.$container.off(".fb.touch");
        $(document).off(".fb.touch");
        if (self.requestId) {
            cancelAFrame(self.requestId);
            self.requestId = null;
        }
        if (self.tapped) {
            clearTimeout(self.tapped);
            self.tapped = null;
        }
    };
    Guestures.prototype.ontouchstart = function(e) {
        var self = this, $target = $(e.target), instance = self.instance, current = instance.current, $slide = current.$slide, $content = current.$content, isTouchDevice = e.type == "touchstart";
        // Do not respond to both (touch and mouse) events
                if (isTouchDevice) {
            self.$container.off("mousedown.fb.touch");
        }
        // Ignore right click
                if (e.originalEvent && e.originalEvent.button == 2) {
            return;
        }
        // Ignore taping on links, buttons, input elements
                if (!$slide.length || !$target.length || isClickable($target) || isClickable($target.parent())) {
            return;
        }
        // Ignore clicks on the scrollbar
                if (!$target.is("img") && e.originalEvent.clientX > $target[0].clientWidth + $target.offset().left) {
            return;
        }
        // Ignore clicks while zooming or closing
                if (!current || instance.isAnimating || current.$slide.hasClass("fancybox-animated")) {
            e.stopPropagation();
            e.preventDefault();
            return;
        }
        self.realPoints = self.startPoints = getPointerXY(e);
        if (!self.startPoints.length) {
            return;
        }
        // Allow other scripts to catch touch event if "touch" is set to false
                if (current.touch) {
            e.stopPropagation();
        }
        self.startEvent = e;
        self.canTap = true;
        self.$target = $target;
        self.$content = $content;
        self.opts = current.opts.touch;
        self.isPanning = false;
        self.isSwiping = false;
        self.isZooming = false;
        self.isScrolling = false;
        self.canPan = instance.canPan();
        self.startTime = new Date().getTime();
        self.distanceX = self.distanceY = self.distance = 0;
        self.canvasWidth = Math.round($slide[0].clientWidth);
        self.canvasHeight = Math.round($slide[0].clientHeight);
        self.contentLastPos = null;
        self.contentStartPos = $.fancybox.getTranslate(self.$content) || {
            top: 0,
            left: 0
        };
        self.sliderStartPos = $.fancybox.getTranslate($slide);
        // Since position will be absolute, but we need to make it relative to the stage
                self.stagePos = $.fancybox.getTranslate(instance.$refs.stage);
        self.sliderStartPos.top -= self.stagePos.top;
        self.sliderStartPos.left -= self.stagePos.left;
        self.contentStartPos.top -= self.stagePos.top;
        self.contentStartPos.left -= self.stagePos.left;
        $(document).off(".fb.touch").on(isTouchDevice ? "touchend.fb.touch touchcancel.fb.touch" : "mouseup.fb.touch mouseleave.fb.touch", $.proxy(self, "ontouchend")).on(isTouchDevice ? "touchmove.fb.touch" : "mousemove.fb.touch", $.proxy(self, "ontouchmove"));
        if ($.fancybox.isMobile) {
            document.addEventListener("scroll", self.onscroll, true);
        }
        // Skip if clicked outside the sliding area
                if (!(self.opts || self.canPan) || !($target.is(self.$stage) || self.$stage.find($target).length)) {
            if ($target.is(".fancybox-image")) {
                e.preventDefault();
            }
            if (!($.fancybox.isMobile && $target.parents(".fancybox-caption").length)) {
                return;
            }
        }
        self.isScrollable = isScrollable($target) || isScrollable($target.parent());
        // Check if element is scrollable and try to prevent default behavior (scrolling)
                if (!($.fancybox.isMobile && self.isScrollable)) {
            e.preventDefault();
        }
        // One finger or mouse click - swipe or pan an image
                if (self.startPoints.length === 1 || current.hasError) {
            if (self.canPan) {
                $.fancybox.stop(self.$content);
                self.isPanning = true;
            } else {
                self.isSwiping = true;
            }
            self.$container.addClass("fancybox-is-grabbing");
        }
        // Two fingers - zoom image
                if (self.startPoints.length === 2 && current.type === "image" && (current.isLoaded || current.$ghost)) {
            self.canTap = false;
            self.isSwiping = false;
            self.isPanning = false;
            self.isZooming = true;
            $.fancybox.stop(self.$content);
            self.centerPointStartX = (self.startPoints[0].x + self.startPoints[1].x) * .5 - $(window).scrollLeft();
            self.centerPointStartY = (self.startPoints[0].y + self.startPoints[1].y) * .5 - $(window).scrollTop();
            self.percentageOfImageAtPinchPointX = (self.centerPointStartX - self.contentStartPos.left) / self.contentStartPos.width;
            self.percentageOfImageAtPinchPointY = (self.centerPointStartY - self.contentStartPos.top) / self.contentStartPos.height;
            self.startDistanceBetweenFingers = distance(self.startPoints[0], self.startPoints[1]);
        }
    };
    Guestures.prototype.onscroll = function(e) {
        var self = this;
        self.isScrolling = true;
        document.removeEventListener("scroll", self.onscroll, true);
    };
    Guestures.prototype.ontouchmove = function(e) {
        var self = this;
        // Make sure user has not released over iframe or disabled element
                if (e.originalEvent.buttons !== undefined && e.originalEvent.buttons === 0) {
            self.ontouchend(e);
            return;
        }
        if (self.isScrolling) {
            self.canTap = false;
            return;
        }
        self.newPoints = getPointerXY(e);
        if (!(self.opts || self.canPan) || !self.newPoints.length || !self.newPoints.length) {
            return;
        }
        if (!(self.isSwiping && self.isSwiping === true)) {
            e.preventDefault();
        }
        self.distanceX = distance(self.newPoints[0], self.startPoints[0], "x");
        self.distanceY = distance(self.newPoints[0], self.startPoints[0], "y");
        self.distance = distance(self.newPoints[0], self.startPoints[0]);
        // Skip false ontouchmove events (Chrome)
                if (self.distance > 0) {
            if (self.isSwiping) {
                self.onSwipe(e);
            } else if (self.isPanning) {
                self.onPan();
            } else if (self.isZooming) {
                self.onZoom();
            }
        }
    };
    Guestures.prototype.onSwipe = function(e) {
        var self = this, instance = self.instance, swiping = self.isSwiping, left = self.sliderStartPos.left || 0, angle;
        // If direction is not yet determined
                if (swiping === true) {
            // We need at least 10px distance to correctly calculate an angle
            if (Math.abs(self.distance) > 10) {
                self.canTap = false;
                if (instance.group.length < 2 && self.opts.vertical) {
                    self.isSwiping = "y";
                } else if (instance.isDragging || self.opts.vertical === false || self.opts.vertical === "auto" && $(window).width() > 800) {
                    self.isSwiping = "x";
                } else {
                    angle = Math.abs(Math.atan2(self.distanceY, self.distanceX) * 180 / Math.PI);
                    self.isSwiping = angle > 45 && angle < 135 ? "y" : "x";
                }
                if (self.isSwiping === "y" && $.fancybox.isMobile && self.isScrollable) {
                    self.isScrolling = true;
                    return;
                }
                instance.isDragging = self.isSwiping;
                // Reset points to avoid jumping, because we dropped first swipes to calculate the angle
                                self.startPoints = self.newPoints;
                $.each(instance.slides, function(index, slide) {
                    var slidePos, stagePos;
                    $.fancybox.stop(slide.$slide);
                    slidePos = $.fancybox.getTranslate(slide.$slide);
                    stagePos = $.fancybox.getTranslate(instance.$refs.stage);
                    slide.$slide.css({
                        transform: "",
                        opacity: "",
                        "transition-duration": ""
                    }).removeClass("fancybox-animated").removeClass(function(index, className) {
                        return (className.match(/(^|\s)fancybox-fx-\S+/g) || []).join(" ");
                    });
                    if (slide.pos === instance.current.pos) {
                        self.sliderStartPos.top = slidePos.top - stagePos.top;
                        self.sliderStartPos.left = slidePos.left - stagePos.left;
                    }
                    $.fancybox.setTranslate(slide.$slide, {
                        top: slidePos.top - stagePos.top,
                        left: slidePos.left - stagePos.left
                    });
                });
                // Stop slideshow
                                if (instance.SlideShow && instance.SlideShow.isActive) {
                    instance.SlideShow.stop();
                }
            }
            return;
        }
        // Sticky edges
                if (swiping == "x") {
            if (self.distanceX > 0 && (self.instance.group.length < 2 || self.instance.current.index === 0 && !self.instance.current.opts.loop)) {
                left = left + Math.pow(self.distanceX, .8);
            } else if (self.distanceX < 0 && (self.instance.group.length < 2 || self.instance.current.index === self.instance.group.length - 1 && !self.instance.current.opts.loop)) {
                left = left - Math.pow(-self.distanceX, .8);
            } else {
                left = left + self.distanceX;
            }
        }
        self.sliderLastPos = {
            top: swiping == "x" ? 0 : self.sliderStartPos.top + self.distanceY,
            left: left
        };
        if (self.requestId) {
            cancelAFrame(self.requestId);
            self.requestId = null;
        }
        self.requestId = requestAFrame(function() {
            if (self.sliderLastPos) {
                $.each(self.instance.slides, function(index, slide) {
                    var pos = slide.pos - self.instance.currPos;
                    $.fancybox.setTranslate(slide.$slide, {
                        top: self.sliderLastPos.top,
                        left: self.sliderLastPos.left + pos * self.canvasWidth + pos * slide.opts.gutter
                    });
                });
                self.$container.addClass("fancybox-is-sliding");
            }
        });
    };
    Guestures.prototype.onPan = function() {
        var self = this;
        // Prevent accidental movement (sometimes, when tapping casually, finger can move a bit)
                if (distance(self.newPoints[0], self.realPoints[0]) < ($.fancybox.isMobile ? 10 : 5)) {
            self.startPoints = self.newPoints;
            return;
        }
        self.canTap = false;
        self.contentLastPos = self.limitMovement();
        if (self.requestId) {
            cancelAFrame(self.requestId);
        }
        self.requestId = requestAFrame(function() {
            $.fancybox.setTranslate(self.$content, self.contentLastPos);
        });
    };
    // Make panning sticky to the edges
        Guestures.prototype.limitMovement = function() {
        var self = this;
        var canvasWidth = self.canvasWidth;
        var canvasHeight = self.canvasHeight;
        var distanceX = self.distanceX;
        var distanceY = self.distanceY;
        var contentStartPos = self.contentStartPos;
        var currentOffsetX = contentStartPos.left;
        var currentOffsetY = contentStartPos.top;
        var currentWidth = contentStartPos.width;
        var currentHeight = contentStartPos.height;
        var minTranslateX, minTranslateY, maxTranslateX, maxTranslateY, newOffsetX, newOffsetY;
        if (currentWidth > canvasWidth) {
            newOffsetX = currentOffsetX + distanceX;
        } else {
            newOffsetX = currentOffsetX;
        }
        newOffsetY = currentOffsetY + distanceY;
        // Slow down proportionally to traveled distance
                minTranslateX = Math.max(0, canvasWidth * .5 - currentWidth * .5);
        minTranslateY = Math.max(0, canvasHeight * .5 - currentHeight * .5);
        maxTranslateX = Math.min(canvasWidth - currentWidth, canvasWidth * .5 - currentWidth * .5);
        maxTranslateY = Math.min(canvasHeight - currentHeight, canvasHeight * .5 - currentHeight * .5);
        //   ->
                if (distanceX > 0 && newOffsetX > minTranslateX) {
            newOffsetX = minTranslateX - 1 + Math.pow(-minTranslateX + currentOffsetX + distanceX, .8) || 0;
        }
        //    <-
                if (distanceX < 0 && newOffsetX < maxTranslateX) {
            newOffsetX = maxTranslateX + 1 - Math.pow(maxTranslateX - currentOffsetX - distanceX, .8) || 0;
        }
        //   \/
                if (distanceY > 0 && newOffsetY > minTranslateY) {
            newOffsetY = minTranslateY - 1 + Math.pow(-minTranslateY + currentOffsetY + distanceY, .8) || 0;
        }
        //   /\
                if (distanceY < 0 && newOffsetY < maxTranslateY) {
            newOffsetY = maxTranslateY + 1 - Math.pow(maxTranslateY - currentOffsetY - distanceY, .8) || 0;
        }
        return {
            top: newOffsetY,
            left: newOffsetX
        };
    };
    Guestures.prototype.limitPosition = function(newOffsetX, newOffsetY, newWidth, newHeight) {
        var self = this;
        var canvasWidth = self.canvasWidth;
        var canvasHeight = self.canvasHeight;
        if (newWidth > canvasWidth) {
            newOffsetX = newOffsetX > 0 ? 0 : newOffsetX;
            newOffsetX = newOffsetX < canvasWidth - newWidth ? canvasWidth - newWidth : newOffsetX;
        } else {
            // Center horizontally
            newOffsetX = Math.max(0, canvasWidth / 2 - newWidth / 2);
        }
        if (newHeight > canvasHeight) {
            newOffsetY = newOffsetY > 0 ? 0 : newOffsetY;
            newOffsetY = newOffsetY < canvasHeight - newHeight ? canvasHeight - newHeight : newOffsetY;
        } else {
            // Center vertically
            newOffsetY = Math.max(0, canvasHeight / 2 - newHeight / 2);
        }
        return {
            top: newOffsetY,
            left: newOffsetX
        };
    };
    Guestures.prototype.onZoom = function() {
        var self = this;
        // Calculate current distance between points to get pinch ratio and new width and height
                var contentStartPos = self.contentStartPos;
        var currentWidth = contentStartPos.width;
        var currentHeight = contentStartPos.height;
        var currentOffsetX = contentStartPos.left;
        var currentOffsetY = contentStartPos.top;
        var endDistanceBetweenFingers = distance(self.newPoints[0], self.newPoints[1]);
        var pinchRatio = endDistanceBetweenFingers / self.startDistanceBetweenFingers;
        var newWidth = Math.floor(currentWidth * pinchRatio);
        var newHeight = Math.floor(currentHeight * pinchRatio);
        // This is the translation due to pinch-zooming
                var translateFromZoomingX = (currentWidth - newWidth) * self.percentageOfImageAtPinchPointX;
        var translateFromZoomingY = (currentHeight - newHeight) * self.percentageOfImageAtPinchPointY;
        // Point between the two touches
                var centerPointEndX = (self.newPoints[0].x + self.newPoints[1].x) / 2 - $(window).scrollLeft();
        var centerPointEndY = (self.newPoints[0].y + self.newPoints[1].y) / 2 - $(window).scrollTop();
        // And this is the translation due to translation of the centerpoint
        // between the two fingers
                var translateFromTranslatingX = centerPointEndX - self.centerPointStartX;
        var translateFromTranslatingY = centerPointEndY - self.centerPointStartY;
        // The new offset is the old/current one plus the total translation
                var newOffsetX = currentOffsetX + (translateFromZoomingX + translateFromTranslatingX);
        var newOffsetY = currentOffsetY + (translateFromZoomingY + translateFromTranslatingY);
        var newPos = {
            top: newOffsetY,
            left: newOffsetX,
            scaleX: pinchRatio,
            scaleY: pinchRatio
        };
        self.canTap = false;
        self.newWidth = newWidth;
        self.newHeight = newHeight;
        self.contentLastPos = newPos;
        if (self.requestId) {
            cancelAFrame(self.requestId);
        }
        self.requestId = requestAFrame(function() {
            $.fancybox.setTranslate(self.$content, self.contentLastPos);
        });
    };
    Guestures.prototype.ontouchend = function(e) {
        var self = this;
        var swiping = self.isSwiping;
        var panning = self.isPanning;
        var zooming = self.isZooming;
        var scrolling = self.isScrolling;
        self.endPoints = getPointerXY(e);
        self.dMs = Math.max(new Date().getTime() - self.startTime, 1);
        self.$container.removeClass("fancybox-is-grabbing");
        $(document).off(".fb.touch");
        document.removeEventListener("scroll", self.onscroll, true);
        if (self.requestId) {
            cancelAFrame(self.requestId);
            self.requestId = null;
        }
        self.isSwiping = false;
        self.isPanning = false;
        self.isZooming = false;
        self.isScrolling = false;
        self.instance.isDragging = false;
        if (self.canTap) {
            return self.onTap(e);
        }
        self.speed = 100;
        // Speed in px/ms
                self.velocityX = self.distanceX / self.dMs * .5;
        self.velocityY = self.distanceY / self.dMs * .5;
        if (panning) {
            self.endPanning();
        } else if (zooming) {
            self.endZooming();
        } else {
            self.endSwiping(swiping, scrolling);
        }
        return;
    };
    Guestures.prototype.endSwiping = function(swiping, scrolling) {
        var self = this, ret = false, len = self.instance.group.length, distanceX = Math.abs(self.distanceX), canAdvance = swiping == "x" && len > 1 && (self.dMs > 130 && distanceX > 10 || distanceX > 50), speedX = 300;
        self.sliderLastPos = null;
        // Close if swiped vertically / navigate if horizontally
                if (swiping == "y" && !scrolling && Math.abs(self.distanceY) > 50) {
            // Continue vertical movement
            $.fancybox.animate(self.instance.current.$slide, {
                top: self.sliderStartPos.top + self.distanceY + self.velocityY * 150,
                opacity: 0
            }, 200);
            ret = self.instance.close(true, 250);
        } else if (canAdvance && self.distanceX > 0) {
            ret = self.instance.previous(speedX);
        } else if (canAdvance && self.distanceX < 0) {
            ret = self.instance.next(speedX);
        }
        if (ret === false && (swiping == "x" || swiping == "y")) {
            self.instance.centerSlide(200);
        }
        self.$container.removeClass("fancybox-is-sliding");
    };
    // Limit panning from edges
    // ========================
        Guestures.prototype.endPanning = function() {
        var self = this, newOffsetX, newOffsetY, newPos;
        if (!self.contentLastPos) {
            return;
        }
        if (self.opts.momentum === false || self.dMs > 350) {
            newOffsetX = self.contentLastPos.left;
            newOffsetY = self.contentLastPos.top;
        } else {
            // Continue movement
            newOffsetX = self.contentLastPos.left + self.velocityX * 500;
            newOffsetY = self.contentLastPos.top + self.velocityY * 500;
        }
        newPos = self.limitPosition(newOffsetX, newOffsetY, self.contentStartPos.width, self.contentStartPos.height);
        newPos.width = self.contentStartPos.width;
        newPos.height = self.contentStartPos.height;
        $.fancybox.animate(self.$content, newPos, 366);
    };
    Guestures.prototype.endZooming = function() {
        var self = this;
        var current = self.instance.current;
        var newOffsetX, newOffsetY, newPos, reset;
        var newWidth = self.newWidth;
        var newHeight = self.newHeight;
        if (!self.contentLastPos) {
            return;
        }
        newOffsetX = self.contentLastPos.left;
        newOffsetY = self.contentLastPos.top;
        reset = {
            top: newOffsetY,
            left: newOffsetX,
            width: newWidth,
            height: newHeight,
            scaleX: 1,
            scaleY: 1
        };
        // Reset scalex/scaleY values; this helps for perfomance and does not break animation
                $.fancybox.setTranslate(self.$content, reset);
        if (newWidth < self.canvasWidth && newHeight < self.canvasHeight) {
            self.instance.scaleToFit(150);
        } else if (newWidth > current.width || newHeight > current.height) {
            self.instance.scaleToActual(self.centerPointStartX, self.centerPointStartY, 150);
        } else {
            newPos = self.limitPosition(newOffsetX, newOffsetY, newWidth, newHeight);
            $.fancybox.animate(self.$content, newPos, 150);
        }
    };
    Guestures.prototype.onTap = function(e) {
        var self = this;
        var $target = $(e.target);
        var instance = self.instance;
        var current = instance.current;
        var endPoints = e && getPointerXY(e) || self.startPoints;
        var tapX = endPoints[0] ? endPoints[0].x - $(window).scrollLeft() - self.stagePos.left : 0;
        var tapY = endPoints[0] ? endPoints[0].y - $(window).scrollTop() - self.stagePos.top : 0;
        var where;
        var process = function(prefix) {
            var action = current.opts[prefix];
            if ($.isFunction(action)) {
                action = action.apply(instance, [ current, e ]);
            }
            if (!action) {
                return;
            }
            switch (action) {
              case "close":
                instance.close(self.startEvent);
                break;

              case "toggleControls":
                instance.toggleControls();
                break;

              case "next":
                instance.next();
                break;

              case "nextOrClose":
                if (instance.group.length > 1) {
                    instance.next();
                } else {
                    instance.close(self.startEvent);
                }
                break;

              case "zoom":
                if (current.type == "image" && (current.isLoaded || current.$ghost)) {
                    if (instance.canPan()) {
                        instance.scaleToFit();
                    } else if (instance.isScaledDown()) {
                        instance.scaleToActual(tapX, tapY);
                    } else if (instance.group.length < 2) {
                        instance.close(self.startEvent);
                    }
                }
                break;
            }
        };
        // Ignore right click
                if (e.originalEvent && e.originalEvent.button == 2) {
            return;
        }
        // Skip if clicked on the scrollbar
                if (!$target.is("img") && tapX > $target[0].clientWidth + $target.offset().left) {
            return;
        }
        // Check where is clicked
                if ($target.is(".fancybox-bg,.fancybox-inner,.fancybox-outer,.fancybox-container")) {
            where = "Outside";
        } else if ($target.is(".fancybox-slide")) {
            where = "Slide";
        } else if (instance.current.$content && instance.current.$content.find($target).addBack().filter($target).length) {
            where = "Content";
        } else {
            return;
        }
        // Check if this is a double tap
                if (self.tapped) {
            // Stop previously created single tap
            clearTimeout(self.tapped);
            self.tapped = null;
            // Skip if distance between taps is too big
                        if (Math.abs(tapX - self.tapX) > 50 || Math.abs(tapY - self.tapY) > 50) {
                return this;
            }
            // OK, now we assume that this is a double-tap
                        process("dblclick" + where);
        } else {
            // Single tap will be processed if user has not clicked second time within 300ms
            // or there is no need to wait for double-tap
            self.tapX = tapX;
            self.tapY = tapY;
            if (current.opts["dblclick" + where] && current.opts["dblclick" + where] !== current.opts["click" + where]) {
                self.tapped = setTimeout(function() {
                    self.tapped = null;
                    if (!instance.isAnimating) {
                        process("click" + where);
                    }
                }, 500);
            } else {
                process("click" + where);
            }
        }
        return this;
    };
    $(document).on("onActivate.fb", function(e, instance) {
        if (instance && !instance.Guestures) {
            instance.Guestures = new Guestures(instance);
        }
    }).on("beforeClose.fb", function(e, instance) {
        if (instance && instance.Guestures) {
            instance.Guestures.destroy();
        }
    });
})(window, document, jQuery);

// ==========================================================================
//
// SlideShow
// Enables slideshow functionality
//
// Example of usage:
// $.fancybox.getInstance().SlideShow.start()
//
// ==========================================================================
// ==========================================================================
//
// SlideShow
// Enables slideshow functionality
//
// Example of usage:
// $.fancybox.getInstance().SlideShow.start()
//
// ==========================================================================
(function(document, $) {
    "use strict";
    $.extend(true, $.fancybox.defaults, {
        btnTpl: {
            slideShow: '<button data-fancybox-play class="fancybox-button fancybox-button--play" title="{{PLAY_START}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6.5 5.4v13.2l11-6.6z"/></svg>' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M8.33 5.75h2.2v12.5h-2.2V5.75zm5.15 0h2.2v12.5h-2.2V5.75z"/></svg>' + "</button>"
        },
        slideShow: {
            autoStart: false,
            speed: 3e3,
            progress: true
        }
    });
    var SlideShow = function(instance) {
        this.instance = instance;
        this.init();
    };
    $.extend(SlideShow.prototype, {
        timer: null,
        isActive: false,
        $button: null,
        init: function() {
            var self = this, instance = self.instance, opts = instance.group[instance.currIndex].opts.slideShow;
            self.$button = instance.$refs.toolbar.find("[data-fancybox-play]").on("click", function() {
                self.toggle();
            });
            if (instance.group.length < 2 || !opts) {
                self.$button.hide();
            } else if (opts.progress) {
                self.$progress = $('<div class="fancybox-progress"></div>').appendTo(instance.$refs.inner);
            }
        },
        set: function(force) {
            var self = this, instance = self.instance, current = instance.current;
            // Check if reached last element
                        if (current && (force === true || current.opts.loop || instance.currIndex < instance.group.length - 1)) {
                if (self.isActive && current.contentType !== "video") {
                    if (self.$progress) {
                        $.fancybox.animate(self.$progress.show(), {
                            scaleX: 1
                        }, current.opts.slideShow.speed);
                    }
                    self.timer = setTimeout(function() {
                        if (!instance.current.opts.loop && instance.current.index == instance.group.length - 1) {
                            instance.jumpTo(0);
                        } else {
                            instance.next();
                        }
                    }, current.opts.slideShow.speed);
                }
            } else {
                self.stop();
                instance.idleSecondsCounter = 0;
                instance.showControls();
            }
        },
        clear: function() {
            var self = this;
            clearTimeout(self.timer);
            self.timer = null;
            if (self.$progress) {
                self.$progress.removeAttr("style").hide();
            }
        },
        start: function() {
            var self = this, current = self.instance.current;
            if (current) {
                self.$button.attr("title", (current.opts.i18n[current.opts.lang] || current.opts.i18n.en).PLAY_STOP).removeClass("fancybox-button--play").addClass("fancybox-button--pause");
                self.isActive = true;
                if (current.isComplete) {
                    self.set(true);
                }
                self.instance.trigger("onSlideShowChange", true);
            }
        },
        stop: function() {
            var self = this, current = self.instance.current;
            self.clear();
            self.$button.attr("title", (current.opts.i18n[current.opts.lang] || current.opts.i18n.en).PLAY_START).removeClass("fancybox-button--pause").addClass("fancybox-button--play");
            self.isActive = false;
            self.instance.trigger("onSlideShowChange", false);
            if (self.$progress) {
                self.$progress.removeAttr("style").hide();
            }
        },
        toggle: function() {
            var self = this;
            if (self.isActive) {
                self.stop();
            } else {
                self.start();
            }
        }
    });
    $(document).on({
        "onInit.fb": function(e, instance) {
            if (instance && !instance.SlideShow) {
                instance.SlideShow = new SlideShow(instance);
            }
        },
        "beforeShow.fb": function(e, instance, current, firstRun) {
            var SlideShow = instance && instance.SlideShow;
            if (firstRun) {
                if (SlideShow && current.opts.slideShow.autoStart) {
                    SlideShow.start();
                }
            } else if (SlideShow && SlideShow.isActive) {
                SlideShow.clear();
            }
        },
        "afterShow.fb": function(e, instance, current) {
            var SlideShow = instance && instance.SlideShow;
            if (SlideShow && SlideShow.isActive) {
                SlideShow.set();
            }
        },
        "afterKeydown.fb": function(e, instance, current, keypress, keycode) {
            var SlideShow = instance && instance.SlideShow;
            // "P" or Spacebar
                        if (SlideShow && current.opts.slideShow && (keycode === 80 || keycode === 32) && !$(document.activeElement).is("button,a,input")) {
                keypress.preventDefault();
                SlideShow.toggle();
            }
        },
        "beforeClose.fb onDeactivate.fb": function(e, instance) {
            var SlideShow = instance && instance.SlideShow;
            if (SlideShow) {
                SlideShow.stop();
            }
        }
    });
    // Page Visibility API to pause slideshow when window is not active
        $(document).on("visibilitychange", function() {
        var instance = $.fancybox.getInstance(), SlideShow = instance && instance.SlideShow;
        if (SlideShow && SlideShow.isActive) {
            if (document.hidden) {
                SlideShow.clear();
            } else {
                SlideShow.set();
            }
        }
    });
})(document, jQuery);

// ==========================================================================
//
// FullScreen
// Adds fullscreen functionality
//
// ==========================================================================
// ==========================================================================
//
// FullScreen
// Adds fullscreen functionality
//
// ==========================================================================
(function(document, $) {
    "use strict";
    // Collection of methods supported by user browser
        var fn = function() {
        var fnMap = [ [ "requestFullscreen", "exitFullscreen", "fullscreenElement", "fullscreenEnabled", "fullscreenchange", "fullscreenerror" ], 
        // new WebKit
        [ "webkitRequestFullscreen", "webkitExitFullscreen", "webkitFullscreenElement", "webkitFullscreenEnabled", "webkitfullscreenchange", "webkitfullscreenerror" ], 
        // old WebKit (Safari 5.1)
        [ "webkitRequestFullScreen", "webkitCancelFullScreen", "webkitCurrentFullScreenElement", "webkitCancelFullScreen", "webkitfullscreenchange", "webkitfullscreenerror" ], [ "mozRequestFullScreen", "mozCancelFullScreen", "mozFullScreenElement", "mozFullScreenEnabled", "mozfullscreenchange", "mozfullscreenerror" ], [ "msRequestFullscreen", "msExitFullscreen", "msFullscreenElement", "msFullscreenEnabled", "MSFullscreenChange", "MSFullscreenError" ] ];
        var ret = {};
        for (var i = 0; i < fnMap.length; i++) {
            var val = fnMap[i];
            if (val && val[1] in document) {
                for (var j = 0; j < val.length; j++) {
                    ret[fnMap[0][j]] = val[j];
                }
                return ret;
            }
        }
        return false;
    }();
    if (fn) {
        var FullScreen = {
            request: function(elem) {
                elem = elem || document.documentElement;
                elem[fn.requestFullscreen](elem.ALLOW_KEYBOARD_INPUT);
            },
            exit: function() {
                document[fn.exitFullscreen]();
            },
            toggle: function(elem) {
                elem = elem || document.documentElement;
                if (this.isFullscreen()) {
                    this.exit();
                } else {
                    this.request(elem);
                }
            },
            isFullscreen: function() {
                return Boolean(document[fn.fullscreenElement]);
            },
            enabled: function() {
                return Boolean(document[fn.fullscreenEnabled]);
            }
        };
        $.extend(true, $.fancybox.defaults, {
            btnTpl: {
                fullScreen: '<button data-fancybox-fullscreen class="fancybox-button fancybox-button--fsenter" title="{{FULL_SCREEN}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 7h-3v2h5v-5h-2v3zM14 5v2h3v3h2V5h-5z"/></svg>' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5 16h3v3h2v-5H5zm3-8H5v2h5V5H8zm6 11h2v-3h3v-2h-5zm2-11V5h-2v5h5V8z"/></svg>' + "</button>"
            },
            fullScreen: {
                autoStart: false
            }
        });
        $(document).on(fn.fullscreenchange, function() {
            var isFullscreen = FullScreen.isFullscreen(), instance = $.fancybox.getInstance();
            if (instance) {
                // If image is zooming, then force to stop and reposition properly
                if (instance.current && instance.current.type === "image" && instance.isAnimating) {
                    instance.isAnimating = false;
                    instance.update(true, true, 0);
                    if (!instance.isComplete) {
                        instance.complete();
                    }
                }
                instance.trigger("onFullscreenChange", isFullscreen);
                instance.$refs.container.toggleClass("fancybox-is-fullscreen", isFullscreen);
                instance.$refs.toolbar.find("[data-fancybox-fullscreen]").toggleClass("fancybox-button--fsenter", !isFullscreen).toggleClass("fancybox-button--fsexit", isFullscreen);
            }
        });
    }
    $(document).on({
        "onInit.fb": function(e, instance) {
            var $container;
            if (!fn) {
                instance.$refs.toolbar.find("[data-fancybox-fullscreen]").remove();
                return;
            }
            if (instance && instance.group[instance.currIndex].opts.fullScreen) {
                $container = instance.$refs.container;
                $container.on("click.fb-fullscreen", "[data-fancybox-fullscreen]", function(e) {
                    e.stopPropagation();
                    e.preventDefault();
                    FullScreen.toggle();
                });
                if (instance.opts.fullScreen && instance.opts.fullScreen.autoStart === true) {
                    FullScreen.request();
                }
                // Expose API
                                instance.FullScreen = FullScreen;
            } else if (instance) {
                instance.$refs.toolbar.find("[data-fancybox-fullscreen]").hide();
            }
        },
        "afterKeydown.fb": function(e, instance, current, keypress, keycode) {
            // "F"
            if (instance && instance.FullScreen && keycode === 70) {
                keypress.preventDefault();
                instance.FullScreen.toggle();
            }
        },
        "beforeClose.fb": function(e, instance) {
            if (instance && instance.FullScreen && instance.$refs.container.hasClass("fancybox-is-fullscreen")) {
                FullScreen.exit();
            }
        }
    });
})(document, jQuery);

// ==========================================================================
//
// Thumbs
// Displays thumbnails in a grid
//
// ==========================================================================
// ==========================================================================
//
// Thumbs
// Displays thumbnails in a grid
//
// ==========================================================================
(function(document, $) {
    "use strict";
    var CLASS = "fancybox-thumbs", CLASS_ACTIVE = CLASS + "-active";
    // Make sure there are default values
        $.fancybox.defaults = $.extend(true, {
        btnTpl: {
            thumbs: '<button data-fancybox-thumbs class="fancybox-button fancybox-button--thumbs" title="{{THUMBS}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M14.59 14.59h3.76v3.76h-3.76v-3.76zm-4.47 0h3.76v3.76h-3.76v-3.76zm-4.47 0h3.76v3.76H5.65v-3.76zm8.94-4.47h3.76v3.76h-3.76v-3.76zm-4.47 0h3.76v3.76h-3.76v-3.76zm-4.47 0h3.76v3.76H5.65v-3.76zm8.94-4.47h3.76v3.76h-3.76V5.65zm-4.47 0h3.76v3.76h-3.76V5.65zm-4.47 0h3.76v3.76H5.65V5.65z"/></svg>' + "</button>"
        },
        thumbs: {
            autoStart: false,
            // Display thumbnails on opening
            hideOnClose: true,
            // Hide thumbnail grid when closing animation starts
            parentEl: ".fancybox-container",
            // Container is injected into this element
            axis: "y"
        }
    }, $.fancybox.defaults);
    var FancyThumbs = function(instance) {
        this.init(instance);
    };
    $.extend(FancyThumbs.prototype, {
        $button: null,
        $grid: null,
        $list: null,
        isVisible: false,
        isActive: false,
        init: function(instance) {
            var self = this, group = instance.group, enabled = 0;
            self.instance = instance;
            self.opts = group[instance.currIndex].opts.thumbs;
            instance.Thumbs = self;
            self.$button = instance.$refs.toolbar.find("[data-fancybox-thumbs]");
            // Enable thumbs if at least two group items have thumbnails
                        for (var i = 0, len = group.length; i < len; i++) {
                if (group[i].thumb) {
                    enabled++;
                }
                if (enabled > 1) {
                    break;
                }
            }
            if (enabled > 1 && !!self.opts) {
                self.$button.removeAttr("style").on("click", function() {
                    self.toggle();
                });
                self.isActive = true;
            } else {
                self.$button.hide();
            }
        },
        create: function() {
            var self = this, instance = self.instance, parentEl = self.opts.parentEl, list = [], src;
            if (!self.$grid) {
                // Create main element
                self.$grid = $('<div class="' + CLASS + " " + CLASS + "-" + self.opts.axis + '"></div>').appendTo(instance.$refs.container.find(parentEl).addBack().filter(parentEl));
                // Add "click" event that performs gallery navigation
                                self.$grid.on("click", "a", function() {
                    instance.jumpTo($(this).attr("data-index"));
                });
            }
            // Build the list
                        if (!self.$list) {
                self.$list = $('<div class="' + CLASS + '__list">').appendTo(self.$grid);
            }
            $.each(instance.group, function(i, item) {
                src = item.thumb;
                if (!src && item.type === "image") {
                    src = item.src;
                }
                list.push('<a href="javascript:;" tabindex="0" data-index="' + i + '"' + (src && src.length ? ' style="background-image:url(' + src + ')"' : 'class="fancybox-thumbs-missing"') + "></a>");
            });
            self.$list[0].innerHTML = list.join("");
            if (self.opts.axis === "x") {
                // Set fixed width for list element to enable horizontal scrolling
                self.$list.width(parseInt(self.$grid.css("padding-right"), 10) + instance.group.length * self.$list.children().eq(0).outerWidth(true));
            }
        },
        focus: function(duration) {
            var self = this, $list = self.$list, $grid = self.$grid, thumb, thumbPos;
            if (!self.instance.current) {
                return;
            }
            thumb = $list.children().removeClass(CLASS_ACTIVE).filter('[data-index="' + self.instance.current.index + '"]').addClass(CLASS_ACTIVE);
            thumbPos = thumb.position();
            // Check if need to scroll to make current thumb visible
                        if (self.opts.axis === "y" && (thumbPos.top < 0 || thumbPos.top > $list.height() - thumb.outerHeight())) {
                $list.stop().animate({
                    scrollTop: $list.scrollTop() + thumbPos.top
                }, duration);
            } else if (self.opts.axis === "x" && (thumbPos.left < $grid.scrollLeft() || thumbPos.left > $grid.scrollLeft() + ($grid.width() - thumb.outerWidth()))) {
                $list.parent().stop().animate({
                    scrollLeft: thumbPos.left
                }, duration);
            }
        },
        update: function() {
            var that = this;
            that.instance.$refs.container.toggleClass("fancybox-show-thumbs", this.isVisible);
            if (that.isVisible) {
                if (!that.$grid) {
                    that.create();
                }
                that.instance.trigger("onThumbsShow");
                that.focus(0);
            } else if (that.$grid) {
                that.instance.trigger("onThumbsHide");
            }
            // Update content position
                        that.instance.update();
        },
        hide: function() {
            this.isVisible = false;
            this.update();
        },
        show: function() {
            this.isVisible = true;
            this.update();
        },
        toggle: function() {
            this.isVisible = !this.isVisible;
            this.update();
        }
    });
    $(document).on({
        "onInit.fb": function(e, instance) {
            var Thumbs;
            if (instance && !instance.Thumbs) {
                Thumbs = new FancyThumbs(instance);
                if (Thumbs.isActive && Thumbs.opts.autoStart === true) {
                    Thumbs.show();
                }
            }
        },
        "beforeShow.fb": function(e, instance, item, firstRun) {
            var Thumbs = instance && instance.Thumbs;
            if (Thumbs && Thumbs.isVisible) {
                Thumbs.focus(firstRun ? 0 : 250);
            }
        },
        "afterKeydown.fb": function(e, instance, current, keypress, keycode) {
            var Thumbs = instance && instance.Thumbs;
            // "G"
                        if (Thumbs && Thumbs.isActive && keycode === 71) {
                keypress.preventDefault();
                Thumbs.toggle();
            }
        },
        "beforeClose.fb": function(e, instance) {
            var Thumbs = instance && instance.Thumbs;
            if (Thumbs && Thumbs.isVisible && Thumbs.opts.hideOnClose !== false) {
                Thumbs.$grid.hide();
            }
        }
    });
})(document, jQuery);

//// ==========================================================================
//
// Share
// Displays simple form for sharing current url
//
// ==========================================================================
//// ==========================================================================
//
// Share
// Displays simple form for sharing current url
//
// ==========================================================================
(function(document, $) {
    "use strict";
    $.extend(true, $.fancybox.defaults, {
        btnTpl: {
            share: '<button data-fancybox-share class="fancybox-button fancybox-button--share" title="{{SHARE}}">' + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M2.55 19c1.4-8.4 9.1-9.8 11.9-9.8V5l7 7-7 6.3v-3.5c-2.8 0-10.5 2.1-11.9 4.2z"/></svg>' + "</button>"
        },
        share: {
            url: function(instance, item) {
                return (!instance.currentHash && !(item.type === "inline" || item.type === "html") ? item.origSrc || item.src : false) || window.location;
            },
            tpl: '<div class="fancybox-share">' + "<h1>{{SHARE}}</h1>" + "<p>" + '<a class="fancybox-share__button fancybox-share__button--fb" href="https://www.facebook.com/sharer/sharer.php?u={{url}}">' + '<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m287 456v-299c0-21 6-35 35-35h38v-63c-7-1-29-3-55-3-54 0-91 33-91 94v306m143-254h-205v72h196" /></svg>' + "<span>Facebook</span>" + "</a>" + '<a class="fancybox-share__button fancybox-share__button--tw" href="https://twitter.com/intent/tweet?url={{url}}&text={{descr}}">' + '<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m456 133c-14 7-31 11-47 13 17-10 30-27 37-46-15 10-34 16-52 20-61-62-157-7-141 75-68-3-129-35-169-85-22 37-11 86 26 109-13 0-26-4-37-9 0 39 28 72 65 80-12 3-25 4-37 2 10 33 41 57 77 57-42 30-77 38-122 34 170 111 378-32 359-208 16-11 30-25 41-42z" /></svg>' + "<span>Twitter</span>" + "</a>" + '<a class="fancybox-share__button fancybox-share__button--pt" href="https://www.pinterest.com/pin/create/button/?url={{url}}&description={{descr}}&media={{media}}">' + '<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m265 56c-109 0-164 78-164 144 0 39 15 74 47 87 5 2 10 0 12-5l4-19c2-6 1-8-3-13-9-11-15-25-15-45 0-58 43-110 113-110 62 0 96 38 96 88 0 67-30 122-73 122-24 0-42-19-36-44 6-29 20-60 20-81 0-19-10-35-31-35-25 0-44 26-44 60 0 21 7 36 7 36l-30 125c-8 37-1 83 0 87 0 3 4 4 5 2 2-3 32-39 42-75l16-64c8 16 31 29 56 29 74 0 124-67 124-157 0-69-58-132-146-132z" fill="#fff"/></svg>' + "<span>Pinterest</span>" + "</a>" + "</p>" + '<p><input class="fancybox-share__input" type="text" value="{{url_raw}}" onclick="select()" /></p>' + "</div>"
        }
    });
    function escapeHtml(string) {
        var entityMap = {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#39;",
            "/": "&#x2F;",
            "`": "&#x60;",
            "=": "&#x3D;"
        };
        return String(string).replace(/[&<>"'`=\/]/g, function(s) {
            return entityMap[s];
        });
    }
    $(document).on("click", "[data-fancybox-share]", function() {
        var instance = $.fancybox.getInstance(), current = instance.current || null, url, tpl;
        if (!current) {
            return;
        }
        if ($.type(current.opts.share.url) === "function") {
            url = current.opts.share.url.apply(current, [ instance, current ]);
        }
        tpl = current.opts.share.tpl.replace(/\{\{media\}\}/g, current.type === "image" ? encodeURIComponent(current.src) : "").replace(/\{\{url\}\}/g, encodeURIComponent(url)).replace(/\{\{url_raw\}\}/g, escapeHtml(url)).replace(/\{\{descr\}\}/g, instance.$caption ? encodeURIComponent(instance.$caption.text()) : "");
        $.fancybox.open({
            src: instance.translate(instance, tpl),
            type: "html",
            opts: {
                touch: false,
                animationEffect: false,
                afterLoad: function(shareInstance, shareCurrent) {
                    // Close self if parent instance is closing
                    instance.$refs.container.one("beforeClose.fb", function() {
                        shareInstance.close(null, 0);
                    });
                    // Opening links in a popup window
                                        shareCurrent.$content.find(".fancybox-share__button").click(function() {
                        window.open(this.href, "Share", "width=550, height=450");
                        return false;
                    });
                },
                mobile: {
                    autoFocus: false
                }
            }
        });
    });
})(document, jQuery);

// ==========================================================================
//
// Hash
// Enables linking to each modal
//
// ==========================================================================
// ==========================================================================
//
// Hash
// Enables linking to each modal
//
// ==========================================================================
(function(window, document, $) {
    "use strict";
    // Simple $.escapeSelector polyfill (for jQuery prior v3)
        if (!$.escapeSelector) {
        $.escapeSelector = function(sel) {
            var rcssescape = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\x80-\uFFFF\w-]/g;
            var fcssescape = function(ch, asCodePoint) {
                if (asCodePoint) {
                    // U+0000 NULL becomes U+FFFD REPLACEMENT CHARACTER
                    if (ch === "\0") {
                        return "�";
                    }
                    // Control characters and (dependent upon position) numbers get escaped as code points
                                        return ch.slice(0, -1) + "\\" + ch.charCodeAt(ch.length - 1).toString(16) + " ";
                }
                // Other potentially-special ASCII characters get backslash-escaped
                                return "\\" + ch;
            };
            return (sel + "").replace(rcssescape, fcssescape);
        };
    }
    // Get info about gallery name and current index from url
        function parseUrl() {
        var hash = window.location.hash.substr(1), rez = hash.split("-"), index = rez.length > 1 && /^\+?\d+$/.test(rez[rez.length - 1]) ? parseInt(rez.pop(-1), 10) || 1 : 1, gallery = rez.join("-");
        return {
            hash: hash,
            /* Index is starting from 1 */
            index: index < 1 ? 1 : index,
            gallery: gallery
        };
    }
    // Trigger click evnt on links to open new fancyBox instance
        function triggerFromUrl(url) {
        if (url.gallery !== "") {
            // If we can find element matching 'data-fancybox' atribute,
            // then triggering click event should start fancyBox
            $("[data-fancybox='" + $.escapeSelector(url.gallery) + "']").eq(url.index - 1).focus().trigger("click.fb-start");
        }
    }
    // Get gallery name from current instance
        function getGalleryID(instance) {
        var opts, ret;
        if (!instance) {
            return false;
        }
        opts = instance.current ? instance.current.opts : instance.opts;
        ret = opts.hash || (opts.$orig ? opts.$orig.data("fancybox") || opts.$orig.data("fancybox-trigger") : "");
        return ret === "" ? false : ret;
    }
    // Start when DOM becomes ready
        $(function() {
        // Check if user has disabled this module
        if ($.fancybox.defaults.hash === false) {
            return;
        }
        // Update hash when opening/closing fancyBox
                $(document).on({
            "onInit.fb": function(e, instance) {
                var url, gallery;
                if (instance.group[instance.currIndex].opts.hash === false) {
                    return;
                }
                url = parseUrl();
                gallery = getGalleryID(instance);
                // Make sure gallery start index matches index from hash
                                if (gallery && url.gallery && gallery == url.gallery) {
                    instance.currIndex = url.index - 1;
                }
            },
            "beforeShow.fb": function(e, instance, current, firstRun) {
                var gallery;
                if (!current || current.opts.hash === false) {
                    return;
                }
                // Check if need to update window hash
                                gallery = getGalleryID(instance);
                if (!gallery) {
                    return;
                }
                // Variable containing last hash value set by fancyBox
                // It will be used to determine if fancyBox needs to close after hash change is detected
                                instance.currentHash = gallery + (instance.group.length > 1 ? "-" + (current.index + 1) : "");
                // If current hash is the same (this instance most likely is opened by hashchange), then do nothing
                                if (window.location.hash === "#" + instance.currentHash) {
                    return;
                }
                if (firstRun && !instance.origHash) {
                    instance.origHash = window.location.hash;
                }
                if (instance.hashTimer) {
                    clearTimeout(instance.hashTimer);
                }
                // Update hash
                                instance.hashTimer = setTimeout(function() {
                    if ("replaceState" in window.history) {
                        window.history[firstRun ? "pushState" : "replaceState"]({}, document.title, window.location.pathname + window.location.search + "#" + instance.currentHash);
                        if (firstRun) {
                            instance.hasCreatedHistory = true;
                        }
                    } else {
                        window.location.hash = instance.currentHash;
                    }
                    instance.hashTimer = null;
                }, 300);
            },
            "beforeClose.fb": function(e, instance, current) {
                if (!current || current.opts.hash === false) {
                    return;
                }
                clearTimeout(instance.hashTimer);
                // Goto previous history entry
                                if (instance.currentHash && instance.hasCreatedHistory) {
                    window.history.back();
                } else if (instance.currentHash) {
                    if ("replaceState" in window.history) {
                        window.history.replaceState({}, document.title, window.location.pathname + window.location.search + (instance.origHash || ""));
                    } else {
                        window.location.hash = instance.origHash;
                    }
                }
                instance.currentHash = null;
            }
        });
        // Check if need to start/close after url has changed
                $(window).on("hashchange.fb", function() {
            var url = parseUrl(), fb = null;
            // Find last fancyBox instance that has "hash"
                        $.each($(".fancybox-container").get().reverse(), function(index, value) {
                var tmp = $(value).data("FancyBox");
                if (tmp && tmp.currentHash) {
                    fb = tmp;
                    return false;
                }
            });
            if (fb) {
                // Now, compare hash values
                if (fb.currentHash !== url.gallery + "-" + url.index && !(url.index === 1 && fb.currentHash == url.gallery)) {
                    fb.currentHash = null;
                    fb.close();
                }
            } else if (url.gallery !== "") {
                triggerFromUrl(url);
            }
        });
        // Check current hash and trigger click event on matching element to start fancyBox, if needed
                setTimeout(function() {
            if (!$.fancybox.getInstance()) {
                triggerFromUrl(parseUrl());
            }
        }, 50);
    });
})(window, document, jQuery);

// ==========================================================================
//
// Wheel
// Basic mouse weheel support for gallery navigation
//
// ==========================================================================
// ==========================================================================
//
// Wheel
// Basic mouse weheel support for gallery navigation
//
// ==========================================================================
(function(document, $) {
    "use strict";
    var prevTime = new Date().getTime();
    $(document).on({
        "onInit.fb": function(e, instance, current) {
            instance.$refs.stage.on("mousewheel DOMMouseScroll wheel MozMousePixelScroll", function(e) {
                var current = instance.current, currTime = new Date().getTime();
                if (instance.group.length < 2 || current.opts.wheel === false || current.opts.wheel === "auto" && current.type !== "image") {
                    return;
                }
                e.preventDefault();
                e.stopPropagation();
                if (current.$slide.hasClass("fancybox-animated")) {
                    return;
                }
                e = e.originalEvent || e;
                if (currTime - prevTime < 250) {
                    return;
                }
                prevTime = currTime;
                instance[(-e.deltaY || -e.deltaX || e.wheelDelta || -e.detail) < 0 ? "next" : "previous"]();
            });
        }
    });
})(document, jQuery);