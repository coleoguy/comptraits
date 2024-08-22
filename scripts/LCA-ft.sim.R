# dipliod biallelic 
# 20 unlinked loci
# foward time population genetic simulation
source("simulation.funcs.R")
N <- 100
loci <- 20
gen <- 100
reps <- 20




# SIMULATION 1
## TODO Figure out why this case leads to always selecting for zeros in trait
## 2 portion of the genome
## elemental archs: a & d
## betas: 7.576, 0.788
## mu: 30, 3
## defining function: RATIO
## inferred arch: AaAa (best example for this inferred arch)

arch1 <- "add"
arch2 <- "dom"
mu1 <- 30
mu2 <- 3
beta1 <- 7.58 
beta2 <- 0.79
deffnc <- "ratio"
sigma <- .5
opt <- 12.5
single.arch <- NULL
res <- SimulateCond(reps = reps, gen = gen, loci = loci,
                    N = N, arch1 = arch1,
                    arch2 = arch2, deffnc = deffnc,
                    sigma =sigma, opt = opt, mu1 = mu1, mu2 = mu2,
                    single.arch = single.arch)


plot(res[1,], type="l", ylim=c(0, max(res)),
     ylab="compound trait", xlab="generations")
for(i in 2:nrow(res)){
  lines(res[i,], col=rainbow(nrow(res))[i])
}








