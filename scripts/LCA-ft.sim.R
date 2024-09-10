# diploid biallelic 
# 20 unlinked loci
# forward time population genetic simulation
source("simulation.funcs.R")
N <- 500
loci <- 20
gen <- 100
reps <- 10


##### SIMULATION 1 ##### 
## elemental archs: a & d
## betas: 7.576, 0.788
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAa 
## inferred arch beta: 1.891
## inferred arch mu: 7.772
res.aa.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 3, opt = 5, 
                                      mu1 = 30, mu2 = 3,
                                      beta1 =7.576, beta2 = 0.788,
                                      single.arch = NULL)
res.aa.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 3, opt = 7, mu1 = 7.772,
                                    beta1 = 1.891, single.arch = "add.x.add")

# plot generating trait arch
plot(res.aa.compound.trait[1,], type="l", 
     ylim=c(range(c(res.aa.single.trait, res.aa.compound.trait))),
     ylab="Trait Value", xlab="Generations", main = "Inferred Arch: AaAa")
for(i in 2:nrow(res.aa.compound.trait)){
  lines(res.aa.compound.trait[i,], col="blue")
}
# add inferred trait arch
for(i in 1:nrow(res.aa.single.trait)){
  lines(res.aa.single.trait[i,], col="red")
}
legend("topright", legend=c("Inferred Trait", "Generating Trait"),
       col=c("red", "blue"), lty=1, bty="n", cex=0.7)
##### SIMULATION 1 #####


##### SIMULATION 2 #####
## elemental archs: a & d
## betas: 7.52, 0.76
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAd 
## inferred arch beta: 3.165
## inferred arch mu: 9.44
res.ad.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 1, opt = 4, 
                                      mu1 = 30, mu2 = 3,
                                      beta1 =7.52, beta2 = 0.76,
                                      single.arch = NULL)
res.ad.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 1, opt = 4, mu1 = 9.44,
                                    beta1 = 3.165, single.arch = "add.x.dom")

# plot generating trait arch
plot(res.ad.compound.trait[1,], type="l", 
     ylim=c(range(c(res.ad.single.trait, res.ad.compound.trait))),
     ylab="Trait Value", xlab="Generations", main="Inferred Arch: AaAd")
for(i in 2:nrow(res.ad.compound.trait)){
  lines(res.ad.compound.trait[i,], col="blue")
}
# add inferred trait arch
for(i in 1:nrow(res.ad.single.trait)){
  lines(res.ad.single.trait[i,], col="red")
}
legend("topright", legend=c("Inferred Trait", "Generating Trait"),
       col=c("red", "blue"), lty=1, bty="n", cex=0.7)
##### SIMULATION 2 #####


##### SIMULATION 3 ####
## elemental archs: a & d
## betas: 9.39, 1.694
## mu: 50, 6
## defining function: RATIO
## inferred arch: AdAd 
## inferred arch beta: 1.763
## inferred arch mu: 7.275
res.dd.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 1, opt = 3, 
                                      mu1 = 50, mu2 = 6,
                                      beta1 = 9.39, beta2 = 1.694,
                                      single.arch = NULL)
res.dd.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 1, opt = 3, mu1 = 7.275,
                                    beta1 = 1.763, single.arch = "dom.x.dom")

# plot generating trait arch
plot(res.dd.compound.trait[1,], type="l", 
     ylim=c(range(c(res.dd.single.trait, res.dd.compound.trait))),
     ylab="Trait Value", xlab="Generations", main="Inferred Arch: AdAd")
for(i in 2:nrow(res.dd.compound.trait)){
  lines(res.dd.compound.trait[i,], col="blue")
}
# add inferred trait arch
for(i in 1:nrow(res.dd.single.trait)){
  lines(res.dd.single.trait[i,], col="red")
}
legend("topright", legend=c("Inferred Trait", "Generating Trait"), 
       col=c("red", "blue"), lty=1, bty="n", cex=0.7)
##### SIMULATION 3 ####



