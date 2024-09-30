additional.cohort.analyses folder: this folder contains the folders, jd.cohort15 and more.cohort8, which have scripts for analyses with 8 and 15 cohorts.

deprecated folder: this folder contains the scripts calc_percerr, mean_percerr, parsingMargTab, simcoding, and successMatrix

performance metrics folder: this folder contains the scripts calc_percent_error, calc_prop_epi, infer_epi, and t.tests

selection simulation folder: this folder contains the scripts ExploreSigma, find_unique_places, LCA-ft.sim, and simulation.funcs

calc_betas.R: this script calculates the expected beta coefficients from sim.results.csv for each compound trait where the two elemental traits are the same and writes res_betas.csv

failureMatrix.R: this script creates a matrix displaying the "failure rate" for inferring the correct architectures under the six possible combining functions of all simple architectures and writes fail.matrix.csv.

parsing.results.R: this script takes the results from simcoding.R and parses those results into tables showing the results of each elemental trait combination.

partialMatrix.R: this script creates a matrix displaying the "partial success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures and writes partial.matrix_mean.csv. 

remove_sm_betas.R: this script removes rows with elemental traits that have low beta coefficients and the compound traits calculated with elemental traits with low beta coefficients. The rows are removed from the sim results of 5 and 15 cohorts.

simcoding.R: this script pulls data from an empirical study of traits to inform the generation of simulated data and runs LCA on the simulated data using 5 cohorts and looking at additive, dominance, and epistatic genetic architectures. it writes a results file (sim.results.csv) containing the genetic architectures inferred for the data.  

successMatrix.R: this script creates a matrix displaying the "success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures and writes succ.matrix.csv.
