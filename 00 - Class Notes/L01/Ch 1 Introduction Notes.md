# Chapter 1: Introduction

Our human nature is driven to make questions with the hope to know the future,
so we can make the best decision possible towards that future. However, the
amount of information available keeps growing and making it more difficult
for us to interpret. Due to this issues systems such as WebMD and E*TRADE has
proven to be popular to diagnose illness and identify best investments for
our portfolios.

The process of developing these kinds of tools has been called 'machine
learning', 'artificial intelligence', 'pattern recognition', 'data mining',
'predictive analytics', and 'knowledge discovery'. While each field approaches
the problem using different perspectives and tool sets, the ultimate objective
is the same: **to make an accurate prediction**. For this book, all this terms
will be associated to the commonly used phrase **predictive modeling**.

**Predictive Modeling Definition:** the process of developing a mathematical
tool or model that generates an accurate prediction.

It is important to notice that predictive models regularly generate inaccurate
predictions and provide the wrong answers. This wrong answers has lead to a
more careful use when attempting to perform forecast.

Some of the common reasons a predictive model fails are:
- inadequate pre-processing of the data
- inadequate model validation
- unjustified extrapolation (e.g., application of the model to data that reside
  in a space which the model has never seen)
- **over-fitting** the model to the existing data
- predictive modelers often only explore relatively few models when searching
  for predictive relationships

This book endeavors to help predictive modelers produce reliable, trust-worthy
models by providing a step-by-step guide to the model building process and to
provide intuitive knowledge of a wide range of common models. The objective of
this book are to provide:
- Foundational principles for building predictive models
- Intuitive explanations of many commonly used predictive modeling methods for
  both classification and regression problems
- Principles and steps for validating a predictive model
- Computer code to perform the necessary foundational work to build and
  validate predictive models

Predictive modeling techniques confronts the **trade-off between prediction and
interpretation**.

## 1.1 Prediction Versus Interpretation
The primary interest of predictive modeling is to generate accurate
predictions, a secondary interest may be to interpret the model and understand
why it works. The unfortunate reality is that as we push towards **higher
accuracy**, models become more complex and their **interpretability becomes more
difficult**.

For example, consider the process that a cancer patient and physician encounter
when contemplating changing treatment therapies. In this case, the critical
question for the doctor and patient is a prediction of **how** the patient will
react to a change in therapy. Above all, this prediction needs to be accurate.

## 1.2 Key Ingredients of Predictive Models
Predictive modeling have x ingredients that are critical:
- The foundation of an effective predictive model is laid with **intuition**
  and **deep knowledge of the problem context**, which are entirely vital for
  driving decisions about model development.

- The process begins with **relevant** data.

- A **versatile** computational toolbox which includes techniques for data
  pre-processing and visualization as well as a suite of modeling tools for
  handling a range of possible scenarios such as those presented in section 1.4.

## 1.3 Terminology
The list below is a set of key terms:
- sample, data, point, observation , or instance could be refer to:
  - A single independent unit of data (e.g., customer and patient)
  - A subset of data points (e.g., training set sample)
- Training set consist of the data used to develop the model and **test** or
  **validation** sets consist of the data set used for model performance
  evaluation.
- Predictors, independent variables, attributes, or descriptors are the data
  used as input for prediction equation.
- Response, outcome, dependent variable, target, or class refers to the outcome
  even that is being predicted.
- Continuous data have natural, numeric scales (e.g., blood pressure)
- Categorical data, otherwise known as nominal, attribute, or discrete data,
  take on specific values that have no scale (e.g., credit status, color)
- Model building, model training, parameter estimation all refer to the process
  of using data to determine values of model equations

## 1.4 Example Data Sets and Typical Data Scenarios
The focus on this section is to study (at a high level) the diversity of the
problems and the types of data used to solve them.

### Comparisons Between Data Sets

[Table 1.1]: ./Table1.1.jpg
![Table 1.1]

The 6 examples presented in the book illustrate common characteristics:
- The **response** may be continuous or categorical
  - Continuous responses distribution may be symmetric or skewed
  - Categorical responses distribution may be balanced or unbalanced
  - **Note:** the distribution of the response is critically necessary for one
    of the first steps in predictive modeling process: splitting the data.


- The **predictor** values may be continuous, count, and or categorical
  - Predictors may have missing values and could be on different scales of
    measurement
  - Predictors within a data set may have **high correlation or association**,
    thus indicating that the predictor set contains numerically redundant
    information
  - Predictors may be sparse, meaning that a majority of samples contain the
    same information while only a few contain unique information.
  - Continuous predictors can follow a symmetric or skewed distribution
  - Categorical predictors can follow balance or unbalanced distribution
  - Predictors within a data set may or may not have an underlying relationship
    with the response


- Different kinds of models handle these types of predictor characteristics in
  different ways. For instance:
  - In the case of correlated predictors characteristics:
    - **least squares** naturally manages correlated predictors but is
      numerically more stable if the predictors are on similar scales.
    - **Recursive partitioning** is unaffected by predictors of different scales
      but has less stable partitioning structure when predictors are correlated.
  - In the case of missing predictor information characteristics:
    - **multiple linear regression** cannot handle missing predictor information
    - **recursive partitioning** can be used when the predictors contains
      moderate amounts of missing information.
  - In either of these example scenarios, failure to **appropriately adjust**
    the predictors prior to modeling (i.e., **pre-processing**) will produce
    models that have less-than-optimal predictive performance.


- The relationship between the number of samples and number of predictors can
  affect your modeling efforts
  - All predictive models can handle the case in which the number of samples is
    much more grater than the number of predictors, but computational time will
    vary among the models.
  - When the data set has significantly fewer samples than predictors,
    predictive models such as multiple linear regression cannot be directly
    used. However, predictive modes such as recursive partitioning or KNNs can
    be used directly under this condition.

In summary, we must have a detailed understanding of the predictors and the
response for any data set prior to attempting to build a model. Most of the
data sets will require some degree of pre-processing in order to expand the
universe of possible predictive models and to optimize each model's predictive
performance.

## 1.5 Overview
### Part 1: General Strategies
Part 1 focuses on explaining approaches for laying strong foundations onto
which models can be built. The cornerstone concepts of data pre-processing
(Chapter 3) and resampling (Chapter 4) should be well understood before
attempting to model any data..

The pre-processing section explains common methods of pre-processing such as
data transformations, the addition and/or removal of variables, and binning
continuous variables.

The resampling section will introduce the idea of **data spending** and methods
for spending data in order to appropriately tune a model and assess its
performance. This section will help us understand why we should always try a
diverse set of models for any given problem.

### Part 2: Regression Models
Part 2 focuses on surveying traditional and modern regression techniques.
Starting with ways to **measure performance** when modeling a continuous
outcome (Chapter 5). Chapter 6 provides a working understanding and intuition
for regression models that seek the underlying structure of data using linear
combinations of the predictors. These models include linear regression, partial
least squares, and L<sub>1</sub> regularization. Chapter 7 presents an
explanation of regression models that are not based on simple linear
combinations of the predictors, which include neural networks, multivariate
adaptive regression splines (MARS), support vector machines (SVMs), and KNNs.
Chapter 8 will focus on tree-based models since they **do not relay on linear
combinations of the predictors**. The trees covered will be regression trees,
bagged trees, random forests, boosting, and Cubist. Lastly, chapter 10 will
compare and contrast all of the techniques discussed on a specific problem.

### Part 3: Classification Models
Part 3 focuses on predictive classification models. Measures of classification
problems are explained in Chapter 11. Chapter 12 will provide a working
understanding and intuition for classification models that are based on linear
combinations of the predictors such as linear, quadratic, regularized, and
partial least squares discriminant analysis. Alongside with penalized methods.
Chapter 13 will focus on classification methods that are highly non-linear
functions of the predictors. These includes flexible discriminant analysis,
neural networks, SVMs, KNNs, Naive Bayes, and nearest shrunken centroids. Trees
for classification are covered in Chapter 14 and a classification case study on
Chapter 17.

### Part 4: Other Considerations
Part 4 addresses other important consideration when building a model or
evaluating its performance. In an attempt to find only the most relevant
predictors in a given problem, many different types of feature selection
methods have been proposed. While these methods have the potential to uncover
practically meaningful information, they often help to understand the data's
noise rather than its structure. Chapter 18 illustrates various methods for
quantifying predictor importance while Chapter 19 provides an introduction and
guide to properly utilizing feature selection techniques. Chapter 20 will
present common factors affecting model performance such as *excess noise in the
predictor set and/or response* and *predictive extrapolation*.

## Study Notes
Prediction modeling have a constant trade-off between **interpretation** and
**model accuracy**.

The good prediction models consist of 3 main ingredients:
- Deep knowledge of the problem context
- A great amount of **relevant** data at our disposal
- A **versatile** computation toolbox for data pre-processing, visualization and
  modeling.

The list below is a set of key terms:
- sample, data, point, observation , or instance could be refer to:
  - A single independent unit of data (e.g., customer and patient)
  - A subset of data points (e.g., training set sample)
- Training set consist of the data used to develop the model and **test** or
  **validation** sets consist of the data set used for model performance
  evaluation.
- Predictors, independent variables, attributes, or descriptors are the data
  used as input for prediction equation.
- Response, outcome, dependent variable, target, or class refers to the outcome
  even that is being predicted.
- Continuous data have natural, numeric scales (e.g., blood pressure)
- Categorical data, otherwise known as nominal, attribute, or discrete data,
  take on specific values that have no scale (e.g., credit status, color)
- Model building, model training, parameter estimation all refer to the process
  of using data to determine values of model equations

Different data sets will present unique challenges when developing the
appropriate model and as such it is important that we are able to:
- Understand the distribution of the response; so we can properly partition the
  data set
- Understand predictor characteristics; so we can address them through
  pre-processing
