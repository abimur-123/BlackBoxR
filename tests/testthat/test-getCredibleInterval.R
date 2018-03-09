context('getCredibleInterval.R')


#sample 
set.seed(1)
sample<-rnorm(5,mean=4,sd=1)


#check valid input
test_that("check if input is in correct format",{
  expect_error(getCredibleInterval(1,2),'Wrong format for input')
  expect_error(getCredibleInterval(), 'need to pass in tree vectors, first is the observations,
               second is prior distribution, third is sample distribution')
  expect_error(getCredibleInterval(sample,c(5,3)), 'need to pass in sample distribution')
})

test_that('vector has at least 1 observation',{
  expect_true(length(sample)>0)
})

test_that('the vector is numeric',{
  expect_true(typeof(sample)=='double'|typeof(sample)=='integer')
})


#check valid output
test_that('the output has two elements only',{
  expect_equal(length(getCredibleInterval(sample)),2)
})


test_that('the output interval is valid',{
  expect_true(getConfidenceInterval(sample,c(3,1),c(4,1))[1]>=min(sample))
  expect_true(getConfidenceInterval(sample,c(3,1),c(4,1))[2]<=max(sample))
})

test_that('the output interval is correct',{
  expected_lower<-2.584653
  expected_upper<-4.544617
  expect_true(abs(getCredibleInterval(sample,c(3,1),c(4,1))[1]-expected_lower)<1e-10)
  expect_true(abs(getCredibleInterval(sample,c(3,1),c(4,1))[2]-expected_upper)<1e-10)
})




  