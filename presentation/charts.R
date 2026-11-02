# Reproducible, inline SVG evidence charts from the supplied observations.
chart <- function(kind="fit") {
 x<-d$advertising; y<-if(kind=="residual") residuals(model) else d$sales
 yr<-if(kind=="residual") c(-40,40) else c(140,370)
 X<-function(v) 90+(v-5)/45*660
 Y<-function(v) 365-(v-yr[1])/diff(yr)*315
 cat('<svg class="data-chart" viewBox="0 0 800 445" role="img" aria-label="',if(kind=="residual") 'Residuals versus advertising' else 'Sales versus advertising with fitted line','">',sep='')
 for(v in if(kind=="residual") seq(-40,40,20) else seq(150,350,50)) cat(sprintf('<line x1="90" x2="750" y1="%1$f" y2="%1$f" class="grid"/><text x="74" y="%2$f" text-anchor="end">%3$s</text>',Y(v),Y(v)+7,v))
 for(v in seq(10,50,10)) cat(sprintf('<text x="%f" y="398" text-anchor="middle">%s</text>',X(v),v))
 cat('<text x="420" y="436" text-anchor="middle">Advertising ($1,000)</text><text transform="translate(24,210) rotate(-90)" text-anchor="middle">',if(kind=="residual") 'Residual ($1,000)' else 'Monthly sales ($1,000)','</text>',sep='')
 if(kind=="residual") cat(sprintf('<line x1="90" x2="750" y1="%1$f" y2="%1$f" class="zero"/>',Y(0)))
 for(i in seq_along(x)) cat(sprintf('<circle cx="%.2f" cy="%.2f" r="6.4" class="observation"><title>Month %s: advertising %s, sales or residual %.2f (thousands of dollars)</title></circle>',X(x[i]),Y(y[i]),d$month[i],x[i],y[i]))
 if(kind!="residual") cat(sprintf('<g class="fragment" data-fragment-index="0"><path d="M %.2f %.2f L %.2f %.2f" class="fit-line" pathLength="1"/></g>',X(min(x)),Y(predict(model,data.frame(advertising=min(x)))),X(max(x)),Y(predict(model,data.frame(advertising=max(x))))))
 if(kind=="prediction") {
 p<-predict(model,data.frame(advertising=20),interval="prediction")
 cat(sprintf('<g class="fragment" data-fragment-index="1"><line x1="%1$f" x2="%1$f" y1="%2$f" y2="%3$f" class="prediction-range"/><line x1="%4$f" x2="%5$f" y1="%2$f" y2="%2$f" class="cap"/><line x1="%4$f" x2="%5$f" y1="%3$f" y2="%3$f" class="cap"/><circle cx="%1$f" cy="%6$f" r="9" class="prediction-point"/></g>',X(20),Y(p[2]),Y(p[3]),X(20)-12,X(20)+12,Y(p[1])))
 }
 cat('</svg>')
}
