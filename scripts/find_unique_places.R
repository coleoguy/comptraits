library(SAGA2)

makedat <- function(arch1, arch2, mu1, mu2, beta1, beta2, deffc){
  cmat <- matrix(c(1,	0,	1,	0,	0,
                   0.5,	0.5,	0.25,	0.25,	0.25,
                   0,	1,	0,	0,	1,
                   -0.5,	0.5,	0.25,	-0.25,	0.25,
                   -1,	0,	1,	0,	0),5,5, byrow = T)
  row.names(cmat) <- c("P1","BC1","F1","BC2","P2")
  colnames(cmat) <- c("a","d","aa","ad","dd")
  t1 <- rnorm(mean = mu1 + beta1 * cmat[,colnames(cmat) == arch1],
              sd = .05 * (mu1 + abs(beta1)),
              n = 5)
  t2 <- rnorm(mean = mu2 + beta2 * cmat[,colnames(cmat) == arch2],
              sd = .05 * (mu2 + abs(beta2)),
              n = 5)
  
  
  if(deffc == "prod") c1 <- t1 * t2
  if(deffc == "diff") c1 <- t1 - t2
  if(deffc == "ratio") c1 <- t1 / t2
  if(deffc == "sum") c1 <- t1 + t2
  dat <- as.data.frame(matrix(NA, 5,7))
  colnames(dat) <- c("cross",	"mean",	"SE",	"sex",	"environ",	"sire",	"dam")
  dat$cross <- c("P1","BC1","F1","BC2","P2")
  dat$mean <- c1
  dat$SE <- .1 * c1
  dat$sex <- rep("U", 5)
  dat$environ <- rep(1, 5)
  dat$sire <- c(1,3,1,3,5)
  dat$dam <- c(1,1,5,5,5)
  res <- list(dat, t1,t2)
  return(res)
}

betaSMs <- seq(from=0.5,to=2, length.out=100)
betaLGs <- seq(from=7,to=10, length.out=100)
#mu1s <- seq(from=2,to=6, length.out=100)
#mu2s <- seq(from=10,to=35, length.out=100)
infarchs <- as.data.frame(matrix(NA, 100, 1))
for(i in 1:100){
  dat <- makedat(arch1 = "a", arch2 = "d", mu1 = 30, mu2 = 3, 
                 beta2 = betaSMs[i], beta1 = betaLGs[i], deffc = "sum")
  res <- LCA(data = dat[[1]], SCS = "NSC", keep.pars=c("Aa","Ad","AaAa","AaAd","AdAd"))
  #plot(res)
  #dat[[2]]
  #dat[[3]]
  infarchs[i,1] <- paste(res$varimp[,1][res$estimates[1,2:ncol(res$estimates)] > res$estimates[2,2:ncol(res$estimates)] & res$varimp[,2] > 0.5], collapse=",")
}
