# Introduction
The purpose of the first class exercise is to get us familiar with the type of
R scripting we will be working through the class. The approach used by the
professor was to organize different type of exercises and demonstrate the type
of tasks was performed on each analysis.

# Example 1: Apple Returns Analysis
The first analysis was around time-series use case. In this case we are
analyzing financial data, in particular Apple returns from January 1, 2001 to
August 22, 2019.

## Key Concepts
**What is the Adjusted Closing Price?**</br>
Adjusted closing price amends a stock's value after accounting for any
corporate actions. It is considered to be the true price of that stock and is
often used when examining historical returns or performing a detailed analysis
of historical returns.

**Why returns is important?**</br>
Investors are interested in revenues that are high relative to the size
of the initial investments. Returns measure this, because returns on an
asset are changes in price expressed as a fraction of the initial price.

**What is the currency (e.g., Dollars, Yen) associated to that return?**</br>
Returns are scale-free, meaning that they do not depend on units (e.g.,
dollars, cents, etc.). However, Returns **are not unitless**. Their unit is
time; they depend on the units of time (e.g., hour, day, etc.).

**Why do we capture the log of the returns?**</br>
Mathematically speaking; log(1+x) is very close to x when the x value is
small. This implies that **log returns** are approximately equal to
**returns**.

Log returns of +/- 1 % are very close to the corresponding net returns.
Notice, that for the Apple example the majority of the values are between
0.1 and -0.1 and those greater than +/- 0.1 call the attention quickly.

**What is the advantage of measuring the log of the returns?**</br>
One advantage of using log returns is simplicity of multiperiod returns. A
k-period log return is simply the sum of the single-period log returns,
rather than the *product* as for gross returns.

**Why do we need to use kernel density estimation?**</br>
The outliers are difficult, or perhaps impossible, to see in the histogram,
except that they have cause the x-axis to expand. The reason that the
outliers are difficult to see is the **large sample size**. When the sample
size is in the thousands, a cell with a small frequency is essentially
invisible.

A much better estimator is the **kernel density estimator (KDE)**. The
estimator takes its name from the **kernel function**, which is a probability
density function that is **symmetric about 0**.

Often a **kernel density** estimate is used to suggest a parametric
statistical model.

## Data Preparation & Exploration:
### Descriptive Analytic Findings for Apple Returns

A modeler familiar with financial data is most likely start the analysis by
creating a graph that shows the adjusted returns for apple from January 1, 2017
to August 22, 2019.

Another common area of interest for a financial modeler is to visualize those
days whose returns are not common or are most likely to be outliers. In this
case the modeler will most likely be interested to visualize the log returns
instead.

Another visualization tool commonly used is the histogram to understand the
distribution of the response and possibly observe the outliers. For a large
data set the histogram will not easily show outliers.

The last graph generated is the apple returns density function. The graph
allows us to see a "bell-shaped" curve, suggesting that a normal distribution
may be a suitable model. In this graph we also see that the normal density and
the kernel density function are somewhat dissimilar. The reason is that the
**outlying returns inflate** the sample standard deviation and cause the normal
density to be too dispersed in the middle of the data. A way to solve this is
to use more robust estimators such as the **Median Absolute Deviation (MAD)**,
which are less sensitive to outliers.

# Example 2: Predicting Fuel Economy
## Key Concepts
The main purpose of the script is to show how can we fit and illustrate the
linear regression for the fuel economy prediction. While the book study case
goes to the process of evaluating the model, this exercise is only focus on
performing running both car model year as training set for 2 training models.

## Data Preparation & Exploration
The fueleconomy.gov web site, run by the U.S. Department of Energy's Office of
Energy Efficiency and Renewable Energy and the U.S. Environmental Protection
Agency, lists different estimates of fuel economy for passenger cars and trucks.

For this exercise we are focused on 1 predictor (i.e., engine displacement) and
a single response (i.e., fuel efficiency). Engine displacement shows the volume
inside the engine cylinders.

The first graph plotted shows the relationship between engine displacement and
fuel economy for the 2010 and 2011 car model years. From this graph we can
observe the following:

- As the engine displacement increases, the fuel efficiency drops regardless
  of the year.
- The scatterplots show some linearity with some curvature towards the extreme
  ends of the displacement axis.

## Predictive Analytics
### Linear Model Preparation
Since the scatterplots presented some resemblance of linearity the author
decides to build a linear model. However, instead of splitting the whole data
set, the author has decided to use the 2010 car model as the training set and
the 245 samples for 2011 as the test data.

### Linear Model Training Approaches
The exercise shows 3 different approaches for training the data. The first
approach is to fit the 2010 and 2011 data sets and plotting the linear
regression for each training set, and the second approach executed is by using 10
fold cross validation.

Linear Regression Model | RMSE
--- | ---
2010 without CV | 4.624
2011 without CV | 5.037
2010 with CV | 4.600

# Example 3: Data visualization for Classification type of analysis
This exercise can be found in chapter 3, page 58; it is exercise 3.1

The UC Irvine Machine Learning Repository contains a data set related to
**glass identification**. The data contains *214 glass* samples labeled as one
of seven class categories. There are nine predictors, including the refractive
index and percentages of eight elements: Na, Mg, Al, Si, K, Ca, Ba, and Fe.

## Data Exploration through Data Visualization
The book exercise is looking to explore the predictor variables to understand
their distributions as well as the relationships between predictors. To achieve
this we can answer the following questions:
- Do there appear to be any outliers in the data?
- Are any predictors skewed?
- Are there any relevant transformations of one or more predictors that might
  improve the classification model?

The boxplot is the visualization technique used to observe outliers and
and skewness. The first boxplot created allow us to see the outliers and
skewness for the predictors. The second and third boxplots allow us to
observe outliers and skewness in relation to the response (i.e, glass type).
To answer the above questions the following techniques were used:

The exercise also provides an numerical approach to identify skewness for each
predictor. This approach presents a table with the value for each predictor. If
the value is a negative skewness that means that the **mean** of the data values
is less than the **median**, and the data distribution is left-skewed. Positive
skewness would indicate that the **mean** of the data values is larger than the
**median**, and the data distribution is right-skewed.

In an effort to make it easier to visualize skewness, the exercise create
histograms for 3 predictors.

Finally, a correlation plot is presented to identify good predictors that could
be used to create the classification model.

# Example 4: Predictive Analytics for Ford and GM Stocks
The exercise was inspired from the first 2 exercises presented in the
**Statistics and Data Analysis for Financial Engineering** book (pg. 77).

 Like in the first example the interest is around returns and in particular the
 adjusted cost which is the cost after adjustment are made at the end of the
 day. This adjustments are made to account for corporate actions.

## Data Exploration
For this exercise the following plots were generated
- Adjusted closing values for Ford and General Motors
- A scatter plot showing Ford and GM returns
- Correlation between predictor (i.e., Ford Returns) and response (i.e., General
  Motors) returns; which showed a correlation of 0.999 between Ford and General
  Motors returns.

## Prediction Analysis for Training Data
A linear regression model was created were the predictor was defined to be Ford
returns and the response was defined as General Motors returns.

# Example 5: Equity Trajectories
The first plot is a single trial is emulated and graph in R, where the Equity
was represented in the y-axis and the number of days in the x-axis.

The second plot is a multiple MC trial showing multiple equity trajectories.
