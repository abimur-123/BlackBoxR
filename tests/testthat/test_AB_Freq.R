context('performABTest.R')

test_that("check if input is in correct format",{
  expect_error(performABTest(1,2),'Wrong format for input')
  expect_error(performABTest(NULL), 'need to pass in a dataframe')
})

test_that('dataframe has more than 2 observations for AB testing',{
  df<-data.frame(name=rep(c('A','B'),1),events=rbinom(2,1,0.5))
  expect_true(nrow(df) > 2)
})

test_that('the first column of dataframe is categorical and can have only 2 levels(event a/event b)',{
  df<-data.frame(name=rep(c('A','B','C'),10),events=rnorm(30,2,0.5))
  expect_true(typeof(df[,1]) == 'integer')
  df <- data.frame(name=rep(c('A','B','C'),5),events=rbinom(15,1,0.5))
  expect_true(nlevels(df[,1]) == 2)
})

test_that('the second column of dataframe is categorical and can have only 2 levels(Yes/No)',{
  df<-data.frame(name=rep(c('A','B','C'),10),events=rnorm(30,2,0.5))
  expect_true(typeof(df[,2])=='integer')
  df<-data.frame(name=rep(c('A','B','C'),10),events=rbinom(30,2,0.5))
  expect_true(nlevels(df[,2]) == 2)
})

test_that('p-value is less than or equal to 1 and greater than 0',{
  expect_true(performABTest(df)$`p.value`> 0)
  expect_true(performABTest(df)$`p.value`< 1)
})
