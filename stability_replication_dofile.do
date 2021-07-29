

*Replication to "Stability through constraints: the impact of fiscal rules on autocratic survival"*



*Start by loading the "stability_replication_dataset"



*Generation of fiscal rules variables* 

*Generation of dummy for expenditure rule with statuary or constitutional basis*
generate statconER=0
replace statconER=1 if ER== 1 & legal_n_ER==3 |ER== 1 & legal_n_ER==5
replace statconER=. if ER==.

*Generation of dummy for revenue rule with statuary or constitutional basis*
generate statconRR=0
replace statconRR=1 if RR== 1 & legal_n_RR==3 |RR== 1 & legal_n_RR==5
replace statconRR=. if RR==.

*Generation of dummy for balanced budget rule with statuary or constitutional basis*
generate statconBBR=0
replace statconBBR=1 if BBR== 1 & legal_n_BBR==3 |BBR== 1 & legal_n_BBR==5
replace statconBBR=. if BBR==.



*Generation of dummy for debt rule with statuary or constitutional basis*
generate statconDR=0
replace statconDR=1 if DR== 1 & legal_n_DR==3 |DR== 1 & legal_n_DR==5
replace statconDR=. if DR==.



xtset ccode year

*Generation of reform expenditure rule*
generate reformER=0
replace reformER=1 if statconER==1 & l1.statconER==0
replace reformER=. if statconER==.

*Generation of reform revenue rule*
generate reformRR=0
replace reformRR=1 if statconRR==1 & l1.statconRR==0
replace reformRR=. if statconRR==.

*Generation of reform balance budget rule*
generate reformBBR=0
replace reformBBR=1 if statconBBR==1 & l1.statconBBR==0
replace reformBBR=. if statconBBR==.

*Generation of reform debt rule*
generate reformDR=0
replace reformDR=1 if statconDR==1 & l1.statconDR==0
replace reformDR=. if statconDR==.


*Generation of non-expenditure rule years. Some countries with problems*
generate nonERyears=.
replace nonERyears= year-1984 if statconER==0
replace nonERyears= 0 if statconER==1
replace nonERyears= year-1984 if statconER==1 & l.statconER==0

generate nationalfiscalreform=0
replace nationalfiscalreform=1 if reformER==1 | reformRR==1 | reformBBR==1 | reformDR==1
replace nationalfiscalreform=. if reformER==. | reformRR==. | reformBBR==. | reformDR==.




*Generation of IMF national expenditure rules index* 
*Rescale cover of expenditure rule*
generate cover_n_er2= cover_n_ER/2

*Rescale legal scope of expenditure rule*
generate legal_n_er2= legal_n_ER/5

*generation of Expenditure rules strenght index* 
generate ER_n_strengh = cover_n_er2 + legal_n_er2 + enforce_n_ER + suport_ceil_n_a + frl + suport_budg_n + suport_impl_n


*Rescale cover of revenue rule*
generate cover_n_rr2= cover_n_RR/2

*Rescale legal scope of revenue rule*
generate legal_n_rr2= legal_n_RR/5

*generation of revenue rules strenght index*
generate RR_n_strengh= cover_n_rr2 + legal_n_rr2 + enforce_n_RR + frl + suport_budg_n + suport_impl_n

*Rescale cover of balanced budget rule*
generate cover_n_bbr2=cover_n_BBR/2

*Rescale legal scope of balanced budget rule*
generate legal_n_bbr2= legal_n_BBR/5

*generation of balanced budget rules strenght index*
generate BBR_n_strengh= cover_n_bbr2 + legal_n_bbr2 + enforce_n_BBR + suport_ceil_n_a + frl + suport_budg_n + suport_impl_n

*Rescale cover of debt rule*
generate cover_n_dr2= cover_n_DR/2

*Rescale legal scope of debt rule*
generate legal_n_dr2= legal_n_DR/5

*generation of debt rule strenght index*
generate DR_n_strengh= cover_n_dr2 + legal_n_dr2 + enforce_n_DR + suport_ceil_n_a + frl + suport_budg_n + suport_impl_n


*Generation of overal fiscal rules index*
generate nationalfiscalrulesindex=((DR_n_strengh*5/7) + (BBR_n_strengh*5/7) + (RR_n_strengh*5/6) + (ER_n_strengh*5/7))/4



*Generation of national fiscal rules in place*
generate nationaler=0
replace nationaler=1 if ER==1 & ER_supra!=2
replace nationaler=. if ER==. 

generate nationalrr=0
replace nationalrr=1 if RR==1 & RR_supra!=2
replace nationalrr=. if RR==. 

generate nationalbbr=0
replace nationalbbr=1 if BBR==1 & BBR_supra!=2
replace nationalbbr=. if BBR==. 

generate nationaldr=0
replace nationaldr=1 if DR==1 & DR_supra!=2
replace nationaldr=. if DR==. 


generate nationalfiscalrule=0
replace nationalfiscalrule=1 if nationaler==1 | nationalrr==1 | nationalbbr==1 | nationaldr==1
replace nationalfiscalrule=. if year<1985 | year>2015


*Reform all types of national fiscal rules* 
*Generation of reform expenditure rule*
generate reformER2=0
replace reformER2=1 if nationaler==1 & l1.nationaler==0
replace reformER2=. if nationaler==.

*Generation of reform revenue rule*
generate reformRR2=0
replace reformRR2=1 if nationalrr==1 & l1.nationalrr==0
replace reformRR2=. if nationalrr==.

*Generation of reform balance budget rule*
generate reformBBR2=0
replace reformBBR2=1 if nationalbbr==1 & l1.nationalbbr==0
replace reformBBR2=. if nationalbbr==.

*Generation of reform debt rule*
generate reformDR2=0
replace reformDR2=1 if nationaldr==1 & l1.nationaldr==0
replace reformDR2=. if nationaldr==.

generate nationalfiscalreform2=0
replace nationalfiscalreform2=1 if reformER2==1 | reformRR2==1 | reformBBR2==1 | reformDR2==1
replace nationalfiscalreform2=. if reformER2==. | reformRR2==. | reformBBR2==. | reformDR2==.




*Alternative fiscal rules strenght indexes: Without ceilings and fiscal responsibility law:

*National fiscal rules*
*generation of Expenditure rules strenght index* 
generate ER_n_strengh2 = cover_n_er2 + legal_n_er2 + enforce_n_ER  + suport_budg_n + suport_impl_n


*generation of revenue rules strenght index*
generate RR_n_strengh2= cover_n_rr2 + legal_n_rr2 + enforce_n_RR +  suport_budg_n + suport_impl_n

*generation of balanced budget rules strenght index*
generate BBR_n_strengh2= cover_n_bbr2 + legal_n_bbr2 + enforce_n_BBR +  suport_budg_n + suport_impl_n

*generation of debt rule strenght index*
generate DR_n_strengh2= cover_n_dr2 + legal_n_dr2 + enforce_n_DR + suport_budg_n + suport_impl_n


 
 *Anoother alternative fiscal rules strenght indexes: Without any auxilliary institutions:

*National fiscal rules*
*generation of Expenditure rules strenght index* 
generate ER_n_strengh3 = cover_n_er2 + legal_n_er2 + enforce_n_ER 


*generation of revenue rules strenght index*
generate RR_n_strengh3= cover_n_rr2 + legal_n_rr2 + enforce_n_RR 

*generation of balanced budget rules strenght index*
generate BBR_n_strengh3= cover_n_bbr2 + legal_n_bbr2 + enforce_n_BBR 

*generation of debt rule strenght index*
generate DR_n_strengh3= cover_n_dr2 + legal_n_dr2 + enforce_n_DR 


*Generation of overal fiscal rules index*
generate nationalfiscalrulesindex3=((DR_n_strengh3*3/3) + (BBR_n_strengh3*3/3) + (RR_n_strengh3*3/3) + (ER_n_strengh3*3/3))/4


 
 



*Generation of overal fiscal rules index*
generate nationalfiscalrulesindex2=((DR_n_strengh2*5/5) + (BBR_n_strengh2*5/5) + (RR_n_strengh2*5/5) + (ER_n_strengh2*5/5))/4



*Logging per capita income*
generate loggdp= log(wdi_gdpcapcon2010)


*Generate log of government debt*
generate logdebt= log(gov_grossdebt)


*Generating of debt-servicing costs variable*
generate debtservicingcosts= gov_netlb - gov_prim_netlb

*Destringing experience variables*
destring averagetotal , replace ignore(NA)
destring averagecore, replace ignore(NA)
destring averageminister, replace ignore(NA)

*Measure of relative cabinet experience (internal checks)

generate elitecheck= averagecore/leaderexperience


*Coding popular uprisings*
generate popularuprising=0
replace popularuprising=1 if gwf_failtype==4
replace popularuprising=. if gwf_failtype==.

*Creating time since last breakdown polynomial*
generate duration2= gwf_duration^2
generate duration3= gwf_duration^3




*Table 1: Listing autocracies with fiscal rules*
list cname year if nationalfiscalrule==1 &  democracy!=1 & democracy!=.
list cname year nationalfiscalrulesindex if nationalfiscalrule==1 &  democracy!=1

list cname year if nationalfiscalrule==1 &   gwf_fail!=. 
list cname year nationalfiscalrulesindex if nationalfiscalrule==1 & gwf_fail!=. 



*Figure B1: Line with development of fiscal rules' index over time*
replace cname= "Russia" if cname=="USSR"

xtline nationalfiscalrulesindex, t(year) i(cname)  ytitle("National fiscal rules strength index")  xtitle("Year") xlabel(1985 1995 2005 2015) graphregion(color(white)) legend(off), if year>1984 & year<2016  & ccode==51 | ccode==360 & year>1984 & year<2016 | ccode==364 & year>1984 & year<2016| ccode==404 & year>1984 & year<2016| ccode==458 & year>1984 & year<2016 & year>1984 & year<2016 | ccode==462 & year>1984 & year<2016| ccode==516 & year>1984 & year<2016 | ccode==566 & year>1984 & year<2016| ccode==586 & year>1984 & year<2016| ccode==604 & year>1984 & year<2016| ccode==810 & year>1984 & year<2016 | ccode==702 & year>1984 & year<2016 | ccode==144 & year>1984 & year<2016| ccode==834 & year>1984 & year<2016



list cname year if nationalfiscalrule==1 &   l.e_lexical_index<4

*Figure 1: Creating line with fiscal rules as world average and for autocracies*
xtset ccode year
generate laggeddemocracy= l.democracy

bysort year : egen year_mean = mean(nationalfiscalrule)
bysort year : egen autocracy_year_mean = mean(nationalfiscalrule) if laggeddemocracy!=1 & laggeddemocracy!=.
bysort year : egen democracy_year_mean = mean(nationalfiscalrule) if laggeddemocracy==1 & laggeddemocracy!=.
twoway (line year_mean year)  ,graphregion(color(white)) ytitle(Share of countries with national fiscal rules) ylabel(, format(%9.1f)) xlabel(1985 1990 1995 2000 2005 2010 2015), if year > 1984 & year<2016

twoway (line year_mean year, lcolor(black) )  (line autocracy_year_mean year, lpattern(shortdash)lcolor(black) )   ,graphregion(color(white)) ytitle(Share of countries with national fiscal rules) ylabel(, format(%9.1f)) xlabel(1985 1990 1995 2000 2005 2010 2015)  legend(label(1 "All countries") label(2 "Autocracies")), if year > 1984 & year<2016

twoway (line year_mean year,lcolor(black) )  (line democracy_year_mean year, lpattern(shortdash) lcolor(black) )  (line autocracy_year_mean year, lpattern(longdash) lcolor(black) )  ,graphregion(color(white)) ytitle(Share of countries with national fiscal rules) ylabel(, format(%9.1f)) xlabel(1985 1990 1995 2000 2005 2010 2015)  legend(label(1 "All countries") label(2 "Democracies") label (3 "Autocracies")), if year > 1984 & year<2016


xtset ccode year
generate laglex= l.e_lexical_index


bysort year : egen autocracy_year_mean1 = mean(nationalfiscalrule) if laglex<4 & laglex!=.
bysort year : egen democracy_year_mean1 = mean(nationalfiscalrule) if laglex>=4 & laglex!=.
twoway (line year_mean year,lcolor(black) )  (line democracy_year_mean1 year, lpattern(shortdash) lcolor(black) )  (line autocracy_year_mean1 year, lpattern(longdash) lcolor(black) )  ,graphregion(color(white)) ytitle(Share of countries with national fiscal rules) ylabel(, format(%9.1f)) xlabel(1985 1990 1995 2000 2005 2010 2015)  legend(label(1 "All countries") label(2 "Democracies") label (3 "Autocracies")), if year > 1984 & year<2016


xtset ccode year


*Table 2: Descriptive statistics*
xtsum  regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr gov_totexp  gov_rev wdi_fdiin iiavg SPall if l.democracy!=1  & l.democracy!=. & nationalfiscalrulesindex!=. & regchange_hr!=. 

xtsum leader_exit_irreg if l.democracy!=1  & l.democracy!=. & nationalfiscalrulesindex!=. & leader_exit_irreg!=. 



* Figure 2 (and Appendix G): Main results*

*Generating manuel lagged variables*

 generate lag1= l.nationalfiscalrulesindex
 generate lag2= l2.nationalfiscalrulesindex
 generate lag3= l3.nationalfiscalrulesindex
 generate lag4= l4.nationalfiscalrulesindex
 generate lag5= l5.nationalfiscalrulesindex
 generate lag6= l6.nationalfiscalrulesindex
 generate lag7= l7.nationalfiscalrulesindex
 generate lag8= l8.nationalfiscalrulesindex
 
 
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))




*Appendix C: Use of Geddes and Frantz instead*
xtsum gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr if gwf_fail!=. &   nationalfiscalrulesindex!=. 



xtreg gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr gwf_duration duration2 duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r0
xtreg f1.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f1.gwf_duration f1.duration2 f1.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r1
xtreg f2.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f2.gwf_duration f2.duration2 f2.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r2
xtreg f3.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f3.gwf_duration f3.duration2 f3.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r3
xtreg f4.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr  f4.gwf_duration f4.duration2 f4.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r4
xtreg f5.gwf_fail  nationalfiscalrulesindex  loggdp wdi_oilrent wdi_gdpcapgr f5.gwf_duration f5.duration2 f5.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r5
xtreg f6.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f6.gwf_duration f6.duration2 f6.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r6
xtreg f7.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f7.gwf_duration f7.duration2 f7.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r7
xtreg f8.gwf_fail  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr f8.gwf_duration f8.duration2 f8.duration3 i.year, fe cluster(ccode), if gwf_fail!=. 
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix C: Irregular Leader exit as the dependent variable*

xtreg leader_exit_irreg nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr  t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg  leader_exit_irreg lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg leader_exit_irreg  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg leader_exit_irreg lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg leader_exit_irreg lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg leader_exit_irreg lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg leader_exit_irreg lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg  leader_exit_irreg lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg leader_exit_irreg lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_leader_exit_irreg t2_leader_exit_irreg  t3_leader_exit_irreg i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on irregular leader exit") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix D: Pure effects of fiscal rules*



xtreg regchange_hr  l2.nationalfiscalrule l2.loggdp l2. wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=. & year>1986

xtreg regchange_hr  l8.nationalfiscalrule  l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=. & year>1992


 generate llag1= l.nationalfiscalrule
 generate llag2= l2.nationalfiscalrule
 generate llag3= l3.nationalfiscalrule
 generate llag4= l4.nationalfiscalrule
 generate llag5= l5.nationalfiscalrule
 generate llag6= l6.nationalfiscalrule
 generate llag7= l7.nationalfiscalrule
 generate llag8= l8.nationalfiscalrule
 



xtreg regchange_hr  nationalfiscalrule loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  llag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  llag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  llag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  llag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  llag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  llag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  llag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  llag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of national fiscal rule on breakdown") vertical  keep (nationalfiscalrule llag1 llag2 llag3 llag4 llag5 llag6 llag7 llag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))




*Appendix D: Alternative coding of fiscal rules*
xtreg regchange_hr  l2.nationalfiscalrulesindex2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.  & year>1984

xtreg regchange_hr  l8.nationalfiscalrulesindex2  l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=. & year>1984



 generate lllag1= l.nationalfiscalrulesindex2
 generate lllag2= l2.nationalfiscalrulesindex2
 generate lllag3= l3.nationalfiscalrulesindex2
 generate lllag4= l4.nationalfiscalrulesindex2
 generate lllag5= l5.nationalfiscalrulesindex2
 generate lllag6= l6.nationalfiscalrulesindex2
 generate lllag7= l7.nationalfiscalrulesindex2
 generate lllag8= l8.nationalfiscalrulesindex2
 



xtreg regchange_hr  nationalfiscalrulesindex2 loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lllag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lllag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lllag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lllag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lllag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lllag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lllag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lllag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of alternative index on breakdown") vertical  keep (nationalfiscalrulesindex2 lllag1 lllag2 lllag3 lllag4 lllag5 lllag6 lllag7 lllag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))




*Appendix D: Another alternative coding of fiscal rules*
 generate alllag1= l.nationalfiscalrulesindex3
 generate alllag2= l2.nationalfiscalrulesindex3
 generate alllag3= l3.nationalfiscalrulesindex3
 generate alllag4= l4.nationalfiscalrulesindex3
 generate alllag5= l5.nationalfiscalrulesindex3
 generate alllag6= l6.nationalfiscalrulesindex3
 generate alllag7= l7.nationalfiscalrulesindex3
 generate alllag8= l8.nationalfiscalrulesindex3
 



xtreg regchange_hr  nationalfiscalrulesindex3 loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  alllag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  alllag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  alllag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  alllag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  alllag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  alllag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  alllag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  alllag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of alternative index on breakdown") vertical  keep (nationalfiscalrulesindex3 alllag1 alllag2 alllag3 alllag4 alllag5 alllag6 alllag7 alllag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


* Appendix E: No GDP-related variables 
xtreg regchange_hr  nationalfiscalrulesindex wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.wdi_oilrent t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2  l2.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3   l3.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4  l4.wdi_oilrent   t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6  l6.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7  l7.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8  l8.wdi_oilrent  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix E: No country- and year-fixed effects*
reg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  ,  cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr year,  cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
reg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
reg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  ,  cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
reg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr , cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
reg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  ,  cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
reg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  ,  cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
reg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  ,  cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
reg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr ,  cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix E: Time-trend instead of year-fixed effects*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))

*Appendix E:  No year-fixed effects*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  , fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  , fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr , fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



* Appendix E: Error correction model*
tabulate year, generate(y)

xtpmg d.regchange_hr  nationalfiscalrulesindex  loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange y*, lr(l.regchange_hr  loggdp wdi_oilrent wdi_gdpcapgr nationalfiscalrulesindex ) ec(_ec) replace dfe cluster(ccode) 



*Appendix E: Manuel error correction model*
xtreg d.regchange_hr  nationalfiscalrulesindex l.d.regchange_hr l.regchange_hr  loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg d.regchange_hr  lag1 l.d.regchange_hr l.regchange_hr l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg d.regchange_hr  lag2  l.d.regchange_hr l.regchange_hr l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg d.regchange_hr  lag3  l.d.regchange_hr l.regchange_hr l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg d.regchange_hr  lag4 l.d.regchange_hr l.regchange_hr l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg d.regchange_hr  lag5 l.d.regchange_hr l.regchange_hr l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg d.regchange_hr  lag6  l.d.regchange_hr l.regchange_hr l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg d.regchange_hr  lag7 l.d.regchange_hr l.regchange_hr  l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg d.regchange_hr  lag8  l.d.regchange_hr l.regchange_hr l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix G: No control variables*
xtreg regchange_hr  nationalfiscalrulesindex t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1   t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3   t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4  t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5  t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7  t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))





*Appendix H: Controlling for debt levels*


xtreg regchange_hr  nationalfiscalrulesindex gov_grossdebt loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.gov_grossdebt l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.gov_grossdebt l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.gov_grossdebt l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.gov_grossdebt l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.gov_grossdebt l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.gov_grossdebt l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.gov_grossdebt l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.gov_grossdebt l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix H: Controlling for IMF programms*


xtreg regchange_hr  nationalfiscalrulesindex imfprogram loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1 l.imfprogram l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.imfprogram l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3 l3.imfprogram l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.imfprogram l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.imfprogram l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.imfprogram l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.imfprogram l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.imfprogram l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix H: Controlling for type of autocracy *

xtreg regchange_hr  nationalfiscalrulesindex i.gwf_regimetype loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1 l.i.gwf_regimetype l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.i.gwf_regimetype l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3 l3.i.gwf_regimetype l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.i.gwf_regimetype l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.i.gwf_regimetype l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.i.gwf_regimetype l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.i.gwf_regimetype l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.i.gwf_regimetype l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix H: Controlling for type for party autocracy *
generate partyautocracy=0
replace partyautocracy= 1 if gwf_regimetype==4
replace partyautocracy=. if gwf_regimetype==.



xtreg regchange_hr  nationalfiscalrulesindex partyautocracy  loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1 l.partyautocracy l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.partyautocracy l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3 l3.partyautocracy l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.partyautocracy l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.partyautocracy l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.partyautocracy l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.partyautocracy l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.partyautocracy l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix H: Controlling for a banking crisis*


xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr banking_crisis t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix H: Considering only negative growth rates* 
generate negativegrowth=0
replace negativegrowth=wdi_gdpcapgr if wdi_gdpcapgr<0
replace negativegrowt=. if wdi_gdpcapgr==. 


xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.negativegrowth t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix H: Controlling for elections*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr election t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr l.election t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr l2.election t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr  l3.election t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr l4.election  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr  l5.election t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr  l6.election t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr  l7.election t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr l8.election t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix H: Controlling for time since last irregular leader exit*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr l.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr l2.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr  l3.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr l4.t1_leader_exit_irreg  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr  l5.t1_leader_exit_irreg   t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr  l6.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr  l7.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr l8.t1_leader_exit_irreg t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))



*Appendix H: Controlling for Economic Freedom Index*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. 
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr l.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=.
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr l2.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=.
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr  l3.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=.
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr l4.EconomicFreedomSummaryIndex  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=.
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr  l5.EconomicFreedomSummaryIndex   t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=.
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr  l6.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=.
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr  l7.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=.
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr l8.EconomicFreedomSummaryIndex t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=.
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))





*Appendix I: Removing Singapore*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. & ccode!= 702
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=. & ccode!= 702
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=. & ccode!= 702
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=. & ccode!= 702
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=. & ccode!= 702
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=. & ccode!= 702
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=. & ccode!= 702
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=. & ccode!= 702
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=. & ccode!= 702
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))


*Appendix I: Removing Malaysia*
xtreg regchange_hr  nationalfiscalrulesindex loggdp wdi_oilrent wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l.democracy!=. & ccode!= 458
estimates store r0
xtreg regchange_hr  lag1  l.loggdp l.wdi_oilrent l.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if   l.democracy!=1 & l2.democracy!=1 & l.democracy!=. & l2.democracy!=. & ccode!= 458
estimates store r1
xtreg regchange_hr  lag2 l2.loggdp l2.wdi_oilrent l2.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l3.democracy!=1 & l.democracy!=. & l3.democracy!=. & ccode!= 458
estimates store r2
xtreg regchange_hr  lag3  l3.loggdp l3.wdi_oilrent l3.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode),  if l.democracy!=1 & l4.democracy!=1 & l.democracy!=. & l4.democracy!=. & ccode!= 458
estimates store r3
xtreg regchange_hr  lag4 l4.loggdp l4.wdi_oilrent l4.wdi_gdpcapgr  t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if  l.democracy!=1 & l5.democracy!=1 & l.democracy!=. & l5.democracy!=. & ccode!= 458
estimates store r4
xtreg regchange_hr  lag5 l5.loggdp l5.wdi_oilrent l5.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if   l.democracy!=1 & l6.democracy!=1 & l.democracy!=. & l6.democracy!=. & ccode!= 458
estimates store r5
xtreg regchange_hr  lag6 l6.loggdp l6.wdi_oilrent l6.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if l.democracy!=1 & l7.democracy!=1 & l.democracy!=. & l7.democracy!=. & ccode!= 458
estimates store r6
xtreg regchange_hr  lag7 l7.loggdp l7.wdi_oilrent l7.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr  i.year, fe cluster(ccode), if  l.democracy!=1 & l8.democracy!=1 & l.democracy!=. & l8.democracy!=. & ccode!= 458
estimates store r7
xtreg regchange_hr  lag8 l8.loggdp l8.wdi_oilrent l8.wdi_gdpcapgr t1_regchange_hr t2_regchange_hr t3_regchange_hr i.year, fe cluster(ccode), if l.democracy!=1 & l9.democracy!=1 & l.democracy!=. & l9.democracy!=. & ccode!= 458
estimates store r8
coefplot (r0, label(Year t) msymbol(circle)mcolor(gs0)ciopts(lcolor(gs0)))  (r1, label(Year t+1)msymbol(diamond)mcolor(gs2)ciopts(lcolor(gs2)))  (r2, label(Year t+2)msymbol(square)mcolor(gs4)ciopts(lcolor(gs4)))  (r3, label(Year t+3)msymbol(circle_hollow)mcolor(gs6)ciopts(lcolor(gs6)))  (r4, label(Year t+4)msymbol(X)mcolor(gs8)ciopts(lcolor(gs8))msize(large))  (r5, label(Year t+5 )msymbol(arrowf)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r6, label(Year t+6 )msymbol(triangle_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r7, label(Year t+7 )msymbol(diamond_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) (r8, label(Year t+8 )msymbol(square_hollow)mcolor(gs10)ciopts(lcolor(gs10))msize(large)) ,  ylabel(, format(%9.2f))graphregion(color(white)) level(90) xlabel("") ytitle("Effect of fiscal rules index on breakdown") vertical  keep (nationalfiscalrulesindex lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 ) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))




