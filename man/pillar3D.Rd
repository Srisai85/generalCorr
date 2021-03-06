% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pillar3D.R
\name{pillar3D}
\alias{pillar3D}
\title{Create a 3D pillar chart to display (x, y, z) data coordinate surface.}
\usage{
pillar3D(z = c(657, 936, 1111, 1201), x = c(280, 542, 722, 1168),
  y = c(162, 214, 186, 246), drape = TRUE, xlab = "y", ylab = "x",
  zlab = "z", mymain = "Pillar Chart")
}
\arguments{
\item{z}{{z-coordinate values}}

\item{x}{{x-coordinate values}}

\item{y}{{y-coordinate values}}

\item{drape}{{logical value, default drape=TRUE to give color to heights}}

\item{xlab}{{default "x" label on the x axis}}

\item{ylab}{{default "y" label on the y axis}}

\item{zlab}{{default "z" label on the z axis}}

\item{mymain}{{default "Pillar Chart" main label on the plot}}
}
\value{
A 3D plot
}
\description{
Give data on x, y, z coordinate values of a 3D surface, this function
plots them after making pillars near each z value by adding and
subtracting small amounts dz. Instead of pins of the height z this
creates pillars which better resemble a surface. It uses the
wireframe() function of `lattice' package to do the plotting.
}
\details{
For additional plotting features type `pillar3D()' on the R console to
get my code and adjust wireframe() function defaults.
}
\examples{

\dontrun{
pillar3D())}

}
\author{
Prof. H. D. Vinod, Economics Dept., Fordham University, NY
}
\concept{3D plot}
\concept{wireframe plot}
