########################################################################
## "The critical period hypothesis in second language acquisition:    ##
## A statistical critique and a reanalysis"                           ##
## http://dx.doi.org/10.1371/journal.pone.0069172                     ##
## Jan Vanhove, Fribourg                                              ##
## contact: jan.vanhove@unifr.ch                                      ##
########################################################################

########################
## Reanalysis DeKeyser et al. (2010),
## 'Cross-linguistic evidence for the nature of 
## age effects in second language acquisition',
## Applied Psycholinguistics 31, 413–438.
########################

#########
# Data input and verification
#########

### Read data:
# am = North America study (DatasetS1.csv)
# isr = Israel study (DatasetS2.csv)
# Linux users using Terminal: am = read.csv("path/to/file.csv", header=T)
am = read.csv(file.choose(), header=T)
isr = read.csv(file.choose(), header=T)

### Verify summary data provided in
### Tables 1 and 2 in original publication

## North America study
range(am$AOA) # OK
mean(am$AOA) # OK
sd(am$AOA) # OK
range(am$GJT) # OK
mean(am$GJT) # OK
sd(am$GJT) # OK
# summary data for North America study exactly replicated

## Israel study
## Note: We rounded the data off to the nearest integer for better
## comparability with North America study.
## This will lead to very slight differences.
range(isr$AOA) # OK
mean(isr$AOA) # OK
sd(isr$AOA) # OK
range(isr$GJT) # OK
mean(isr$GJT) # OK
sd(isr$GJT) # OK
# summary data for Israel study replicated

### Additional check: verify whether correlation coefficients
### for AOA/GJT are identical in our data compared to the original

## North America study (see pp. 422-423)
cor(am$AOA, am$GJT) # OK
cor(am[am$AOA < 18,]$AOA, am[am$AOA < 18,]$GJT) # OK
cor(am[am$AOA >= 18 & am$AOA <= 40,]$AOA, am[am$AOA >= 18 & am$AOA <= 40,]$GJT) # practically identical (-.446)
cor(am[am$AOA > 40,]$AOA, am[am$AOA > 40,]$GJT) # OK
# r coefficients either identical or very slightly different to DK et al.'s

## Israel study (see p. 428)
## Again: slight differences due to rounding to be expected
cor(isr$AOA, isr$GJT) # OK
cor(isr[isr$AOA < 18,]$AOA, isr[isr$AOA < 18,]$GJT) # ?
# Probably due to rounding (17.7 considered as 18 etc.). Retry with AOA <= 18
cor(isr[isr$AOA <= 18,]$AOA, isr[isr$AOA <= 18,]$GJT) # OK
cor(isr[isr$AOA > 18 & isr$AOA <= 40,]$AOA, isr[isr$AOA > 18 & isr$AOA <= 40,]$GJT) # ?
# Rounding. Retry with 18 < AOA < 40
cor(isr[isr$AOA > 18 & isr$AOA < 40,]$AOA, isr[isr$AOA > 18 & isr$AOA < 40,]$GJT) # OK
cor(isr[isr$AOA >= 40,]$AOA, isr[isr$AOA >= 40,]$GJT) # OK
# r coefficients either identical or very slightly different to DK et al.'s

#########
# Graphical data exploration
#########

### Load package ggplot2 (visualisation)
# If not already installed, run following line first:
# install.packages("ggplot2")
require(ggplot2)

## N. America graph with loess smoother
tiff("Figure3.tiff", width=6.83 , height=4.5, units="in", res=300)
qplot(data=am, AOA, GJT, geom=c("point", "smooth"), main="North America study")+
  scale_x_continuous('age of onset of acquisition', limits=c(0,75)) +
  scale_y_continuous('grammaticality judgement task score', limits=c(100,200)) +
  theme_bw()
dev.off()
# no CP 'elbow' detectable

## Israel graph with loess smoother
tiff("Figure4.tiff", width=6.83 , height=4.5, units="in", res=300)
qplot(data=isr, AOA, GJT, geom=c("point", "smooth"), main="Israel study")+
  scale_x_continuous('age of onset of acquisition', limits=c(0,75)) +
  scale_y_continuous('grammaticality judgement task score', limits=c(100,200)) +
  theme_bw()
dev.off()
# no CP 'elbow' detectable either

## Alternative code that doesn't require ggplot2 (not run):
# plot(am$AOA, am$GJT)
# lines(lowess(am$AOA, am$GJT)) # uses lowess algorithm

#########
# Linear regressions with and without breakpoint at AOA = 18
# See Baayen, 2008:214ff, for details
#########

## N. America study

# define breakpoint and shift AOA
breakpoint = 18
am$ShiftedAOA = am$AOA - breakpoint

# compute breakpoint model (before/after as interaction term)
am$PastBreakPoint = as.factor(am$ShiftedAOA > 0)
am.with18 = lm(GJT ~ ShiftedAOA:PastBreakPoint, data=am)

# compare with simpler model without breakpoint
am.without18 = lm(GJT ~ ShiftedAOA, data=am)
anova(am.without18, am.with18)
# F(1,73) = 3.27, p = 0.07
# am.without18 is a more parsimonious model

# inspect summaries
summary(am.with18); summary(am.without18)
# increase in R2 very low: .647 to .662; adjusted: .642 to .652

## Redo exact same thing for Israel
# define breakpoint and shift AOA
breakpoint = 18
isr$ShiftedAOA = isr$AOA - breakpoint

# compute breakpoint model (before/after as interaction term)
isr$PastBreakPoint = as.factor(isr$ShiftedAOA > 0)
isr.with18 = lm(GJT ~ ShiftedAOA:PastBreakPoint, data=isr)

# compare with simpler model without breakpoint
isr.without18 = lm(GJT ~ ShiftedAOA, data=isr)
anova(isr.without18, isr.with18)
# F(1,59) < 0.01, p = 0.98
# isr.without18 is a more parsimonious model

# inspect summaries
summary(isr.with18); summary(isr.without18)
# increase in R2 non-existent: .626 to .626; adjusted: .620 to .613 (= drop!)

## Plot regression lines
# Rewrite regression models first for ease of plotting
am.with18b = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=am)
isr.with18b = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=isr)
# You can compare the summary()s: these are exactly the same models as am.both and isr.both

# Define domains of predictions
newShiftedAOA_am <- seq(-13,53)
newShiftedAOA_isr <- seq(-14,47)

# predictions for North America: with breakpoint
predictedGJT_am <- predict(am.with18b,
                           newdata=data.frame(ShiftedAOA=newShiftedAOA_am),
                           interval=c("confidence"), level=.95, type="response")
# predictions North America: no breakpoint
predictedGJT_am2 <- predict(am.without18,
                            newdata=data.frame(ShiftedAOA=newShiftedAOA_am),
                            interval=c("confidence"), level=.95, type="response")

# plot regressions North America
# solid: with breakpoints + 95% CI (dashed)
# dash-dot: without breakpoints (no CI to keep things clear)
tiff("Figure5.tiff", width=6.83 , height=5.7, units="in", res=300)
plot(am$ShiftedAOA, am$GJT,
     xlim=c(-18,57), ylim=c(100,200), xaxt="n",
     xlab="age of onset of acquisition",
     ylab="grammaticality judgement task score",
     main="North America study")
axis(1,at=seq(-18,52,by=10), labels=c("0", "10","20","30","40","50","60","70"))
lines(newShiftedAOA_am, predictedGJT_am[,1], lwd=3)
lines(newShiftedAOA_am, predictedGJT_am[,2], lty=2, lwd=.6)
lines(newShiftedAOA_am, predictedGJT_am[,3], lty=2, lwd=.6)
lines(newShiftedAOA_am, predictedGJT_am2[,1], lty=4, lwd=3)
dev.off()

# predictions for Israel: with breakpoint
predictedGJT_isr <- predict(isr.with18b,
                           newdata=data.frame(ShiftedAOA=newShiftedAOA_isr),
                           interval=c("confidence"), level=.95, type="response")
# predictions Israel: no breakpoint
predictedGJT_isr2 <- predict(isr.without18,
                            newdata=data.frame(ShiftedAOA=newShiftedAOA_isr),
                            interval=c("confidence"), level=.95, type="response")

# plot regressions Israel
# solid: with breakpoints + 95% CI (dashed)
# dash-dot: without breakpoints (no CI to keep things clear)
tiff("Figure6.tiff", width=6.83 , height=5.7, units="in", res=300)
plot(isr$ShiftedAOA, isr$GJT,
     xlim=c(-18,57), ylim=c(100,200), xaxt="n",
     xlab="age of onset of acquisition",
     ylab="grammaticality judgement task score",
     main="Israel study")
axis(1,at=seq(-18,52,by=10), labels=c("0","10","20","30","40","50","60","70"))
lines(newShiftedAOA_isr, predictedGJT_isr[,1], lwd=3)
lines(newShiftedAOA_isr, predictedGJT_isr[,2], lty=2, lwd=.6)
lines(newShiftedAOA_isr, predictedGJT_isr[,3], lty=2, lwd=.6)
lines(newShiftedAOA_isr, predictedGJT_isr2[,1], lty=4, lwd=3)
dev.off()
# all but complete overlap of two regression lines

### Conclusion: no need to postulate breakpoint in either study

#########
# Loop through AOAs to determine optimal breakpoint
# See Baayen, 2008:218
#########

## North America study
deviances_am = rep(0, 15)
for (i in 1:15) {
  breakpoint = i+4
  am$ShiftedAOA = am$AOA - breakpoint
  am$PastBreakPoint = as.factor(am$ShiftedAOA > 0)
  mod.lm = lm(GJT~ ShiftedAOA:PastBreakPoint, data=am) # updated
  deviances_am[i] = deviance(mod.lm)
}
which(deviances_am==min(deviances_am))

# optimal breakpoints at i = 12
# age = i + 4 = 12 + 4 = 16
breakpoint = 16
am$ShiftedAOA = am$AOA - breakpoint
am.with16 = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=am)
am.without16 = lm(GJT ~ ShiftedAOA, data=am)
anova(am.without16, am.with16)
# p < 0.05; tentative evidence for CP

# Define domain of predictions
newShiftedAOA_am <- seq(-11,55)

# predictions for North America: with breakpoint
predictedGJT_am <- predict(am.with16,
                           newdata=data.frame(ShiftedAOA=newShiftedAOA_am),
                           interval=c("confidence"), level=.95, type="response")
# predictions North America: no breakpoint
predictedGJT_am2 <- predict(am.without16,
                            newdata=data.frame(ShiftedAOA=newShiftedAOA_am),
                            interval=c("confidence"), level=.95, type="response")

# plot
tiff("Figure8.tiff", width=6.83 , height=5.7, units="in", res=300)
plot(am$ShiftedAOA, am$GJT,
     xlim=c(-16,59), ylim=c(100,200), xaxt="n",
     xlab="age of onset of acquisition",
     ylab="grammaticality judgement task score",
     main="North America study")
axis(1,at=seq(-16,59,by=10), labels=c("0", "10","20","30","40","50","60","70"))
lines(newShiftedAOA_am, predictedGJT_am[,1], lwd=3)
lines(newShiftedAOA_am, predictedGJT_am[,2], lty=2, lwd=.6)
lines(newShiftedAOA_am, predictedGJT_am[,3], lty=2, lwd=.6)
lines(newShiftedAOA_am, predictedGJT_am2[,1], lty=4, lwd=3)
dev.off()
# slope change in CP-predicted direction, but linear trend within CI region

## Israel study
deviances_isr = rep(0, 15)
for (i in 1:15) {
  breakpoint = i+4
  isr$ShiftedAOA = isr$AOA - breakpoint
  isr$PastBreakPoint = as.factor(isr$ShiftedAOA > 0)
  mod.lm = lm(GJT~ ShiftedAOA:PastBreakPoint, data=isr)
  deviances_isr[i] = deviance(mod.lm)
}
which(deviances_isr==min(deviances_isr))


# Plot deviances
tiff("Figure7.tiff", width=6.83, height=3.4, units="in", res=300)
par(mfrow=c(1,2))
plot(1:length(deviances_am)+4,deviances_am, type="l",
     xlab="breakpoint (AOA)", ylab="deviance",
     main="North America", xaxt="n")
axis(1, at=c(6, 10, 14, 18))
plot(1:length(deviances_isr)+4,deviances_isr, type="l",
     xlab="breakpoint (AOA)", ylab="deviance",
     main="Israel", xaxt="n")
axis(1, at=c(6, 10, 14, 18))
par(mfrow=c(1,1))
dev.off()

# age = i + 4 = 2 + 4 = 6
breakpoint = 6
isr$ShiftedAOA = isr$AOA - breakpoint
isr.with6 = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=isr)
isr.without6 = lm(GJT ~ ShiftedAOA, data=isr)
anova(isr.without6, isr.with6)
# no evidence for CP

# Define domain of predictions
newShiftedAOA_isr <- seq(-2,59)

# predictions for Israel: with breakpoint
predictedGJT_isr <- predict(isr.with6,
                           newdata=data.frame(ShiftedAOA=newShiftedAOA_isr),
                           interval=c("confidence"), level=.95, type="response")
# predictions Israel: no breakpoint
predictedGJT_isr2 <- predict(isr.without6,
                            newdata=data.frame(ShiftedAOA=newShiftedAOA_isr),
                            interval=c("confidence"), level=.95, type="response")

# plot
tiff("Figure9.tiff", width=6.83 , height=5.7, units="in", res=300)
plot(isr$ShiftedAOA, isr$GJT,
     xlim=c(-6,69), ylim=c(100,200), xaxt="n",
     xlab="age of onset of acquisition",
     ylab="grammaticality judgement task score",
     main="Israel study")
axis(1,at=seq(-6,64,by=10), labels=c("0","10","20","30","40","50","60","70"))
lines(newShiftedAOA_isr, predictedGJT_isr[,1], lwd=3)
lines(newShiftedAOA_isr, predictedGJT_isr[,2], lty=2, lwd=.6)
lines(newShiftedAOA_isr, predictedGJT_isr[,3], lty=2, lwd=.6)
lines(newShiftedAOA_isr, predictedGJT_isr2[,1], lty=4, lwd=3)
dev.off()
# STILL near-complete overlap; break not compatible with CPH

#########
# Data not perfectly homoskedastic; perform robust regression
#########

# load MASS package; if not already installed, run next line
# install.packages("MASS")
require(MASS)

am.with16.rob = rlm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=am)
am.without16.rob = rlm(GJT ~ ShiftedAOA, data=am)
summary(am.with16.rob)
summary(am.without16.rob) # similar to normal lm() models

isr.with6.rob = rlm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data=isr)
isr.without6.rob = rlm(GJT ~ ShiftedAOA, data=isr)
summary(isr.with6.rob)
summary(isr.without6.rob) # similar to normal lm() models

#########
# Alternative: perform generalized least squares regression in with the variance increased linearly with the mean
#########

# load NLME package; if not already install, run next lines
# install.packages("nlme")
require(nlme)

am.with16.gls = gls(GJT ~ ShiftedAOA:as.factor(ShiftedAOA >0), data=am, weights=varFixed(~AOA), method="ML")
am.without16.gls = gls(GJT ~ ShiftedAOA, data = am, weights=varFixed(~AOA), method="ML")
anova(am.without16.gls, am.with16.gls)
summary(am.with16.gls)
summary(am.without16.gls) # parameters similar to normal lm() models

isr.with6.gls = gls(GJT ~ ShiftedAOA:as.factor(ShiftedAOA > 0), data = isr, weights=varFixed(~AOA), method="ML")
isr.without6.gls = gls(GJT ~ ShiftedAOA, data = isr, weights=varFixed(~AOA), method="ML")
anova(isr.without6.gls, isr.with6.gls)
summary(isr.with6.gls)
summary(isr.without6.gls) # parameters similar to normal lm() models

#########
# Outliers problematic?
#########

## Plot diagnostics America
plot(am.without16)

## Plot diagnostics Israel
plot(isr.without6)

## Which datapoints?
# with breakpoints
am[abs(scale(resid(am.without16))) > 2.5,]
isr[abs(scale(resid(isr.without6))) > 2.5,]
# with breakpoints
am[abs(scale(resid(am.with16))) > 2.5,]
isr[abs(scale(resid(isr.with6))) > 2.5,]
# The same participants are outliers, regardless of the model.

## Refit models excluding these data points
am.without16b = lm(GJT ~ ShiftedAOA, data=am, subset=(abs(scale(resid(am.without16))) < 2.5))
am.with16b = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA>0), data=am, subset(abs(scale(resid(am.with16))) < 2.5))

isr.without6b = lm(GJT ~ ShiftedAOA, data=isr, subset=(abs(scale(resid(isr.without6)))) < 2.5)
isr.with6b = lm(GJT ~ ShiftedAOA:as.factor(ShiftedAOA>0), data=isr, subset(abs(scale(resid(isr.with6))) < 2.5))

## Compare parameters
summary(am.without16b)
summary(am.with16b)
summary(isr.without6b)
summary(isr.with6b)
# highly similar to models fitted on all data:
# parameter estimates are well within error margins of those models
