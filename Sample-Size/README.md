# Sample Size Calculation

The goal of this document is to provide a template in R that can calculate the sample size needed for clinical trials and other experiments based on specified values and a set type l error (alpha), type two error (beta), and statistical power (1 minus beta). A range of means or proportions of interest can be established and all sample sizes calculated, stored in a data frame, and plotted.  

A correct sample size calculation is specially important in clinical trials, where patients and usually large budgets are involved and the validity of the methodology and results of a study comparing two treatmenta are largely based on proper statistical planning and calculations. When calculating sample size it is fundamental to determine the type of clinical trial:

### Equality
Aims to prove that the same treatment in a new presentation is equal to the old presentation.

### Non-Inferiority 
Aims to prove a new treatment is not inferior to another by a margin of non-inferiority. 

### Superiority
Aims to prove a new treatment is superior to anothe by a margin of superiority. 

### Equivalence
Aims to prove that the same treatment in a new presentation is equivalent to the old presentation by a margin of equivalence.

The values needed to calculate sample size for a clinical trial are type l error (alpha, usually 0.05), type ll error (beta, usually 0.8), statistical power (1-beta, usually 0.2), and in some cases the standard deviation and the margin of significance (delta, can be of non-inferiority, superiority, or equivalence). 

This template is included as an R script and an RMarkdown file has also been added to this repository as a guide for each of the different possible calculations. 

Source and inspiration from: HyLown Consulting LLC (2022), https://powerandsamplesize.com/
