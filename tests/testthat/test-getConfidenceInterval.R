context('getConfidenceInterval.R')


df<-data.frame(name=rep('A',4),score=rbeta(4,3,2))


test_that("check if input is in correct format",{
  expect_error(getConfidenceInterval(1,2),'Wrong format for input')
  expect_error(getConfidenceInterval(), 'need to pass in a dataframe')
})

test_that('dataframe has at least 1 observation',{
  expect_true(nrow(df)>0)
})

test_that('the second column of dataframe is numeric',{
  expect_true(typeof(df[,2])=='double'|typeof(df[,2])=='integer')
})

test_that('the output interval is valid',{
  expect_true(getCredibleInterval(df)$lower>=min(df$score))
  expect_true(getCredibleInterval(df)$upper<=max(df$score))
})

test_that('the output interval is correct',{
  xbar<-mean(df$score)
  n<-nrow(df)
  expected_lower<-xbar-1.96*sqrt(xbar*(1-xbar))/sqrt(n)
  expected_upper<-xbar+1.96*sqrt(xbar*(1-xbar))/sqrt(n)
  expect_equal(getCredibleInterval(df)$lower,expected_lower)
  expect_equal(getCredibleInterval(df)$upper,expected_upper)
})
