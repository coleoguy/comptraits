# Jorja Burch - jorjaelliott@tamu.edu

# diploid biallelic 
# 20 unlinked loci
# forward time population genetic simulation
library(scales)
source("simulation.funcs.R")
N <- 500
loci <- 20
gen <- 100
reps <- 100


##### SIMULATION 1 ##### 
## elemental archs: a & d
## betas: 7.576, 0.788
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAa 
## inferred arch beta: 1.891
## inferred arch mu: 7.772
GetRange(arch1 = "add",
         arch2 = "dom", deffnc = "ratio",
         mu1 = 30, mu2 = 3,
         beta1 =7.576, beta2 = 0.788,
         single.arch = "none")
# 5.9, 12.5
GetRange(mu1 = 7.772, 
         beta1 =1.891, 
         single.arch = "add.x.add")
# 7.77, 9.663
# So we might evaluate this pairing with an optimum of 7.7 or 9.6
# based on exploration of sigmas we have chosen a sigma of 1 for both of these

res.aa.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 1, opt = 9.6, 
                                      mu1 = 30, mu2 = 3,
                                      beta1 =7.576, beta2 = 0.788,
                                      single.arch = NULL)
#write.csv(res.aa.compound.trait, 
          #file = "../../results/selection simulation results/res.aa.compound.trait.csv")
res.aa.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 1, opt = 9.6, mu1 = 7.772,
                                    beta1 = 1.891, single.arch = "add.x.add")
#write.csv(res.aa.single.trait, 
          #file = "../../results/selection simulation results/res.aa.single.trait.csv")
res.aa.single.trait100 <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = 100, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 1, opt = 9.6, mu1 = 7.772,
                                    beta1 = 1.891, single.arch = "add.x.add")
#write.csv(res.aa.single.trait100, 
          #file = "../../results/selection simulation results/res.aa.single.trait100.csv")

# plot generating trait arch
plot(res.aa.compound.trait[1,], type="l", 
     ylim=c(range(c(res.aa.single.trait, res.aa.compound.trait))),
     ylab="Trait Value", xlab="Generations", main = "Inferred Arch: AaAa", col=alpha("blue",0.5), lwd=0.5)
for(i in 2:nrow(res.aa.compound.trait)){
  lines(res.aa.compound.trait[i,], col=alpha("blue", 0.5), lwd=0.5)
}
# add inferred trait arch
for(i in 1:nrow(res.aa.single.trait)){
  lines(res.aa.single.trait[i,], col=alpha("red",0.5), lwd=0.5)
}
for(i in 1:nrow(res.aa.single.trait100)){
  lines(res.aa.single.trait100[i,], col=alpha("orange", 0.5), lwd=0.5)
}
meanline_comp <- colMeans(res.aa.compound.trait)
meanline_sing <- colMeans(res.aa.single.trait)
meanline_sing100 <- colMeans(res.aa.single.trait100)
lines(meanline_comp, col="dark blue", lwd=3)
lines(meanline_sing, col="dark red", lwd=3)
lines(meanline_sing100, col="dark orange", lwd=3)

legend("topleft", legend=c("Inferred Trait", "Inferred Trait N=100", "Generating Trait"),
       col=c("red", "orange", "blue"), lwd=2, lty=1, bty="n", cex=0.7)
##### SIMULATION 1 #####


##### SIMULATION 2 #####
## elemental archs: a & d
## betas: 7.52, 0.76
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAd 
## inferred arch beta: 3.165
## inferred arch mu: 9.44
GetRange(arch1 = "add",
         arch2 = "dom", deffnc = "ratio",
         mu1 = 30, mu2 = 3,
         beta1 =7.52, beta2 = 0.76,
         single.arch = "none")
# 5.978, 12.5067
GetRange(mu1 = 9.44, 
         beta1 =3.165, 
         single.arch = "add.x.dom")
# 8.649, 10.231
# So we might evaluate this pairing with an optimum of 8.649 or 10.231
# based on exploration of sigmas we have chosen a sigma of 1 for both of these

res.ad.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 1, opt = 10.231, 
                                      mu1 = 30, mu2 = 3,
                                      beta1 =7.52, beta2 = 0.76,
                                      single.arch = NULL)
#write.csv(res.ad.compound.trait, 
          #file = "../../results/selection simulation results/res.ad.compound.trait.csv")
res.ad.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 0.4, opt = 10.231, mu1 = 9.44,
                                    beta1 = 3.165, single.arch = "add.x.dom")
#write.csv(res.ad.single.trait, 
          #file = "../../results/selection simulation results/res.ad.single.trait.csv")

# plot generating trait arch
plot(res.ad.compound.trait[1,], type="l", 
     ylim=c(range(c(res.ad.single.trait, res.ad.compound.trait))),
     ylab="Trait Value", xlab="Generations", main="Inferred Arch: AaAd", col=alpha("blue",0.5), lwd=0.5)
for(i in 2:nrow(res.ad.compound.trait)){
  lines(res.ad.compound.trait[i,], col=alpha("blue", 0.5), lwd=0.5)
}
# add inferred trait arch
for(i in 1:nrow(res.ad.single.trait)){
  lines(res.ad.single.trait[i,], col=alpha("red",0.5), lwd=0.5)
}
meanline_comp <- colMeans(res.ad.compound.trait)
meanline_sing <- colMeans(res.ad.single.trait)
lines(meanline_comp, col="dark blue", lwd=3)
lines(meanline_sing, col="dark red", lwd=3)
legend("topleft", legend=c("Inferred Trait", "Generating Trait"),
       col=c("red", "blue"), lwd=2, lty=1, bty="n", cex=0.7)
##### SIMULATION 2 #####


##### SIMULATION 3 ####
## elemental archs: a & d
## betas: 9.39, 1.694
## mu: 50, 6
## defining function: RATIO
## inferred arch: AdAd 
## inferred arch beta: 1.763
## inferred arch mu: 7.275
GetRange(arch1 = "add",
         arch2 = "dom", deffnc = "ratio",
         mu1 = 50, mu2 = 6,
         beta1 = 9.39, beta2 = 1.694,
         single.arch = "none")
# 5.278, 12.5
GetRange(mu1 = 7.275, 
         beta1 = 1.763, 
         single.arch = "dom.x.dom")
# 7.275, 9.038
# So we might evaluate this pairing with an optimum of 7.275 or 9.038
# based on exploration of sigmas we have chosen a sigma of 1 for both of these

res.dd.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "dom", deffnc = "ratio",
                                      sigma = 1, opt = 9.038, 
                                      mu1 = 50, mu2 = 6,
                                      beta1 = 9.39, beta2 = 1.694,
                                      single.arch = NULL)
#write.csv(res.dd.compound.trait, 
          #file = "../../results/selection simulation results/res.dd.compound.trait.csv")
res.dd.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 0.4, opt = 9.038, mu1 = 7.275,
                                    beta1 = 1.763, single.arch = "dom.x.dom")
#write.csv(res.dd.single.trait, 
          #file = "../../results/selection simulation results/res.dd.single.trait.csv")

# plot generating trait arch
plot(res.dd.compound.trait[1,], type="l", 
     ylim=c(range(c(res.dd.single.trait, res.dd.compound.trait))),
     ylab="Trait Value", xlab="Generations", main="Inferred Arch: AdAd", col=alpha("blue",0.5), lwd=0.5)
for(i in 2:nrow(res.dd.compound.trait)){
  lines(res.dd.compound.trait[i,], col=alpha("blue", 0.5), lwd=0.5)
}
# add inferred trait arch
for(i in 1:nrow(res.dd.single.trait)){
  lines(res.dd.single.trait[i,], col=alpha("red",0.5), lwd=0.5)
}
meanline_comp <- colMeans(res.dd.compound.trait)
meanline_sing <- colMeans(res.dd.single.trait)
lines(meanline_comp, col="dark blue", lwd=3)
lines(meanline_sing, col="dark red", lwd=3)
legend("topleft", legend=c("Inferred Trait", "Generating Trait"), 
       col=c("red", "blue"), lwd=2, lty=1, bty="n", cex=0.7)
##### SIMULATION 3 ####



