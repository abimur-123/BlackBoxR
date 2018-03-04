context('performABTest.R')


df<-data.frame(name=rep(c('A','B'),10),events=rbinom(20,1,0.5))


test_that("check if input is in correct format",{
  expect_error(performABTest(1,2),'Wrong format for input')
  expect_error(performABTest(), 'need to pass in a dataframe')
})

test_that('dataframe has more than 2 observations for AB testing',{
  expect_true(nrow(df) > 2)
})

test_that('the first column of dataframe is categorical and can have only 2 levels(event a/event b)',{
  expect_true(typeof(df[,1]) == 'integer')
  expect_true(nlevels(df[,1]) == 2)
})

test_that('the second column of dataframe is categorical and can have only 2 levels(Yes/No)',{
  expect_true(typeof(df[,2])=='integer')
  expect_true(nlevels(df[,2]) == 2)
})

test_that('p-value is less than or equal to 1 and greater than 0',{
  expect_true(performABTest(df)$`p.value`> 0)
  expect_true(performABTest(df)$`p.value`< 1)
})
