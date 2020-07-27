#####load required libraries and functions
library(lattice); library(Hmisc); library(vegan); library(MASS);library(lmtest); library(wesanderson); library(tools); library(fitdistrplus)  #may need to install.packages, if these aren't on a user's system
bit=function(x){print(x[c(1:10),c(1:10)]); print(dim(x))}  #shows top-left corner of a data.frame/matrix; useful for large datasets
wrap_strings <- function(vector_of_strings,width){
  as.character(sapply(vector_of_strings,
                      FUN<-function(x){paste(strwrap(x,width=width), collapse="\n")}
  ))}

#####load raw data
rawdata=read.csv("data-raw/narrative_style/journal.pone.0167983.s009.csv")
impact=read.csv("data-raw/narrative_style/impact.csv", header=T, row.names=1, as.is=T)
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

climate <- res.df
climate <- select(climate, -Eigen)
climate <- janitor::clean_names(climate)
save(list = c("climate"), file = "data/climate.rda")
