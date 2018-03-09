context('getConfidenceInterval.R')

#sample vector
sample<-c(1,3,4,5)


#check valid input
test_that("check if input is in correct format",{
  expect_error(getConfidenceInterval(1,2),'Wrong format for input')
  expect_error(getConfidenceInterval(), 'need to pass in a dataframe')
  expect_error(getConfidenceInterval(c()),'blank vector')
})

test_that('vector has at least 1 observation',{
  expect_true(length(sample)>0)
})

test_that('the vector is numeric',{
  expect_true(typeof(sample)=='double'|typeof(sample)=='integer')
})

#check valid output

test_that('the output has two elements only',{
  expect_equal(length(getConfidenceInterval(sample)),2)
})


test_that('the output interval is valid',{
  expect_true(getConfidenceInterval(sample)[1]>=min(sample))
  expect_true(getConfidenceInterval(sample)[2]<=max(sample))
})

test_that('the output interval is correct',{
  expected_lower<-1.576331
  expected_upper<-4.923668
  expect_true(abs(getConfidenceInterval(sample)[1]-expected_lower)<1e-10)
  expect_true(abs(getConfidenceInterval(sample)[2]-expected_upper)<1e-10)
})
