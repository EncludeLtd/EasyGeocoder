(function(e){function t(t){for(var r,o,s=t[0],u=t[1],c=t[2],l=0,p=[];l<s.length;l++)o=s[l],Object.prototype.hasOwnProperty.call(a,o)&&a[o]&&p.push(a[o][0]),a[o]=0;for(r in u)Object.prototype.hasOwnProperty.call(u,r)&&(e[r]=u[r]);f&&f(t);while(p.length)p.shift()();return i.push.apply(i,c||[]),n()}function n(){for(var e,t=0;t<i.length;t++){for(var n=i[t],r=!0,o=1;o<n.length;o++){var u=n[o];0!==a[u]&&(r=!1)}r&&(i.splice(t--,1),e=s(s.s=n[0]))}return e}var r={},a={app:0},i=[];function o(e){return s.p+"js/"+({about:"about"}[e]||e)+"."+{about:"41491049"}[e]+".js"}function s(t){if(r[t])return r[t].exports;var n=r[t]={i:t,l:!1,exports:{}};return e[t].call(n.exports,n,n.exports,s),n.l=!0,n.exports}s.e=function(e){var t=[],n=a[e];if(0!==n)if(n)t.push(n[2]);else{var r=new Promise((function(t,r){n=a[e]=[t,r]}));t.push(n[2]=r);var i,u=document.createElement("script");u.charset="utf-8",u.timeout=120,s.nc&&u.setAttribute("nonce",s.nc),u.src=o(e);var c=new Error;i=function(t){u.onerror=u.onload=null,clearTimeout(l);var n=a[e];if(0!==n){if(n){var r=t&&("load"===t.type?"missing":t.type),i=t&&t.target&&t.target.src;c.message="Loading chunk "+e+" failed.\n("+r+": "+i+")",c.name="ChunkLoadError",c.type=r,c.request=i,n[1](c)}a[e]=void 0}};var l=setTimeout((function(){i({type:"timeout",target:u})}),12e4);u.onerror=u.onload=i,document.head.appendChild(u)}return Promise.all(t)},s.m=e,s.c=r,s.d=function(e,t,n){s.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},s.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},s.t=function(e,t){if(1&t&&(e=s(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(s.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)s.d(n,r,function(t){return e[t]}.bind(null,r));return n},s.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return s.d(t,"a",t),t},s.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},s.p="/EasyGeocoder/",s.oe=function(e){throw console.error(e),e};var u=window["webpackJsonp"]=window["webpackJsonp"]||[],c=u.push.bind(u);u.push=t,u=u.slice();for(var l=0;l<u.length;l++)t(u[l]);var f=c;i.push([0,"chunk-vendors"]),n()})({0:function(e,t,n){e.exports=n("56d7")},"56d7":function(e,t,n){"use strict";n.r(t);n("e260"),n("e6cf"),n("cca6"),n("a79d");var r=n("2b0e"),a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-app",[n("v-navigation-drawer",{staticClass:"neutral-1",attrs:{permanent:"",app:"",width:"420"}},[n("v-list-item",{staticClass:"primary"},[n("v-list-item-content",[n("v-list-item-title",{staticClass:"title white--text"},[e._v(" EasyGeocoder ")]),n("v-list-item-subtitle",{staticClass:"white--text font-weight-light"},[e._v(" Documentation ")])],1)],1),n("v-divider"),n("SearchBar"),n("MetadataTree")],1),n("v-content",{staticClass:"ma-3 neutral-1"},[n("router-view")],1)],1)},i=[],o=(n("d3b7"),n("96cf"),n("1da1")),s=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-autocomplete",{staticClass:"pa-1",staticStyle:{"margin-bottom":"-25px"},attrs:{flat:"",light:"",solo:"",items:e.items,label:"Search","auto-select-first":"","prepend-inner-icon":"mdi-magnify"},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})},u=[],c={data:function(){return{items:["foo","bar","fizz","buzz"],values:["foo","bar"],value:null}}},l=c,f=n("2877"),p=n("6544"),m=n.n(p),d=n("c6a6"),v=Object(f["a"])(l,s,u,!1,null,null,null),h=v.exports;m()(v,{VAutocomplete:d["a"]});var b=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-treeview",{staticClass:"black--text",attrs:{dense:"",hoverable:"",open:e.initiallyOpen,items:e.items,activatable:"","item-key":"name","open-on-click":""},scopedSlots:e._u([{key:"prepend",fn:function(t){var r=t.item,a=t.open;return[r.file?n("v-icon",[e._v(" "+e._s(e.files[r.file])+" ")]):n("v-icon",[e._v(" "+e._s(a?"mdi-folder-open":"mdi-folder")+" ")])]}},{key:"label",fn:function(t){var r=t.item;return[n("div",{on:{click:function(t){return e.fileSelect(r)}}},[e._v(e._s(r.name))])]}}])})},g=[],y=n("2f62");r["a"].use(y["a"]);var w=new y["a"].Store({state:{dev:!1,repo:null,selectedFile:null},mutations:{},actions:{},modules:{}}),x={computed:{items:function(){return this.$store.state.repo?this.$store.state.repo.items:null}},store:w,data:function(){return{initiallyOpen:[""],files:{html:"mdi-language-html5",js:"mdi-nodejs",json:"mdi-code-json",md:"mdi-language-markdown",pdf:"mdi-file-pdf",png:"mdi-file-image",txt:"mdi-file-document-outline",xls:"mdi-file-excel",xml:"mdi-file-document-outline"}}},methods:{fileSelect:function(e){e.path&&(w.state.selectedFile=e.path,console.log(w.state.selectedFile))}}},j=x,O=n("132d"),_=n("eb2a"),k=Object(f["a"])(j,b,g,!1,null,null,null),C=k.exports;m()(k,{VIcon:O["a"],VTreeview:_["a"]});n("99af"),n("4de4"),n("7db0"),n("4160"),n("a15b"),n("fb6a"),n("b0c0"),n("ac1f"),n("8a79"),n("1276"),n("159b");var V=n("d4ec"),E=n("bee2"),L=n("ade3"),R=function(){function e(t,n){var r=this;Object(V["a"])(this,e),Object(L["a"])(this,"items",[]),this.config=t,this.tree=n;var a=n.filter((function(e){return e.path.endsWith(".xml")}));a.forEach((function(e){return r.createItems(r.items,e,e.path)}))}return Object(E["a"])(e,[{key:"createItems",value:function(e,t,n){var r=t.path.split("/"),a=r.shift(),i=e.find((function(e){return e.name===a})),o={};if(i)return t.path=r.join("/"),void this.createItems(i.children,t,n);if(r||r.length)o.name=a,o.children=[],e.push(o);else{var s=a.split(".");o.name=s.shift(),o.file=s.slice(-1).pop(),o.path=n,e.push(o)}}},{key:"metadataURL",get:function(){console.log("STORE:"),console.log(w);var e=w.state.dev?"https://github.com/EncludeLtd/EasyGeocoder":"";return"".concat(e,"/tree/main/force-app/main/default/")}}],[{key:"fromConfig",value:function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(n){var r,a,i,o,s,u;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return r="https://api.github.com/repos/".concat(n.username,"/").concat(n.repo,"/git/trees/").concat(n.branch,"?recursive=1"),t.next=3,fetch(r);case 3:return a=t.sent,t.next=6,a.json();case 6:return i=t.sent,o=i.tree.find((function(e){return"force-app/main/default"===e.path})).url,t.next=10,fetch(o+"?recursive=1");case 10:return s=t.sent,t.next=13,s.json();case 13:return u=t.sent,t.abrupt("return",new e(n,u.tree));case 15:case"end":return t.stop()}}),t)})));function n(e){return t.apply(this,arguments)}return n}()}]),e}(),S={name:"App",gitRepo:null,components:{SearchBar:h,MetadataTree:C},store:w,created:function(){return Object(o["a"])(regeneratorRuntime.mark((function e(){var t,n;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:if(w.state.dev){e.next=12;break}return e.next=3,fetch("config.json");case 3:return t=e.sent,e.next=6,t.json();case 6:return n=e.sent,e.next=9,R.fromConfig(n);case 9:w.state.repo=e.sent,e.next=15;break;case 12:return e.next=14,R.fromConfig({username:"EncludeLtd",repo:"EasyGeocoder",branch:"main"});case 14:w.state.repo=e.sent;case 15:case"end":return e.stop()}}),e)})))()}},T=S,A=n("7496"),I=n("a75b"),F=n("ce7e"),P=n("da13"),B=n("5d23"),$=n("f774"),D=Object(f["a"])(T,a,i,!1,null,null,null),M=D.exports;m()(D,{VApp:A["a"],VContent:I["a"],VDivider:F["a"],VListItem:P["a"],VListItemContent:B["a"],VListItemSubtitle:B["b"],VListItemTitle:B["c"],VNavigationDrawer:$["a"]});var G=n("8c4f"),q=function(){var e=this,t=e.$createElement,n=e._self._c||t;return e.$store.state.selectedFile?n("v-card",{staticClass:"mx-auto",attrs:{height:"100%",outlined:""}},[n("v-list-item",{attrs:{"three-line":""}},[n("v-list-item-content",[n("div",{staticClass:"overline mb-4"},[e._v(" OVERLINE ")]),n("v-list-item-title",{staticClass:"headline mb-1"},[e._v(" Headline 5 ")]),n("v-list-item-subtitle",[e._v(" Greyhound divisely hello coldly fonwderfully ")])],1)],1),n("v-card-actions",[n("v-btn",{attrs:{outlined:"",rounded:"",text:""}},[e._v(" Button ")])],1)],1):e._e()},z=[],H=function(){function e(t){Object(V["a"])(this,e),console.log(t)}return Object(E["a"])(e,null,[{key:"fromURL",value:function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(n){var r;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,e.makeRequest("GET",n);case 2:return r=t.sent,console.log(r),t.abrupt("return",new e({test:"response"}));case 5:case"end":return t.stop()}}),t)})));function n(e){return t.apply(this,arguments)}return n}()},{key:"makeRequest",value:function(e,t){return new Promise((function(n,r){var a=new XMLHttpRequest;a.open(e,t),a.onload=function(){this.status>=200&&this.status<300?n(a.response):r({status:this.status,statusText:a.statusText})},a.onerror=function(){r({status:this.status,statusText:a.statusText})},a.send()}))}}]),e}(),U={name:"Home",components:{},store:w,watch:{"$store.state.selectedFile":function(){var e=Object(o["a"])(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,H.fromURL(w.state.repo.metadataURL+w.state.selectedFile);case 2:case"end":return e.stop()}}),e)})));function t(){return e.apply(this,arguments)}return t}()}},J=U,N=n("8336"),W=n("b0af"),X=n("99d9"),K=Object(f["a"])(J,q,z,!1,null,null,null),Q=K.exports;m()(K,{VBtn:N["a"],VCard:W["a"],VCardActions:X["a"],VListItem:P["a"],VListItemContent:B["a"],VListItemSubtitle:B["b"],VListItemTitle:B["c"]}),r["a"].use(G["a"]);var Y=[{path:"/",name:"Home",component:Q},{path:"/about",name:"About",component:function(){return n.e("about").then(n.bind(null,"f820"))}}],Z=new G["a"]({routes:Y}),ee=Z,te=n("f309");r["a"].use(te["a"]);var ne={theme:{themes:{light:{primary:"#235287",secondary:"#A72B73",accent:"#DB4DA0",error:"#f44336",warning:"#ffeb3b",info:"#03a9f4",success:"#4caf50",white:"#fff","neutral-1":"#F4F4F5","neutral-2":"#D4D4D8","neutral-3":"#9F9FA8","neutral-4":"#6B6B76","neutral-5":"#3A3A40",black:"#0A0A0B"}}}},re=new te["a"](ne);r["a"].config.productionTip=!1,new r["a"]({router:ee,store:w,vuetify:re,render:function(e){return e(M)}}).$mount("#app")}});
//# sourceMappingURL=app.76f2ad2b.js.map