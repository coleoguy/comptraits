# Jorja Burch - jorjaelliott@tamu.edu

# this script generates the supp plot (3 panel) which shows the range in phenotypes
# for the inferred and generating architectures, and the distribution of fitnesses,
# and the optimum phenotype. For each inferred arch (AaAa, AaAd, AdAd)

dat <- read.csv("../../results/selection simulation results/parameters.csv")

getW <- function(low, high, opt, sigma){
  obs <- seq(from=low, to=high, length.out=100)
  numer <- (obs - opt)^2
  denom <- (2 * sigma)^2
  w <- exp(-(numer / denom))
  return(list(w, obs))
}


xlims <- c(min(dat[1,1:4]), max(dat[1,1:4]))
ylims <- c(-.05,1)

# plot 1 - AaAa
#open plod as pdf device
pdf("AaAa_parameters.pdf")

plot(x=0,y=0,xlim=xlims,ylim=ylims,col="white",
     xlab="phenotype", ylab="fitness", cex.axis = 1.1, cex.lab = 1.1)
lines(x=c(dat[1,1],dat[1,2]),y=c(-0.01,-0.01), lwd=3,col="blue")
lines(x=c(dat[1,3],dat[1,4]),y=c(-0.04,-0.04), lwd=3,col="red")
abline(v=dat[1,5],lty=2)
fitdatgen <- getW(dat$low.gen[1],
                  dat$high.gen[1], 
                  dat$opt[1],
                  dat$sigma1[1])
fitdatinf <- getW(dat$low.inf[1],
                  dat$high.inf[1], 
                  dat$opt[1],
                  dat$sigma2[1])
lines(x=fitdatgen[[2]],
      y=fitdatgen[[1]],
      col="blue")
lines(x=fitdatinf[[2]],
      y=fitdatinf[[1]],
      col="red")
# add point to each line for phenotype at gen 1
points(8.84805, -0.01, col="blue", pch=19, cex=2)
points(8.480567, -0.04, col="red", pch=19, cex=2)

legend("topleft", legend=c("Inferred Architecture", "Generating Architecture"),
       col=c("red", "blue"), lwd=2, lty=1, bty="n", cex=1)

# close the device
dev.off()


# plot 2 - AaAd
#open plod as pdf device
pdf("AaAd_parameters.pdf")

plot(x=0,y=0,xlim=xlims,ylim=ylims,col="white",
     xlab="phenotype", ylab="fitness", cex.axis = 1.1, cex.lab = 1.1)
lines(x=c(dat[2,1],dat[2,2]),y=c(-0.01,-0.01), lwd=3,col="blue")
lines(x=c(dat[2,3],dat[2,4]),y=c(-0.04,-0.04), lwd=3,col="red")
abline(v=dat[2,5],lty=2)
fitdatgen <- getW(dat$low.gen[2],
                  dat$high.gen[2], 
                  dat$opt[2],
                  dat$sigma1[2])
fitdatinf <- getW(dat$low.inf[2],
                  dat$high.inf[2], 
                  dat$opt[2],
                  dat$sigma2[2])
lines(x=fitdatgen[[2]],
      y=fitdatgen[[1]],
      col="blue")
lines(x=fitdatinf[[2]],
      y=fitdatinf[[1]],
      col="red")

# add point to each line for phenotype at gen 1
points(8.883328, -0.01, col="blue", pch=19, cex=2)
points(9.440011, -0.04, col="red", pch=19, cex=2)

legend("topleft", legend=c("Inferred Architecture", "Generating Architecture"),
       col=c("red", "blue"), lwd=2, lty=1, bty="n", cex=1)

# close the device
dev.off()


# plot 3 - AdAd

#open plod as pdf device
pdf("AdAd_parameters.pdf")

plot(x=0,y=0,xlim=xlims,ylim=ylims,col="white",
     xlab="phenotype", ylab="fitness", cex.axis = 1.1, cex.lab = 1.1)
lines(x=c(dat[3,1],dat[3,2]),y=c(-0.01,-0.01), lwd=3,col="blue")
lines(x=c(dat[3,3],dat[3,4]),y=c(-0.04,-0.04), lwd=3,col="red")
abline(v=dat[3,5],lty=2)
fitdatgen <- getW(dat$low.gen[3],
                  dat$high.gen[3], 
                  dat$opt[3],
                  dat$sigma1[3])
fitdatinf <- getW(dat$low.inf[3],
                  dat$high.inf[3], 
                  dat$opt[3],
                  dat$sigma2[3])
lines(x=fitdatgen[[2]],
      y=fitdatgen[[1]],
      col="blue")
lines(x=fitdatinf[[2]],
      y=fitdatinf[[1]],
      col="red")

# add point to each line for phenotype at gen 1
points(7.312431, -0.01, col="blue", pch=19, cex=2)
points(7.385211, -0.04, col="red", pch=19, cex=2)

legend("topleft", legend=c("Inferred Architecture", "Generating Architecture"),
       col=c("red", "blue"), lwd=2, lty=1, bty="n", cex=1)

# close the device
dev.off()
