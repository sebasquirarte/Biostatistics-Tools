# Sample size calculation v.1.0 | Sep 2023
# Sebastian Quirarte Justo | sebastianquirajus@gmail.com

# This R script can calculate the sample size needed for clinical trials and 
# other experiments based on specified values and a set type l error (alpha), 
# type two error (beta), and statistical power (1 minus beta). A range of means
# or proportions of interest can be established and all sample sizes calculated,
# stored in a data frame, and plotted. 

# Source and inspiration: 
# HyLown Consulting LLC (2022), https://powerandsamplesize.com/

# ---------------------------------------------------------------------------- #

# Removes previous variables 
rm(list = ls())

# Installs and loads necessary packages 
pkgs <- (c("ggplot2", "ggthemes")) # ggplot, theme_minimal() 
install.packages(pkgs)
lapply(pkgs, require, character.only = TRUE)

# --------------------------- COMPARE TWO MEANS ------------------------------ #

### EQUALITY ###

muA = 5 # group A mean (new treatment)
muB = 10 # group B mean
sd = 10 # standard deviation
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of means for group A
range_meanA = seq(1, 8, 0.1)

# Creates data frame with range of means and empty column for sample sizes (n)
df <- data.frame("meanA"=range_meanA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each mean of group A and adds value to data frame
for (i in range_meanA){
  muA = i 
  nB = ceiling((1+1/kappa)*(sd*(qnorm(1-alpha/2)+qnorm(1-beta))/(muA-muB))^2)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of means 
ggplot(df, aes(x = meanA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Group A Mean")

### NON-INFERIORITY or SUPERIORITY ###

muA = 5 # group A mean (new treatment)
muB = 5 # group B mean
sd = 10 # standard deviation
delta = 5 # non-inferiority (-) or superiority (+) margin
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of means for group B
range_meanA = seq(5, 8, 0.1)

# Creates data frame with range of means and empty column for sample sizes (n)
df <- data.frame("meanA"=range_meanA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each mean of group A and adds value to data frame
for (i in range_meanA){
  muA = i 
  nB = ceiling((1+1/kappa)*(sd*(qnorm(1-alpha)+qnorm(1-beta))/(muA-muB-delta))^2)
  print(nB)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of means 
ggplot(df, aes(x = meanA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Mean A")

### EQUIVALENCE ###

muA = 5 # group A mean (new treatment)
muB = 4 # group B mean
sd = 10 # standard deviation
delta = 5 # equivaence margin
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of means for group A
range_meanA = seq(4, 7, 0.1)

# Creates data frame with range of means and empty column for sample sizes (n)
df <- data.frame("meanA"=range_meanA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each mean of group A and adds value to data frame
for (i in range_meanA){
  muA = i 
  nB = ceiling((1+1/kappa)*(sd*(qnorm(1-alpha)+qnorm(1-beta/2))/(abs(muA-muB)-delta))^2)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of means 
ggplot(df, aes(x = meanA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Mean Group A")

# ------------------------ COMPARE TWO PROPORTIONS --------------------------- #

### EQUALITY ###

pA = 0.65 # group A proportion (new treatment)
pB = 0.85 # group B proportion
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of proportions for group A
range_propA = seq(0.65, 0.78, 0.01)

# Creates data frame with range of proportions and empty column for sample sizes (n)
df <- data.frame("propA"=range_propA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each proportion of group A and adds value to data frame
for (i in range_propA){
  pA = i 
  nB = ceiling((pA*(1-pA)/kappa+pB*(1-pB))*((qnorm(1-alpha/2)+qnorm(1-beta))/(pA-pB))^2)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of proportions 
ggplot(df, aes(x = propA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Proportion Group A")

### NON-INFERIORITY or SUPERIORITY ###

pA = 0.85 # group A proportion (new treatment)
pB = 0.65 # group B proportion
delta = -0.10 # non-inferiority (-) or superiority (+) margin
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of proportions for group A
range_propA = seq(0.65, 0.85, 0.01)

# Creates data frame with range of proportions and empty column for sample sizes (n)
df <- data.frame("propA"=range_propA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each proportion of group A and adds value to data frame
for (i in range_propA){
  pA = i 
  nB = ceiling((pA*(1-pA)/kappa+pB*(1-pB))*((qnorm(1-alpha)+qnorm(1-beta))/(pA-pB-delta))^2)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of proportions 
ggplot(df, aes(x = propA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Proportion Group A")

### EQUIVALENCE ###

pA = 0.65 # group A proportion (new treatment)
pB = 0.85 # group B proportion
delta = 0.05 # equivalence margin
kappa = 1 # sampling ratio
alpha = 0.05 # type 1 error 
beta = 0.20 # type 2 error 

# Set range of proportions for group A
range_propA = seq(0.60, 0.75, 0.01)

# Creates data frame with range of proportions and empty column for sample sizes (n)
df <- data.frame("propA"=range_propA, "n"=0)

# Sets counter variable to iterate through each row 
count = 1
# Calculates sample size for each proportion of group A and adds value to data frame
for (i in range_propA){
  pA = i 
  nB = ceiling((pA*(1-pA)/kappa+pB*(1-pB))*((qnorm(1-alpha)+qnorm(1-beta/2))/(abs(pA-pB)-delta))^2)
  print(nB)
  df[count, 2] = nB
  count = count + 1
}

# View df
df 

# Creates plot of sample sizes based on range of proportions 
ggplot(df, aes(x = propA, y = n)) + geom_point(color="dodgerblue4") + 
  theme_minimal() + xlab("Proportion Group A")

