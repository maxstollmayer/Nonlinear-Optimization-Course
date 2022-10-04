# Exercise Session 1

## Problem 1

Let $X \subseteq \mathbb{R}^n$ be a nonempty convex set and $f : \mathbb{R}^n \to \mathbb{R}$ a convex function. Show that every local minimum of $f$ with respect to $X$ is a global minimum of $f$ with respect to $X$.

### Solution

Let $y^\*$ be a global minimum and $x^\*$ be a local minimum. If $f(x^\*) = f(y^\*)$ we are be done, so suppose that $f(y^\*) < f(x^\*)$.

Since $f$ is convex we have for all $\lambda \in [0, 1)$
$$\begin{align*}
f \big( \lambda x^\* + (1-\lambda) y^\* \big) &\le \lambda f(x^\*) + (1-\lambda) f(y^\*) \\
&< \lambda f(x^\*) + (1-\lambda) f(x^\*) \\
&= f(x^\*)
\end{align*}$$

Since $X$ is convex there exists a $\lambda \in [0,1)$ such that $\lambda x^\* + (1-\lambda) y^\*$ is in a neighbourhood in which $x^\*$ is the local minimum.

But then $f(x^\*) \le f \big( \lambda x^\* + (1-\lambda) y^\* \big) < f(x^\*)$, which is a contradiction. So it must be that $f(x^\*) = f(y^\*)$ and thus $x^\*$ is also a global minimum.
