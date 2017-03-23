# Discrete Random Variables

## Basic Concepts

A **random variable** is a real-valued function of the experimental outcome.

A **discrete random variable** is a real-valued function of the out come of the experiment th at can take a finite or countably infinite number of values.

A discrete random variable has an associated **probability mass function (PMF)**, which gives the probability of each numerical value th at the random variable can take.

## PROBABILITY MASS FUNCTIONS

The **probability mass** of x, denoted $p_X(x)$, is the probability of the event $\{X = x\}$ consisting of all outcomes that give rise to a value of $X$ equal to $x$ : $$p_X(x) = P(\{X = x\})$$

we will use upper case characters to donote random variables,and lower case characters to denote real numbers such as the numerical values of a random variable.

$$\sum_x{p_X(x)}=1$$

### The Bernoulli Random Variable

The Bernoulli distribution is a special case of the binomial distribution where a single experiment/trial is conducted (n=1).

$$
p_X(k)=
\begin{cases}
p   & \text{if $k$ = 1} \\
1-p & \text{if $k$ = 0}
\end{cases}
$$

### The Binomial Random Variable

$$p_X(k)=C_n^kp^k(1-p)^{k-1} \qquad k=1,2,3,\ldots,n $$

![](assets/2-Discrete_Random_Variables-d6dc4.png)

### The Poisson Random Variable

$$p_X(k)=e^{-\lambda}\cfrac{\lambda^k}{k!} \qquad k=0,1,2,3,\ldots $$

The Poisson distribution is actually a limiting case of a Binomial distribution when the number of trials, $n$, gets very large and $p$, the probability of success, is small.

### The Geometric Random Variable

$$p_X(k)=(1-p)^{k-1}p \qquad k=1,2,3,\ldots $$

## EXPECTATION, MEAN, AND VARIANCE

**EXPECTATION**

We define the *expected value* (also called th e expectation or the mean)
of a random variable $X$ , w th PMF $p_X$, by

$$E[X] = \sum_x{xp_X(x)}$$

不考虑期望不存在的情况

## Variance, Moments, and the Expected Value Rule

In mathematics, a **moment(矩)** is a specific quantitative measure, used in both mechanics and statistics, of the shape of a set of points. If the points represent probability density, then the zeroth moment is the total probability (i.e. one), the first moment is the **mean(平均数)**, the second central moment is the **variance(方差)**, the third central moment is the **skewness(偏度)**, and the fourth central moment (with normalization and shift) is the **kurtosis(峰度)**.

$$var(X)=E\left[ (X-E(X)^2 \right]$$

**standard deviation** of $X$

$$σ_X= \sqrt{var(X)}$$

**Expected Value Rule for Functions of Random Variables**

Let $X$ be a random variable with PMF $p_X$, and let $g(X)$ be a function of $X$. Then, the expected value of the random variable $g(X)$ is given by

$$E[g(X)] = \sum_x{g(x)p_X(x)}$$

**Variance**

$$var(X)=\sum_x(x-E[X])^2p_X(x)$$

### Properties of Mean and Variance

$$var(X) = E[X^2] - (E[X])^2$$
