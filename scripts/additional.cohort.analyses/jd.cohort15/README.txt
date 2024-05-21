jd.failureMatrix.R: this script creates a matrix of the "failure rate" for inferring the correct architectures under the six possible combining functions of all simple architectures in data with 15 cohorts.

jd.parsing.results.R: this script takes the results from jd.simcoding.R and parses those results into tables showing the results of each elemental trait combination.

jd.parsingMargTab.R: this script parses the results from jd.simcoding.R into "marginalized" tables, producing 5 tables that show the "true" and "false" positives when a specific architecture is ONE of the elemental architectures.

jd.partialMatrix.R: this script creates a matrix of the "partial success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures in data with 15 cohorts.

jd.simcoding.R: this script pulls data from an empirical study of traits to inform the generation of simulated data and runs LCA on the simulated data using 15 cohorts and looking at additive, dominance, and epistatic genetic architectures. it writes a results file containing the genetic architectures inferred for the data.  

jd.successMatrix.R: this script creates a matrix of the "success rate" for inferring the correct architectures under the six possible combining functions of all simple architectures in data with 15 cohorts.
