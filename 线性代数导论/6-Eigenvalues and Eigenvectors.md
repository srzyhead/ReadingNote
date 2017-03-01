# Eigenvalues and Eigenvectors

## Introduction to Eigenvalues

The basic equation is $Ax = λx$. The number $λ$ is an **eigenvalue** of $A$.The vector $x$ is an **eigenvector** of $A$.

### The Equation for the Eigenvalues

$$Ax = λx \\
\Downarrow \\
(A-λI)x = 0 \\
\Downarrow \\
det(A-λI)=0
$$

To solve the eigenvalue problem for an n by n matrix, follow these steps:

1. Compute the determinant of $A-λI$
2. Find the roots of this polynomial
3. Solve $(A-λI)x=0$ to find an eigenvector $x$

> 矩阵A乘以x表示，对向量x进行一次转换（旋转或拉伸）（是一种线性转换），而该转换的效果为常数λ乘以向量x（即只进行拉伸）。
我们通常求特征值和特征向量即为求出该矩阵能使哪些向量（当然是特征向量）只发生拉伸，使其发生拉伸的程度如何（特征值大小）。这样做的意义在于，看清一个矩阵在那些方面能产生最大的效果（power），并根据所产生的每个特征向量（一般研究特征值最大的那几个）进行分类讨论与研究。

### 关于退化矩阵

狭义的来说，仅限于方阵，退化矩阵和奇异矩阵对比起来还真的不一样。
首先是奇异矩阵，它的等价定义是：
- 行列式=0；
- 不可逆；
- 至少有一个特征值=0；
- 非满秩 ...

然后是退化矩阵。退化矩阵可以是满秩矩阵，也就是可逆，但特征向量的方向个数少于矩阵的size。例如这个2x2矩阵：
$$
\begin{bmatrix} 3 & 1 \\ 0 & 3 \end{bmatrix}
$$
它是秩为2的可逆矩阵；它的size是2；它有2个特征值，都是3；但是属于这2个特征值的特征向量都在同一个方向上，也就是说特征向量的方向个数是1，比它的size小。这就是一个典型的退化矩阵。
这意味着什么呢？
如果是奇异矩阵，那么特征值的个数和特征向量的方向个数都是小于size，那么经过这个矩阵的投影后，维度“坍缩”了；
如果是退化矩阵，那么特征向量的方向个数都是小于size，特征值的个数不一定小于size，但维度的“坍缩”还是存在的。

上例的矩阵就是可以看做一个线性变换，把二维的向量都投影到二维空间中的一维子空间内。

另外，需要注意的是，退化矩阵一定有相同的特征值，比如上例的矩阵的2个特征值都是3；但是具有相同特征值的矩阵不一定都是退化矩阵，例如：
$$
\begin{bmatrix} 3 & 0 \\ 0 & 3 \end{bmatrix}
$$
它也有2个特征值都是3，但具有2个不同方向的特征向量。

那么，如果一个方针A有相同的特征值，如何判断是不是退化矩阵？
记Lamda是A的多重特征值，重复个数是n。单位矩阵是I。观察矩阵  A - Lamda*I的零空间(Null Space)的维度是不是等于n。如果等于n，则A不是退化矩阵；如果小于n，则A是退化矩阵。

## Diagonalizing a Matrix

Suppose the $n$ by $n$ matrix $A$ has $n$ linearly independent eigenvectors $x_1,\ldots,x_n$.(**Without n independent eigenvectors, we can't diagonalize.**) Put them into the columns of an eigenvector matrix $S$. Eigenvalue matrix $Λ$
$$
Λ=\begin{bmatrix} λ_1 \\   & \ddots \\ & & λ_n \end{bmatrix}
$$
than
$$A=SΛS^{-1}$$

if **all the $λ$'s are different** then **n independent eigenvectors**

if **repeated eigenvectors** then **may or may not have n independent eigenvectors**

Remember that there is no connection between invertibility and diagonalizability:

**Invertibility** is concerned with the eigenvalues ($λ = 0$ or $λ \neq 0$).
**Diagonalizability** is concerned with the eigenvectors (too few or enough for $S$).

>If that diagonal matrix has any zeroes on the diagonal, then $A$ is not invertible. Otherwise, $A$ is invertible.

 $\begin{aligned} \textbf{Powers of }A \end{aligned} \qquad A^k =SΛ^kS^{-1}$

## Applications to Differential Equations

## Symmetric Matrices

What is special about $Ax = λx$ when A is symmetric?

1. A symmetric matrix has only *real eigenvalues*.
2. The eigenvectors can be chosen *orthonormal*.

Why do we use the word "choose"? Because the eigenvectors do not have to be unit vectors. Their lengths are at our disposal. We will choose unit vectors-eigenvectors of length one, which are orthonormal and not just orthogonal. Then $SΛS^{-1}$ is in its special and particular form $QΛQ^T$ for symmetric matrices.

**Symmetric diagonalization** : Every symmetric matrix has the factorization $A=QΛQ^T=QΛQ^{-1}$ with real eigenvalues in $Λ$ and orthonormal eigenvectors in $S=Q$.

### All Symmetric Matrices are Diagonalizable

Every square matrix can be "triangularized" by $A = QTQ^{-1}$.

## Positive Definite Matrices

Symmetric matrices that have positive eigenvalues are called **positive definite**.

正定矩阵等价判定条件:

1. All $n$ eigenvalues are positive
2. All $n$ pivots are positive
3. All $n$ upper left determinants are positive
4. $x^TAx$ is positive except at $x=0$.(This is the energy-based definition.)
5. $A$ equals $R^TR$ for a matrix R with independent columns.

$A = R^TR$ is automatically positive definite if $R$ has independent columns.

## Similar Matrices

Diagonalization is not possible for every $A$. Some matrices have too few eigenvectors. In this new section, the eigenvector matrix $S$ remains the best choice when we can find it, but now we allow any invertible matrix $M$.

A typical matrix $A$ is similar to a whole family of other matrices because there are so many choices of $M$.

Let $M$ be any invertible matrix. Then $B = M^{-1}AM$ is **similar** to $A$.

## Singular Value Decomposition (SVD)

The eigenvectors in $S$ have three big problems: They are usually not orthogonal, there are not always enough eigenvectors, and $Ax = λx$ requires $A$ to be square. The singular vectors of $A$ solve all those problems in a perfect way.

$$A = UΣV^T$$

The $u$'s are eigenvectors of $AA^T$ and the $v$'s are eigenvectors of $A^TA$.

![](assets/6-EigenvaluesandEigenvectors-d3419.png)

![](assets/6-EigenvaluesandEigenvectors-c7d74.png)


## Table of Eigenvalues and Eigenvectors

![](assets/6-EigenvaluesandEigenvectors-6e76e.png)

$$
\begin{array}{lll}
\text{Matrix} & \text{Eigenvalue Feature} & \text{Eigenvector Feature} \\
\hline
\mathbf{Symmetric:\ } A^T = A & \\
\mathbf{Orthogonal:\ } Q^T = Q^{-1} \\
\mathbf{Skew-symmetric:\ } A^T = -A \\
\mathbf{Complex\ Hermitian:\ } \overline{A}^T = A \\
\mathbf{Positive\ Definite:\ } x^TAx>0 \\
\mathbf{Markov:\ } m_{ij} > 0, \sum_{i=1}^n m_{ij} = 1 \\
\mathbf{Similar:\ } B= \\
\end{array}
$$
