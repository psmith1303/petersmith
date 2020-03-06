+++
title = "Bookmarklets for all"
date = "2002-12-19T11:44:00+12:00"
categories = ["IT"]
slug = "bookmarklets-for-all"
draft = "False"
+++
This was a collection of bookmarklets. But in reality, I did not use
them.

_Site Data_
[Google Related](javascript:void(0);void(0);void(0);void(0);void("Add%20this%20text%20into%20the%20code%20to%20suppress%20the%20tooltip%20with%20long%20script');void(0);void(0);void(0);void(0);void(0);void(0);void(0);q=location.href;void(location.href="https://www.google.com/search?client=googlet&q=related:'+q))

[Whois](javascript:(function(){var%20h,p;%20h%20=%20location.host.split(".');%20p%20=%20h.length;%20if%20(h[p-1].match(/com\|net\|org\|edu\/i))%20{%20location%20=%20'https://www.netsol.com/cgi-bin/whois/whois?SearchType=do&STRING="%20+%20h[p-]%20+%20'."%20+%20h[p-];%20}%20else%20{%20alert('This%20bookmarklet%20can%20only%20look%20up%20owners%20for%20.com,%20.net,%20.org,%20and%20.edu%20domains.');%20}%20void(0);%20})();)

[Cookie](javascript:if(document.cookie.length\<1)%20alert("No%20cookie%20for%20this%20site.')}else{alert("Cookie%20for%20this%20site:'+document.cookie)})
[Echo Form](javascript:void(d=document);void(df="https://petersmith.org/cgi-bin/echoform.cgi');void(c=(d.all)?d.all.tags("form'):d.getElementsByTagName("form'));with©{for(i=0;i<length;i++)%20item(i).setAttribute('action',df);})  
_Validate Site_  
[W3C HTML Validator](javascript:void(document.location='https://validator.w3.org/check?uri='+document.location))  
[W3C CSS Validator](javascript:void(document.location='https://jigsaw.w3.org/css-validator/validator?uri='+document.location))  

_Selected Text_ 
 [Search Google](javascript:q=(document.frames.length?'':document.selection.createRange().text);for(i=0;i<document.frames.length;%20++){q=document.frames[i].document.selection.createRange().text;if(q!='')break;}if(q=='')void(q=prompt('Enter%20text%20to%20search%20using%20Google.%20You%20can%20also%20highlight%20a%20word%20on%20this%20web%20page%20before%20clicking%20Google%20Search.',''));if(q)location.href='https://www.google.com/search?client=googlet&q='+escape(q))  

[Define](javascript:if(top.document.frames.length==0){Term=document.selection.createRange().text}else{for(i=0;i<top.document.frames.length;i++){if(top.document.frames[i].document.selection.createRange().text!=''){Term=top.document.frames[i].document.selection.createRange().text}}};if(!Term){void(Term=prompt('Dictionary%20Lookup:',''))}if(Term)void(window.open('https://www.m-w.com/cgi-bin/dictionary?'+escape(Term))))  

[Thesarus](javascript:if(top.document.frames.length==0){Term=document.selection.createRange().text}else{for(i=0;i<top.document.frames.length;i++){if(top.document.frames[i].document.selection.createRange().text!=''){Term=top.document.frames[i].document.selection.createRange().text}}};if(!Term){void(Term=prompt('Find%20Synonyms%20For:',''))}if(Term)void(window.open('https://www.m-w.com/cgi-bin/thesaurus?book=Thesaurus&va='+escape(Term))))  

[Grab](javascript:(function(){javascript:var%20d,w,s,x,h="";%20if%20(window.getSelection)%20{%20s%20=%20window.getSelection();%20if%20(s.rangeCount%20&&%20!s.getRangeAt(0).collapsed)%20{x%20=%20document.createElement("div");%20x.appendChild(s.getRangeAt(0).cloneContents());%20h=x.innerHTML;%20}%20}%20else%20{%20h%20=%20document.selection.createRange().htmlText%20}%20if(h)%20{%20d=window.open().document;%20d.write(""+h+"");%20d.close();%20}})())  

_Manipulate Page_  
[Grayscale the page](javascript:document.body.style.filter='gray()';void(null))  
[Missing ALT Tags](javascript:di=document.images;str='';for(i=0;i<di.length;i++){if(di[i].getAttribute('ALT').length==0)str+=di[i].src.link(di[i].src)+'<br%20/>"}if(str.length==0){alert('All%20images%20have%20ALTs!')}else{W=open("','s',"width=600,height=300,resizable,scrollbars');with(W.document){write("<base%20target=im>These%20images%20are%20missing%20ALTs:<br%20/>'+str);close()}})
[Lose CSS](javascript:for(i=0;i<document.styleSheets.length;i++)document.styleSheets[i].cssText='';void(null))  

[Zoom +](javascript:void(s=document.body.style);void(z=s.getAttribute('zoom'));if(z){s.setAttribute('zoom',(parseInt(z)+50)+'%');}else%20s.setAttribute('zoom','150%');)  

[Zoom -](javascript:void(s=document.body.style);void(z=s.getAttribute('zoom'));if(z){s.setAttribute('zoom',(parseInt(z)-50)+'%');}else%20s.setAttribute('zoom','50%');)  
[Turn on Borders](javascript:void(d=document);void(cs='https://www.woodster.com/bookmarklets/tableborders.css');void(d.g=d.getElementsByTagName);void(l='link');void(H=d.g('head').item(0));void(c=(d.all)?c=d.all.tags(l):d.g(l));with(c)%20{for(i=0;i<length;i++){if(item(i).getAttribute('href')==cs)location.reload();}}void(L=d.createElement(l));void(L.s=L.setAttribute);void(L.s('rel','StyleSheet'));void(L.s('href',cs));void(H.appendChild(L));)  
[Page Weight](javascript:var%20fs=0;var%20f=1;var%20p='';for(i=0;i<document.images.length;i++){if(p.indexOf('('+document.images(i).src+')')<0)fs=fs+parseInt(document.images(i).fileSize);p=p+'('+document.images(i).src+')';};fs=fs+parseInt(document.fileSize);fs=fs+'';for(i=fs.length-1;i>0;i---){if(f/3==Math.ceil(f/3)){fs=fs.substring(0,%20i)+",'_fs.substring(i,fs.length);}f_+;}alert("This%20page%20weighs%20'_fs_"%20bytes.');)
[Show DIVs](javascript:void(d=document);void(el=d.getElementsByTagName("div'));for(i=0;i<el.length;i++){void(el[i].style.border='2px%20dashed%20red')};void(el=d.getElementsByTagName('span'));for(i=0;i<el.length;i++){void(el[i].style.border='2px%20solid%20green');})  
[Show CSS](javascript:var%20d,h,s;void(d=document);void(h=d.getElementsByTagName('head')[0]);void((s=d.createElement('script')).setAttribute('src','https://www.ashleyit.com/liorean/viewstyles.js'));void(h.appendChild(s));)  
[Show Scripts...](javascript:var%20s='https://members.evolt.org/liorean/bookmarklets/viewscripts.js',q='u0022',n=navigator,d=document,e,h,c,m;m=/mac/i.test(n.platform)&&/msie/i.test(n.userAgent);h=m?d.body:d.getElementsByTagName('head')[0];e=d.createElement(m?'div':'script');m?e.innerHTML='u003cscript%20type='+q+'text/javascript'+q+'%20src='+q+s+q+'u003eu003c/scriptu003e':e.setAttribute('src',s);void(h.appendChild(e));)  
[Page Freshness](javascript:if(frames.length<1){alert('The%20server%20indicates%20that%20the%20page%20was%20last%20modified:%20'%20+%20window.document.lastModified)}else{alert('Page%20is%20framed.%20Use%20version%20of%20bookmarklet%20for%20frames.%20(bookmarklets.com)')})  
[Analyze Images](javascript:n='';for(i=0;i<document.images.length;i++){n+='<img%20src='+document.images[i].src+'>%20'_document.images[i].src_"%20'_document.images[i].width_"%20x%20'_document.images[i].height_",%20'_document.images[i].fileSize_"%20Bytes</p>%0A<p>'};if(n!="'){document.write('</p>%0A<p%20style=font-size:11px;font-family:verdana,sans;>"_n_'</p>%0A<p>");void(document.close())}else{alert('i%20see%20no%20images')})
[Page Weight and Speed](javascript:void((function(){var%20element=document.createElement("script');element.setAttribute("src',"https://www.gazingus.org/js/pageWeight.js');document.body.appendChild(element)})()))
[Zap handlers](javascript:(function(){var%20H=["mouseover","mouseout","mousemove","submit","load","unload","resize","click"],%20Z=[],%20s="",%20j;%20function%20R(N,a){%20while%20(N[a])%20{%20Z[a]=Z[a]?Z[a]+1:1;%20N[a]=null;%20}%20}%20function%20zapEH(N)%20{%20var%20a,i,C;%20for%20(j%20in%20H)%20R(N,"on"_H[j]);%20C=N.childNodes;%20for%20(i=0;i\<C.length;i)%20zapEH(C[i]);%20}%20zapEH(document);%20for%20(j%20in%20Z)%20s%20_=%20j%20+%20"%20("%20+%20Z[j]%20+%20")n";%20if(s)%20alert("Zapped%20event%20handlers:nn"+s);%20else%20alert("No%20event%20handlers%20found.");})();)

_Misc_

[Resize](javascript:moveTo(screen.availWidth-800,0);window.resizeTo(800,screen.availHeight))

