#Quality-control and Analysis Script RPK 2016
#Annie Hillier et al., 2016 submission to PlosOne

setwd("") #set working dir by adding path here

#####load required libraries and functions
library(lattice); library(Hmisc); library(vegan); library(MASS);library(lmtest); library(wesanderson); library(tools); library(fitdistrplus)  #may need to install.packages, if these aren't on a user's system
bit=function(x){print(x[c(1:10),c(1:10)]); print(dim(x))}  #shows top-left corner of a data.frame/matrix; useful for large datasets
wrap_strings <- function(vector_of_strings,width){
	as.character(sapply(vector_of_strings,
	FUN<-function(x){paste(strwrap(x,width=width), collapse="\n")}
	))}

#####load raw data
rawdata=read.csv("Hillier_rawdata.csv")
impact=read.csv("impact.csv", header=T, row.names=1, as.is=T)
	impact[,1]<-tolower(impact[,1]) ; impact[4,1]<-"PNAS" ; impact[8,1]<-"Proc Roy Soc B" ; impact[19,1]<-"Phil Trans Roy Soc B"						


################################################################################
#####Quality-control and organizational Steps
################################################################################
						#filter df, using only responses that were in the majority for the narrative perspective question, and taking the mean of other numeric answers
							str1=as.character(unique(rawdata$ab)) #create vector of unique abstracts
							Combined_absLength=sapply(gregexpr("[A-z]\\W+", str1), length) + 1L  #calculate abstract lengths (N words)
						
									#set up vectors to fill in quality-control step
									CombinedAppeal_Filtered_Means=NA
									CombinedConj_Filtered_Means=NA
									CombinedConnect_Filtered_Means=NA
									CombinedNarrativePers_Filtered=NA
									CombinedSensory_Filtered_Means=NA
									CombinedSetting_Filtered_Means=NA
									Combined_cites=NA
									Combined_year=NA
									Combined_journal=NA
									Combined_numberauthors=NA
									AbstractNumber=NA
									#Total.citations.WoS=NA
									FirstAuthor=NA
							for (i in 1:length(unique(rawdata$X_unit_id))){
								temp<-rawdata[rawdata $X_unit_id ==unique(rawdata $X_unit_id)[i],]
								temp_filtered<-temp[temp$narrative_perspective==names(table(temp$narrative_perspective))[which.max(table(temp$narrative_perspective))],]
								
								CombinedAppeal_Filtered_Means[i]=sum(temp_filtered$appeal_to_reader=="yes", na.rm=T)/length(temp_filtered$appeal_to_reader)
								CombinedConj_Filtered_Means[i]=mean(as.numeric(temp_filtered$conjunctions), na.rm=T)
								CombinedConnect_Filtered_Means[i]=mean(as.numeric(temp_filtered$connectivity, na.rm=T))
								CombinedNarrativePers_Filtered[i]=as.character(temp_filtered$narrative_perspective[1]) #these should all be the same after filtering; just take the first
								CombinedSensory_Filtered_Means[i]=mean(temp_filtered$sensory_language, na.rm=T)
								CombinedSetting_Filtered_Means[i]=sum(temp_filtered$setting=="yes", na.rm=T)/length(temp_filtered$setting)
								Combined_cites[i]=mean(temp_filtered$tc)
								Combined_year[i]=mean(temp_filtered$py)
								Combined_journal[i]=tolower(as.character(temp_filtered$so[1]))
								if(is.na(temp$au[1])) Combined_numberauthors[i]<-temp$numberauthors[1] else Combined_numberauthors[i]<-length(strsplit(as.character(temp_filtered $au[1]), ";")[[1]])
								AbstractNumber[i]<-temp$X_unit_id[1]
								#Total.citations.WoS[i]= mean(temp_filtered$TC)
								if(!is.na(temp_filtered $firstauthor[1])) FirstAuthor[i]<-as.character(temp_filtered $firstauthor[1]) else FirstAuthor[i]<-strsplit(as.character(temp_filtered $au[1]), ";")[[1]][1]
								}
						
						#create results data frame
						res.df=data.frame(CombinedAppeal_Filtered_Means, CombinedConj_Filtered_Means, CombinedConnect_Filtered_Means, CombinedNarrativePers_Filtered, CombinedSensory_Filtered_Means, CombinedSetting_Filtered_Means,Combined_cites,Combined_year,Combined_journal, Combined_numberauthors, Combined_absLength, AbstractNumber)
						
						#only keep records from 2009 and 2010
						res.df=res.df[res.df$Combined_year%in%c(2009,2010),]


						#fix column names
						names(res.df)<-c("Appeal","Conjunctions", "Connectivity", "NarrativePerspective", "Sensory", "Setting","Citations", "Year", "Journal", "NumberOfAuthors", "AbstractLength", "AbstractNumber")
						
						#fix journal names
						res.df$Journal[res.df$Journal=="science (new york, n.y.)"]<-"science"
						res.df$Journal[res.df$Journal=="ecological applications : a publication of the ecological society of america"]<-"ecological applications"
						res.df$Journal[res.df$Journal=="proceedings. biological sciences / the royal society"|res.df$Journal=="philosophical transactions of the royal society of london. series b, biological sciences"]<-"proceedings of the royal society b-biological sciences"
						res.df$Journal[res.df$Journal=="the science of the total environment"]<-"science of the total environment"
						res.df$Journal[res.df$Journal=="environmental science &amp; technology"]<-"environmental science & technology"
						res.df$Journal[res.df$Journal=="the new phytologist"]<-"new phytologist"
						
						levels(res.df$Journal)<-c(levels(res.df$Journal), "PNAS", "Proc Roy Soc B", "Phil Trans Roy Soc B")
							res.df$Journal[res.df$Journal=="proceedings of the national academy of sciences of the united states of america"]<-"PNAS"
							res.df$Journal[res.df$Journal=="proceedings of the royal society b-biological sciences"]<-"Proc Roy Soc B"
							res.df$Journal[res.df$Journal=="philosophical transactions of the royal society b-biological sciences"]<-"Phil Trans Roy Soc B"
						
						
						##Normalize data for year and abstract length
						
							NormalizedCitations<-res.df$Citations/(2016-res.df$Year) #normalize log(Citations) by time (in years) since publication
							NormalizedSensory<-res.df$Sensory/res.df$AbstractLength  #normalize count variables for abstract length  (units are, e.g., "Sensory elements per word in the abstract")
							NormalizedConjunctions<-res.df$Conjunctions/res.df$AbstractLength  #normalize count variables for abstract length
							NormalizedConnectivity<-res.df$Connectivity/res.df$AbstractLength  #normalize count variables for abstract length
						
												##Log-transform
						#use log N authors and log Citations, to create more normal distributions
						res.df$NumberOfAuthors <-log(res.df$NumberOfAuthors)
						res.df$Citations <-log(res.df$Citations)
						
						#make narrative perspective numeric binary
						res.df $NarrativePerspective <-ifelse(res.df $NarrativePerspective =="yes", 1,0)
						
						##Create binary variables for Setting and Appeal
							BinarySetting<-ifelse(res.df$Setting<0.5, 0, 1)
							BinaryAppeal<-ifelse(res.df$Appeal<0.5, 0, 1)
						
						##add these transformed variables to to res.df						
							res.df<-data.frame(res.df, NormalizedCitations, NormalizedSensory, NormalizedConjunctions, NormalizedConnectivity, BinarySetting, BinaryAppeal)
						
						##add impact factors and Eigenfactors to data, adjusting journal names as necessary
						res.df$Impact<-impact[,3][match(res.df$Journal,impact[,1])]
						res.df$Eigen<-impact[,4][match(res.df$Journal,impact[,1])]

						#data subsets for 2009 and 2010
						df2009=res.df[res.df$Year==2009,]
						df2010=res.df[res.df$Year==2010,]

################################################################################
#####Analytical Steps
################################################################################


##RESULTS
#individual narrative elements; nonparametric correlations
#create nonparametric stats table
#see plotting script below to reproduce figures
stats.table<-as.data.frame(matrix(NA, nrow=6, ncol=2)); index=1
for(i in c(17,4,14,15,16,18)){
	if(i%in%c(17,4,18)){
		stats.table[index,1]<-"-"			
		stats.table[index,2]<-wilcox.test(res.df$Citations[res.df[,i]==0], res.df$Citations[res.df[,i]==1], exact=F)$p.value}
		else{
			stats.table[index,1]<-round(cor.test(res.df$Citations, res.df[,i], method="spearman", exact=F)$estimate,3)
			stats.table[index,2]<-cor.test(res.df$Citations, res.df[,i], method="spearman", exact=F)$p.value
			}
	index=index+1
}
row.names(stats.table)=names(res.df)[c(17,4,14,15,16,18)]
colnames(stats.table)=c("Rho", "P-value")
stats.table[,2]<-format(stats.table[,2], digits=3)
write.csv(stats.table, "Stats.table.csv")


####synthesizing narrativity variables using ordination
#reducing dimensionality with PCA
pca.res=prcomp(res.df[,c(17,4,14,15,16,18)], center=F, scale.=T)  #note scaling/centering 
	pc1<-scores(pca.res)[,1]
	pc2<-scores(pca.res)[,2]
	plot(res.df $Citations ~I(-1*pc1))  #visualize ; more negative PC scores correlate with greater numbers of citations; I'm inverting here for clarity of illustration

	summary(lm(res.df $Citations ~scores(pca.res)[,1]))  #PC1 is an index of narrativity, and does significantly correlate with normalized citations, explaining about 5% of the variance in citations with a linear model... a nonlinear model might seem more appropriate, however, but linear model wins by AIC
	
	summary(lm(pc1~Journal, data=res.df)) #pc1 varies significantly by journal
	#note: using impact as a continous variable, rather than journal title (as a factor), saves degrees of freedom; makes more sense

	
	
	summary(pca.res) #"PC1 alone explained 76.5% of the variance in the narrative elements, with PC2 explaining an additional 13.8%. "
	round(summary(pca.res)$importance,3)
	write.csv(round(summary(pca.res)$importance,3), "pca.importance.csv")
	write.csv(round(pca.res$rotation,3), "pca.rotation.csv")
	
	pca.res  #look at loadings; sensory, conjunctions,connectivity, and appeal all load about evenly onto PC1.  So the take-home here is (all else being equal), more narrativity (as measured by a combination of setting, sensory, conjnuctions, connectivity, and appeal) is associated with more citations. however, narrative perspective does its own thing.
	
	#add PC1 and PC2 to res.df
	res.df<-data.frame(res.df, pc1, pc2)
	
#"This effect is independent of year of publication, number of authors, or abstract length"	
	summary(lm(Citations~Year+pc1, data=res.df))
	summary(lm(Citations~NumberOfAuthors+pc1, data=res.df))
	summary(lm(Citations~AbstractLength+pc1, data=res.df))


#Calculate journal means for Narrativity to regress on Impact Factor (avoiding pseudo-replication)
###more highly-cited journals are simply more narrative
meanCitations<-aggregate(res.df$Citations, by=list(res.df$Journal), mean)
	meanCitations[order(meanCitations[,2], decreasing=T),1][1:5]
	sdCitations<-aggregate(res.df$Citations, by=list(res.df$Journal), sd)
meanNarrativity<-aggregate(scores(pca.res)[,1], by=list(res.df$Journal), mean)
	meanNarrativity[order(meanNarrativity[,2], decreasing=F),1]
	sdNarrativity<-aggregate(scores(pca.res)[,1], by=list(res.df$Journal), sd)
meanImpact<-aggregate(res.df$Impact, by=list(res.df$Journal), mean)  #[note this isn't really a mean; it's just the journals' IFs for 2010]
meanEigen<-aggregate(res.df$Eigen, by=list(res.df$Journal), mean)  #[note this isn't really a mean; it's just the journals' Eigenfactors for 2010]

	#stats
	summary(lm(-meanNarrativity[,2] ~log(meanImpact[,2])))



###non-narrative independent variables

summary(lm(Citations ~ AbstractLength, data=res.df)) #significant, but this is due to journal effect...
	summary(lm(Citations ~AbstractLength+Journal, data=res.df))  #abstract length effect is due entirely to journal identity...
	summary(lm(AbstractLength~Journal, data=res.df)) # journals w shortest abstracts are the most highly cited

summary(lm(Citations ~ NumberOfAuthors, data=res.df)) #small but significant  (note: N authors is actually log(NumberOfAuthors), because that data type had a skewed distribution)
	summary(lm(Citations ~ NumberOfAuthors+Journal, data=res.df)) #remains significant even controlling for journal; adding log(1) authors adds log(.176) citations, on average. This is a tiny effect.
	exp(.176)/exp(1) #about .44 citations per author added, assuming a linear relationship


summary(lm(Citations ~ Journal, data=res.df))  #journal matters a lot, obv	
summary(lm(Citations ~ log(Impact), data=res.df)) #significant, obv

summary(lm(Citations ~Year, data=res.df)) # signif
	exp(.42) # year effect is small; moving back from log-scale to regular scale, it's 1.5 citations fewer in 2010 than 2009.


#Multiple linear regression
#using stepwise model selection
summary(stepAIC(lm(res.df $Citations~res.df$pc1+log(res.df$Impact)+res.df$Year+res.df$NumberOfAuthors+res.df$AbstractLength))) #best model still keeps pc1






################################################################################
######PLOTTING
################################################################################
###FIGURE 1
#multipanel plot; uncomment part of it to create PDF

				def.par <- par(no.readonly = TRUE) # save default, for resetting...
	
				#setEPS()
			tiff("Figure1.tiff", height=6, width=4, units="in", res=300)
				#pdf("Figure1.pdf", height=6, width=4)
				nf <- layout(matrix(c(1,2,3,4,5,6,7,7,7,7), 5, 2, byrow = TRUE), widths = rep.int(1.5, 2), respect = TRUE)
				#layout.show(nf)
				
					par(mgp=c(2,.5,0)) #distance between axis titles and the axes themselves
					par(mar=c(2,3,2,1))
				
				# #SUB1 Binary
					i=17
					boxplot(res.df$Citations ~ res.df[,i], main="Setting", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
						axis(1, c(1,2), c("No", "Yes"))
						if(wilcox.test(res.df$Citations[res.df[,i]==0], res.df$Citations[res.df[,i]==1], exact=F)$p.value<0.05){
							text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}
				##SUB2 Perspective
					i=4
					boxplot(res.df$Citations ~ res.df[,i], main="Narrative Perspective", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2],xlab="", xaxt="n")
						axis(1, c(1,2), c("No", "Yes"))
						if(wilcox.test(res.df$Citations[res.df[,i]==0], res.df$Citations[res.df[,i]==1], exact=F)$p.value<0.05){
							text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}
				
				# #SUB3  Sensory
					i=14
					plot(res.df$Citations ~ res.df[,i], main="Sensory Language", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
						if(cor.test(res.df$Citations, res.df[,i], method="spearman")$p.value){
							text(.75*max(res.df[,i]),.4*max(res.df$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
						
				# #SUB4	Conjunctions
					i=15
					plot(res.df$Citations ~ res.df[,i], main="Conjunctions", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
						if(cor.test(res.df$Citations, res.df[,i], method="spearman")$p.value){
							text(.75*max(res.df[,i]),.4*max(res.df$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
				
				#SUB5 Connectivity
					i=16
					plot(res.df$Citations ~ res.df[,i], main="Connectivity", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
						if(cor.test(res.df$Citations, res.df[,i], method="spearman")$p.value){
							text(.75*max(res.df[,i]),.4*max(res.df$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
				
				#SUB6  Appeal
					i=18
					boxplot(res.df$Citations ~ res.df[,i], main="Appeal to Reader", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
						axis(1, c(1,2), c("No", "Yes"))
						if(wilcox.test(res.df$Citations[res.df[,i]==0], res.df$Citations[res.df[,i]==1], exact=F)$p.value<0.05){
							text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}
						
				#SUB7  PCA plot
					par(mar=c(3,3,2,1))
					plot(res.df $Citations ~I(-pc1), ylab="Log(Citations)", xlab="Narrativity Index (PC1)", col=wes_palette("Darjeeling")[2], main="Narrativity Index", type='n')  #note PC1 inverted for clarity
					
					temp.df<-data.frame(res.df $Citations,I(-pc1)); temp.df<-temp.df[order(temp.df[,1]),]; names(temp.df)<-c("Citations","PC1")
						temp.mod<-lm(Citations~PC1, data=temp.df)
						newx <- seq(0, 1.5*max(temp.df[,2]), 0.1)
						mod.confint <- predict(temp.mod, data.frame(PC1=newx), interval="prediction") 	
					polygon(c(newx, rev(newx)), c(mod.confint[,3], rev(mod.confint[,2])), col=adjustcolor(col=wes_palette("Darjeeling")[3], alpha.f=.2), border=NA)
						points(res.df $Citations ~I(-pc1), pch=19, col=wes_palette("Darjeeling")[2], cex=.8)
						abline(temp.mod, col=wes_palette("Darjeeling")[1], lwd=2)
						text(3.5,2.3,bquote(R^2 == .(round(summary(temp.mod)$r.sq, 3))), cex=.7)
						text(3.5,1.9,bquote(p == .(format(coefficients(summary(temp.mod))[8], digits=2))), cex=.7)
				dev.off()
				#par(def.par)  #- reset to default








###FIGURE 2 #note: annoying labeling scheme allows individual adjustmet of labels.
					tiff("Figure2.tiff", height=7, width=7, units="in", res=300)
					#pdf("Figure2.pdf", height=7, width=7)
					par(mar=c(4,4,3,2))
					plot(-meanNarrativity[,2] ~log(meanImpact[,2]), pch=19, ylab="Mean Narrativity Index (PC1)", xlab="Log(Journal Impact Factor)", col=wes_palette("Darjeeling")[2], type='n', xlim=c(0.3,3.6))
						#calc 95% CI
						temp.df<-data.frame(-meanNarrativity[,2],log(meanImpact[,2])); temp.df<-temp.df[order(temp.df[,1]),]; names(temp.df)<-c("Narrativity","Impact")
							temp.mod<-lm(Narrativity~Impact, data=temp.df)
							newx <- seq(0, 1.1*max(temp.df[,2], na.rm=T), 0.1)
							mod.confint <- predict(temp.mod, data.frame(Impact=newx), interval="prediction") 	
						polygon(c(newx, rev(newx)), c(mod.confint[,3], rev(mod.confint[,2])), col=adjustcolor(col=wes_palette("Darjeeling")[3], alpha.f=.2), border=NA)
							#clip(min(log(meanImpact[,2]))-.1, max(log(meanImpact[,2]))+.1, min(-meanNarrativity[,2]), max(-meanNarrativity[,2]))
							abline(lm(-meanNarrativity[,2] ~log(meanImpact[,2])), col=wes_palette("Darjeeling")[1], lwd=2)
								points(-meanNarrativity[,2] ~log(meanImpact[,2]), pch=19, col=wes_palette("Darjeeling")[2])
						text(log(meanImpact[1,2]), -meanNarrativity[1,2]+0.015, labels=toTitleCase(wrap_strings(meanCitations[1,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[2,2])-.18, -meanNarrativity[2,2], labels=toTitleCase(wrap_strings(meanCitations[2,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[3,2]), -meanNarrativity[3,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[3,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[4,2]), -meanNarrativity[4,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[4,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[5,2]), -meanNarrativity[5,2]+0.025, labels=toTitleCase(wrap_strings(meanCitations[5,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[6,2]), -meanNarrativity[6,2]+0.03, labels=toTitleCase(wrap_strings(meanCitations[6,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[7,2])-.14, -meanNarrativity[7,2], labels=toTitleCase(wrap_strings(meanCitations[7,1], 20)), cex=0.4, lwd=2)
						text(log(meanImpact[8,2]), -meanNarrativity[8,2]+0.03, labels=toTitleCase(wrap_strings(meanCitations[8,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[9,2])-.15, -meanNarrativity[9,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[9,1], 20)), cex=0.4, lwd=2)
				text(log(meanImpact[10,2])+.11, -meanNarrativity[10,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[10,1], 20)), cex=0.4, lwd=2)
				text(log(meanImpact[11,2]), -meanNarrativity[11,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[11,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[12,2]), -meanNarrativity[12,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[12,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[13,2]), -meanNarrativity[13,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[13,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[14,2]), -meanNarrativity[14,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[14,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[15,2]), -meanNarrativity[15,2]+0.017, labels=toTitleCase(wrap_strings(meanCitations[15,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[16,2])-.1, -meanNarrativity[16,2]+0.02, labels=toTitleCase(wrap_strings(meanCitations[16,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[17,2]), -meanNarrativity[17,2]+0.02, labels=toTitleCase(wrap_strings(meanCitations[17,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[18,2]), -meanNarrativity[18,2]+0.02, labels=toTitleCase(wrap_strings(meanCitations[18,1], 20)), cex=0.4, lwd=2)
					text(log(meanImpact[19,2])+.1, -meanNarrativity[19,2]+0.01, labels=toTitleCase(wrap_strings(meanCitations[19,1], 20)), cex=0.4, lwd=2)
													
					dev.off()


###Supplemental figure: subsets by year
pca.res2009=prcomp(df2009[,c(17,4,14,15,16,18)], center=F, scale.=T)
pca.res2010=prcomp(df2010[,c(17,4,14,15,16,18)], center=F, scale.=T)

					###2009
					pc1=scores(pca.res2009)[,1]	
					#def.par <- par(no.readonly = TRUE) # save default, for resetting...
					
					tiff("SupplFigure2009.tiff", height=6, width=4, units="in", res=300)
					#pdf("SupplFigure2009.pdf", height=6, width=4)
					nf <- layout(matrix(c(1,2,3,4,5,6,7,7,7,7), 5, 2, byrow = TRUE), widths = rep.int(1.5, 2), respect = TRUE)
					#layout.show(nf)
					
						par(mgp=c(2,.5,0)) #distance between axis titles and the axes themselves
						par(mar=c(2,3,2,1))
					
					# #SUB1 Binary
						i=17
						boxplot(df2009$Citations ~ df2009[,i], main="Setting", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2009 $Citations[df2009[,i]==0], df2009 $Citations[df2009[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}		
					##SUB2 Perspective
						i=4
						boxplot(df2009$Citations ~ df2009[,i], main="Narrative Perspective", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2],xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2009 $Citations[df2009[,i]==0], df2009 $Citations[df2009[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}
					# #SUB3  Sensory
						i=14
						plot(df2009$Citations ~ df2009[,i], main="Sensory Language", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2009$Citations, df2009[,i])$p.value){
								text(.75*max(df2009[,i]),.35*max(df2009$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
							
					# #SUB4	Conjunctions
						i=15
						plot(df2009$Citations ~ df2009[,i], main="Conjunctions", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2009$Citations, df2009[,i])$p.value){
								text(.75*max(df2009[,i]),.35*max(df2009$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB5 Connectivity
						i=16
						plot(df2009$Citations ~ df2009[,i], main="Connectivity", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2009$Citations, df2009[,i])$p.value){
								text(.75*max(df2009[,i]),.35*max(df2009$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB6  Appeal
						i=18
						boxplot(df2009$Citations ~ df2009[,i], main="Appeal to Reader", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2009 $Citations[df2009[,i]==0], df2009 $Citations[df2009[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}		
										
					#SUB7  PCA plot
						par(mar=c(3,3,2,1))
						plot(df2009 $Citations ~I(-pc1), ylab="Log(Citations)", xlab="Narrativity Index (PC1)", col=wes_palette("Darjeeling")[2], main="Narrativity Index")  #note PC1 inverted for clarity
							clip(min(I(-pc1)), max(I(-pc1)), min(df2009$Citations), max(df2009$Citations))
							mod=lm(df2009 $Citations ~I(-pc1))
							abline(mod, col=wes_palette("Darjeeling")[1], lwd=2)
							text(3.5,2.7,bquote(R^2 == .(round(summary(mod)$r.sq, 3))), cex=.7)
							text(3.5,2.4,bquote(p == .(format(coefficients(summary(mod))[8], digits=2))), cex=.7)
					dev.off()					
					#par(def.par)  #- reset to default
					
					
					###2010
					pc1=scores(pca.res2010)[,1]					
					#def.par <- par(no.readonly = TRUE) # save default, for resetting...

					tiff("SupplFigure2010.tiff", height=6, width=4, units="in", res=300)					
					#pdf("SupplFigure2010.pdf", height=6, width=4)
					nf <- layout(matrix(c(1,2,3,4,5,6,7,7,7,7), 5, 2, byrow = TRUE), widths = rep.int(1.5, 2), respect = TRUE)
					#layout.show(nf)
					
						par(mgp=c(2,.5,0)) #distance between axis titles and the axes themselves
						par(mar=c(2,3,2,1))
					
					# #SUB1 Binary
						i=17
						boxplot(df2010$Citations ~ df2010[,i], main="Setting", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2010 $Citations[df2010[,i]==0], df2010 $Citations[df2010[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}			
					##SUB2 Perspective
						i=4
						boxplot(df2010$Citations ~ df2010[,i], main="Narrative Perspective", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2],xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2010 $Citations[df2010[,i]==0], df2010 $Citations[df2010[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}	
					# #SUB3  Sensory
						i=14
						plot(df2010$Citations ~ df2010[,i], main="Sensory Language", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2010$Citations, df2010[,i])$p.value){
								text(.75*max(df2010[,i]),.35*max(df2010$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
							
					# #SUB4	Conjunctions
						i=15
						plot(df2010$Citations ~ df2010[,i], main="Conjunctions", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2010$Citations, df2010[,i])$p.value){
								text(.75*max(df2010[,i]),.35*max(df2010$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB5 Connectivity
						i=16
						plot(df2010$Citations ~ df2010[,i], main="Connectivity", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(df2010$Citations, df2010[,i])$p.value){
								text(.75*max(df2010[,i]),.35*max(df2010$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB6  Appeal
						i=18
						boxplot(df2010$Citations ~ df2010[,i], main="Appeal to Reader", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(df2010 $Citations[df2010[,i]==0], df2010 $Citations[df2010[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}			
										
					#SUB7  PCA plot
						par(mar=c(3,3,2,1))
						plot(df2010 $Citations ~I(-pc1), ylab="Log(Citations)", xlab="Narrativity Index (PC1)", col=wes_palette("Darjeeling")[2], main="Narrativity Index")  #note PC1 inverted for clarity
							clip(min(I(-pc1)), max(I(-pc1)), min(df2010$Citations), max(df2010$Citations))
							mod=lm(df2010 $Citations ~I(-pc1))
							abline(mod, col=wes_palette("Darjeeling")[1], lwd=2)
							text(3.5,2.7,bquote(R^2 == .(round(summary(mod)$r.sq, 3))), cex=.7)
							text(3.5,2.3,bquote(p == .(format(coefficients(summary(mod))[8], digits=2))), cex=.7)
					dev.off()					
					#par(def.par)  #- reset to default


####with outliers removed, supplemental multiplot

				###OUTLIER Identification
						#fit reasonable distributions to non-binary variables to reliably find outliers
						distparams=fitdistr(res.df$NormalizedConjunctions, "gamma")$estimate
							#plot that distribution
							x=seq(0,0.06,0.001)
							plot(dgamma(x, shape= distparams[1], rate= distparams[2])~x)
							hist(res.df$NormalizedConjunctions, add=T, freq=F)
							probs=pgamma(res.df$NormalizedConjunctions, shape=distparams[1], rate=distparams[2])
							outliers_conjunctions =which(probs>0.995)
						
						distparams=fitdistr(res.df$NormalizedConnectivity, "gamma")$estimate
							x=seq(0,0.06,0.001)
							plot(dgamma(x, shape= distparams[1], rate= distparams[2])~x)
							hist(res.df$NormalizedConnectivity, add=T, freq=F)
							probs=pgamma(res.df$NormalizedConnectivity, shape=distparams[1], rate=distparams[2])
							outliers_connectivity =which(probs>0.995)
						
						distparams=fitdistr(res.df$AbstractLength, "normal")$estimate
							#plot that distribution
							x=seq(0,500,10)
							plot(dnorm(x, distparams[1], distparams[2])~x)
							hist(res.df$AbstractLength, add=T, freq=F)
							probs=pnorm(res.df$AbstractLength, distparams[1], distparams[2])
							outliers_absLength=which(probs<0.005|probs>0.995)
						
						distparams=fitdist(res.df$NumberOfAuthors, "gamma", method="mme")$estimate #note: using fitdistrplus here; better optimization power than fitdistr using method of moments
							#plot that distribution
							x=seq(0,10,.1)
							plot(dgamma(x, shape= distparams[1], rate= distparams[2])~x)
							hist(res.df$NumberOfAuthors, add=T, freq=F)
							probs=pgamma(res.df$NumberOfAuthors, , shape=distparams[1], rate=distparams[2])
							outliers_numberauthors=which(probs>0.995)
								res.df$NumberOfAuthors[outliers_numberauthors]
						
						distparams=fitdistr(res.df$Citations, "normal")$estimate
							#plot that distribution
							x=seq(0,10,1)
							plot(dnorm(x, distparams[1], distparams[2])~x)
							hist(res.df$Citations, add=T, freq=F)
							probs=pnorm(res.df$Citations, distparams[1], distparams[2])
							outliers_cites=which(probs<0.005|probs>0.995)
								res.df$Citations[outliers_cites]
						
						graphics.off() #close quartz windows
						
						#total N outliers
						length(unique(c(outliers_conjunctions, outliers_connectivity, outliers_absLength, outliers_numberauthors, outliers_cites)))


						#remove outlier rows from results in main data frame
						res.df_wo_outliers=res.df[-unique(c(outliers_conjunctions, outliers_connectivity, outliers_absLength, outliers_numberauthors, outliers_cites)),]
						dim(res.df)

					tiff("SupplFigure_wo_outliers.tiff", height=6, width=4, units="in", res=300)
					#pdf("SupplFigure_wo_outliers.pdf", height=6, width=4)
					nf <- layout(matrix(c(1,2,3,4,5,6,7,7,7,7), 5, 2, byrow = TRUE), widths = rep.int(1.5, 2), respect = TRUE)
					#layout.show(nf)
					
						par(mgp=c(2,.5,0)) #distance between axis titles and the axes themselves
						par(mar=c(2,3,2,1))
					
					# #SUB1 Binary
						i=17
						boxplot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Setting", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==0], res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}			
					##SUB2 Perspective
						i=4
						boxplot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Narrative Perspective", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2],xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==0], res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}	
					# #SUB3  Sensory
						i=14
						plot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Sensory Language", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(res.df_wo_outliers$Citations, res.df_wo_outliers[,i])$p.value){
								text(.75*max(res.df_wo_outliers[,i]),.35*max(res.df_wo_outliers$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
							
					# #SUB4	Conjunctions
						i=15
						plot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Conjunctions", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(res.df_wo_outliers$Citations, res.df_wo_outliers[,i])$p.value){
								text(.75*max(res.df_wo_outliers[,i]),.35*max(res.df_wo_outliers$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB5 Connectivity
						i=16
						plot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Connectivity", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="")
							if(cor.test(res.df_wo_outliers$Citations, res.df_wo_outliers[,i])$p.value){
								text(.75*max(res.df_wo_outliers[,i]),.35*max(res.df_wo_outliers$Citations), "*", cex=2, col=wes_palette("Darjeeling")[1])}
					
					#SUB6  Appeal
						i=18
						boxplot(res.df_wo_outliers$Citations ~ res.df_wo_outliers[,i], main="Appeal to Reader", ylab="Log(Citations)", col=wes_palette("Darjeeling")[2], xlab="", xaxt="n")
							axis(1, c(1,2), c("No", "Yes"))
							if(wilcox.test(res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==0], res.df_wo_outliers $Citations[res.df_wo_outliers[,i]==1], exact=F)$p.value<0.05){
								text(1.5,5.5, "*", cex=2, col=wes_palette("Darjeeling")[1])}			
										
					#SUB7  PCA plot
						par(mar=c(3,3,2,1))
						plot(res.df_wo_outliers $Citations ~I(-res.df_wo_outliers $pc1), ylab="Log(Citations)", xlab="Narrativity Index (PC1)", col=wes_palette("Darjeeling")[2], main="Narrativity Index")  #note PC1 inverted for clarity
							clip(min(I(-pc1)), max(I(-res.df_wo_outliers $pc1)), min(res.df_wo_outliers$Citations), max(res.df_wo_outliers$Citations))
							mod=lm(res.df_wo_outliers $Citations ~I(-res.df_wo_outliers $pc1))
							abline(mod, col=wes_palette("Darjeeling")[1], lwd=2)
							text(3.5,2.7,bquote(R^2 == .(round(summary(mod)$r.sq, 3))), cex=.7)
							text(3.5,2.3,bquote(p == .(format(coefficients(summary(mod))[8], digits=2))), cex=.7)
					dev.off()					
					#par(def.par)  #- reset to default






