# Vector Spaces and Subspaces

## Spaces of Vectors

*The space $R^n$ consists of all column vectors $v$ with n components.*

"Inside the vector space" means that **the result stays in the space**.

A **subspace** of a vector space is a set of vectors (including 0) that satisfies two requirments:

If $v$ and $w$ are vectors in the subspace and $c$ is any scalar, then

(i) $v$ + $w$ is in the subspace

(ii) $cv$ is in the subspace

*Every subspace contains the zero vector.*

The **column space** consists of **all linear combinations of the columns**.

The system $Ax=b$ is solvable if and only if $b$ is in the column space of $A$.

## The Nullspace of A: Solving Ax == 0

The **nullspace** of $A$ consists of all solutions to $Ax = 0$. $N(A)$ is a subspace of $R^n$.

The nullspace consists of all combinations of the **special solutions**.

The **reduced row echelon matrix** $R$ has zeros above the pivots

## The Rank and the Row Reduced Form

The rank of $A$ is the number of pivots.This number is $r$.

$Ax=0$ has $r$ pivots and $n-r$ free variables.N(A) contains the $n-r$ special solutions.

## The Complete Solution to $Ax = b$

|    rank   |                        R                       |           A           | Ax = b solution |
|:---------:|:----------------------------------------------:|:---------------------:|:---------------:|
|  $r=m=n$  | $\begin{bmatrix} I \end{bmatrix}$              | Square and invertible | 1               |
|  $r=m<n$  | $\begin{bmatrix} I & F \end{bmatrix}$          |     Short and wide    | ∞               |
|  $r=n<m$  | $\begin{bmatrix} I \\ 0 \end{bmatrix}$         |     Tall and thin     | 0 or 1          |
| $r<n,r<m$ | $\begin{bmatrix} I & F \\ 0 & 0 \end{bmatrix}$ |     Not full rank     | 0 or ∞          |

## Independence, Basis and Dimension
