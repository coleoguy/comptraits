# Jorja Burch - jorjaelliott@tamu.edu
# selection simulation figures script

library(scales)

##### AaAa #####
# define path to save plot as pdf
pdf("select_AaAa.pdf")

# read in generating trait results
res.aa.compound.trait <- as.matrix(read.csv("../../results/selection simulation results/res.aa.compound.trait.csv", row.names = 1))

# read in inferred trait results
res.aa.single.trait <- as.matrix(read.csv("../../results/selection simulation results/res.aa.single.trait.csv", row.names = 1))

# read in inferred trait N=100 results
res.aa.single.trait100 <- as.matrix(read.csv("../../results/selection simulation results/res.aa.single.trait100.csv", row.names = 1))


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

# close the pdf device
dev.off()
##### AaAa #####


##### AaAd #####
# define path to save plot as pdf
pdf("select_AaAd.pdf")

# read in generating trait results
res.ad.compound.trait <- as.matrix(read.csv("../../results/selection simulation results/res.ad.compound.trait.csv", row.names = 1))

# read in inferred trait results
res.ad.single.trait <- as.matrix(read.csv("../../results/selection simulation results/res.ad.single.trait.csv", row.names = 1))

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

# close the pdf device
dev.off()
##### AaAd #####


##### AdAd #####
# define path to save plot as pdf
pdf("select_AdAd.pdf")

# read in generating trait results
res.dd.compound.trait <- as.matrix(read.csv("../../results/selection simulation results/res.dd.compound.trait.csv", row.names = 1))

# read in inferred trait results
res.dd.single.trait <- as.matrix(read.csv("../../results/selection simulation results/res.dd.single.trait.csv", row.names = 1))

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

# close the pdf device
dev.off()
##### AdAd #####
