PRO idl_plot_erf

 x=READ_CSV('HadGEM3-GC31-LL_1850-2099_piClim-histall_ERF.csv')
 yr_histall=x.field1
 dF1_histall=x.field2
 dF2_histall=x.field3
 dF3_histall=x.field4
 dFmean_histall=x.field5
 x=READ_CSV('HadGEM3-GC31-LL_1850-2099_piClim-histaer_ERF.csv')
 yr_histaer=x.field1
 dF1_histaer=x.field2
 dF2_histaer=x.field3
 dF3_histaer=x.field4
 dFmean_histaer=x.field5
 x=READ_CSV('HadGEM3-GC31-LL_1850-2099_piClim-histghg_ERF.csv')
 yr_histghg=x.field1
 dF1_histghg=x.field2
 dF2_histghg=x.field3
 dF3_histghg=x.field4
 dFmean_histghg=x.field5
 x=READ_CSV('HadGEM3-GC31-LL_1850-2099_piClim-histnat_ERF.csv')
 yr_histnat=x.field1
 dF1_histnat=x.field2
 dF2_histnat=x.field3
 dF3_histnat=x.field4
 dFmean_histnat=x.field5
 
 !P.FONT = 0
 !P.THICK = 5
 !X.THICK = 5
 !Y.THICK = 5
 !P.MULTI = [0,1,3]
 TEK_COLOR
 xrange=[1850,2100]
 yrange=[-2.5,6]
 PR,file='Figure_ERF.ps', /cps, /portrait
  PLOT,xrange,yrange,ystyle=9,xstyle=9,xtitle='Year',ytitle='Effective Radiative Forcing (Wm!E-2!N)',$
       title='',CHARSIZE=2.0,/NODATA
   OPLOT,xrange,[0,0],LINESTYLE=1,COL=0
   OPLOT,yr_histall,dF1_histall,THICK=2,COL=14
   OPLOT,yr_histall,dF2_histall,THICK=2,COL=14
   OPLOT,yr_histall,dF3_histall,THICK=2,COL=14
   OPLOT,yr_histall,dFmean_histall,THICK=5,COL=0
   OPLOT,yr_histghg,dF1_histghg,THICK=2,COL=8
   OPLOT,yr_histghg,dF2_histghg,THICK=2,COL=8
   OPLOT,yr_histghg,dF3_histghg,THICK=2,COL=8
   OPLOT,yr_histghg,dFmean_histghg,THICK=5,COL=2
   OPLOT,yr_histaer,dF1_histaer,THICK=2,COL=27
   OPLOT,yr_histaer,dF2_histaer,THICK=2,COL=27
   OPLOT,yr_histaer,dF3_histaer,THICK=2,COL=27
   OPLOT,yr_histaer,dFmean_histaer,THICK=5,COL=11
   OPLOT,yr_histnat,dF1_histnat,THICK=2,COL=25
   OPLOT,yr_histnat,dF2_histnat,THICK=2,COL=25
   OPLOT,yr_histnat,dF3_histnat,THICK=2,COL=25
   OPLOT,yr_histnat,dFmean_histnat,THICK=5,COL=9
   labels=['All forcings','WMGHGs','Aerosols','Natural']
   cols=[0,2,4,9]
   LEGEND3,labels,LINESTYLE=[0,0,0,0],COLORS=cols,CHARSIZE=1,box=0,SPACING=1.1,MARGIN=0.1,/TOP,/LEFT
   XYOUTS,1975,6.5,'HadGEM3-GC3.1-LL Historical & SSP2-4.5 ERF',ALIGNMENT=0.5
 PREND, /keep, /noprint
 SPAWN,'ps2pdf Figure_ERF.ps'
 SPAWN,'convert -trim -density 250 Figure_ERF.ps Figure_ERF.png'

END
