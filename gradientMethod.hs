type Scalar = Double
type Vector = [Double]
type StepSize = Scalar
type Direction = Vector
type Params = (Scalar, Scalar, Scalar)
type Objective = Vector -> Scalar
type Derivative = Vector -> Vector

-- scalar product
prod :: Vector -> Vector -> Scalar
prod x y = sum $ zipWith (*) x y

-- squared euclidean norm
norm2 :: Vector -> Scalar
norm2 x = prod x x

-- returns x + t * d
nextIterate :: Vector -> Scalar -> Direction -> Vector
nextIterate x t d = zipWith (+) x (map (*t) d)


-- finds minimal k >= 0 such that f(x + t*d) <= f(x) + sigma * t * g(x) * d for t = beta^k
stepSizeRecursion :: Objective -> Scalar -> Vector -> Direction -> Scalar -> Scalar -> Int -> Scalar 
stepSizeRecursion f fx x d sgxd beta k
    | f (nextIterate x t d) <= fx + t * sgxd = t
    | otherwise = stepSizeRecursion f fx x d sgxd beta (k+1)
    where
        t = beta^k

getStepSize :: Objective -> Derivative -> Vector -> Direction -> Scalar -> Scalar -> StepSize
getStepSize f g x d sigma beta = stepSizeRecursion f (f x) x d sgxd beta 0
    where
        sgxd = sigma * prod (g x) d


-- finds minimum of objective function via steepest descent
-- returns list of iterates
gradientRecursion :: Objective -> Derivative -> Params -> [Vector] -> [Vector]
gradientRecursion f g (eps, sigma, beta) xs
    | norm > eps^2 = gradientRecursion f g (eps, sigma, beta) (xs ++ [y])
    | otherwise = xs ++ [y]
    where
        x = last xs
        d = map (*(-1)) (g x)
        norm = norm2 d
        t = getStepSize f g x d sigma beta
        y = nextIterate x t d

gradientMethod :: Objective -> Derivative -> Vector -> Params -> [Vector]
gradientMethod f g x0 params = gradientRecursion f g params [x0]
