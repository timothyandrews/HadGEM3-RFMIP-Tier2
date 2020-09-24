PRO idl_calculate_erf_timeseries

 ; Calculate global time-mean piClim-control N, to be subtracted
 ; from perturnation runs in dermining the ERF.
 rlut=PPA(NCASSOC('/project/champ/data/CMIP6/RFMIP/MOHC/HadGEM3-GC31-LL/piClim-control/r1i1p1f3/Amon/rlut/gn/v20191113/rlut_Amon_HadGEM3-GC31-LL_piClim-control_r1i1p1f3_gn_185001-187912.nc',/IGNORE),/ALL)
 rsut=PPA(NCASSOC('/project/champ/data/CMIP6/RFMIP/MOHC/HadGEM3-GC31-LL/piClim-control/r1i1p1f3/Amon/rsut/gn/v20191113/rsut_Amon_HadGEM3-GC31-LL_piClim-control_r1i1p1f3_gn_185001-187912.nc',/IGNORE),/ALL)
 rsdt=PPA(NCASSOC('/project/champ/data/CMIP6/RFMIP/MOHC/HadGEM3-GC31-LL/piClim-control/r1i1p1f3/Amon/rsdt/gn/v20191113/rsdt_Amon_HadGEM3-GC31-LL_piClim-control_r1i1p1f3_gn_185001-187912.nc',/IGNORE),/ALL)
 N=PP_FF('a-b-c',rsdt,rsut,rlut)
 Ncontrol=PP_AREA_AVG(PP_AVG(N),/BOX)

 ; Loop of piClim-hist... runs and read in 1850-2099 timeseres data
 yr=INDGEN(250)+1850
 expnames=['piClim-histall','piClim-histghg','piClim-histnat','piClim-histaer']
 FOR iexp=0,N_ELEMENTS(expnames)-1 DO BEGIN
  exp=expnames[iexp]
  ; 1st ensemble member (r1i1p1f3)
  dir='/net/home/h04/hadta/cdds/'+exp+'/data/output/ap5/Amon/'
  var='rlut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rlut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsdt'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsdt=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  N=PP_FF('a-b-c',rsdt,rsut,rlut)
  N=IDL_CREATE_ANNUAL_MEAN(N,1850,2099)
  N=PP_AREA_AVG(N,/BOX)
  dF=N-Ncontrol
  dF1=dF
  ; 2nd ensemble member (r2i1p1f3)
  dir='/net/home/h04/hadta/cdds/'+exp+'_r2/data/output/ap5/Amon/'
  var='rlut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rlut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsdt'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsdt=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  N=PP_FF('a-b-c',rsdt,rsut,rlut)
  N=IDL_CREATE_ANNUAL_MEAN(N,1850,2099)
  N=PP_AREA_AVG(N,/BOX)
  dF=N-Ncontrol
  dF2=dF
  ; 3rd ensemble member (r3i1p1f3)
  dir='/net/home/h04/hadta/cdds/'+exp+'_r3/data/output/ap5/Amon/'
  var='rlut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rlut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsut'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsut=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  var='rsdt'
  SPAWN,'\ls '+dir+''+var+'/*.nc',infiles
  rsdt=PPA(NCASSOC(infiles,/IGNORE),SS(fromdt=[1850,1,1],todt=[2099,12,30]),/ALL)
  N=PP_FF('a-b-c',rsdt,rsut,rlut)
  N=IDL_CREATE_ANNUAL_MEAN(N,1850,2099)
  N=PP_AREA_AVG(N,/BOX)
  dF=N-Ncontrol
  dF3=dF

  ; Calculate ensemble-mean
  dFmean=FLTARR(250)
  FOR iyr=0,N_ELEMENTS(dFmean)-1 DO BEGIN
   dFmean[iyr]=MEAN([dF1[iyr],dF2[iyr],dF3[iyr]])
  ENDFOR

  ; Write to csv file
  headers=['YEAR','r1i1p1f3','r2i1p1f3','r3i1p1f3','Ensemble-mean,']
  data_to_write=TRANSPOSE([[yr],[dF1],[dF2],[dF3],[dFmean]])
  WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_1850-2099_'+exp+'_ERF.csv'
 ENDFOR
END
