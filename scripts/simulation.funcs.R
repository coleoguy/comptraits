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
      ##### end of combine with defining function #####
    }else{
      if(single.arch=="add.x.add"){
        print("not coded yet")
      }
      if(single.arch=="add.x.dom"){
        print("not coded yet")
      }
      if(single.arch=="dom.x.dom"){
        print("not coded yet")
      }
    }
    
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
SimulatePop <- function(gen, loci, N, arch1, arch2, deffnc, sigma, opt, mu1, mu2, single.arch){
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
  print(paste("trait 1:", sum(pop[1:2,1:10,1]), " trait 2: ", sum(pop[1:2,11:20,1])))
  return(popmean)
}
SimulateCond <- function(reps, gen, loci, N, arch1, arch2, deffnc, sigma, opt, mu1, mu2, single.arch){
  res <- matrix(NA, reps, gen)
  for(i in 1:reps){
    cat(paste("\nWorking on replicate", i))
    res[i, ] <- SimulatePop(gen = gen, loci = loci,
                            N = N, arch1 = arch1,
                            arch2 = arch2, deffnc = deffnc,
                            sigma =sigma, opt = opt, 
                            mu1 = mu1, mu2 = mu2, single.arch=single.arch)
  }
  return(res)
}
##### End Functions #####
