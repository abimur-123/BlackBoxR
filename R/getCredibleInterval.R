#' compute 95% credible interval (bayesian approach)
#' assume the input prior distribution and samples follow normal distribution 
#'
#' @param vector a numeric vector
#' @param prior_dis a numeric vector
#' @param smaple_dis a numeric vector
#'
#' @return vector a numeric vector with two elements only
#' 
#' @examples 
#' 
#' #example with toy samples
#' sample<-rnorm(5,mean=1,sd=0.2)
#' getCredibleInterval(sample,c(1.4,0.3),c(1,0.2))
#'
#' @export
getCredibleInterval<-function(vector,prior_dis,sample_dis){
  prior_mean<-prior_dis[1]
  prior_sd<-prior_dis[2]
  sample_mean<-sample_dis[1]
  sample_sd<-sample_dis[2]
  vector_mean<-mean(vector)
  vector_n<-length(n)
  post_mean<-(vector_mean*vector_n/sample_sd+prior_mean*1/prior_sd)/(vector_n/sample_sd+1/prior_sd^2)
  post_sd<-1/(vector_n/(sample_sd^2)+1/(prior_sd^2))
  lower<-qnorm(0.025,mean=post_mean,sd=post_sd)
  upper<-qnorm(0.975,mean=post_mean,sd=post_sd)
  
  return(c(lower,upper))
  
}

