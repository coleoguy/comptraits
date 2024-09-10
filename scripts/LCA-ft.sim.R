# dipliod biallelic 
# 20 unlinked loci
# foward time population genetic simulation
source("simulation.funcs.R")
N <- 50
loci <- 20
gen <- 100
reps <- 5




# SIMULATION 1
## TODO Figure out why this case leads to always selecting for zeros in trait
## 2 portion of the genome
## elemental archs: a & d
## betas: 7.576, 0.788
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAa (best example for this inferred arch)
res.aa.compound.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                      N = N, arch1 = "add",
                                      arch2 = "add", deffnc = "sum",
                                      sigma = 1, opt = 4, 
                                      mu1 = 10, mu2 = 10,
                                      beta1 = 8, beta2 = 8,
                                      single.arch = NULL)
res.aa.single.trait <- SimulateCond(reps = reps, gen = gen, loci = loci,
                                    N = N, arch1 = NULL,
                                    arch2 = NULL, deffnc = "none",
                                    sigma = 1, opt = 15, mu1 = 10,
                                    beta1 = 5, single.arch = "add.x.add")

# plot generating trait arch
plot(res.aa.compound.trait[1,], type="l", 
     ylim=c(range(c(res.aa.single.trait, res.aa.compound.trait))),
     ylab="Trait Value", xlab="Generations")
for(i in 2:nrow(res.aa.compound.trait)){
  lines(res.aa.compound.trait[i,], col="blue")
}
# add inferred trait arch
for(i in 1:nrow(res.aa.single.trait)){
  lines(res.aa.single.trait[i,], col="red")
}








