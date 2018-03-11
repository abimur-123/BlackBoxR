# Bayesian and Frequentist approach using BlackBoxR
[![Build Status](https://travis-ci.org/UBC-MDS/BlackBoxR.svg?branch=master)](https://travis-ci.org/UBC-MDS/BlackBoxR)

### Contributors

1. Siddharth Arora(@sarora)
2. Yinghua Guan(@vinverguan)
3. Abishek Murali(@abimur-123)

### Summary

The Bayesian vs Frequentist approach is more of a philosophical debate which this package will not delve into. This package attempts at breaking down the understanding and the underlying assumptions of the 2 approaches and how they compare. The package will run a significance analysis using both approaches based on data provided by the user, compare credible and confidence intervals and finally debunks the understanding of MAP and MLE for parameter estimation.

This package is aimed at users who are attempting to familiarize themselves with the Bayesian/Frequentist approach(although I'm guessing it will be more Bayesian). This package can elucidate the difference in approaches and will attempt to help the user get a basic high-level understanding of both approaches and how they should proceed to carry out further analysis.


### Functions

getCredibleInterval(x,prior\_dis,sample\_dis) :   
**Purpose:** obtain credible intervals using Bayesian approach(we now just accpet normal distribution data, may accept more distribution in future )  

**Args:**   
x, a numeric vector  
prior\_dis, a numeric vector  
sample\_dis, a numeric vector 

**Returns:**   
numeric vector with length 2

**Example**   
  
```
sample<-rnorm(5,mean=3,sd=1)
getCredibleInterval(sample,c(2,1),c(3,1))
```
*******
getConfidenceInterval(x) :   

**Purpose:** Obtain confidence interval for the result(we now just accpet normal distribution data, may accept more distribution in future) 

**Args:**   
x, a numeric vector  


**Returns:**   
numeric vector with length 2

**Example**   
  
```
sample<-rnorm(5,mean=2, sd =0.98)
getConfidenceInterval(sample)
```
******
performABtest() : Run A\B test using the Frequentist approach
*****
performABtest_Bayesian() : Run A\B test using the Bayesian approach
****
getMAP(): Get Maximum a Priori estimate for the parameters for a given distribution.
*****
getMLE(): Get maximum likelihood value of the parameter for a given distribution.


### Similar Packages

The [BayesAB package](https://cran.r-project.org/web/packages/bayesAB/index.html) does AB testing using Bayesian approach with different distributions.
