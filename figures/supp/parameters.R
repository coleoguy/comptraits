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
plot(x=0,y=0,xlim=xlims,ylim=ylims,col="white",
     xlab="phenotype", ylab="fitness")
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
