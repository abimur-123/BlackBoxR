context('getMLE.R')


test_that("error message occurs when input is not correct format", {
  expect_error(getMLE(1,2),"Wrong format for both inputs; string,vector expected")

  expect_error(getMLE("1",2),"Wrong format for column input;vector expected")

  expect_error(getMLE(1,c(2,3,2,3)),"Wrong format for distribution input;string expected")

  expect_error(getMLE(), "No defaults specified for distribution, vector")

  expect_error(getMLE("1",c("2","3","2","3")),"Wrong type of vector provided; numeric vector type expected")

  expect_error(getMLE("1",list("2",3,"2",3)),"Wrong column type provided; Vector type expected")

})


test_that("when the input is not from available set of inputs", {
  expect_error(getMLE("poisson",c(2,3,4,6)),"Input values for distribution can only take in values; Binomial and Poisson")
})


test_that("when the input is ndevot from available set of inputs", {
  expect_error(getMLE("poisson",c(2,3,4,6)),"Input values for distribution can only take in values; Binomial and Poisson")
})


test_that("MLE return for poisson distribution of the right ouput",{
  output <- getMLE("binomial",c(1,0,2,3,1,1,1,2))
  chec_output_type <- typeof(output) == "double"
  expect_that(chec_output_type, is_true())
})


test_that("MLE returns for binomial distribution (log likelihood) between 0 and 1",{
  output <- getMLE("binomial",c(1,0,2,3,1,1,1,2))
  output_check <- ifelse(output >= 0 & output <= 1, TRUE, FALSE)
  expect_that(output_check,is_true())
})


test_that("MLE returns for poisson distribution (mean) between >=0",{
    output <- getMLE("poisson",c(1,0,2,3,1,1,1,2))
    output_check_mean <- ifelse(mean(output) >= 0,TRUE,FALSE)
    expect_that(output_check_mean,is_true())
})



test_that("MLE return for poisson distribution of the right ouput",{
  output <- getMLE("poisson",c(1,0,2,3,1,1,1,2))
  chec_output_type <- typeof(output) == "double"
  expect_true(chec_output_type)
})

