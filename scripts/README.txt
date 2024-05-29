additional.cohort.analyses folder: this folder contains the folders, jd.cohort15 and more.cohort8, which have scripts for analyses with 8 and 15 cohorts.

calc_betas.R: this script calculates the expected beta coefficients from sim.results.csv for each compound trait and writes res_betas.csv

failureMatrix.R: this script creates a matrix displaying the "failure rate" for inferring the correct architectures under the six possible combining functions of all simple architectures.

parsing.results.R: this script takes the results from simcoding.R and parses those results into tables showing the results of each elemental trait combination.

parsingMargTab.R: this script parses the results from simcoding.R into "marginalized" tables, producing 5 tables that show the "true" and "false" positives when a specific architecture is ONE of the elemental architectures.

partialMatrix.R: this script creates a matrix displaying the "partial success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures. 

simcoding.R: this script pulls data from an empirical study of traits to inform the generation of simulated data and runs LCA on the simulated data using 5 cohorts and looking at additive, dominance, and epistatic genetic architectures. it writes a results file containing the genetic architectures inferred for the data.  

successMatrix.R: this script creates a matrix displaying the "success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures.

t.tests.R: this script runs a t-test for fewer cohorts (5) versus more cohorts (8) and fewer cohorts (5) versus many "jd" cohorts (15) for the success, partial success, and failure matrices. 