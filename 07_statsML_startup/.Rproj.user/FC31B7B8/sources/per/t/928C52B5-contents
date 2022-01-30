
# Step 1: Install packages ------------------------

# List installed packages
source('../project_fxns.R')

pkgs <-
    c('imputeTS', 'Rcmdr', 'doParallel', 'randomForest', 'ranger', 'xgboost', 'vip',
      'modeldata', 'textrecipes', 'finetune', 'SHAPforxgboost')

install_and_list_packages(pkgs)

# Step 2: Validate installations -------------------------------------------
# https://cran.rstudio.com/web/packages/imputeTS/vignettes/Cheat_Sheet_imputeTS.pdf
imputeTS::ggplot_na_distribution(imputeTS::tsAirgap)

# Validate installation of Rcmdr
# https://cran.r-project.org/web/packages/RcmdrMisc/RcmdrMisc.pdf
if (require(car)) {
    data(Moore)
    with(Moore, RcmdrMisc::plotMeans(conformity, fcategory, partner.status, ylim = c(0, 25)))
}

# Validate installation of doParallel
# http://users.iems.northwestern.edu/~nelsonb/Masterclass/gettingstartedParallel.pdf

library(doParallel)
registerDoParallel(cores = 2)
getDoParWorkers()

x <- iris[which(iris[,5] != 'setosa'), c(1,5)]
trials <- 10000
ptime <- system.time({
    r <- foreach(icount(trials), .combine = cbind) %dopar% {
        ind <- sample(100, 100, replace = T)
        result1 <- glm(x[ind,2] ~ x[ind,1], family = binomial(logit))
        coefficients(result1)
    }
})
ptime

nptime <- system.time({
    r <- foreach(icount(trials), .combine = cbind) %do% {
        ind <- sample(100, 100, replace = T)
        result1 <- glm(x[ind,2] ~ x[ind,1], family = binomial(logit))
        coefficients(result1)
    }
})
nptime

registerDoSEQ()
getDoParWorkers()

# Validate installation of randomForest
# https://cran.rstudio.com/web/packages/randomForestExplainer/vignettes/randomForestExplainer.html

data(Boston, package = 'MASS')
Boston$chas <- as.logical(Boston$chas)
str(Boston)
set.seed(2017)
forest <- randomForest::randomForest(medv ~ ., data = Boston, localImp = TRUE)
forest


# Validate installation of ranger
# https://rdrr.io/cran/tidypredict/f/vignettes/ranger.Rmd
model <- ranger::ranger(Species ~ ., data = iris, num.trees = 100)

ranger::treeInfo(model)


# Validate installation of xgboost
# https://www.r-bloggers.com/2016/03/an-introduction-to-xgboost-r-package/
require(xgboost)
data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')
train <- agaricus.train
test <- agaricus.test
model <- xgboost(data = train$data, label = train$label,
                 nrounds = 2, objective = "binary:logistic")
preds <- predict(model, test$data)
cv.res1 <- xgb.cv(data = train$data, label = train$label, nfold = 5,
                 nrounds = 1, objective = "binary:logistic")
cv.res1

cv.res10 <- xgb.cv(data = train$data, label = train$label, nfold = 5,
                  nrounds = 10, objective = "binary:logistic")
cv.res10

# Validate installation of vip
# https://koalaverse.github.io/vip/articles/vip.html
vip::vip(model)

# Validate modeldata and textrecipes installations
# https://github.com/tidymodels/textrecipes

data(okc_text, package = 'modeldata')

library(tidyverse)

okc_text %>%
    recipes::recipe(~ essay0 + essay1) %>%
    textrecipes::step_tokenize(essay0, essay1)

# Validate installation of finetune
# https://github.com/tidymodels/finetune

data(two_class_dat, package = 'modeldata')

set.seed(1)

rs <- rsample::bootstraps(two_class_dat, times = 10)

rda_spec <-
    discrim::discrim_regularized(frac_common_cov = tune(), frac_identity = tune()) %>% 
    parsnip::set_engine('klaR')

finetune::control_sim_anneal(verbose = T)

# Validate installation of SHAPforxgboost
# https://cran.r-project.org/web/packages/SHAPforxgboost/vignettes/basic_workflow.html

set.seed(9375)

X <- data.matrix(iris[, -1])

dtrain <- xgboost::xgb.DMatrix(X, label = iris[[1]])

fit <- xgboost::xgb.train(
    params = list(
        objective = "reg:squarederror",
        learning_rate = 0.1
    ), 
    data = dtrain,
    nrounds = 50
)

library(SHAPforxgboost)

shap <- shap.prep(fit, X_train = X)

shap.plot.summary(shap)
