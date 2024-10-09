# Jorja Burch - jorjaelliott@tamu.edu
# this script stores the functions used in the LCA-ft.sim.R simulation

##### Functions #####
Phenotyper <- function(pop, loci, N, arch1, arch2, deffnc, mu1, mu2, beta1, beta2, single.arch){
  # vector to store phenotypes
  phenos <- c()
  # loop through all individuals in population
  for(i in 1:N){
    genome <- pop[,,i]
    if(is.null(single.arch)){
      # calculate the phenotype of the elemental traits
      ##### additive case #####
      if(arch1 == "add"){
        opp1 <- ((2 * sum(genome[,1:(loci/2)])) / 20) - 1
        t1 <- mu1 + opp1 * beta1
      }
      if(arch2 == "add"){
        opp2 <- ((2 * sum(genome[,(loci/2 + 1):loci])) / 20) - 1
        t2 <- mu2 + opp2 * beta2
      }
      ##### end of additive case #####
      ##### dominance case #####
      if(arch1 == "dom"){
        opp1 <- sum(colSums(genome[,1:(loci/2)])==1) / 10
        t1 <- mu1 + opp1 * beta1
      }
      if(arch2 == "dom"){
        opp2 <- sum(colSums(genome[,(loci/2 + 1):loci])==1) / 10
        t2 <- mu2 + opp2 * beta2
      }
      ##### end of dominance case #####
    }
    if(!is.null(single.arch)){
      ##### additive by additive case #####
      if(single.arch == "add.x.add"){
        genvec <- colSums(genome)
        genvec <- genvec[1:10] + genvec[11:20]
        bvals <- c(1, .5, 0, .5, 1)
        opp <- mean(bvals[(genvec+1)])
        # this next line calculates the phenotype for the addxadd trait
        single.trait <- mu1 + opp * beta1
      }
      ##### end of additive by additive case #####
      ##### additive by dominance case #####
      if(single.arch == "add.x.dom"){
        # compress the genome into vector of values 0-2, representing each genotype.
        genvec <- colSums(genome)
        # and it should produce a vector of 0, 1, 2 of length 20
        # 00 = 0
        # 01 = 1
        # 10 = 1
        # 11 = 2
        
        # compare the ith and i+10th values in vector, use switch function to 
        # find opp value for each genotype pair (i.e., 0,0 = 0.125):
        mlgen <- paste(genvec[1:10], genvec[11:20], sep = ",")
        lookup <- c("0,0" = 0.125,
                    "0,1" = 0,
                    "1,0" = -0.25,
                    "1,1" = 0,
                    "2,2" = -0.125,
                    "2,1" = 0,
                    "1,2" = 0.25,
                    "2,0" = 0.125,
                    "0,2" = -0.125)
        # this is the opportunity for addxdom to impact the phenotype 
        # (for the whole genome)
        opp <-mean(lookup[mlgen])
        
        # this next line calculates the phenotype for the addxdom trait
        single.trait <- mu1 + opp * beta1
      }
      ##### end of additive by dominance case #####
      ##### dominance by dominance case #####
      if(single.arch == "dom.x.dom"){
        # compress the genome into vector of values 0-2, representing each genotype.
        genvec <- colSums(genome)
        # and it should produce a vector of 0, 1, 2 of length 20
        # 00 = 0
        # 01 = 1
        # 10 = 1
        # 11 = 2
        
        # compare the ith and i+10th values in vector, use switch function to 
        # find opp value for each genotype pair (i.e., 0,0 = 0.125):
        mlgen <- paste(genvec[1:10], genvec[11:20], sep = ",")
        lookup <- c("0,0" = 0.25,
                    "0,1" = -0.5,
                    "1,0" = -0.5,
                    "1,1" = 1,
                    "2,2" = 0.25,
                    "2,1" = -0.5,
                    "1,2" = -0.5,
                    "2,0" = 0.25,
                    "0,2" = 0.25)
        # this is the opportunity for domxdom to impact the phenotype 
        # (for the whole genome)
        opp <- mean(lookup[mlgen])
        
        # this next line calculates the phenotype for the domxdom trait
        single.trait <- mu1 + opp * beta1
      }
      ##### end of dominance by dominance case #####
    }
      ##### combine with defining function #####
      if(deffnc == "ratio"){
        ct <- t1/t2
      }
      if(deffnc == "sum"){
        ct <- t1 + t2
      }
      if(deffnc == "diff"){
        ct <- t1 - t2
      }
      if(deffnc == "prod"){
        ct <- t1 * t2
      }
      if(deffnc == "none"){
        ct <- single.trait
      }
      ##### end of combine with defining function #####
    phenos[i] <- ct
  }
  return(phenos)
}
GetFit <- function(obs, opt, sigma){
  # basic Gaussian fitness function
  # sigma determines how quickly fitness drops off
  # so effecitively how strong the selection coefficient is
  numer <- (obs - opt)^2
  denom <- (2 * sigma)^2
  w <- exp(-(numer / denom))
  return(w)
}
Reproduce <- function(pop, N, w, loci){
  # Sample parents
  parents <- sample(1:N, size = 2 * N, replace = TRUE, prob = w)
  # Initialize haplotypes matrix
  haplotypes <- matrix(NA, 2*N, loci)
  # Vectorized sampling for haplotypes
  for(i in seq_len(2 * N)){
    genome <- pop[,,parents[i]]
    haplotypes[i,] <- genome[cbind(sample(1:2, loci, replace = TRUE), seq_len(loci))]
  }
  # Assign haplotypes back to the population
  pop[,,1:N] <- array(haplotypes, dim = c(2, loci, N))
  return(pop)
}
SimulatePop <- function(gen, loci, N, arch1, arch2, deffnc, sigma, opt, 
                        mu1, mu2, beta1, beta2, single.arch){
  # we start our population with random genotypes with each allele at 50%
  # to replicate our expectation for an F∞
  # we will hold our population in an array where each individual
  # is a layer of the array so the first individuals genome is at pop[,,1]
  # while the second would be pop[,,2]. This extracts a matrix that has 2
  # rows and the same number of columns as loci
  pop <- array(sample(0:1, size = 2 * loci * N, replace = T), 
               dim = c(2, loci, N))
  popmean <- c()
  for(i in 1:gen){
    if(i%%10 == 0) cat(".")
    phenos <- Phenotyper(pop, loci, N, 
                         arch1 = arch1, 
                         arch2 = arch2, 
                         deffnc = deffnc,
                         mu1 = mu1, mu2 = mu2,
                         beta1 = beta1,
                         beta2 = beta2,
                         single.arch = single.arch)
    popmean[i] <- mean(phenos)
    w <- GetFit(obs = phenos, opt = opt, sigma = sigma)
    pop <- Reproduce(pop = pop, N = N, w = w, loci = loci)
  }
  return(popmean)
}
SimulateCond <- function(reps, gen, loci, N, arch1, arch2, deffnc, sigma, opt, 
                         mu1, mu2, beta1, beta2, single.arch){
  res <- matrix(NA, reps, gen)
  rownames(res) <- paste0("rep", 1:reps)
  colnames(res) <- paste0("gen", 1:gen)
  for(i in 1:reps){
    cat(paste("\nWorking on replicate", i))
    res[i, ] <- SimulatePop(gen = gen, loci = loci,
                            N = N, arch1 = arch1,
                            arch2 = arch2, deffnc = deffnc,
                            sigma =sigma, opt = opt, 
                            mu1 = mu1, mu2 = mu2, beta1 = beta1,
                            beta2 = beta2, single.arch=single.arch)
  }
  return(res)
}

GetRange <- function(arch1, arch2, deffnc, mu1, mu2,
                     beta1, beta2, single.arch){
  cmat <- matrix(c(1,.5,0,-.5,-1,
                   0,.5,1,.5,0,
                   1,.25,0,.25,1,
                   0,.25,0,-.25,0,
                   0,.25,1,.25,0), 5,5)
  rownames(cmat) <- c("P1","BC1","F1","BC2","P2")
  colnames(cmat) <- c("add","dom","add.x.add","add.x.dom","dom.x.dom")
  if(single.arch != "none"){
    maxval <- mu1 + beta1 * max(cmat[,colnames(cmat) == single.arch])
    minval <- mu1 + beta1 * min(cmat[,colnames(cmat) == single.arch])
  }
  if(single.arch == "none"){
    maxT1 <- mu1 + beta1 * max(cmat[,colnames(cmat) == arch1])
    minT1 <- mu1 + beta1 * min(cmat[,colnames(cmat) == arch1])
    maxT2 <- mu2 + beta2 * max(cmat[,colnames(cmat) == arch2])
    minT2 <- mu2 + beta2 * min(cmat[,colnames(cmat) == arch2])
    if(deffnc == "ratio"){
      maxval <- maxT1 / minT2
      minval <- minT1 / maxT2
    }
    if(deffnc == "sum"){
      maxval <- maxT1 + maxT2
      minval <- minT1 + minT2
    }
    if(deffnc == "diff"){
      maxval <- maxT1 - minT2
      minval <- minT1 - maxT2
    }
    if(deffnc == "prod"){
      maxval <- maxT1 * maxT2
      minval <- minT1 * minT2
    }
  }
  return(c(minval, maxval))
}
##### End Functions #####
