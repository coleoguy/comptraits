# line cross analysis simulations
library(SAGA2)

# We will be pulling data from our past empirical study of traits
# These results have 8 rows for each dataset so we will be counting 
# by 8s when we are pulling the data out.
starts <- seq(from=0, by=8, length.out=6000)

# For all sims we will use the cohorts P1, P2, F1, BC1, BC2
# this will read in an empty datamatrix that has no values for means or
# standard errors but the crossing structure is defined and the environment
# is set to be the same for all cohorts.
blank <- read.csv("../data/cross.structure.csv")[-c(5,7),]

# get the generating c-matrix
cmat <- read.csv("../data/sim data/gen.cmat.csv")[,-1]
replicate <- 1000

getExpected <- function(dat, cmat){
  res1 <- LCA(dat1, Cmatrix = cmat, SCS="NSC")
  effects <- res1$varimp[which(as.numeric(res1$varimp[,2]) >= 0.5)]
  eff2 <- which(colnames(res1$estimates) %in% effects)
  valbeta <- c()
  for(i in 1:length(eff2)){
    checker <- abs(as.numeric(res1$estimates[,eff2[i]]))
    hit <- checker[1] > checker[2]
    if(hit){
      valbeta <- c(valbeta, eff2[i])
    }
  }
  val.ests <- res1$estimates[, c(1,valbeta)]
  red.cmat <- cmat[,colnames(cmat) %in% colnames(val.ests)]
  exp.cont <- as.data.frame(red.cmat)
  for(i in 1:ncol(red.cmat)){
    exp.cont[,i] <- as.numeric(red.cmat[,i]) * as.numeric(val.ests[1,i])
  }
  x <- rowSums(exp.cont)
  names(x) <- cmat[,1]
  return(x)
}

getSimDat <- function(expvals, n, emp.sd, dat1, samples=100){
  results <- list()
  for(i in 1:samples){
    cursamp <- dat1
    for(j in 1:nrow(dat1)){
      curcohort <- rnorm(n, mean=expvals[j], sd=emp.sd[j])
      cursamp[j, 2] <- mean(curcohort)
      cursamp[j, 3] <- sd(curcohort)/sqrt(n)
    }
    results[[i]] <- cursamp
  }
  return(results)
}

dif <- function(x){
  x <- range(x)
  z <- x[2]-x[1]
  return(z)
}

# getVals conditions on the inference being significant.
getVals <- function(x){
  foo <- x$estimates[,c(F, x$varimp[,2]>.5), drop=F]
  zed <- (abs(as.numeric(foo[1,]))-as.numeric(foo[2,])) > 0
  foo <- foo[,zed, drop=F]
  return(list(colnames(foo), as.numeric(foo[1,])))
}

#results container
results <- as.data.frame(matrix(NA,48000, 7))
colnames(results) <- c("trait","beta","Aa","Ad","AaAa","AaAd","AdAd")

# standard deviation proportion based on a reasonable value from empirical 
# datasets that we have studied.
sdp <- .1

# based on a typical sample size per cohort of empircal datasets
n <- 20

# build containers for simulated data
simdata <- vector(mode = "list", length = 6)
names(simdata) <- c("AA", "AD", "AE", "DD", "DE", "EE")

# these abbreviations indicate the architecture of the traits being combined
# if AA, use Aa for both simple datasets
# if AD, use Aa for one dataset and Ad for the other
# if AE, use Aa for one dataset and sample (AaAa, AaAd, AdAd) for the other
# if DD, use Ad for both simple datasets
# if DE, use Ad for one dataset and sample (AaAa, AaAd, AdAd) for the other
# if EE, sample (AaAa, AaAd, AdAd) twice, one for each dataset

# files for the 1606 empirical datasets from Burch et al., 2024 
empfiles <- list.files("../data/empirical data/data/")

# cycle through all genetic architectures
for(i in 1:length(simdata)){
  # marginalize across empirical characters, 
  # and compounding functions
  for(j in 1:replicate){
    print(paste("working on J:", j))
    set.seed(i*j)
    simp1 <- simp2 <- blank
    comp1 <- comp2 <- comp3 <- comp4 <- comp5 <- comp6 <- blank
    x <-   switch(i,
                  "1" = c(3,3),
                  "2" = c(3,4),
                  "3" = c(3, sample(5:7, 1)),
                  "4" = c(4,4),
                  "5" = c(4,sample(5:7, 1)),
                  "6" = sample(5:7, 2, replace=T))
    # this will create vectors of the opportunity for the 
    # current architecture to impact a trait
    cmat1 <- cmat[,x[1]]
    cmat2 <- cmat[,x[2]]
    #trait 1 basis
    empdat1 <- read.csv(paste("../data/empirical data/data/", 
                              sample(empfiles, 1), sep=""))
    # get mean of the first empirical trait
    mu1 <- mean(empdat1$mean)
    # get the range of the first empirical trait
    rng1 <- range(empdat1$mean)

    #trait 2 basis
    empdat2 <- read.csv(paste("../data/empirical data/data/", 
                              sample(empfiles, 1), sep=""))
    # get the mean of the second empirical trait
    mu2 <- mean(empdat2$mean)
    # get the range of the second empirical trait
    rng2 <- range(empdat2$mean)
    
    # simulate elemental traits
    bet1 <- dif(rng1)/dif(cmat1)
    bet2 <- dif(rng2)/dif(cmat2)
    for(k in 1:nrow(cmat)){
      # trait 1
      trait1 <- rnorm(mean = mu1+bet1*cmat1[k], 
                      sd = abs(mu1*sdp), 
                      n=n)
      simp1$mean[k]<- mean(trait1)
      simp1$SE[k] <- sd(trait1)/sqrt(n)
      # trait 2
      trait2 <- rnorm(mean = mu2+bet2*cmat2[k], 
                      sd = abs(mu2*sdp), 
                      n=n)
      simp2$mean[k]<- mean(trait2)
      simp2$SE[k] <- sd(trait2)/sqrt(n)
      # generate 6 types of functions
      # comp1: quotient _ x/y
      # comp2: quotient _ y/x
      # comp3: product _ x * y
      # comp4: sum _ x + y
      # comp5: difference _ x - y
      # comp6: difference _ y - x
      
      # generate the compound traits based on each of the 6 functions
      comp1$mean[k] <- mean(trait1/trait2)
      comp1$SE[k] <- sd(trait1/trait2) / sqrt(n)
      
      comp2$mean[k] <- mean(trait2/trait1)
      comp2$SE[k] <- sd(trait2/trait1) / sqrt(n)
      
      comp3$mean[k] <- mean(trait1*trait2)
      comp3$SE[k] <- sd(trait1*trait2) / sqrt(n)
      
      comp4$mean[k] <- mean(trait1+trait2)
      comp4$SE[k] <- sd(trait1+trait2) / sqrt(n)
      
      comp5$mean[k] <- mean(trait1-trait2)
      comp5$SE[k] <- sd(trait1-trait2) / sqrt(n)
      
      comp6$mean[k] <- mean(trait2-trait1)
      comp6$SE[k] <- sd(trait2-trait1) / sqrt(n)
    }
    keep.pars <- c("Aa","Ad","AaAa","AaAd","AdAd")
    dat <- list(simp1,simp2,comp1,comp2,comp3,comp4,comp5,comp6)
    res <- list()
    for(m in 1:length(dat)){
      res[[m]] <- getVals(LCA(data=dat[[m]], SCS="NSC", 
                          keep.pars = keep.pars, messages=F))
      
      results[(starts[1]+m), colnames(results) %in% res[[m]][[1]]] <- res[[m]][[2]]
      if(m == 1){
        results$beta[(starts[1]+1)] <- bet1
        results$beta[(starts[1]+2)] <- bet2
      }
    }
    z <- (starts[1]+1)
    s1<-colnames(cmat)[x[[1]]]
    s2<-colnames(cmat)[x[[2]]]
    results$trait[(z:(z+7))] <- c(s1,s2,paste(s1,"/",s2),
                                paste(s2,"/",s1),
                                paste(s1,"*",s2),
                                paste(s1,"+",s2),
                                paste(s1,"-",s2),
                                paste(s2,"-",s1))
    starts <- starts[-1]
  }
}
    
# save results of simulation into csv file
write.csv(results,file="../results/sim.results.csv", row.names = F)
