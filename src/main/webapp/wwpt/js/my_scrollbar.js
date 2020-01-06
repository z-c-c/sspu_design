(function(win, dom) {
    function MyScrollBar(o) {
        this.init(o);
    }
    MyScrollBar.prototype.init = function(o) {
        this.bXBar = false;
        this.bYBar = false;
        this.iScrollTop = 0;
        this.iScrollLeft = 0;
        this.bYShow = false;
        this.bXShow = false;
        this.oWrapper = dom.getElementById(o.selId);
        this.oScroll = this.oWrapper.firstElementChild;
        this.setParam(o);
        this.addScrollBar();
        this.initState();
        this.initEvent();
    }
    MyScrollBar.prototype.initState = function() {
        var sWPosition = getStyle(this.oWrapper, 'position');
        if (sWPosition == 'static') {
            setStyle(this.oWrapper, {
                position: 'relative'
            })
        }
        setStyle(this.oScroll, {
            position: 'relative'
        })
        if (this.bYBar) {
            setStyle(this.oYBox, {
                display: this.enterShow ? 'none' : 'block',
                position: 'absolute',
                top: 0,
                right: 0,
                zIndex: 10,
                width: this.width + 'px',
                height: '100%',
                backgroundColor: this.bgColor
            });
            setStyle(this.oYBar, {
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                backgroundColor: this.barColor,
                borderRadius: this.borderRadius + 'px',
                transition: 'all ' + this.time + 'ms'
            })
        }
        if (this.bXBar) {
            setStyle(this.oXBox, {
                display: this.enterShow ? 'none' : 'block',
                position: 'absolute',
                bottom: '1px',
                left: 0,
                zIndex: 10,
                height: this.width + 'px',
                width: '100%',
                backgroundColor: this.bgColor
            })
            setStyle(this.oXBar, {
                position: 'absolute',
                bottom: '1px',
                left: 0,
                height: '100%',
                backgroundColor: this.barColor,
                borderRadius: this.borderRadius + 'px',
                transition: 'all ' + this.time + 'ms'
            })
        }
        this.setSize(100,true);
    }
    MyScrollBar.prototype.initEvent = function() {
        var _this = this;
        var sUserAgent = win.navigator.userAgent.toLowerCase();
        if (sUserAgent.indexOf('firefox') != -1) {
            this.oWrapper.addEventListener('DOMMouseScroll', function(e) {
                if (_this.bYBar && _this.bYShow) {
                    e.preventDefault();
                    _this.iScrollTop += e.detail > 0 ? 60 : -60;
                    _this.iScrollTop = _this.iScrollTop <= 0 ? 0 : _this.iScrollTop >= _this.iScrollH - _this.iWrapperH ? _this.iScrollH - _this.iWrapperH : _this.iScrollTop;
                    _this.setTransLate();
                    _this.setYTop(_this.iScrollTop / _this.iScrollH * _this.iYBoxH);
                }
            })
        } else {
            this.oWrapper.onmousewheel = function(evt) {
                if (_this.bYBar && _this.bYShow) {
                    var e = evt || win.event;
                    evt ? e.preventDefault() : e.returnValue = false;
                    _this.iScrollTop += e.wheelDelta < 0 ? 60 : -60;
                    _this.iScrollTop = _this.iScrollTop <= 0 ? 0 : _this.iScrollTop >= _this.iScrollH - _this.iWrapperH ? _this.iScrollH - _this.iWrapperH : _this.iScrollTop;
                    _this.setTransLate();
                    _this.setYTop(_this.iScrollTop / _this.iScrollH * _this.iYBoxH);
                }
            }
        }
        var isInWrapper = false;
        this.oWrapper.onmouseenter = function() {
            isInWrapper = true;
            if (_this.enterShow) {
                if (_this.bYBar && _this.bYShow) {
                    setStyle(_this.oYBox, {
                        display: 'block'
                    })
                }
                if (_this.bXBar && _this.bXShow) {
                    setStyle(_this.oXBox, {
                        display: 'block'
                    })
                }
            }
        }
        this.oWrapper.onmouseleave = function() {
            isInWrapper = false;
            if (_this.enterShow) {
                if (_this.bYBar && !bYDown && _this.bYShow) {
                    setStyle(_this.oYBox, {
                        display: 'none'
                    })
                }
                if (_this.bXBar && !bXDown && _this.bXShow) {
                    setStyle(_this.oXBox, {
                        display: 'none'
                    })
                }
            }
        }
        var bYDown = false
          , bXDown = false;
        var bYLeave = true
          , bXLeave = true;
        var iDownPageY = 0
          , iDownPageX = 0;
        var iYBarTop = 0
          , iXBarLeft = 0;
        if (this.bYBar) {
            if (this.enterColor) {
                this.oYBar.onmouseenter = function() {
                    bYLeave = false;
                    setStyle(this, {
                        backgroundColor: _this.enterColor
                    })
                }
                this.oYBar.onmouseleave = function() {
                    bYLeave = true;
                    if (!bYDown) {
                        setStyle(this, {
                            backgroundColor: _this.barColor
                        })
                    }
                }
            }
            this.oYBar.onmousedown = function(e) {
                if (_this.bYShow) {
                    bYDown = true;
                    iDownPageY = e.clientY + dom.documentElement.scrollTop || dom.body.scrollTop;
                    iYBarTop = parseInt(getStyle(this, 'top'));
                    _this.setYTime(0);
                    canSelectText(false);
                }
            }
            dom.addEventListener('mouseup', function() {
                if (bYDown && _this.bYShow) {
                    bYDown = false;
                    _this.setYTime(_this.time);
                    canSelectText(true);
                    if (!isInWrapper && _this.enterShow) {
                        setStyle(_this.oYBox, {
                            display: 'none'
                        })
                    }
                }
                if (!bYDown && bYLeave) {
                    setStyle(_this.oYBar, {
                        backgroundColor: _this.barColor
                    })
                }
            })
            dom.addEventListener('mousemove', function(e) {
                if (bYDown && _this.bYShow) {
                    var iNowPageY = e.clientY + dom.documentElement.scrollTop || dom.body.scrollTop;
                    var iNowTop = iYBarTop + iNowPageY - iDownPageY;
                    iNowTop = iNowTop <= 0 ? 0 : iNowTop >= _this.iYBoxH - _this.iYBarH ? _this.iYBoxH - _this.iYBarH : iNowTop;
                    _this.iScrollTop = iNowTop / _this.iYBoxH * _this.iScrollH;
                    _this.setTransLate();
                    _this.setYTop(iNowTop);
                }
            })
            this.oYBar.ondrag = function(e) {
                var e = evt || win.event;
                evt ? e.preventDefault() : e.returnValue = false;
            }
        }
        if (this.bXBar) {
            if (this.enterColor) {
                this.oXBar.onmouseenter = function() {
                    bXLeave = false;
                    setStyle(this, {
                        backgroundColor: _this.enterColor
                    })
                }
                this.oXBar.onmouseleave = function() {
                    bXLeave = true;
                    if (!bXDown) {
                        setStyle(this, {
                            backgroundColor: _this.barColor
                        })
                    }
                }
            }
            this.oXBar.onmousedown = function(e) {
                if (_this.bXShow) {
                    bXDown = true;
                    iDownPageX = e.clientX + dom.documentElement.scrollLeft || dom.body.scrollLeft;
                    iXBarLeft = parseInt(getStyle(this, 'left'));
                    _this.setXTime(0);
                    canSelectText(false);
                }
            }
            dom.addEventListener('mouseup', function() {
                if (bXDown && _this.bXShow) {
                    bXDown = false;
                    _this.setXTime(_this.time);
                    canSelectText(true);
                    if (!isInWrapper && _this.enterShow) {
                        setStyle(_this.oXBox, {
                            display: 'none'
                        })
                    }
                }
                if (!bXDown && bXLeave) {
                    setStyle(_this.oXBar, {
                        backgroundColor: _this.barColor
                    })
                }
            })
            dom.addEventListener('mousemove', function(e) {
                if (bXDown && _this.bXShow) {
                    var iNowPageX = e.clientX + dom.documentElement.scrollLeft || dom.body.scrollLeft;
                    var iNowLeft = iXBarLeft + iNowPageX - iDownPageX;
                    iNowLeft = iNowLeft <= 0 ? 0 : iNowLeft >= _this.iXBoxW - _this.iXBarW ? _this.iXBoxW - _this.iXBarW : iNowLeft;
                    _this.iScrollLeft = iNowLeft / _this.iXBoxW * _this.iScrollW;
                    _this.setTransLate();
                    _this.setXLeft(iNowLeft);
                }
            })
            this.oXBar.ondrag = function(e) {
                var e = evt || win.event;
                evt ? e.preventDefault() : e.returnValue = false;
            }
        }
    }
    MyScrollBar.prototype.setParam = function(o) {
        this.width = o.width ? o.width : 10;
        this.bgColor = o.bgColor ? o.bgColor : '#eaeaea';
        this.barColor = o.barColor ? o.barColor : '#ccc';
        this.enterColor = o.enterColor || false;
        this.enterShow = o.enterShow === false ? false : true;
        this.hasY = o.hasY === false ? false : true;
        this.hasX = o.hasX === true ? true : false;
        this.borderRadius = o.borderRadius >= 0 ? o.borderRadius : this.width / 2;
        this.time = o.time || 0;
    }
    MyScrollBar.prototype.addScrollBar = function() {
        this.getSize();
        if (this.hasX) {
            this.bXBar = true;
            this.oXBox = dom.createElement('div');
            this.oXBar = dom.createElement('div');
            this.oXBox.appendChild(this.oXBar);
            this.oWrapper.insertBefore(this.oXBox, this.oScroll);
        }
        if (this.hasY) {
            this.bYBar = true;
            this.oYBox = dom.createElement('div');
            this.oYBar = dom.createElement('div');
            this.oYBox.appendChild(this.oYBar);
            this.oWrapper.insertBefore(this.oYBox, this.oScroll);
        }
    }
    MyScrollBar.prototype.getSize = function() {
        var oWrapperSize = getClientSize(this.oWrapper);
        var oScrollSize = getClientSize(this.oScroll);
        this.iWrapperClientW = oWrapperSize.width;
        this.iWrapperClientH = oWrapperSize.height;
        this.iPaddingT = parseInt(getStyle(this.oWrapper, 'paddingTop'));
        this.iPaddingR = parseInt(getStyle(this.oWrapper, 'paddingRight'));
        this.iPaddingB = parseInt(getStyle(this.oWrapper, 'paddingBottom'));
        this.iPaddingL = parseInt(getStyle(this.oWrapper, 'paddingLeft'));
        this.iWrapperW = oWrapperSize.width - this.iPaddingR - this.iPaddingL;
        this.iWrapperH = oWrapperSize.height - this.iPaddingT - this.iPaddingB;
        this.iScrollW = oScrollSize.width;
        this.iScrollH = oScrollSize.height;
        if (this.bYBar) {
            this.iYBoxH = oWrapperSize.height;
            this.iYBarH = this.iWrapperH / this.iScrollH * this.iYBoxH;
        }
        if (this.bXBar) {
            this.iXBoxW = oWrapperSize.width;
            this.iXBarW = this.iWrapperW / this.iScrollW * this.iXBoxW;
        }
    }
    MyScrollBar.prototype.setSize = function(time,flag) {
        var _this = this;
        time = time || 100;
        setTimeout(function() {
            _this.getSize();
            if (_this.iScrollTop >= _this.iScrollH - _this.iWrapperH) {
                _this.iScrollTop = _this.iScrollH - _this.iWrapperH;
            }
            if (_this.iScrollW >= _this.iScrollW - _this.iWrapperW) {
                _this.iScrollLeft = _this.iScrollW - _this.iWrapperW;
            }
            if(flag){
                _this.iScrollLeft = 0; 
            }
            _this.setTransLate();
            if (_this.bYBar) {
                if (_this.iWrapperH >= _this.iScrollH) {
                    setStyle(_this.oYBox, {
                        display: 'none'
                    })
                    _this.bYShow = false;
                } else {
                    if (!_this.enterShow) {
                        setStyle(_this.oYBox, {
                            display: 'block'
                        })
                    }
                    setStyle(_this.oYBar, {
                        height: _this.iYBarH + 'px',
                        top: _this.iScrollTop / _this.iScrollH * _this.iYBoxH + 'px'
                    }, 0)
                    _this.bYShow = true;
                }
            }
            if (_this.bXBar) {
                if (_this.iWrapperW >= _this.iScrollW) {
                    setStyle(_this.oXBox, {
                        display: 'none'
                    })
                    _this.bXShow = false;
                } else {
                    if (!_this.enterShow) {
                        setStyle(_this.oXBox, {
                            display: 'block'
                        })
                    }
                    setStyle(_this.oXBar, {
                        width: _this.iXBarW + 'px',
                        left: _this.iScrollLeft / _this.iScrollW * _this.iYBoxW + 'px'
                    }, 0)
                    _this.bXShow = true;
                }
            }
        }, time);
    }
    MyScrollBar.prototype.setTransLate = function(iTime) {
        var sTranslate = 'translate(-' + this.iScrollLeft + 'px, -' + this.iScrollTop + 'px)';
        setStyle(this.oScroll, {
            transition: 'all ' + (iTime >= 0 ? iTime : this.time) + 'ms',
            transform: sTranslate,
            msTransform: sTranslate,
            mozTransform: sTranslate,
            webkitTransform: sTranslate,
            oTransform: sTranslate
        })
    }
    MyScrollBar.prototype.setYTime = function(iTime) {
        setStyle(this.oYBar, {
            transition: 'all ' + (iTime >= 0 ? iTime : this.time) + 'ms'
        })
    }
    MyScrollBar.prototype.setYTop = function(iTop) {
        setStyle(this.oYBar, {
            top: iTop + 'px'
        })
    }
    MyScrollBar.prototype.setXTime = function(iTime) {
        setStyle(this.oXBar, {
            transition: 'all ' + (iTime >= 0 ? iTime : this.time) + 'ms'
        })
    }
    MyScrollBar.prototype.setXLeft = function(iLeft, iTime) {
        setStyle(this.oXBar, {
            transition: 'all ' + (iTime >= 0 ? iTime : this.time) + 'ms',
            left: iLeft + 'px'
        })
    }
    MyScrollBar.prototype.jump = function(o) {
        o = o || {};
        var oPos = {
            top: 0,
            left: 0
        };
        var iTop = 0;
        var iBottome = this.iScrollH - this.iWrapperClientH + this.iPaddingT + this.iPaddingB > 0 ? this.iScrollH - this.iWrapperClientH + this.iPaddingT + this.iPaddingB : 0;
        var iLeft = 0;
        var iRight = this.iScrollW - this.iWrapperClientW + this.iPaddingL + this.iPaddingR > 0 ? this.iScrollW - this.iWrapperClientW + this.iPaddingL + this.iPaddingR : 0;
        if (o.id) {
            var obj = document.getElementById(o.id);
            oPos = getPosition(obj, this.oScrolll);
            if (this.bYBar) {
                oPos.top += this.iPaddingT;
            }
            if (this.bXBar) {
                oPos.left += this.iPaddingL;
            }
        } else if (o.pos) {
            if (typeof o.pos == 'string') {
                switch (o.pos) {
                case 'top':
                    oPos.top = iTop;
                    break;
                case 'bottom':
                    oPos.top = iBottome;
                    break;
                case 'left':
                    oPos.left = iLeft;
                    break;
                case 'right':
                    oPos.left = iRight;
                    break;
                default:
                    break;
                }
            } else if (typeof o.pos == 'object') {
                oPos = o.pos;
            }
        }
        oPos.top = oPos.top > iBottome ? iBottome : oPos.top >= 0 ? oPos.top : 0;
        oPos.left = oPos.left > iRight ? iRight : oPos.left >= 0 ? oPos.left : 0;
        this.iScrollTop = oPos.top;
        this.iScrollLeft = oPos.left;
        this.setTransLate(o.time);
        if (this.bYBar) {
            this.setYTime(o.time);
            this.setYTop(this.iScrollTop / this.iScrollH * this.iYBoxH);
        }
        if (this.bXBar) {
            this.setXTime(o.time);
            this.setXLeft(this.iScrollLeft / this.iScrollW * this.iXBoxW, o.time);
        }
    }
    function getStyle(obj, name) {
        if (win.getComputedStyle) {
            return getComputedStyle(obj, null)[name];
        } else {
            return obj.currentStyle[name];
        }
    }
    function setStyle(obj, oStyle) {
        for (var i in oStyle) {
            obj.style[i] = oStyle[i];
        }
    }
    function getOffsetSize(obj) {
        var sDisplay = getStyle(obj, "display");
        var res = {}
        if (sDisplay != "none") {
            res.width = obj.offsetWidth;
            res.height = obj.offsetHeight;
        } else {
            var oldStyle = {
                position: getStyle(obj, "position"),
                visibility: getStyle(obj, "visibility"),
                display: sDisplay
            }
            var newStyle = {
                position: "absolute",
                visibility: "hidden",
                display: "inline-block"
            }
            setStyle(obj, newStyle);
            res.width = obj.offsetWidth;
            res.height = obj.offsetHeight;
            setStyle(obj, oldStyle);
        }
        return res;
    }
    function getClientSize(obj) {
        var iTopW = parseInt(getStyle(obj, 'borderTopWidth'));
        var iRightW = parseInt(getStyle(obj, 'borderRightWidth'));
        var iBottomW = parseInt(getStyle(obj, 'borderBottomWidth'));
        var iLeftW = parseInt(getStyle(obj, 'borderLeftWidth'));
        var oOffset = getOffsetSize(obj);
        return {
            width: oOffset.width <= 0 ? oOffset.width : oOffset.width - iLeftW - iRightW,
            height: oOffset.height <= 0 ? oOffset.height : oOffset.height - iTopW - iBottomW
        }
    }
    function canSelectText(bCan) {
        if (!bCan) {
            dom.body.style.mozUserSelect = 'none';
            dom.body.style.webkitUserSelect = 'none';
            dom.body.style.msUserSelect = 'none';
            dom.body.style.khtmlUserSelect = 'none';
            dom.body.style.userSelect = 'none';
        } else {
            dom.body.style.mozUserSelect = 'text';
            dom.body.style.webkitUserSelect = 'text';
            dom.body.style.msUserSelect = 'text';
            dom.body.style.khtmlUserSelect = 'text';
            dom.body.style.userSelect = 'text';
        }
    }
    function getPosition(obj, goal) {
        var oPos = {
            top: obj.offsetTop,
            left: obj.offsetLeft
        }
        return oPos;
        if (obj.parentNode != goal) {
            var obj = getPosition(obj.parentNode, goal);
            oPos.top += obj.top;
            oPos.left += obj.left;
        } else {
            return oPos;
        }
    }
    if (typeof define === "function" && define.amd) {
        define([], function() {
            return MyScrollBar;
        });
    }
    win.MyScrollBar = MyScrollBar;
}
)(window, document);
